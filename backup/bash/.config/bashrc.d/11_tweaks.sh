# history expand before running
shopt -s histverify

# cd can be skipped to change directory
shopt -s autocd

# case insensitive completion
bind 'set completion-ignore-case on'

# keybinds
bind '"\e[5~": history-search-backward'
bind '"\e[6~": history-search-forward'
