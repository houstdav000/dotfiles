#!/usr/bin/env bash

export BASH_STARTED=1

# Source environment variables from .profile
if [[ -f "${HOME}/.profile" ]]; then
    # shellcheck source=./.profile
    . "${HOME}/.profile"
fi

# Turn on lesspipe if available
if command -v lesspipe &>/dev/null; then
    eval "$(SHELL=/bin/sh lesspipe)"
fi

# Run gnome-keyring daemon if available
if command -v gnome-keyring-daemon &>/dev/null; then
    export "$(gnome-keyring-daemon --start --components=pkcs11\,secrets\,ssh)"
fi

# Run .bashrc if interactive
if [[ $- == *i* && -f "${HOME}/.bashrc" ]]; then
    # shellcheck source=./.bashrc
    . "${HOME}/.bashrc"
fi
