LJL@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\proxy\BossProxy.lua   08+ =  + = +  = 4  = )
 = + = )  = )  = )  = )˙˙=	 )˙˙=
 )  = )  = )˙˙= +  = )  = )  = )  = 4  = + = )˙˙= )˙˙= 6 :/= K  Config_LanguagebossKillerbossEndTimebossStartTimecanGetDamageRewardbossRanksmyDamagemyRankbossMaxHphasGetboxEndTimeboxLeftboxCanGetheadIdreviveEndTimemyBuffworldLvbossStatusneedCheckHeartBeatheartBeatIntervalmsgRecToHandlesocketloginedinited		

self  1 E   6   9BK  removeEventsEventManagerself   C  "-   9 BL ŔnewBossProxy self  proxy  -   
--   + =  K   Ŕinitedself  i   36   9    9  B -     9  + B K   	init
resetbossProxyGameGlobalself    ;0-      X3   - 9  X6 9- 9B- +  =- 6 9  - 9B=-  9BK   Ŕsend_loginheartBeatIntervalperformWithDelayGlobalunscheduleGlobalschedulerheartBeatTicker 			needSendLogin self reLogin  ÷  W'.  X+   9  B9   X2 L3 3 +   XE  X6 ' B 9B= 6  9		  9
 6 '
 B9 B+ = 9  9B+ X= + = 6  9		  9
 6 '
 B9 B6  9		  9
 6 '
 B96   9 B A9 99  X  X9  9B+ = 2  K  K  isConnectedmsgReceivedhandler!BOSS_SOCKET_MESSAGE_RECEIVEDBOSS_SOCKET_DISCONNECTEDconnectneedCheckHeartBeatBOSS_SOCKET_CONNECTEDapp.event.BossSocketEventaddEventEventManagercreateapp.control.BossSocketrequiresocket  inited	ctor  "##%%%%%%%%%%%&&&&&&&&&&&&&&'''''''((((++..self  WneedSendLogin  W_socket  Wdisconnected Kconnected Jconnect I ć
 
 ˘ÝV) 9 B-  9 XK   9B 9B9  X
-  9 X6 99 	 BK  -  9 X  9 	 BX}-  9 X  9 	 BXt-  9	 X  9	 	 BXk-  9
 X  9
 	 BXb-  9 X  9 	 BXY-  9 X  9 	 BXP-  9 X  9 	 BXG-  9 X  9 	 BX>-  9 X  9 	 BX5-  9 X  9 	 BX,-  9 X  9 	 BX#-  9 X  9 	 BX-  9 X  9 	 BX-  9 X  9 	 BX-  9 X  9 	 BK  Ŕ.MODULE_WORLDBOSS_broadcastBigRewardResultMODULE_WORLDBOSS_boxRestMODULE_WORLDBOSS_getMyRankMODULE_WORLDBOSS_heartBeat&MODULE_WORLDBOSS_getDropBoxReward$MODULE_WORLDBOSS_getDropBoxInfo$MODULE_WORLDBOSS_getBonusReward*MODULE_WORLDBOSS_getBonusProgressInfo*MODULE_WORLDBOSS_broadcastFightResultMODULE_WORLDBOSS_reviveMODULE_WORLDBOSS_fightMODULE_WORLDBOSS_encourage!MODULE_WORLDBOSS_setHeroListmsgRecToHandleinsert
tableMODULE_WORLDBOSS_loginloginedgetParamsgetCmdMODULE_WORLDBOSSgetType



    !!!!!""""#####$$$$%%%%%&&&&'''')msgType self  Łtarget  Łmsg  Łtype cmd params  Ł   9    XK  9   X6 99 B+  = K  unscheduleGlobalschedulerheartBeatTimeOutTikerneedCheckHeartBeatself  arr   g   
ą-   9      X K  -     9  B K   Ŕsend_heartBeatneedCheckHeartBeatself  Ę &~ł/9    X6 99  B+ = :  X) 2 o:= := := := := :=	 :=
 :	 X:	= 6 96  9:
' + B=: X6 96  9:' + B=X6 94  =6 :B= := := := 9 	 X9 = 6 :B= )  ) M6  98	'
 B6 99	 4
 :>
:>
6  9:B ? BOę6  9  6  '! B9"B3# 6 9$ 9% B=  2  K  K  heartBeatIntervalscheduleGlobal 
loginapp.event.BossProxyEventrequiresendEventEventManagersetUnitsForMyriadbossRanksinsert
tablemyDamagebossEndTimebossStartTimemyRanktonumberbossMaxHpbossTeam,
splitStringUtilbossHeroslocalPlayerGameGlobalbossKiller-1boxLeftboxCanGetheadIdreviveEndTimemyBuffworldLvbossStatusloginedunscheduleGlobalschedulerheartBeatTickerţ˙˙˙ 8Ŕ	  !!!"""$$$$%%%%&&&&&&'''''''''''''''%)))))))))-......//self  ~arr  ~a G  i tmp sendHeartBeat  ă  )ˇ6  ' B 9-  9-  9B 9B9  9 BK  ŔsendMsgsocketfinishMODULE_WORLDBOSS_loginMODULE_WORLDBOSScreateapp.control.BossMsgrequiremsgType self  msg 	 Â   Ć-   9      X6  9  -  9 B 6  9    9  B -     9  + B K   Ŕ	init
resetbossProxyGameGlobalunscheduleGlobalschedulerheartBeatTickerself  ę  @ź9    X2 3 6 9 ) B= 6 ' B 9-  9-  9	B 9
B9   9 B2  K  K  ŔsendMsgfinishMODULE_WORLDBOSS_heartBeatMODULE_WORLDBOSScreateapp.control.BossMsgrequireperformWithDelayGlobalschedulerheartBeatTimeOutTiker socketmsgType self   timeOut msg 
 Ť 	 &Ń:  X6   96 9BX6 99 =6  9	  6
 ' B9BK  setHeroListapp.event.BossProxyEventrequiresendEventEventManagertmpTeambossTeamlocalPlayerGameGlobal	czsbConfig_LanguageaddMessageFloatMessageself  arr   Ň 
 !KŮ	6  ' B 9-  9-  9B4  = ) ) ) M9 8<	 98
BOř 9B9  9	 BK  ŔsendMsgsocketfinishaddInttmpTeam!MODULE_WORLDBOSS_setHeroListMODULE_WORLDBOSScreateapp.control.BossMsgrequire	msgType self  "team  "msg 	 	 	i  ř 	 &4ä:  X:	 X6   96 9BX6   96 9BX6 9 9:B:= 6	  9
  6 ' B9BK  encourageapp.event.BossProxyEventrequiresendEventEventManagermyBuffsetGoldlocalPlayerGameGlobal	czsb
hdwkqConfig_LanguageaddMessageFloatMessageţ˙˙˙		








self  'arr  '  	 4ń6  ' B 9-  9-  9B 9 B 9B9  9 BK  ŔsendMsgsocketfinishaddIntMODULE_WORLDBOSS_encourageMODULE_WORLDBOSScreateapp.control.BossMsgrequiremsgType self  type  msg  Ł 	 #1ř:  X6   96 9BX6 96  9B6 9	 =6 9
9 =6  9  6 ' B9BK  
fightapp.event.BossProxyEventrequiresendEventEventManagertmpTeambossTeamlocalPlayerbossReviveTimeConfig_GameDatagetServerTimereviveEndTimebossProxyGameGlobal	czsbConfig_LanguageaddMessageFloatMessageĐself  $arr  $ Ě 
 !K	6  ' B 9-  9-  9B4  = ) ) ) M9 8<	 98
BOř 9B9  9	 BK  ŔsendMsgsocketfinishaddInttmpTeamMODULE_WORLDBOSS_fightMODULE_WORLDBOSScreateapp.control.BossMsgrequire	msgType self  "team  "msg 	 	 	i  ˘ 	 *8:  X:	 X6   96 9BX6   96 9BX
6 9 9:B6 9)˙˙=	6
  9  6 ' B95 =BK  arr  reviveapp.event.BossProxyEventrequiresendEventEventManagerreviveEndTimebossProxysetGoldlocalPlayerGameGlobal	czsbhdjjjsConfig_LanguageaddMessageFloatMessageţ˙˙˙				self  +arr  +  	 46  ' B 9-  9-  9B 9 B 9B9  9 BK  ŔsendMsgsocketfinishaddIntMODULE_WORLDBOSS_reviveMODULE_WORLDBOSScreateapp.control.BossMsgrequiremsgType self  type  msg  Š 	   6   9  6 ' B95 =BK  arr  broadcastFightResultapp.event.BossProxyEventrequiresendEventEventManagerself  arr   ­ 	  ¤6   9  6 ' B95 =BK  arr  broadcastBigRewardResultapp.event.BossProxyEventrequiresendEventEventManagerself  arr    	 $¨:  X6   96 9BX6  9  6 ' B95	 =
BK  arr  getBonusProgressInfoapp.event.BossProxyEventrequiresendEventEventManager	czsbConfig_LanguageaddMessageFloatMessageself  arr   ň  )Ż6  ' B 9-  9-  9B 9B9  9 BK  ŔsendMsgsocketfinish*MODULE_WORLDBOSS_getBonusProgressInfoMODULE_WORLDBOSScreateapp.control.BossMsgrequiremsgType self  msg 	 ä 
 -;ľ:  X6   96 9BX"6  96 9 9B 9	B6
 ' B99+  5 :	=	:	=	B6  9  6
 ' B95 =BK  arr  getBonusRewardapp.event.BossProxyEventsendEventEventManager
heros
items  	nameACQUIREITEMSSIMPLEdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager	czsbConfig_LanguageaddMessageFloatMessageself  .arr  .  	 2ž6  ' B 9-  9-  9B 9 B 9B9  9 BK  ŔsendMsgsocketfinishaddInt$MODULE_WORLDBOSS_getBonusRewardMODULE_WORLDBOSScreateapp.control.BossMsgrequiremsgType self  id  msg  Ł 	  Ĺ6   9  6 ' B95 =BK  arr  getDropBoxInfoapp.event.BossProxyEventrequiresendEventEventManagerself  arr   ě  )Č6  ' B 9-  9-  9B 9B9  9 BK  ŔsendMsgsocketfinish$MODULE_WORLDBOSS_getDropBoxInfoMODULE_WORLDBOSScreateapp.control.BossMsgrequiremsgType self  msg 	 ő 
 DRÎ:	  X6   96 9BX.:	 X6   96 9BX$:	 X6   96 9BX:	 X6  96 9	 9
B 9B6 ' B99+  5 :	=	B)  = 6  9  6 ' B95 =BK  arr  getDropBoxRewardapp.event.BossProxyEventsendEventEventManagerboxCanGet
items  	nameACQUIREITEMSSIMPLEdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager
wcyzdmdlqsj	czsbConfig_LanguageaddMessageFloatMessage ţ˙˙˙ř˙˙˙		

self  Earr  E î  )Ü6  ' B 9-  9-  9B 9B9  9 BK  ŔsendMsgsocketfinish&MODULE_WORLDBOSS_getDropBoxRewardMODULE_WORLDBOSScreateapp.control.BossMsgrequiremsgType self  msg 	 Ž 	  â:=  6  9  6 ' B95 =BK  arr  boxRestapp.event.BossProxyEventrequiresendEventEventManagerboxLeftself  arr    	  ç6   9  6 ' B95 =BK  arr  getMyRankapp.event.BossProxyEventrequiresendEventEventManagerself  arr   ç  )ę6  ' B 9-  9-  9B 9B9  9 BK  ŔsendMsgsocketfinishMODULE_WORLDBOSS_getMyRankMODULE_WORLDBOSScreateapp.control.BossMsgrequiremsgType self  msg 	 -   đ  9  BK  
resetself   ę   4<ó+ =  + = 9   X9  9B+  = 4  = )
 = + = )  = )  = )  =	 )˙˙=
 )˙˙= )  = )  = 9   X6 99 B+  = 9   X6 99 B+  = K  heartBeatTimeOutTikerunscheduleGlobalschedulerheartBeatTickerboxLeftboxCanGetheadIdreviveEndTimemyBuffperiodbossStatusneedCheckHeartBeatheartBeatIntervalmsgRecToHandledisposesocketloginedinited		

self  5 ä	  E K¸ 6   ' B 6 ' B6  ' B3 =3 =3
 =	3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3  =3" =!3$ =#3& =%3( ='3* =)3, =+3. =-30 =/32 =134 =336 =538 =73: =93< =;3> ==3@ =?3B =A3D =C2  L  
reset dispose send_getMyRank MODULE_WORLDBOSS_getMyRank MODULE_WORLDBOSS_boxRest send_getDropBoxReward &MODULE_WORLDBOSS_getDropBoxReward send_getDropBoxInfo $MODULE_WORLDBOSS_getDropBoxInfo send_getBonusReward $MODULE_WORLDBOSS_getBonusReward send_getBonusProgressInfo *MODULE_WORLDBOSS_getBonusProgressInfo .MODULE_WORLDBOSS_broadcastBigRewardResult *MODULE_WORLDBOSS_broadcastFightResult send_revive MODULE_WORLDBOSS_revive send_fight MODULE_WORLDBOSS_fight send_encourage MODULE_WORLDBOSS_encourage send_setHeroList !MODULE_WORLDBOSS_setHeroList send_heartBeat send_login MODULE_WORLDBOSS_login MODULE_WORLDBOSS_heartBeat msgReceived 	init create removeEvents 	ctorapp.const.Const_MsgTypeBossProxy
classdata.Config_UIrequire           !  % " U '  V   ś  ť ˇ Ď ź Ř Ń â Ů đ ä ö ń  ř 
" &$.(3/=5C>GELH[N`\ebignjrpsuiConfig HBossProxy EmsgType B  