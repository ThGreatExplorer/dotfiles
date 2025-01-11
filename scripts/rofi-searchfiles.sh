#!/bin/zsh

# Define multiple search directories
SEARCH_DIRS=("$HOME/Documents" "$HOME/current_courses" "$HOME/Downloads" "$HOME/Zotero")  # Add more directories as needed

# Define file types you want to search for
FILE_TYPES="*.pdf *.tex *.epub *.djvu"  # Add or remove file types as necessary

# Create an empty variable to store the found files
results=""

# Use a for loop to search each directory
for dir in "${SEARCH_DIRS[@]}"; do
    # Find files recursively, output full paths, and append them to results
    results+=$(find -L "$dir" -type f \( -name "*.pdf" -o -name "*.tex" -o -name "*.epub" -o -name "*.djvu" \) 2>/dev/null)
    results+=$'\n'  # Add a newline between results from different directories
done

# Remove empty lines (in case no files are found) and send results to Rofi
echo "$results" | grep -v '^$' | rofi -dmenu -i -p "Select File:" | while read -r file; do
    case "$file" in
        *.pdf) zathura "$file" ;;
        *.tex) gnome-terminal -- nvim "$file" ;;
        *.epub) calibre "$file" ;;
        *.djvu) zathura "$file" ;;
        *) xdg-open "$file" ;;
    esac
done
