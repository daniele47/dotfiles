#!/bin/bash

function upgrade(){
    sudo sh -c '
        rpm-ostree update
        flatpak update -y
    ' && distrobox upgrade --all
}
