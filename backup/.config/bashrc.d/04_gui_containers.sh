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
                -v "$XDG_RUNTIME_DIR:$XDG_RUNTIME_DIR:ro" \
                -v "/tmp/.X11-unix:/tmp/.X11-unix:ro" \
                --security-opt "label=type:container_runtime_t" \
                --name "gui-box-$(date +%Y-%m-%d-%H-%M-%S)" \
                --device /dev/dri \
                --workdir /root \
                --label "$label" \
                --init \
                fedora \
                sleep infinity
            ;;
        _list) podman ps -aq --filter "label=$label" ;;
        _list_fmt) podman ps -a --filter "label=$label" ;;
        _count) "$FUNCNAME" _list | wc -l ;;
        _assert_not_multiple) [[ "$("$FUNCNAME" _count)" -gt 1 ]] && echo -e "\e[1;31mmultiple container running\e[m" 1>&2; return 1 ;;
        _assert_not_missing) [[ "$("$FUNCNAME" _count)" -eq 0 ]] && echo -e "\e[1;31mno container running\e[m" 1>&2; return 1 ;;
        _asser_single) "$FUNCNAME" _assert_not_missing ; "$FUNCNAME" _assert_not_multiple ;;
        _get_only) "$FUNCNAME" _assert_single ; "$FUNCNAME" _list ;;
        _create_if_missing)
            "$FUNCNAME" _assert_not_multiple
            if [[ "$("$FUNCNAME" _count)" == 0 ]]; then "$FUNCNAME" _create; fi
            ;;
        ls) "$FUNCNAME" _list_fmt ;;
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
            podman exec -it \
                -e "WAYLAND_DISPLAY=$WAYLAND_DISPLAY" \
                -e "DISPLAY=$DISPLAY" \
                -e "XAUTHORITY=$XAUTHORITY" \
                -e "XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR" \
                -e "PIPEWIRE_SOCKET=$XDG_RUNTIME_DIR/pipewire-0" \
                "$("$FUNCNAME" _get_only)" bash
            ;;
        stop)  
            "$FUNCNAME" _assert_not_multiple
            for container in $("$FUNCNAME" _list); do podman stop "$container"; done >/dev/null
            ;;
        *) echo -e "\e[1;31minvalid args\e[m" 1>&2; return 1 ;;
        esac
    }

complete -W "ls rm run stop" box
