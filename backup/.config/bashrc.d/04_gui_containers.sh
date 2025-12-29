#!/bin/bash

function box() {
    if [[ "$1" == _* && "${FUNCNAME[1]}" != "$FUNCNAME" ]]; then
        echo -e "\e[1;31mInvalid args\e[0m" 1>&2
        return 1
    fi

    local -r label="function=box-39ff3913-0d21-4443-b10a-094fc3fc4d81" 
    case "$1" in 
        _create)
            podman run -d \
                -e "WAYLAND_DISPLAY=$WAYLAND_DISPLAY" \
                -e "DISPLAY=$DISPLAY" \
                -e "XAUTHORITY=$XAUTHORITY" \
                -e "XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR" \
                -e "PIPEWIRE_SOCKET=$XDG_RUNTIME_DIR/pipewire-0" \
                -v "$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:ro" \
                -v "/tmp/.X11-unix:/tmp/.X11-unix:ro" \
                -v "$XAUTHORITY:$XAUTHORITY:ro" \
                -v "$XDG_RUNTIME_DIR/pulse/native:$XDG_RUNTIME_DIR/pulse/native:ro" \
                -v "$XDG_RUNTIME_DIR/pipewire-0:$XDG_RUNTIME_DIR/pipewire-0:ro" \
                -v "$XDG_RUNTIME_DIR/bus:$XDG_RUNTIME_DIR/bus:ro" \
                --security-opt "label=type:container_runtime_t" \
                --name "gui-box-$(date +%Y-%m-%d-%H-%M-%S)" \
                --device /dev/dri \
                --workdir /root \
                --label "$label" \
                --init \
                archlinux \
                sleep infinity
            ;;
        _list) podman ps -aq --filter "label=$label" ;;
        _count) "$FUNCNAME" _list | wc -l ;;
        _assert_not_multiple) [[ "$("$FUNCNAME" _count)" -gt 1 ]] && echo -e "\e[1;31mmultiple container running\e[m" 1>&2; return 1 ;;
        _get_only) 
            "$FUNCNAME" _assert_not_multiple
            if [[ "$("$FUNCNAME" _count)" == 1 ]]; then "$FUNCNAME" _list; fi
            ;;
        _create_if_missing)
            "$FUNCNAME" _assert_not_multiple
            if [[ "$("$FUNCNAME" _count)" == 0 ]]; then "$FUNCNAME" _create; fi
            ;;
        rm) 
            if [[ "$("$FUNCNAME" _count)" -gt 0 ]]; then
                read -rp "Are you sure you want to delete the container? [Y/n] " answer
                if [[ "${answer,,}" == y ]]; then
                    for container in $("$FUNCNAME" _list); do podman rm -f "$container"; done >/dev/null
                fi
            fi
            ;;
        run|"") 
            "$FUNCNAME" _create_if_missing >/dev/null
            podman start "$("$FUNCNAME" _get_only)" >/dev/null
            podman exec -it "$("$FUNCNAME" _get_only)" bash
            ;;
        stop)  
            "$FUNCNAME" _assert_not_multiple
            for container in $("$FUNCNAME" _list); do podman stop "$container"; done >/dev/null
            ;;
        *) echo -e "\e[1;31minvalid args\e[m" 1>&2; return 1 ;;
    esac
}

complete -W "rm run stop" box
