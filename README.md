# Netsmartz_1_Bash
######################## THIS IS THE HELP FILE FOR YOU ###############################

TOOL NAME: OMNI.SH
DESCRIPTION: THIS IS A LOG ANALYSIS TOOL WHICH PROVIDE USERA REAL TIME ANALYSIS OF LOGS. YOU CAN EASILY SEE THE ERROR LOGS AND FIND WHICH SERVER HAS MORE LOGS AT WHAT TIME. IT HAS A LIVE DASHBOARD TO ENHANCE THE VUEW OF USER REGARDING ERRORS IN LOGS.

######################## HOW TO USE IT ###############################################

START--->
CMD: bash omnitool.sh
DESCRIPTION: TO SEE THE COMMON OPTIONS TO USE

YOUR BASE DIRECTORY STRUCTURE IS:
.
├── Central_log_server
│   ├── help.txt
│   └── omni.sh
├── gen_send_logs.sh
└── servers

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
_________________________________________________________________________________________

outputs screen shorts:
![Omni1](https://github.com/FarhanCeo/Netsmartz_1_Bash/assets/80202023/8e95ffed-8769-4d6b-a7a5-b59a7845d04a)

![Omni2](https://github.com/FarhanCeo/Netsmartz_1_Bash/assets/80202023/95bc9b56-aaf5-4100-a19a-b64ce951d320)

![omni3](https://github.com/FarhanCeo/Netsmartz_1_Bash/assets/80202023/5b5aa167-e8ff-43de-8ca7-4553d7d600a0)

![omni4](https://github.com/FarhanCeo/Netsmartz_1_Bash/assets/80202023/ff508428-c1c9-47d3-949a-8ac246ed02d5)

![omni5](https://github.com/FarhanCeo/Netsmartz_1_Bash/assets/80202023/52249e1f-fa8a-428b-908b-a6a32eddb725)

![omni6](https://github.com/FarhanCeo/Netsmartz_1_Bash/assets/80202023/e4978269-a93e-47b3-a32f-cbe7928e53de)

![omni7](https://github.com/FarhanCeo/Netsmartz_1_Bash/assets/80202023/3f6a45b9-c32c-4c60-9435-1d9ef259e884)

![omni8 1](https://github.com/FarhanCeo/Netsmartz_1_Bash/assets/80202023/d9c1c82d-bdb2-4d34-b742-cd9d8c2bdacc)

![omni8](https://github.com/FarhanCeo/Netsmartz_1_Bash/assets/80202023/e5334d86-e448-4656-ad59-cd6dd4246eb3)

![omni9](https://github.com/FarhanCeo/Netsmartz_1_Bash/assets/80202023/ff465cc6-0594-4eb4-9033-f95978fe17af)

![omni10](https://github.com/FarhanCeo/Netsmartz_1_Bash/assets/80202023/41b8810d-9e97-4c62-a34e-dedb0e62945a)

