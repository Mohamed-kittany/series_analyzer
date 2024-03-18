#! /bin/bash

# Function to read series from the user
input_series() {
    while true; do
        echo "Enter a series of positive numbers separated by space ('exit' to quit):"
        read -ra series
        # Check if the user wants to exit
        if [[ "${series[0]}" == "exit" ]]; then
            echo "Exiting."
            exit 0
        fi
        if validate_series "${series[@]}"; then
            echo "Series accepted: ${series[*]}"
            break
        else
            echo "Invalid input. Please try again."
        fi
    done
}

# Function to validate the series
validate_series() {
    local series=("$@")
    local num

    if [ "${#series[@]}" -lt 3 ]; then
        echo "Error: At least 3 positive numbers are required."
        return 1
    fi

    for num in "${series[@]}"; do
        if ! [[ "$num" =~ ^[1-9][0-9]*$ ]]; then
            echo "Error: Each input must be a positive number. Found invalid input: $num"
            return 1
        fi
    done

    return 0
}
