#!/usr/bin/env bash

# export GBM_BACKEND=nvidia-drm
# export __GLX_VENDOR_LIBRARY_NAME=nvidia
# export WLR_NO_HARDWARE_CURSORS=1
# export WLR_RENDERER_ALLOW_SOFTWARE=1
# export WLR_RENDERER=vulkan

exec /usr/bin/sway --unsupported-gpu "$@"
