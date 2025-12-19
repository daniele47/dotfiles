# commands to run GUI applications inside a container

## integrate wayland, x11

```bash
podman run -it --rm \
    -e "WAYLAND_DISPLAY=$WAYLAND_DISPLAY" \
    -e XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" \
    -e "DISPLAY=$DISPLAY" \
    -e "XAUTHORITY=$XAUTHORITY" \
    -v "$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:ro" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:ro" \
    -v "$XAUTHORITY:$XAUTHORITY:ro" \
    --security-opt label=type:container_runtime_t \
    fedora
```

## integrate wayland, x11, pipewire, pulseaudio, dbus

```bash
podman run -it --rm \
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
  fedora
```
