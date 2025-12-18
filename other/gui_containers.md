## command to run wayland applications inside a container

```bash
podman run -it --rm -e WAYLAND_DISPLAY="$WAYLAND_DISPLAY" \
    -e XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" \
    -v "$XDG_RUNTIME_DIR"/"$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY" \
    --security-opt label=type:container_runtime_t \
    fedora
```

## dockerfile to create a systemd init container

```dockerfile
FROM fedora:latest

RUN dnf -y update && \
    dnf -y install systemd && \
    dnf clean all

CMD [ "/usr/lib/systemd/systemd" ]
```
