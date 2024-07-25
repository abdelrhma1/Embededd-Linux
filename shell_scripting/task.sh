#!/usr/bin/bash
# Description: Organizes files
# Input: Path of files from user.
# Output: Types of folders, each folder contains a single type of files.
# -------------------------------------------------------------/

## Function create ##
function create_dir() {
    local dir_name=$1
    if [ ! -d "$dir_name" ]; then
        mkdir "$dir_name"
    fi
}
## Function move ##
function move_files() {
    local files=("${!1}")
    local dir_name=$2
    if [ ${#files[@]} -gt 0 ]; then
        mv "${files[@]}" "$dir_name"
    fi
}
# -------------------------------------------------------------/
## Main function ##
function main() {
    local path=$1

    # Check if path exists
    if [ ! -e "$path" ]; then
        echo "-> Path does not exist"
        exit 1
    fi
    echo "-> Path exists"

    # Find all .txt files in the specified directory and store them in an array
    readarray -t resultArray1 < <(find "$path" -maxdepth 1 -type f -name "*.txt")
    create_dir "text_folder"
    move_files resultArray1[@] "text_folder"

    # Find all .jpg files in the specified directory and store them in an array
    readarray -t resultArray2 < <(find "$path" -maxdepth 1 -type f -name "*.jpg")
    create_dir "jpg_folder"
    move_files resultArray2[@] "jpg_folder"

    # Find all .pdf files in the specified directory and store them in an array
    readarray -t resultArray3 < <(find "$path" -maxdepth 1 -type f -name "*.pdf")
    create_dir "pdf_folder"
    move_files resultArray3[@] "pdf_folder"

    # Find all other files in the specified directory and store them in an array
    readarray -t resultArray4 < <(find "$path" -maxdepth 1 -type f ! -name "*.txt" ! -name "*.jpg" ! -name "*.pdf")
    create_dir "misc_folder"
    move_files resultArray4[@] "misc_folder"
}

# Call the main function 
main "$1"
