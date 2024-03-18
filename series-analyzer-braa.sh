#!/bin/bash

# Check if series is passed as arguments. If not, read from input.
if [ $# -gt 0 ]; then
    series=("$@")
else
    read -p "Enter a series of positive numbers separated by space: " -a series
fi

# Function to validate the series
validate_series() {
    local series=("$@") # Local copy of the series array
    local num

    # check for minimum count
    if [ "${#series[@]}" -lt 3 ]; then
        echo "Error: At least 3 positive numbers are required."
        return 1 # return 1 indicates error
    fi

    # check each element for being a positive number
    for num in "${series[@]}"; do
        #  regex to check if num is a positive integer
        if ! [[ "$num" =~ ^[1-9][0-9]*$ ]]; then
            echo "Error: Each input must be a positive number. Found invalid input: $num"
            return 1 # Return 1 indicates error
        fi
    done

    return 0 #return 0 indicates success
}

# validate the initial series
if ! validate_series "${series[@]}"; then
    exit 1
fi
