#!/bin/bash

#author: Salma
#original_order()-------------------------------------#
#input: series of numbers in array
#output: the original series order
#-----------------------------------------------------#


original_order()
{
	local arr_length=${#array[@]}

	for ((i=0; i<$arr_length; i++))
	do
		echo -n "${array[$i]} "
	done

	echo
}

sort()
{
	local sorted_arr=$(sort -n <<<"${array[*]}")
	num_of_elements $sorted_arr
}

max_value()
{
	local arr_length=${#array[@]}
	local max=${array[0]}


	for ((i=0; i<$arr_length; i++))
	do
		if (( array[$i] > $max ))
		then
			let max=${array[$i]}
		fi
	
		done

		echo $max
}



min_value()
{
        local arr_length=${#array[@]}
        local min=${array[0]}


        for ((i=0; i<$arr_length; i++))
        do
		if (( array[$i] < $min ))
                then
			let min=${array[$i]}
			
                fi

                done

                echo $min
}


array=("1" "7" "3")
min_value $array
