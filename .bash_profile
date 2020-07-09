# ~/.bash_profile: executed by bash(1) for login shells.

umask 002
PS1='[\h]$ '
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

