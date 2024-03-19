#!/bin/bash

# Define color escape sequences
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color


#Author : salma, mohamed, baraa, areej
#original_order()----------------------------------------------------#
#input : series of numbers
#integers output : the original order of the numbers 
#--------------------------------------------------------------------#
function original_order()
{
	local arr_length=${#series[@]}

    # Printing the series
	for ((i=0; i<$arr_length; i++))
	do
		echo -en "${CYAN}${series[$i]} ${NC}"
	done

	echo
}


#num_of_elements()----------------------------------------------------#
#input : series of numbers
#integers output : number of elements in the series
#---------------------------------------------------------------------#
function num_of_elements()
{
    echo -e "${YELLOW}Number of Elements in the Series : ${#series[@]}${NC}"
}


#sort()----------------------------------------------------#
#input : series of numbers
#integers output : the series is sorted from low to high value
#-----------------------------------------------------------#
function sort() {
    local sorted_array=("$@")
    local length=${#sorted_array[@]}
    
    for ((i = 0; i < length; i++)); do
        for ((j = 0; j < length-i-1; j++)); do
            if [[ ${sorted_array[j]} -gt ${sorted_array[j + 1]} ]]; then
                temp=${sorted_array[j]}
                sorted_array[j]=${sorted_array[j + 1]}
                sorted_array[j + 1]=$temp
            fi
        done
    done

    # Printing the series 
    for ((m=0; m<length; m++)); do
        echo -en "${GREEN}${sorted_array[$m]} ${NC}"
    done

    echo
}


#max_value()----------------------------------------------------#
#input : series of numbers
#integers output : maximum value in the series 
#---------------------------------------------------------------#
function max_value()
{
	local arr_length=${#series[@]}
    
    # Assigning the max value with the first index in the series.
	local max=${series[0]}


	for ((i=0; i<$arr_length; i++))
	do
		if (( series[$i] > $max ))
		then
			let max=${series[$i]}
		fi
	
		done

		echo -e "${RED}Maximum value is: $max${NC}"
}



#min_value()----------------------------------------------------#
#input : series of numbers
#integers output : minimum value in the series 
#---------------------------------------------------------------#
function min_value()
{
    local arr_length=${#series[@]}

    # Assigning the min value with the first index in the series.
    local min=${series[0]}

    for ((i=0; i<$arr_length; i++))
        do
    		if (( series[$i] < $min ))
            then
			let min=${series[$i]}
            fi
        done
    echo -e "${RED}Minimum value is: $min${NC}"
}

 
#sum()----------------------------------------------------#
#input : series of numbers
#integers output : sum of the numbers 
#---------------------------------------------------------#
function sum()
{
    local sum=0
    for num in "${series[@]}"
    do
        local sum=$((sum+num))
    done

    echo -e "${YELLOW}Sum of the Series = $sum${NC}"
}

#average()----------------------------------------------------#
#input : series of numbers
#integers output : average of the numbers 
#-------------------------------------------------------------#
function average()
{
    local sum=0
    for num in "${series[@]}"
    do
        sum=$((sum + num))
    done
    
    local average=$(printf "%.2f" "$(echo "scale=2; $sum / ${#series[@]}" | bc -l)")
    echo -e "${YELLOW}Average Of the Series=$average${NC}"
}

#display_menu()----------------------------------------------------#
#input : none
#integers output : display the menu 
#------------------------------------------------------------------#
display_menu() {
    echo -e "${GREEN}Series Analyzer Menu:${NC}"
    echo -e "${CYAN}a.${NC} Input a Series"
    echo -e "${CYAN}b.${NC} Display the series in the order it was entered"
    echo -e "${CYAN}c.${NC} Display the series in sorted order"
    echo -e "${CYAN}d.${NC} Display the Max value of the series"
    echo -e "${CYAN}e.${NC} Display the Min value of the series"
    echo -e "${CYAN}f.${NC} Display the Average of the series"
    echo -e "${CYAN}g.${NC} Display the Number of elements in the series"
    echo -e "${CYAN}h.${NC} Display the Sum of the series"
    echo -e "${CYAN}i.${NC} Exit"
    echo
}


#validate_series()----------------------------------------------------#
#input : series of numbers
#integers output : the result of numbers validation (0 = true/success | 1 = false/error)
#---------------------------------------------------------------------#
validate_series() {
    local series=("$@") # Local copy of the series array
    local num

    # Check for minimum count
    if [ "${#series[@]}" -lt 3 ]; then
        echo -e "${RED}Error: At least 3 positive numbers are required.${NC}"
        return 1 # Return 1 indicates error
    fi

    # check each element for being a positive number
    for num in "${series[@]}"; do
        # using regex to check if num is a positive integer
        if ! [[ "$num" =~ ^[1-9][0-9]*$ ]]; then
            echo -e "${RED}Error: Each input must be a positive number. Found invalid input: $num${NC}"
            return 1 #  1 indicates error
        fi
    done

    return 0 #  0 indicates success
}


#input_series()----------------------------------------------------#
#input : none
#integers output : validate_series()
#------------------------------------------------------------------#
input_series() {
    while true; do
        echo -e "${GREEN}Enter a series of positive numbers separated by space ('exit' to quit):${NC}"
        read -ra series

        # Check if the user wants to exit
        if [[ "${series[0]}" == "exit" ]]; then
            echo -e "${YELLOW}Exiting.${NC}"
            exit 0
        fi
        
        # Validating the given series.
        if validate_series "${series[@]}"; then
            echo -e "${YELLOW}Series accepted: ${series[*]}${NC}"
            break
        else
            echo -e "${RED}Invalid input. Please try again.${NC}"
        fi
    done
}


#main()----------------------------------------------------#
#input : none
#integers output : display menu 
#---------------------------------------------------------#
main() {

    while true; do
        display_menu
        read -r choice
        case $choice in
            a) input_series ;;
            b) original_order $series;;
            c) sort "${series[@]}" ;;
            d) max_value $series ;;
            e) min_value $series ;;
            f) average $series;;
            g) num_of_elements $series;;
            h) sum $series;;
            i) echo -e "${YELLOW}Exiting...${NC}"; exit ;;
            *) echo -e "${RED}Invalid option. Please choose a valid option.${NC}" ;;
        esac
        echo
    done
}


input_series
# Run the main function
main