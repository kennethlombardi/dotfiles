#!/bin/zsh

# Get the id of the iTerm window
# iterm_id=$(yabai -m query --windows | jq -r 'map(select(.app == "iTerm2")) | .[0].id')
# echo $iterm_id

# Get the id of the VSCode window
# vscode_id=$(yabai -m query --windows | jq -r 'map(select(.app == "Code")) | .[0].id')
# echo $vscode_id

# Move iTerm to the top half of the screen
# yabai -m window "$iterm_id" --grid 2:2:0:0:2:1

# Move VSCode to the bottom half of the screen
# yabai -m window "$vscode_id" --grid 2:2:0:1:2:1
# 

# Get the id of the iTerm window
iterm_id=$(yabai -m query --windows | jq -r 'map(select(.app == "iTerm2")) | .[0].id')

# Get the id of the VSCode window
vscode_id=$(yabai -m query --windows | jq -r 'map(select(.app == "Code")) | .[0].id')

# Focus on iTerm and split the window horizontally, moving it to the top
yabai -m window "$iterm_id" --focus
# yabai -m window --toggle split
yabai -m window "$vscode_id" --grid 2:2:0:1:2:1

# Focus on VSCode and split the window horizontally, moving it to the bottom
# yabai -m window "$vscode_id" --focus
# yabai -m window --toggle split