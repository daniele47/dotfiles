#!/bin/bash

function edit(){
    local -r IMAGE="ghcr.io/daniele47/neovim"
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
                "$IMAGE" sleep infinity >/dev/null
            podman exec --detach-keys="" -it neovim-client bash ;;
        stop|kill|end|rm) 
            [[ "$running" == true ]] && podman kill neovim-client >/dev/null && echo 'container removed!'
            [[ "$running" != true ]] && echo 'container was already not running!' ;;
        up|update)
            podman rmi -f "$IMAGE"
            podman pull "$IMAGE" ;;
        *) echo 'invalid arguments!' ;;
    esac
    return 0
}

function netbird(){
    local -r IMAGE="docker.io/netbirdio/netbird"
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
                "$IMAGE" >/dev/null
            podman exec -it netbird-client bash ;;
        stop|kill|end|rm) 
            [[ "$running" == true ]] && podman kill netbird-client >/dev/null && echo 'container removed!'
            [[ "$running" != true ]] && echo 'container was already not running!' ;;
        up|update)
            podman rmi -f "$IMAGE"
            podman pull "$IMAGE" ;;
        *) echo 'invalid arguments!' ;;
    esac
    return 0
}

function rmall(){
    echo -n "neovim: " && edit rm
    echo -n "netbird: " && netbird rm
}

function root-netbird(){
    local -r IMAGE="docker.io/netbirdio/netbird"
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
                "$IMAGE" >/dev/null
            sudo podman exec -it netbird-client bash ;;
        stop|kill|end|rm) 
            [[ "$running" == true ]] && sudo podman stop netbird-client >/dev/null && echo 'container removed!'
            [[ "$running" != true ]] && echo 'container was already not running!' ;;
        up|update)
            podman rmi -f "$IMAGE"
            podman pull "$IMAGE" ;;
        *) echo 'invalid arguments!' ;;
    esac
    return 0
}
