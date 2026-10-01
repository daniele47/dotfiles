#!/bin/bash

# shut up when i type missing cmd
unset -f command_not_found_handle

# history expand before running
shopt -s histverify

# cd can be skipped to change directory
shopt -s autocd

# case insensitive completion
bind 'set completion-ignore-case on'
