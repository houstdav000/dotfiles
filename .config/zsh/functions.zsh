#!/usr/bin/env zsh
#
# Zsh functions for git and such

function push() {
    git push "$@"
}

function pull() {
    git pull "$@"
}

function commit() {
    git commit "$@"
}

function commit-all() {
    git commit -a "$@"
}

function switch() {
    git switch "$@"
}

function stash() {
    git stash "$@"
}

function rebase() {
    git rebase '$@'
}

function stage() {
    git add .
}

function unstage() {
    git unstage
}

function state() {
    git state
}

function github() {
    if [[ $# -eq 1 ]]; then
        git clone "github:$1.git"
    elif [[ $# -eq 2 ]]; then
        git clone "github:$1/$2.git"
    else
        echo "Usage: github <user> <repo>"
    fi
}

function gitlab() {
    if [[ $# -eq 1 ]]; then
        git clone "gitlab:$1.git"
    elif [[ $# -eq 2 ]]; then
        git clone "gitlab:$1/$2.git"
    else
        echo "Usage: gitlab <user> <repo>"
    fi
}

# Create Functions for nixos
function nixupd() {
    if command -v nixos-rebuild &>/dev/null; then
        sudo nix-channel --update "$@"
    else
        nix-channel --update "$@"
    fi
}

function nixsw() {
    if command -v nixos-rebuild &>/dev/null; then
        sudo nixos-rebuild switch "$@"
    else
        home-manager switch "$@"
    fi
}
