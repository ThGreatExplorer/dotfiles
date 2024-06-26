#!/bin/bash

# Get the list of all workspaces
workspaces=$(i3-msg -t get_workspaces | jq -r '.[] | .num')

# Convert the list of workspaces to an array
workspace_array=($workspaces)

# Get the current workspace number
current_workspace=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true) | .num')

# Find the index of the current workspace in the array
current_index=-1
for i in "${!workspace_array[@]}"; do
  if [ "${workspace_array[$i]}" -eq "$current_workspace" ]; then
    current_index=$i
    break
  fi
done

# Calculate the next workspace index (cyclic)
next_index=$(( (current_index + 1) % ${#workspace_array[@]} ))

# Switch to the next workspace
i3-msg workspace number "${workspace_array[$next_index]}"

