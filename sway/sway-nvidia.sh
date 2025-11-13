#!/bin/bash

# Nvidia Wayland optimized setup
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1

# Wayland session
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# Firefox
export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1

# Steam/Proton
export __GL_GSYNC_ALLOWED=0
export __GL_VRR_ALLOWED=0

exec sway --unsupported-gpu "$@"
