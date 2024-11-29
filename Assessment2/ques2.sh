# !/bin/bash

memory_information=$(free)
echo "$memory_information"

#accesing memory information
total_mem=$(echo "$memory_information" | grep Mem: | awk '{print $2}')
used_mem=$(echo "$memory_information" | grep Mem: | awk '{print $3}')
free_mem=$(echo "$memory_information" | grep Mem: | awk '{print $4}')

echo "Total Memory: $total_mem kB"
echo "Used Memory: $used_mem kB"
echo "Free Memory: $free_mem kB"


#finding disc info
disc_info=$(df -h /)
echo "$disc_info"

#finding used space
used_space=$(df -h | grep '/dev/sdc' | awk '{print $5}')
echo "$free_space"

#converting %space into number
total_used_space=$(echo "$used_space" | cut -d '%' -f1)
echo "$total_used_space"


#checking whether space is greater than 50 or not
if [ $total_used_space -le 50 ]; then
	directory="alert"
	mkdir -p "$directory"
	file_name="Notification.txt"
	echo "$used_space space used"> "$file_name"
	mv "$file_name" "$directory"
else
	echo "we"
fi


#finding top 10 files in file system
top_file=$(du -a /home | sort -n -r | head -n 10)
echo "$top_file"
