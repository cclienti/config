#!/bin/sh

# Récupérer le workspace courant de la sortie focalisée
CUR_WORKSPACE=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .current_workspace')

# Déterminer le workspace cible
if [ "$1" = "prev" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE - 1)
elif [ "$1" = "next" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE + 1)
else
    # Argument invalide
    exit 1
fi

# Wrap-around
if [ "$TO_WORKSPACE" -gt 10 ]; then
    TO_WORKSPACE=1
elif [ "$TO_WORKSPACE" -lt 1 ]; then
    TO_WORKSPACE=10
fi

# Switch workspace
swaymsg workspace number "$TO_WORKSPACE"
