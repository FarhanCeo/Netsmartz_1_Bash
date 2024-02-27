#!/bin/bash


#pwd => /home/farhan/Desktop/random_assignment1
#-----------------------------------------------------

#Argument list:
#$1 = server_number
#$2 = log_count

#-----------------------------------------------------

server_number=$1
log_count=$2

#-----------------------------------------------------
#CREATE A FILE FOR SERVER


#count files of serverI than increase the number and create for that number
file_count=$(ls ./servers/ | grep -c "^server$1")
#echo file count = $file_count
increase_count=$((file_count+1))
#echo "increase count => $increase_count"

new_filename=server$1.$increase_count.txt
echo "new filename:$new_filename--"
touch ./servers/$new_filename
echo "logs of server$1 is transferring....."

for ((i=1; i<=$2; i++ ))
do
	check=$((RANDOM%4))
	if [ $check -eq 0 ]; then
		check="ERROR"
	else
		check="SUCCESS"
	fi
	echo $(date)    $(pwd)    server$1    $check >> ./servers/$new_filename
	# Check for folder of that server
	if [ -d "./Central_log_server/server$1" ]; then
		cp ./servers/$new_filename ./Central_log_server/server$1
		
	elif [ $new_filename == "server1.1.txt" ]; then
		#Make directory for new server i.e. server1.1 only
		mkdir ./Central_log_server/server$1
		#Create a file to store total server count (only create for one time, after it only do update in it)
		touch ./Central_log_server/memory_servers_count.txt
		#Set 0 as total server count, on running analyzing script it will update automatically
		echo "0" > ./Central_log_server/memory_servers_count.txt
		#Create separate file to store total file count of server
		touch ./Central_log_server/server$1/memory_file_count.txt
		#Set 0 as total file count at first, it will update on running analyzing script
		echo "0" > ./Central_log_server/server$1/memory_file_count.txt
		#Create a separate file to store total error count of server
		touch ./Central_log_server/server$1/memory_error_count.txt
		#Set 0 as the total error count at first it will update on running analyzing script
		echo "0" > ./Central_log_server/server$1/memory_error_count.txt

	else
		mkdir ./Central_log_server/server$1
		#Create separate file to store total file count of server
		touch ./Central_log_server/server$1/memory_file_count.txt
		#Set 0 as total file count at first, it will update on running analyzing script
		echo "0" > ./Central_log_server/server$1/memory_file_count.txt
		#Create a separate file to store total error count of server
		touch ./Central_log_server/server$1/memory_error_count.txt
		#Set 0 as the total error count at first it will update on running analyzing script
		echo "0" > ./Central_log_server/server$1/memory_error_count.txt

	fi
	
	
done
