#!/bin/bash

function edit(){
    [[ -n "$(podman ps -a -q --filter "name=neovim-client")" ]] && local -r running=true
    case "$*" in
        "") [[ "$running" != true ]] && \
            podman run -d --rm \
                --name neovim-client \
                --init \
                -e "TZ=$(timedatectl show --property=Timezone --value)" \
                --security-opt label=type:container_runtime_t \
                -v neovim-data:/data \
                -w /data \
                -p 8000 \
                ghcr.io/daniele47/neovim sleep infinity >/dev/null
            podman exec --detach-keys="" -it neovim-client bash ;;
        port)
            [[ "$running" == true ]] && echo "$(podman port neovim-client 8000)"
            [[ "$running" != true ]] && echo "neovim container is not running!" ;;
        open|web) 
            [[ "$running" == true ]] && local -r url="http://$(podman port neovim-client 8000)" && echo "opening $url..." && xdg-open "$url"
            [[ "$running" != true ]] && echo "neovim container is not running!" ;;
        stop|kill|end|rm) 
            [[ "$running" == true ]] && podman kill neovim-client >/dev/null && echo 'container removed!'
            [[ "$running" != true ]] && echo 'container was already not running!' ;;
        *) echo 'invalid arguments!' ;;
    esac
    return 0
}

function netbird(){
    [[ -n "$(podman ps -a -q --filter "name=netbird-client")" ]] && local -r running=true
    case "$*" in
        "") [[ "$running" != true ]] && \
            podman run -d --rm \
                --name netbird-client \
                --cap-add NET_ADMIN \
                --cap-add SYS_ADMIN \
                --cap-add NET_RAW \
                --device /dev/net/tun \
                --security-opt label=type:container_runtime_t \
                -v netbird-data:/var/lib/netbird \
                -p 8000 \
                docker.io/netbirdio/netbird >/dev/null
            podman exec -it netbird-client bash ;;
        port)
            [[ "$running" == true ]] && echo "$(podman port netbird-client 8000)"
            [[ "$running" != true ]] && echo "netbird container is not running!" ;;
        open|web) 
            [[ "$running" == true ]] && local -r url="http://$(podman port netbird-client 8000)" && echo "opening $url..." && xdg-open "$url"
            [[ "$running" != true ]] && echo "netbird container is not running!" ;;
        stop|kill|end|rm) 
            [[ "$running" == true ]] && podman kill netbird-client >/dev/null && echo 'container removed!'
            [[ "$running" != true ]] && echo 'container was already not running!' ;;
        *) echo 'invalid arguments!' ;;
    esac
    return 0
}

function rmall(){
    echo -n "neovim: " && edit rm
    echo -n "netbird: " && netbird rm
}

function root-netbird(){
    [[ -n "$(sudo podman ps -a -q --filter "name=netbird-client")" ]] && local -r running=true
    case "$*" in
        "") [[ "$running" != true ]] && \
            sudo podman run -d --rm \
                --name netbird-client \
                --cap-add NET_ADMIN \
                --cap-add SYS_ADMIN \
                --cap-add NET_RAW \
                --device /dev/net/tun \
                --security-opt label=type:container_runtime_t \
                -v netbird-data:/var/lib/netbird \
                --network host \
                docker.io/netbirdio/netbird >/dev/null
            sudo podman exec -it netbird-client bash ;;
        stop|kill|end|rm) 
            [[ "$running" == true ]] && sudo podman stop netbird-client >/dev/null && echo 'container removed!'
            [[ "$running" != true ]] && echo 'container was already not running!' ;;
        *) echo 'invalid arguments!' ;;
    esac
    return 0
}
