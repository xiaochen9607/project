LJJ@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\proxy\Mission.lua    	K  self   A  -   9 BL  �newMission self  proxy  � 	  
:=  6  9  6 ' B95 =BK  
param  acqMissionRewardapp.event.MissionEventrequiresendEventEventManagermissionInfoself  arr   � 	  :=  6  9  6 ' B95 =BK  
param  acqAchieveRewardapp.event.MissionEventrequiresendEventEventManagerachieveInfoself  arr   � 	  :=  6  9  6 ' B95 =BK  
param  getMissionInfoapp.event.MissionEventrequiresendEventEventManagermissionInfoself  arr   � 	  :=  6  9  6 ' B95 =BK  
param  getAchieveInfoapp.event.MissionEventrequiresendEventEventManagerachieveInfoself  arr   � 	  :=  6  9  6 ' B95 =BK  
param  acqMeanMissionRewardapp.event.MissionEventrequiresendEventEventManagermeanMissionInfoself  arr   � 	  :=  6  9  6 ' B95 =BK  
param  getMeanMissionInfoapp.event.MissionEventrequiresendEventEventManagermeanMissionInfoself  arr   �   /%6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt#MODULE_MISSION_getActiveRewardMODULE_MISSIONmsgTypecreateapp.control.Msgrequireself  id  msg  � 
 &4+6   96 9 9B 9B6 ' B99	+  5
 :	=	:	=	B:	  X�6  9  6 ' B95 =BK  
param  getActiveRewardapp.event.MissionEventsendEventEventManager
heros
items  	nameACQUIREITEMSSIMPLEdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagerself  'arr  ' �   /36  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt(MODULE_MISSION_acqMeanMissionRewardMODULE_MISSIONmsgTypecreateapp.control.Msgrequireself  id  msg  � 
  (96  ' B 96 96 9B 9B6 9 9	 6
   9	 B+  + BK  handlersendMsggameSocketGameGlobalfinish&MODULE_MISSION_getMeanMissionInfoMODULE_MISSIONmsgTypecreateapp.control.Msgrequireself  msg  � 
  (>6  ' B 96 96 9B 9B6 9 9	 6
   9	 B+  + BK  handlersendMsggameSocketGameGlobalfinish"MODULE_MISSION_getMissionInfoMODULE_MISSIONmsgTypecreateapp.control.Msgrequireself  msg  � 
  (C6  ' B 96 96 9B 9B6 9 9	 6
   9	 B+  + BK  handlersendMsggameSocketGameGlobalfinish"MODULE_MISSION_getAchieveInfoMODULE_MISSIONmsgTypecreateapp.control.Msgrequireself  msg  �   1H6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B+  +	 BK  handlersendMsggameSocketGameGlobalfinishaddInt$MODULE_MISSION_acqMissionRewardMODULE_MISSIONmsgTypecreateapp.control.Msgrequireself  id  msg  �   1N6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B+  +	 BK  handlersendMsggameSocketGameGlobalfinishaddInt$MODULE_MISSION_acqAchieveRewardMODULE_MISSIONmsgTypecreateapp.control.Msgrequireself  id  msg  �  " %0 T6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  2  �L   send_acqAchieveReward send_acqMissionReward send_getAchieveInfo send_getMissionInfo send_getMeanMissionInfo send_acqMeanMissionReward #MODULE_MISSION_getActiveReward send_getActiveReward &MODULE_MISSION_getMeanMissionInfo (MODULE_MISSION_acqMeanMissionReward "MODULE_MISSION_getAchieveInfo "MODULE_MISSION_getMissionInfo $MODULE_MISSION_acqAchieveReward $MODULE_MISSION_acqMissionReward create 	ctorMission
class	
"*%1+83=9B>GCMHSNTTMission "  