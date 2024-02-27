# Netsmartz_1_Bash
######################## THIS IS THE HELP FILE FOR YOU ###############################

TOOL NAME: OMNI.SH

DESCRIPTION: THIS IS A LOG ANALYSIS TOOL WHICH PROVIDE USERA REAL TIME ANALYSIS OF LOGS. YOU CAN EASILY SEE THE ERROR LOGS AND FIND WHICH SERVER HAS MORE LOGS AT WHAT TIME. IT HAS A LIVE DASHBOARD TO ENHANCE THE VUEW OF USER REGARDING ERRORS IN LOGS.

######################## HOW TO USE IT ###############################################

START--->

CMD: bash omnitool.sh

DESCRIPTION: TO SEE THE COMMON OPTIONS TO USE


YOUR BASE DIRECTORY STRUCTURE IS:

![image](https://github.com/Farhan-Ahmed-Netsmartz/Assignment_1/assets/160687843/5fb4669f-a0d5-43fd-9fe1-54df26d1b8b7)


2 directories, 3 files

---------------------------------------------------------------------------------------

ASKING FOR HELP ----------------->

CMD: bash omnitool.sh --help

DESCRIPTION: WHEN YOU NEED HELP YOU CAN USE IT. AS YOU ARE DOING.

---------------------------------------------------------------------------------------

TO VIEW LIVE DASHBOARD -------------->

CMD: bash omnitool.sh -d

DESCRIPTION: THIS WILL SHOW THE LIVE DASHBOARD SHOWING THE VARIOUS INFORMATION REGARDING LOGS AND ERRORS OF SERVERS.

---------------------------------------------------------------------------------------

TO VIEW THE LOGS OF ANY SPECIFIC SERVER ------------------->

CMD: bash omnitool.sh -s <server_number>

DESCRIPTION: THIS WILL PRINT THE NUMBER OF LOG FILES PRESENT IN THE SERVER

EXAMPLE: bash omnitool.sh -s 2  (IT WILL SHOW THE COUNT OF LOG FILES OF SERVER 2)

---------------------------------------------------------------------------------------

TO VIEW THE SERVER WITH HIGHEST ERROR COUNT ------------------->

CMD: bash omnitool.sh -he

DESCRIPTION: THIS WILL PRINT THE INFORMATION ABOUT THE SERVER WHICH HAS HIGHEST ERROR COUNT IN ALL SERVER.

----------------------------------------------------------------------------------------

TO SEE SPECIFIC FILE OF LOGS OF A SPECIFIC SERVER ------------------->

CMD: bash omnitool.sh -sf <server_number> <file_number>

DESCRIPTION: THIS WILL SHOW THE LOG FILE OF A SERVER YOU SPECIFIED

EXAMPLE: bash omnitool.sh -sf 3 (THIS WILL SHOW YOU FILE 3 LOGS OF SERVER 3)

----------------------------------------------------------------------------------------

TO CONTINUOUSLY CHECK FOR ERRORS AND ALERT WHEN REACHING MAXIMUM ERROR COUNT

CMD: bash omnitool.sh --analyze

DESCRIPTION: THIS WILL CONTINUOUSLY ANALYSE THE LOGS OF EACH SERVER AND TRACK COUNT OF ERRORS OF EACH SERVERS AND RETURN ALERT MESSAGE.

----------------------------------------------------------------------------------------



TO SEE THE NUMBER OF SERVERS PRESENT

CMD: bash omnitool.sh -sc

DESCRIPTION: THIS COMMAND WILL PRINT THE NUMBER OF SERVERS PRESENT.
_________________________________________________________________________________________
