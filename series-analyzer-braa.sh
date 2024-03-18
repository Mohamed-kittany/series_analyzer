#!/bin/bash

# Function to validate the series
# 
validate_series() {
    local series=("$@") # Local copy of the series array
    local num

    # Check for minimum count
    if [ "${#series[@]}" -lt 3 ]; then
        echo "Error: At least 3 positive numbers are required."
        return 1 # Return 1 indicates error
    fi

    # check each element for being a positive number
    for num in "${series[@]}"; do
        # using regex to check if num is a positive integer
        if ! [[ "$num" =~ ^[1-9][0-9]*$ ]]; then
            echo "Error: Each input must be a positive number. Found invalid input: $num"
            return 1 #  1 indicates error
        fi
    done

    return 0 #  0 indicates success
}

# Main script logic
if [ $# -gt 0 ]; then
    series=("$@")
    if ! validate_series "${series[@]}"; then
        exit 1
    fi
else
    while true; do
        echo "Enter a series of positive numbers separated by space ('exit' to quit):"
        read -ra series
        # Check if the user wants to exit
        if [[ "${series[0]}" == "exit" ]]; then
            echo "Exiting."
            exit 0
        fi
        if validate_series "${series[@]}"; then
            break
        else
            echo "Invalid input. Please try again."
        fi
    done
fi

echo "series accepted: ${series[*]}"


