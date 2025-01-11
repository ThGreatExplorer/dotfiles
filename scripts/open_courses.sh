#!/bin/zsh

SYMLINK_PATH="$HOME/current_courses"

# Check if the course directory exists
if [[ -d "$SYMLINK_PATH/$1" ]]; then
  # Extract the URL from the info.yaml file and open it in Firefox
  URL=$(yq eval ".url" "$SYMLINK_PATH/$1/info.yaml")
  
  if [[ -n "$URL" ]]; then
    exec firefox "$URL"
  else
    echo "URL not found in $SYMLINK_PATH/$1/info.yaml"
  fi
else
  echo "Course directory $SYMLINK_PATH/$1 not found."
fi

