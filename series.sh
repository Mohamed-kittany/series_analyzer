# average
function average()
{
sum=0
for num in "${series[@]}"
do
sum=$((sum + num))
done
average=$(echo "scale=2"; $sum / ${#series[@]} | bc)
echo "Average Of the Series=$average"
}
#NumberOfElemnts
function numofelemnts()
{
echo "Number of Elements in the Series : ${#series[@]}"
}
#sum
function sum()
{
sum=0
for num in "${series[@]}"
do
sum=$((sum+num))
done
echo "Sum of the Series=$sum"
}
