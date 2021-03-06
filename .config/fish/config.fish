#!/usr/bin/env fish
# Set PROFILE variable for powershell-like referencing of this file
set -U profile ~/.config/fish/config.fish

# Set NIXOS_CONFIG variable for quick config changes in NixOS
if test -e /etc/nixos/configuration.nix
    set -U NIXOS_CONFIG /etc/nixos/configuration.nix
end

# Turn off greeting message
set -U fish_greeting ""

# Create Alias for vim
switch $EDITOR
    case nvim
        alias edit="nvim"
        alias vim="nvim"
        alias vi="nvim"
    case vim
        alias edit="vim"
        alias nvim="vim"
        alias vi="vim"
    case '*'
        alias edit="vi"
        alias nvim="vi"
        alias vim="vi"
end

switch $VISUAL
    case "nvim -R"
        alias view="nvim -R"
    case "vim -R"
        alias view="vim -R"
    case '*'
        alias view="vi -R"
end

# Create Alias for cls
alias cls="clear"

# Install fisher if available
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fisher
end

# Edit path
for each in ~/.cargo/bin \
    ~/.nix-profile/bin \
    ~/.local/bin
    if test -d $each
        and not contains $each $PATH
        set -a PATH $each
    end
end


# Set up exa
if command -s exa &>/dev/null
    alias ls='exa -F --icons'
else
    alias ls='ls -F'
end

alias la='ls -abghl'
alias dir='ls -abghl'

# Set up bat
if command -s bat &>/dev/null
    alias cat='bat'
end

# Alias ripgrep for grep
if command -s rg &>/dev/null
    alias grep='rg'
    alias egrep='rg'
    alias pgrep='rg'
end

# Alias fd for find
if command -s fd &>/dev/null
    alias find='fd'
end

# Set up starship
if command -s starship &>/dev/null
    starship init fish | source
end

if command -s direnv &>/dev/null
    eval (direnv hook fish)
end
