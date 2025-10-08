#!/bin/bash






books_dir="$HOME/data/books"

show_directory_contents() {

    local current_dir="$1"
    local display_path="$2"
    local temp_file=$(mktemp)

    if [[ "$current_dir" != "$books_dir" ]]; then
        echo "← Back|BACK|$current_dir" >> "$temp_file"
    fi

    for dir in "$current_dir"/*; do
        if [[ -d "$dir" ]]; then
            dir_name=$(basename "$dir")
            echo "$dir_name/|DIR|$dir" >> "$temp_file"
        fi
    done

    for file in "$current_dir"/*.{pdf,epub,djvu,mobi,azw,azw3,fb2} "$current_dir"/*.{PDF,EPUB,DJVU,MOBI,AZW,AZW3,FB2}; do
        if [[ -f "$file" ]]; then
            filename=$(basename "$file")
            echo "$filename|FILE|$file" >> "$temp_file"
        fi
    done

    if [[ "$current_dir" != "$books_dir" ]]; then
        head -1 "$temp_file" > "${temp_file}.sorted"
        tail -n +2 "$temp_file" | sort >> "${temp_file}.sorted"
        mv "${temp_file}.sorted" "$temp_file"
    else
        sort "$temp_file" -o "$temp_file"
    fi

    if [[ ! -s "$temp_file" ]] || [[ $(wc -l < "$temp_file") -eq 0 ]]; then
        echo "No books found|EMPTY|" >> "$temp_file"
    fi

    display_list=$(cut -d'|' -f1 "$temp_file")

    if [[ -z "$display_path" ]]; then
        prompt=" Books"
    else
        prompt=" $display_path"
    fi

    selection=$(echo "$display_list" | rofi -dmenu -p "$prompt")

    if [ -n "$selection" ]; then
        if [[ "$selection" == "← Back" ]]; then
            parent_dir=$(dirname "$current_dir")
            if [[ "$parent_dir" == "$books_dir" ]]; then
                show_directory_contents "$books_dir" ""
            else
                parent_name=$(basename "$parent_dir")
                show_directory_contents "$parent_dir" "$parent_name"
            fi
        elif [[ "$selection" == "No books found" ]]; then
            show_directory_contents "$current_dir" "$display_path"
        else
            item_info=$(while IFS='|' read -r name type path; do
                if [[ "$name" == "$selection" ]]; then
                    echo "$name|$type|$path"
                    break
                fi
            done < "$temp_file")

            if [[ -n "$item_info" ]]; then
                item_type=$(echo "$item_info" | cut -d'|' -f2)
                item_path=$(echo "$item_info" | cut -d'|' -f3)

                if [[ "$item_type" == "DIR" ]]; then
                    dir_name=$(basename "$item_path")
                    if [[ -z "$display_path" ]]; then
                        new_display_path="$dir_name"
                    else
                        new_display_path="$display_path/$dir_name"
                    fi
                    show_directory_contents "$item_path" "$new_display_path"
                elif [[ "$item_type" == "FILE" ]]; then
                    if [ -f "$item_path" ]; then
                        zathura "$item_path" &
                    else
                        notify-send "Error" "File not found: $item_path"
                    fi
                fi
            else
                notify-send "Error" "Selection not found: $selection"
            fi
        fi
    fi
    rm -f "$temp_file" "${temp_file}.sorted"
}





show_directory_contents "$books_dir" ""