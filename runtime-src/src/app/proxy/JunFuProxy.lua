LJM@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\proxy\JunFuProxy.luaÁ   #4  =  )  = )
 = 9 = 4  = 4  = 4  = 4  = )  = 4  =	 )
 =
 4  = 4  = K  hasDefenderfireOnCitiestimeIntervalcanUseHeroshangingUpattackCityPlayerNumattackCityoptionsattackFactionattackTimesdefaultAttackTimescurAttackTimesteamInfo		

self     #-   9 B95 >L  Ŕ  ˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙teamInfonewJunFuProxy self  	proxy  u   () 9   ) M9  8 X+ L Oů+ L attackCityself  id    i  î  K+ 9   )  ) M9	  8			 X	
	  X	6	 9		9   B	K  X	K  Oń	 X6 99   BK  insertremove
tableattackCity 	self  id  sw  found len   i     9/9  )  ) M8: X+ L Oů+ L attackFactionself  uId  attackFaction   i  Ç  )r8+ 9  )  )	 M8
9 X	  X4 >>><
+ X	X6 9 
 B+ XOę  X
	  X6 9	 4
 >
>
>
BK  insertremove
tableuIdattackFaction




self  *uId  *name  *iconStr  *sw  *found (attackFaction '  i  š  'JN)  )  9    X)  L ) 9   ) M9  8  XXX	6 9	 99
  8

B  Ođ	 X) 6 99 "#B L attackTimes
floor	mathgetCostArmyFoodlocalPlayerGameGlobalteamInfo 	self  (total &len %	  i  ď   bŁ^!4  =  9  5 >: X: X6  9:' B)  ) M
6 
 98' + B9	  <	Oö4  = : X: X6  9:' B)  ) M6	 9
9
 6  98' B AOő6  9:' + B= 4  = : X: X6  9:' + B=   X B6  9  6 '	 B9BK  getInfoapp.event.JunFuProxyEventrequiresendEventEventManagerattackCityoptionsinsert
tableattackFaction,;
splitStringUtil-1  ˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙teamInfo						





         !self  carr  ccb  ctmp   i 	tmp2 tmp2   i 
 Ź 
 /:	  X9   	 X9  5 >  X B6  9  6 '	 B9BK    9 BK  send_getInfosaveTeamapp.event.JunFuProxyEventrequiresendEventEventManager  ˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙teamInfo self  arr  cb      -6  ' B 96 96 9B 9B6 9 9	 6
 	  9
 B4 >BK  handlersendMsggameSocketGameGlobalfinishMODULE_JUNFU_getInfoMODULE_JUNFUmsgTypecreateapp.control.Msgrequireself  cb  msg  a   !)   ) M8   X+ L Oú+ L ţ˙˙˙team    i  ¤ VŞ)6  ' B 96 96 9B' 3 4  = ) )  )	 M/ 8
B  X))  X '	 &9 8
< ) 8
 ) M)˙˙8
8
  X8
8 X8
8  &8
  X '
 &Oę8
  XXOŃ	 9
 B	 9B6 9	 9
 6   9 B4 >BK  handlersendMsggameSocketGameGlobalfinishaddString,;teamInfo MODULE_JUNFU_saveTeamMODULE_JUNFUmsgTypecreateapp.control.Msgrequireţ˙˙˙!!!"&&&&'''(((((((((((()self  WteamInfo  Wcb  Wmsg Lstr Kcheck Jindex G0 0 0i .  k uId   	  
ź6   9  6 ' B9BK  saveInfoapp.event.JunFuProxyEventrequiresendEventEventManagerself  arr   ŕ  w˝Ŕ+6  ' B 96 96 9B 9)  B' 9  	  X'	 ) 9  ) M 9 8:&9   X '
 &Oó 9 B' 6 99 B	  X'	 )  ) M)  9	 8		
	  X	9	 8		 
 &
	 X		 '

 &
	Ođ 9 B' 9  	  X'	 ) 9  ) M 9	 8		&	9   X '	
 &	Oô 9 B 9)  B 9B6 9 9 6 
  9 B AK  handlersendMsggameSocketGameGlobalfinishattackCityoptions	maxn
tableaddString,-1attackFactionaddIntMODULE_JUNFU_saveInfoMODULE_JUNFUmsgTypecreateapp.control.Msgrequire 					





     !!!!!""""####$$$!''''(((()))**********+self  xmsg mstr h	  k len H  k vv   k  n   )ú) -   ) M-  8  X+ L Oů+ L noHero uId    i  š  ě/4  :
  X:  X: X6  9:' +	 B 4  = :
  X:  X: X6  9:' +	 B= 3 4  = 6 6	 9
9BH
  B
 
 X9
 <	
FR÷4  = :
  X%:  X": X6  9:'	 +
 B)  ) M8
	

  X
6
 
 9

8	' + B
6 99 5 :
=:
=BOě4  = :
  X:  X: X6  9:'	 +
 B) 9  ) M9
 8
	
9 8	<
Oú  X B2  K  attackCityhasDefendernumid  insert
table_fireOnCities
heroslocalPlayerGameGlobal
pairscanUseHeros attackCityPlayerNum,
splitStringUtil-1		








   !!!!!!!"""""""""&&'''''''''((((((()))))**+++)....//self  arr  cb  noHero nums #checkHeroCanUse ^
 
 
k v  tmp   i tmp2 
	tmp   k cityId    =c6  ' B 96 96 9B' 9  	  X'   9 5	  BK  ) 9  ) M 9	 8		&	9   X '	
 &	Oô 9 B 9B6 9 9 6 
  9 B4	 >	+
  + BK  handlersendMsggameSocketGameGlobalfinishaddString,  -1attackCity%MODULE_JUNFU_getCityAndHeroStateMODULE_JUNFUmsgTypecreateapp.control.Msgrequire 				



self  >cb  >msg 3str 2  k  â  wśŽ5:	  X6   96 9B  9 B  9 BK  :)  X6 ' :&8  X6 9  9 B  9 B6   9 BK  :	 X  9 B  9 B6 9	6   9 BK  :	 X) 9
  ) M9
 8 X6 99

  BXOő  9 BK  : X9 = X6 9 9 6	 8		9		B 6   9 B6 9 9:B6  9  6 '
 B9BK  dispatchGroupapp.event.JunFuProxyEventrequiresendEventEventManagersetArmyFoodlocalPlayerGameGlobal	nameConfig_CityformathasDisptachToCitycurAttackTimesremove
tableattackCityczsjygaddMessage	czsb'MODULE_FACTIONWAR_dispatchGroupErrsend_saveInfo	stopjunfuHangTipConfig_LanguageaddStringFloatMessageţ˙˙˙			
   """""####$$$$$%")))*,,,----//00000000111113333334444444445self  xarr  xcityId  xteamId  xstr str   i 
str  ô  7rä6  ' B 96 96 9B 9 B'  	  X' )  ) M

 8	&

 	
 X

 '	 &
Oö 9
	 B 9B6 9 9	 6
   9 B
4 >>+ BK  handlersendMsggameSocketGameGlobalfinishaddString,-1addInt&MODULE_JUNFU_dispatchGroupForCityMODULE_JUNFUmsgTypecreateapp.control.Msgrequire self  8cityId  8teamId  8heros  8msg -str (  k 	 č  	  Dö
6   9  6  96  96  96 9 9   B  X	6 9 9  B  XK  -   9BK   Ŕ
start!checkSameMsgSendingOrInQueuegameSocketGameGlobal%MODULE_JUNFU_getCityAndHeroState&MODULE_JUNFU_dispatchGroupForCityMODULE_JUNFUConst_MsgType				
self type1 type2 cmd1 cmd2  Ä A
+ ) -  9 8  ) M-  9 8 8  X-  98  X+ XOňL  ŔcanUseHerosteamInfoţ˙˙˙	self index  canUse   i uId 	 @   Š9  9  X+ L + L numa  	b  	 ż  
5gŻ+ )   )  ) M(8 9 6	 9			 9		 )  B	
	 X	6	 9			 9		 B	9		6
 9

9

	
 X	6	 9			 9		 B	9			  X	6	 9			   B	OŘ  )   X+ L remove
tablefactionUIddefFactionUIdgetCityStateByIdfactioncheckInsAllPassedByTypeinstanceProxyGameGlobalidţ˙˙˙	cities  6boo 4index 3cityL 2) ) )i 'id %  mÓŁB4   ) -  9  ) M6 9  5 -	  9	 	8		=	-	  9		8		=	BOň3 3 6	   B-  9
:	  X-  9
  X-  9 )   X6	 -  9B -  9
:	  X)  )  ) M8
9

-  98
	  X6 9  B  Oń-  9
:	  X6 9  B  B X-  9
:	  X6	   B -  9
:	  X6 9  B-  =K   ŔcanUseCity	sortremovehasDefenderfireOnCitiesoptions
clone  numattackCityPlayerNumid  insert
tableattackCity     !!!!!!!!!!"""""&&&&&'())))**,,,,,-----.0)44444555557779999999::::<<<<<=====AABself attackCity l  i sort WcheckCanUseCity Vtmp Sindex tmpL   i id boo    UŹć-   B 4   ) - 9  ) M-  B  X
6 9  5 -	 9	 	8		=	=BOđ- 9 	  X-  9BK  )  )   ) M,- 98  X) - 989- 	 9	
 8 98 9B- - 9
=
- 9
- 9 X- )  =
- - 9=- 	 9BK  OÔK  Ŕ ŔŔdefaultAttackTimesattackTimescurAttackTimessend_dispatchGroupForCityid	stopcanUseCityteamId	team  insert
tableteamInfo 




initCity self checkTeam canUseTeam R  t cityIdIndex 1- - -i +cityId 
! É	 Ló9    X3 6 9 9 B=  6 9 9B6 999	 X6 9 9B6 999
 X6 9 9B 9B9	  X2  K    X)  = 9 	 X2  K  9 9  X)  =   9 B2  K  4  = 3 3 3   9  B2  K  send_getCityAndHeroState   canUseCity	stopattackTimeshangingUpcurAttackTimesbatTypegetRunningScenegetInstanceDirectorccBATTLESCENEFACTIONWARSCENEsceneNametblgetCurSceneResourceManagerGameGlobaltimeIntervalscheduleGlobalscheduler ticker
 $$/rself  MresetCurAttackTimes  Mst checkTeam @initCity cb  ë  	 9    X6 99  B=  +  =  )  = 6  9  6 ' B9BK  	stopapp.event.JunFuProxyEventrequiresendEventEventManagerhangingUpunscheduleGlobalschedulertickerself         9  B4  = )  = )
 = 4  = 4  = 4  = 4  = )  = 4  =	 )
 =
 K  timeIntervalcanUseHeroshangingUpattackCityPlayerNumattackCityoptionsattackFactionattackTimescurAttackTimesteamInfo	stop		

self   °  * -h 6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 3' =& 3) =( 2  L   dispose 	stop 
start send_dispatchGroupForCity &MODULE_JUNFU_dispatchGroupForCity send_getCityAndHeroState %MODULE_JUNFU_getCityAndHeroState send_saveInfo MODULE_JUNFU_saveInfo send_saveTeam send_getInfo MODULE_JUNFU_saveTeam MODULE_JUNFU_getInfo getTotalArmyfoodCost setAttackFaction #checkHasFactionInAttackFaction setAttackCity checkInAttackCity create 	ctorJunFuProxy
class         .  7 / M 8 ] N  ^     ť  ż ź ë Ŕ ě -c.rdsJunFuProxy *  