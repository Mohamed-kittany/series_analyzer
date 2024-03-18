#! /bin/bash

# Function to display the menu
display_menu() {
    echo "Series Analyzer Menu:"
    echo "a. Input a Series"
    echo "b. Display the series in the order it was entered"
    echo "c. Display the series in sorted order"
    echo "d. Display the Max value of the series"
    echo "e. Display the Min value of the series"
    echo "f. Display the Average of the series"
    echo "g. Display the Number of elements in the series"
    echo "h. Display the Sum of the series"
    echo "i. Exit"
}


# Main function
main() {
    while true; do
        display_menu
        read -r choice
        case $choice in
            a) input_series ;;
            b) display_series ;;
            c) display_sorted_series ;;
            d) calculate_max ;;
            e) calculate_min ;;
            f) calculate_average ;;
            g) calculate_num_elements ;;
            h) calculate_sum ;;
            i) echo "Exiting..."; exit ;;
            *) echo "Invalid option. Please choose a valid option." ;;
        esac
        echo
    done
}

# Run the main function
main