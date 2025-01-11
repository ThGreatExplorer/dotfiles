#!/bin/zsh

# The path to the symlink
SYMLINK_PATH="$HOME/current_courses"

# Create an array to store course names and their corresponding directories
typeset -A COURSE_PATHS

# Populate the array with course names from the `info.yaml` files
for dir in $(find -L "$SYMLINK_PATH" -mindepth 1 -maxdepth 1 -type d); do
    COURSE_NAME=$(yq eval ".title" "$dir/info.yaml")
    if [ -n "$COURSE_NAME" ]; then
        COURSE_PATHS["$COURSE_NAME"]="$dir"
    fi
done

# Debugging: Print the contents of COURSE_PATHS
echo "Contents of COURSE_PATHS:"
for course in "${(@k)COURSE_PATHS}"; do
    echo "Course: $course, Path: ${COURSE_PATHS[$course]}"
done

# Display the course names in Rofi and capture the selected course
SELECTED_COURSE=$(printf "%s\n" "${(@k)COURSE_PATHS}" | rofi -dmenu -p "Select course")

# If a course was selected, open a new terminal in the corresponding directory
if [ -n "$SELECTED_COURSE" ]; then
    gnome-terminal --working-directory="${COURSE_PATHS[$SELECTED_COURSE]}"
fi

