#!/usr/bin/env bash

virt-install \
    --name ubuntu24 \
    --memory 8192 \
    --vcpus 2 \
    --disk size=20 \
    --cdrom /usr/local/src/isos/ubuntu-24.04.1-desktop-amd64.iso \
    --network bridge:virbr0 \
    --os-variant ubuntu24.04
