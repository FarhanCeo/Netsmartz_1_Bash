#!/bin/bash

#pwd=> /home/farhan/Desktop/random_assignment1/Central_log_server

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NC='\033[0m' # No Color



#--------------------------------ALL-FUNCTIONS-DEFINITION-GOES-HERE---------------------------------------------------
#COUNT TOTAL FILES OF EACH SERVER
	#FIRST COUNT THE FOLDERS
#total_server_count=$(ls | grep "^server*"  | wc -l)
#echo $total_server_count
#echo "total_server_count $total_server_count" > memory_servers_count.txt

#for ((i=1; i<=$total_server_count; i++))
#do
#	total_file_count=$(ls ./server$i | wc -l)
#	echo "total_file_count in server$i $total_file_count" >> memory_servers_count.txt
#	echo "total file count in server$i=> $total_file_count"

#done
function analyzefile(){
	echo "Analyzing $1"
	echo "Server number $2"
	error_count=$(grep -c "ERROR" $1)
	path=$1
	filename=${path:10:7}
	index_name=${path:10:9}
	echo "Index:--$index_name--"
	#echo "Filename:--$filename--"
	if [ -d "error_count_folder" ]; then
		echo "$index_name:$error_count" >> ./error_count_folder/$filename.txt	
	else
		mkdir error_count_folder
		echo "$index_name:$error_count" >> ./error_count_folder/$filename.txt
	fi
	
	
	
	old_error_count=$(cat ./server$2/memory_error_count.txt)
	
	#echo line---$line_of_error--
	#old_error_count=${line_of_error:6:4}
	echo "old error count:$old_error_count"
	echo "new error count:$error_count"
	if [ $old_error_count == 0 ]; then
		echo "$error_count" > ./server$2/memory_error_count.txt
	else
		
		#echo "OLD-$old_error_count"
		echo "new error count:$error_count"
		sum=$(($old_error_count + $error_count))
		echo "sum:$sum"
		echo "$sum" > ./server$2/memory_error_count.txt
	
	fi
	
	if [ $error_count -gt 100 ]; then
		echo -e "${RED}#-----------------------------------------#${NC}"
		echo -e "${RED} ERROR THRESHOLD REACHED IN SERVER $2 ${NC}"
		echo -e "${RED}#-----------------------------------------#${NC}"
	fi
	
	
}	


#------------------------------ALL-FUNCTIONS-DEFINITION-END----------------------------------------

#------------------------------ALL-OPTIONS-GOES-HERE-----------------------------------------------

#-----------------------------If-no-arguments-then-ask-for-help------------------------------------		
if [ $# == 0 ]; then
	echo "Please enter an argument to do a task"
	echo "or you can use --help."
	echo "example: omnitool.sh --help"
	
	echo "SOME BASIC COMMAND OPTIONS TO USE:"
	echo "--help (to take help)"
	echo "-he (to see server with highest error)"
	echo "--analyze (to analyze the logs of servers)"
	echo "-s <server_number> (to see the number of log files present in the specified server)"
	echo "-sf <server_number> <log_file_number> (to see the data of specified file of the specified server)"
	echo "-sc (to see the total count of server)"
	echo "-d (to see the dashboard)"  
	
	
elif [ "$1" == "--help" ]; then
	tput smcup
	less help.txt	

#------------------------------Server-with highest-error-count--------------------------------------
elif [ $1 == "-he" ]; then
	#go inside every server and use memory_error_count
	server_count=$(ls . | grep -c "^server")
	max_error_count=0
	max_error_server=""
	for ((i=1; i<=$server_count; i++))
	do
		
		server_error_count=$(cat ./server$i/memory_error_count.txt)
		#server_error_count=${line_of_error:6:4}
		if [ $max_error_count -lt $server_error_count ]; then
			max_error_count=$server_error_count
			max_error_server="server$i"
		fi
	done
	echo "Highest Error Server: $max_error_server"
	echo "Error count: $max_error_count"

	

#-------------------------------------------------------------------------------------------------

elif [ "$1" == "--analyze" ]; then
	while true;
	do	
	
	total_server_count=$(ls | grep "^server*"  | wc -l)
	pwd
	old_total_server_count=$(cat memory_servers_count.txt)
	
	#updating memory_servers_count.txt
	echo "$total_server_count" > memory_servers_count.txt
	
	echo ---Old servers count=$old_total_server_count---
	echo ---New servers count=$total_server_count---
	
	#Here checking for new server
	if [ $total_server_count -gt $old_total_server_count ]; then
		analyzefile "./server$total_server_count/server$total_server_count.1.txt" "$total_server_count"
		echo "1" > ./server$total_server_count/memory_file_count.txt
	
	fi
	
	#Here checking for new files in already created servers
	for ((i=1; i<=$total_server_count; i++))
	do
		#total log files present in an server
		total_file_count=$(ls "./server$i" | grep -c "server")
		echo "New file count of server$i=$total_file_count"
		
		#Getting data about old file count in server
		old_total_file_count=$(cat ./server$i/memory_file_count.txt)
		echo "Old file count of server$i=$old_total_file_count"
		
		
		#old_error_count=$(cat ./server$i/memory_error_count.txt)
		#echo line---$line_of_error--
		#old_error_count=${line_of_error:6:4}
		#echo "--$old_error_count--"
		
		echo "$total_file_count" > ./server$i/memory_file_count.txt
		#echo "ERROR $old_error_count" > ./server$i/memory_error_count.txt
		  
		if [ $total_file_count -gt $old_total_file_count ]; then
			
			analyzefile "./server$i/server$i.$total_file_count.txt" "$i"
			
	
		fi
		
		
	done
		sleep 6
		read -r -t 4 -p "want to stop? press y" keypress
		if [ "$keypress" == "y" ]; then
			break
		fi
	done

#------------------------------SHOW-NUMBER-OF-FILES-IN-A-SERVER-------------------------------------------------------------------------
elif [ $1 == "-s" ]; then
	
	file_count=$(ls ./server$2/ | grep -c "^server*")
	echo "NUMBER OF FILES PRESENT IN SERVER $2: $file_count"

#------------------------------SHOW-SPECIFIED-FILE-OF-A-SERVER--------------------------------------------------------------------------
elif [ $1 == "-sf" ]; then
	
	tput smcup
	less ./server$2/server$2.$3.txt

#------------------------------SHOW-SERVER-COUNT----------------------------------------	
elif [ $1 == "-sc" ]; then
	server_count=$(ls . | grep -c "^server*" )
	echo "NUMBER OF TOTAL SERVERS->$server_count"
	
#----------------------------------------DASHBOARD------------------------------------------------------
#-------------------------------Script-to-show-dashboard---------------------------------------------------------------------------------------
elif [ $1 == "-d" ]; then
		tput smcup
		while true; 
		do
			clear
			echo "Hello"
			
			echo ""
			echo -e "${GREEN}#-----------------------------------------#${NC}"
			echo -e "${YELLOW} Hello Farhan This is your Dashboard${NC}"
			echo -e "${GREEN}#-----------------------------------------#${NC}"
			servers_present=$(ls . | grep -c "^server*")
			echo "NUMBER OF SERVERS => $servers_present"
			echo "*******************************************"

			for ((i=1; i<=$servers_present; i++))
			do
				echo "-----DETAILS OF SERVER$i-----"
				
				
				total_file_count=$(ls ./server$i | grep -c "^server")
				echo "TOTAL NUMBER OF LOG FILES IN SERVER$i->$total_file_count"

				analyzed_file_count=$(cat ./server$i/memory_file_count.txt)
				echo "NUMBER OF LOG FILES ANALYZED IN SERVER$i->$analyzed_file_count"
				
				
				
				
				total_log_sum=0
				for ((j=1; j<=$analyzed_file_count; j++))
				do	
					a=$(cat ./server$i/server$i.$j.txt | wc -l)
					total_log_sum=$(($total_log_sum + $a))
				done
				echo "TOTAL LOG COUNT: $total_log_sum"
				
				error_count=$(cat ./server$i/memory_error_count.txt)
				echo "TOTAL ERROR COUNT: $error_count"

				if [ $error_count -gt 100 ]; then
					c='\033[0;31m'
				else
					c='\033[0m'
				fi
				
				if [ $total_log_sum == 0 ]; then
					error_count=0
					#echo "TOTAL LOG SUM->0"
					#echo "TOTAL ERROR COUNT->0"
				else
									
				error_percentage=$(( 100*error_count/total_log_sum ))
				echo -e "ERROR PERCENTAGE=>${c}$error_percentage%${NC}"	
				echo -e "${c}_____________________________________________________________________________________${NC}"
				echo -e "${c}|                                          |                                        |${NC}"
				echo -e "${c} Total logs analyzed in Server $i => $total_log_sum          Error count in Server $i => $error_count   ${NC}"
				echo -e "${c}|__________________________________________|________________________________________|${NC}"
				#echo "Last 1 logs of server $i =>"
				#tail -1 ./central_log_server/logs_of_server$i.txt
				echo "*******************************************"
				fi
			done
			
			
			#------------------------------------Code-to-stop------------------------------------------------------
			echo "________________________________________________________________________________________________"
			read -r -t 2 -p "want to stop? press y" keypress
			echo ""
			#echo "________________________________________________________________________________________________"
			if [ "$keypress" == "y" ]; then
				tput rmcup
				break
			fi
			sleep 5
			
		#-------WHILE-DONE--------------------------------------------------
		done


	


#----------------------------------------IF-STATEMENT-END---------------------------------------------------------	
fi
