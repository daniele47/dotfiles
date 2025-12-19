## command to run GUI applications inside a container

```bash
podman run -it --rm -e "WAYLAND_DISPLAY=$WAYLAND_DISPLAY" \
    -e XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" \
    -v "$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:ro" \
    -e "DISPLAY=$DISPLAY" \
    -e "XAUTHORITY=$XAUTHORITY" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:ro" \
    -v "$XAUTHORITY:$XAUTHORITY:ro" \
    --security-opt label=type:container_runtime_t \
    fedora
```
