#! /bin/bash

#Author : salma, mohamed, baraa, areej
#original_order()----------------------------------------------------#
#input : series of numbers
#integers output : the original order of the numbers 
#--------------------------------------------------------------------#
function original_order()
{
	local arr_length=${#series[@]}

	for ((i=0; i<$arr_length; i++))
	do
		echo -n "${series[$i]} "
	done

	echo
}


#num_of_elements()----------------------------------------------------#
#input : series of numbers
#integers output : number of elements in the series
#---------------------------------------------------------------------#
function num_of_elements()
{
    echo "Number of Elements in the Series : ${#series[@]}"
}


#sort()----------------------------------------------------#
#input : series of numbers
#integers output : the series is sorted from low to high 
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

    for ((m=0; m<length; m++)); do
        echo -n "${sorted_array[$m]} "
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
	local max=${series[0]}


	for ((i=0; i<$arr_length; i++))
	do
		if (( series[$i] > $max ))
		then
			let max=${series[$i]}
		fi
	
		done

		echo "Maximum value is: $max"
}



#min_value()----------------------------------------------------#
#input : series of numbers
#integers output : tminimum value in the series 
#---------------------------------------------------------------#
function min_value()
{
    local arr_length=${#series[@]}
    local min=${series[0]}

    for ((i=0; i<$arr_length; i++))
        do
    		if (( series[$i] < $min ))
            then
			let min=${series[$i]}
            fi
        done
    echo "Minimum value is: $min"
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
    #echo "Sum of the Series = $sum"
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
    echo "Average Of the Series=$average"
}

#display_menu()----------------------------------------------------#
#input : none
#integers output : display the menu 
#------------------------------------------------------------------#
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
    echo
}


#validate_series()----------------------------------------------------#
#input : series of numbers
#integers output : the result of numbers validation
#---------------------------------------------------------------------#
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


#input_series()----------------------------------------------------#
#input : none
#integers output : validate_series()
#------------------------------------------------------------------#
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
            i) echo "Exiting..."; exit ;;
            *) echo "Invalid option. Please choose a valid option." ;;
        esac
        echo
    done
}
input_series
# Run the main function
main
