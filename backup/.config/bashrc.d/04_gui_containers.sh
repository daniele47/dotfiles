#!/bin/bash

function box() {
    if [[ "$1" == _* && "${FUNCNAME[1]}" != "$FUNCNAME" ]]; then
        echo -e "\e[1;31mInvalid args\e[0m" 1>&2
        return 1
    fi

    local -r label="function=box-39ff3913-0d21-4443-b10a-094fc3fc4d81" 
    case "$1" in 
        _create)
            local -r CONTAINER="$(podman run -d \
                -v "$XDG_RUNTIME_DIR:$XDG_RUNTIME_DIR:rw" \
                -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
                --security-opt "label=type:container_runtime_t" \
                --name "gui-box-$(date +%Y-%m-%d-%H-%M-%S)" \
                --userns=keep-id \
                --label "$label" \
                --init \
                --shm-size=512m \
                registry.fedoraproject.org/fedora \
                sleep infinity)"
            podman exec -u 0 -it "$CONTAINER" sh -c "cp -r /etc/skel/ /home/$(whoami) ; chown -R $(id -u):$(id -g) /home/$(whoami); chmod 700 /home/$(whoami)"
            ;;
        _list) podman ps -aq --filter "label=$label" ;;
        _list_fmt) podman ps -a --filter "label=$label" ;;
        _count) "$FUNCNAME" _list | wc -l ;;
        ls) "$FUNCNAME" _list_fmt ;;
        rm) 
            if [[ "$("$FUNCNAME" _count)" -gt 0 ]]; then
                if [[ "$2" != "-f" ]]; then
                    read -rp "Are you sure you want to delete the container? [Y/n] " answer
                    if [[ "${answer,,}" != y ]]; then
                        return 0
                    fi
                fi
                echo "Removing container..."
                for container in $("$FUNCNAME" _list); do podman rm -f "$container"; done >/dev/null
            fi
            ;;
        ""|run|root) 
            case "$("$FUNCNAME" _count)" in
                0) "$FUNCNAME" _create; ;;
                1) ;;
                *) echo -e "\e[1;31mmultiple container running\e[m" 1>&2; return 1 ;;
            esac
            podman start "$("$FUNCNAME" _list)" >/dev/null
            case "$1" in
                ""|run)
                    podman exec -it \
                        -e "WAYLAND_DISPLAY=$WAYLAND_DISPLAY" \
                        -e "DISPLAY=$DISPLAY" \
                        -e "XAUTHORITY=$XAUTHORITY" \
                        -e "XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR" \
                        -e "PIPEWIRE_SOCKET=$XDG_RUNTIME_DIR/pipewire-0" \
                        -e "HOME=/home/$(whoami)" \
                        -w "/home/$(whoami)" \
                        "$("$FUNCNAME" _list)" bash
                    ;;
                root) podman exec -u 0 -it -w /root "$("$FUNCNAME" _list)" bash ;;
            esac
            ;;
        stop) 
            if [[ "$("$FUNCNAME" _count)" -gt 0 ]]; then
                echo "Stopping container..."
                for container in $("$FUNCNAME" _list); do podman stop "$container"; done >/dev/null ;
            fi
            ;;
        *) echo -e "\e[1;31minvalid args\e[m" 1>&2; return 1 ;;
    esac
}

complete -W "ls rm root run stop" box
