LJT@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\proxy\PalaceBattleProxy.lua   19+ =  + = +  = )
 = )’’= 4  = ) = )  = )  = 4  =	 ) =
 ) = )  = 4  = )’’= )’’= 4  = )’’= 4  = 4  = 4  = 4  = 4  = + = K  inGatefactionCamparenaEnemyHeroStatearenaEnemyHeroarenaHeroStatearenaHeromyGateIdrobInfomyStandsPosIdenterPKStandsPosIdstandsInfojoinedBattletableMaxincGoldgateInfoendTime
state
roundpkTablebattleEndTimeheartBeatIntervalsocketloginedinited		

self  2 n   6  6 9989L 
money
levellocalPlayerGameGlobalConfig_PalaceExpMoneyself   K  '!-   9 BL  ĄnewPalaceBattleProxy self  proxy  K  % 9  89L uIdgateInfoŠself  cityId  index  E   )6   9BK  removeEventsEventManagerself   -   
:-   + =  K   Ąinitedself  Ó    >6   9    9  B -     9  + B -   9     X6   9    9  B 6   9    9  + B K   ĄfactionWarProxyinGate	init
resetpalaceBattleProxyGameGlobalself  Ö   2WG-      X.-  9      X6  9  - 9 B -  6 9- - 9B=  -    9  B -     X6  9    9  B 6  9    9 	 6 99
+ 6 99B 6  9    9  B K   ĄĄĄsocketpalaceBattleProxycityId	init
resetfactionWarProxyGameGlobalsend_loginheartBeatIntervalperformWithDelayGlobalunscheduleGlobalschedulerheartBeatTicker			




needSendLogin self reLogin fromCity  į  P¤,8  X+ +  9    X9    9 B  X=  9   X2 =3 3 3   X6  X06 '	 B	 9B=  6	 	 9

  9  6 ' B9 B6	 	 9

  9  6 ' B9 B6	 	 9

  9  6 ' B96   9 B A9  	 9BX B+ = 2  K  K  connectmsgReceivedhandler'FACTIONWAR_SOCKET_MESSAGE_RECEIVED#FACTIONWAR_SOCKET_DISCONNECTED FACTIONWAR_SOCKET_CONNECTED$app.event.FactionWarSocketEventaddEventEventManagercreate!app.control.FactionWarSocketrequire   inited	ctorsocket			

*++,,-------...........///////////0000000000000011111446688self  PneedSendLogin  PfromCity  PtmpSocket Kdisconnected <reLogin ;connected : l   f6  6 9989L exp
levellocalPlayerGameGlobalConfig_PalaceExpMoneyself   ® 
 ü·i* 9 B-  9 X-  9 XK   9B 9B-  9 X	-  9 X  9 	 BXÜ-  9 X	-  9 X  9 	 BXĻ-  9 X	-  9 X  9 	 BXĀ-  9 X	-  9 X  9 	 BXµ-  9 X	-  9	 X  9	 	 BXØ-  9 X	-  9
 X  9
 	 BX-  9 X	-  9 X  9 	 BX-  9 X	-  9 X  9 	 BX-  9 X	-  9 X  9 	 BXt-  9 X	-  9 X  9 	 BXg-  9 X	-  9 X  9 	 BXZ-  9 X	-  9 X  9 	 BXM-  9 X	-  9 X  9 	 BX@-  9 X	-  9 X  9 	 BX3-  9 X	-  9 X  9 	 BX&-  9 X	-  9 X  9 	 BX-  9 X	-  9 X  9 	 BX-  9 X-  9 X  9 	 BK  Ą$MODULE_PALACEBATTLE_statusChg_r*MODULE_PALACEBATTLE_getJuesaiRankInfo"MODULE_PALACEBATTLE_standsChg&MODULE_PALACEBATTLE_leavePosition MODULE_FACTIONWAR_heartBeat(MODULE_PALACEBATTLE_getArmyCampInfo#MODULE_PALACEBATTLE_adjustArmy'MODULE_PALACEBATTLE_positionRobbed$MODULE_PALACEBATTLE_npcNumChg_r"MODULE_PALACEBATTLE_leaveCity$MODULE_PALACEBATTLE_leaveStands!MODULE_PALACEBATTLE_result_rMODULE_PALACEBATTLE_bonus#MODULE_PALACEBATTLE_robPostion#MODULE_PALACEBATTLE_positonChg&MODULE_PALACEBATTLE_enterPKStands'MODULE_PALACEBATTLE_enterVIPStandsMODULE_PALACEBATTLE_logingetParamsgetCmdMODULE_PALACEBATTLEMODULE_FACTIONWARgetType								




     !!!!!!!!"""""########$$$$$%%%%%%%%&&&&&''''''''((((*msgType self  żtarget  żmsg  żtype łcmd ķparams ź Į   ?m4  =  : X06 9 B)  ) M(6 '	 B	 9B6 
 98'	 + B6	 :B	=	
6	 :B	=	:	=	6	 :B	=	6	 :B	=	6	 :B	=	:	=	9	  <	OŲ6  9  6 ' B9BK  getArmyCampInfo app.event.PalaceBattleEventsendEventEventManagerheroInfoStringbatPowerlvid	nameplayerUIdtonumberuId,
splitStringUtilcreateapp.proxy.vo.CampInforequire	maxn
tablefactionCamp							



self  @arr  @len 
,) ) )i 'tmp !data  Ļ 	 !Ŗ9  6 :B 6 :B<6  9  6 ' B9BK  standsChg app.event.PalaceBattleEventrequiresendEventEventManagertonumberpkTableself  arr    	 ';®:	  X6   96 ' B9B6  9  6 ' B9BK  6 ' B'	 :&8
  X6   9 B  9
 BK  send_getArmyCampInfoadjustArmy_erradjustArmyapp.event.FactionEventsendEventEventManageractionSuccessdata.Config_LanguagerequireaddMessageFloatMessageself  (arr  (str  Ń 	  )½6   96 9 9B 9B6 99+  5	 B6
  9  6 ' B9BK  positionRobbed app.event.PalaceBattleEventrequiresendEventEventManager idpositionRobbed	nameMESSAGEBOXConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerself  arr   /   Į+ =  K  inGateself  arr       ĒK  self  arr   ¼ 	 Ź	:  X )’’=  6  9  6 ' B9BK  leavePosition app.event.PalaceBattleEventrequiresendEventEventManagermyStandsPosId	self  arr   © 	  Ō6   9  6 ' B95 =BK  arr  getJuesaiRankInfo app.event.PalaceBattleEventrequiresendEventEventManagerself  arr   ö  g ×::6  9 9 B6  9 96  99 B6 9 9' ) B6 9 9'	 )	 B 9
*	  B6 96 96 
 96 9 9B 9B'  &) 6 9  )  )2 ) +   ) * B6 
 96 9 9B 9B'  &) 6 9 )  )2 ) +   ) * B6 
 9  6 ' B9BK  
bonus app.event.PalaceBattleEventrequiresendEventEventManager
greenConst_colorData x getRunningScenegetInstanceDirectorccmoveFontAniCenterYCenterXUIManagersetScalecommon2_jingyan.pngcommon_yuanbao.pngcreateImageView	ccui	goldsetGoldaddPlayerExplocalPlayerGameGlobalµęĢ³¦’ŗx							



self  harr  hexp fgold eim1 Oim2 HstartX BstartY @ Ö  3Aź9  6 :B 89)   X9  6 :B 8)’’=6  96 9 9B 9B6	 9
9+  5 6	 :B	=	B6  9  6 ' B95 =BK  arr  result_r app.event.PalaceBattleEventrequiresendEventEventManagerid  	nameHUANGCHENGENDConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManageruIdtonumbergateInfoŠself  4arr  4 Ł  -åŪńE:  X.:)  X6   96 96 9::B AK  X: X:	 X6  9+  6 9	9
B6   96 9BK  X6   96 9BK  5 4 5 >5 >5 >5 >5 >5 >5 4 5 >5 >5 >5 >5 >5 >4 :>:	>:
>:>:>:>4 :>:>:>:>:>:>6 99)	 )
 ) M	98 X6  9 8'! B6" '# B 9$8:::B<4 89%>89&><8 X6  9 8'! B6" '# B 9$8:::B<4 89%>89&><O	Ē4	 :
>
	:
>
	:
>
	:
>
	:
>
	:
>
	=	' 4	 :
>
	:
>
	:
>
	:
>
	:
>
	:
>
	=	( 4	 :
>
	:
>
	:
>
	:
>
	:
>
	:
>
	=	) 4	 :
>
	:
>
	:
>
	:
>
	:
>
	:
>
	=	*   9	+ ', :B	K  enterBattlearenaEnemyHeroStatearenaEnemyHeroarenaHeroStatearenaHeromoralehpcreateOneHeroByStrapp.proxy.vo.Herorequire,
splitStringUtil-1palaceBatRobPositionbatTypeConfig_GameData  ’’’’’’’’  ’’’’’’’’  ’’’’’’’’  ’’’’’’’’  ’’’’’’’’  ’’’’’’’’  ’’’’’’’’’’’’’’’’’’’’’’’’  ’’’’’’’’  ’’’’’’’’  ’’’’’’’’  ’’’’’’’’  ’’’’’’’’  ’’’’’’’’  ’’’’’’’’’’’’’’’’’’’’’’’’	czsb	ztbd	nameREADYTOBATTLEConfig_UIremoveUIUIManagerinProtectStateConfig_LanguageformatstringaddMessageFloatMessageī’’’ģ’’’      !!######$)*************+,,,,,,,,,,,,,-------------.............///1111222333333444444444445555555577788888899999999999::::::::1??????????????@@@@@@@@@@@@@@AAAAAAAAAAAAAABBBBBBBBBBBBBBDDDDDEself  ęarr  ęheros 3³herosState ¦enemyHeros „enemyHerosState hh eh ~batType {: : :i 8tmp 	tmp  O   Š-     9   - B K   Ą startInstanceScriptscene batStr  Ģ 	JĖ	6     9  B 6  ' B   9  -  6 - 6 + - B 6 = 3	 6
  9  *   B2  K  ĄĄĄrepalceSceneGameGlobal isBatReportisBattleReport	hardchapterIdcreateapp.scenes.BattleScenerequire
clearUIManager’		batType insId items batStr scene entered 	 Ž 0­·16  99B 6  B 6  9 ' B:6 :=6	 9
 9B 9B) 6 ' B86 994   X	 6	 	 9		 ' + B	6
  9

	 B
) 
 ) M6  9 6  9 B 6  98	' + B AOļ3	 9
6 ' B96 ' B' 
 &86 ' B6  99' B4  6  9+   6  6  B 9!B6"  9#  B6"  9$ B6%  9&B6  9'B 9(B6  9'B 9)B6  9'B 9*B6  9'B 9(B6  9'B 9+6  9'B9,9-B6%  9. 9/ +  	 + B2  K  	name
addUIBATTLESCENEsceneNametblsetCurScenepurgeCachedDataUseEngineretainConstTexInMemoryshowTexCacheInfogetResourceManagerremoveNodeFromCacheUIManagerremoveDuplicateItemscombineTableTableUtilgetPreloadRes	hardchapterIdgetBattleInforesapp.utils.StringUtilBATTLEFIELDLOADINGdata.Config_UIbattleFieldId _insert	maxn,palaceBatRobPositionbatTypeConfig_GameDatadata.Config_ArenaInstrequiregetRunningScenegetInstanceDirectorcclastPvpBattleStrGameGlobal@
splitStringUtiluncompress	_bufconcat
table				


       !!!""""""#$$$$$$$$$$$$%%%%%%&&&&&****+++++++,,,,,,,-------......./////////////000000000011self  ®itemStr  ®batStr  ®tmpTotalStrArr curScene insId insInfo batType items tmp 	len   i loadComplete fbattleFieldId econf abattleFieldConf ZbattleFieldResArr 	Qarr PbattleRes D   Gqé:  X:)  ) M66  98	'
 B4  6 :
B =6 :
B=6 :
B=6 :
B=:=	6 :
B=
6 :
B=:=:	=:
=9 9	 8	9	<	96	 9		9			 X9 = OŹ6  9  6 ' B9BK  positonChg app.event.PalaceBattleEventrequiresendEventEventManagermyStandsPosIdplayerUIdlocalPlayerGameGlobalenterPKStandsPosIdstandsInfofactionheroStrscombatPowerlv
defId	nameuId	type	timetonumberpos,
splitStringUtil				



self  Harr  H7 7 7i 5tmpStr /tmp . Ó  b#:  X:	 X6   96 9BX6   96 9BK  9 9 4  <: X=:
  X:)  ) M66  9	8	'

 B4  6 :
B =6 :
B=6 :
B=6 :
B=:=6 :
B=6 :
B=:=:	=:
=9 9	 8	9	<	96	 9		9			 X9 = OŹ6  9  6 ' B9BK  enterPKStands app.event.PalaceBattleEventrequiresendEventEventManagermyStandsPosIdplayerUIdlocalPlayerGameGlobalfactionheroStrscombatPowerlv
defId	nameuId	type	timetonumberpos,
splitStringUtilenterPKStandsPosIdstandsInfoenterStandsFail	bkgzConfig_LanguageaddMessageFloatMessagež’’’						"""""""""#self  carr  c"7 7 7i 5tmpStr /tmp .  	 
$§:  X6   96 9BK  )c = 6  9  6 ' B9	BK  enterVIPStands app.event.PalaceBattleEventrequiresendEventEventManagermyStandsPosIdenterVipStandsFailConfig_LanguageaddMessageFloatMessageself  arr   |   
°9    X6 99  B+  =  K  unscheduleGlobalschedulerheartBeatTimeOutTikerself  arr   ń 
 	-¶: 9  89  X9  8:=6  9  6 '	 B95 =BK  arr  npcNumChg_r app.event.PalaceBattleEventrequiresendEventEventManagernumgateInfoŠself  arr  index  @   Ė 9  9   X+ X+ L num        a  	b  	 × @aæ:=  := := 9  	  X-4  ) ) ) M9 89  X6 9	 9
 8

BOō6 9 3 B:  X6	 9
:9=6	 9
:9=6	 9
:9=6	 9
:9=6  9  6 ' B9BK  statusChg_r app.event.PalaceBattleEventrequiresendEventEventManageruIdemperorUId	nameemperorFactionNamepersonemperorName	flagemperorFactionIconStrpalaceFunProxyGameGlobal 	sortinsert
tablenumgateInfoendTime
state
round
						self  Aarr  Atmp ,  i  @    9  9   X+ X+ L num        a  	b  	 ;   -     9   B K   Ąsend_heartBeatself   /²ÕH:  X6   9B2 ©+ = := := := 4  = )  = 6  9	:'
 B)  ) M98 X(8 X%6 	 9	8
' B4  6	 :B	=	:	=	:	=	:	=	:	=	=9	 <	6	  9		9			 X	6	  9		9		9
	
 X	)	 =	 = X8 X9 5 <X8 X9 5 <OĒ9 :>9 :>9 :>9 	 X-4  ) ) ) M9 89  X	6 9
 9 8BOō6 9 3 B:  X6  9:9= 6  9:9=!6  9:9="6  9:9=#6  9:	= 6  9:
=!6$  9%  6& '	' B9(B3) 9*   X6+ 9,9* B6+ 9- 9. B=* 2  K  K  heartBeatIntervalscheduleGlobalunscheduleGlobalschedulerheartBeatTicker 
login app.event.PalaceBattleEventrequiresendEventEventManageremperorUIdemperorFactionNameemperorNameemperorFactionIconStrpalaceFunProxy 	sortinsert
tablepkTable uId’’’’ uIdž’’’myGateIdfactionUIdfactionidperson	flagnum	nametonumberuId|-2-1,
splitStringUtiljoinedBattlegateInfoendTime
state
roundloginedreturnWorldMapGameGlobalž’’’



 !!"""""""""""##$%&&&''''((())),,,---...///01111222223333331666667778888899999:::::;;;;;>>>>????@@@@@@@@@CDDDEEEEGGGGGGHHself  ²arr  ²tmp : : :i 8tmp2 tmp3 tmp 9,  i sendHeartBeat :   -9    XK  6 ' B 9-  9-  9B 9B9   9 BK  ĄsendMsgfinishMODULE_PALACEBATTLE_loginMODULE_PALACEBATTLEcreateapp.control.FactionWarMsgrequiresocketmsgType self  msg 	 ł   )1¤+ =  9   X6 99 B9   X6 99 B+  = +  = + = + = 4  = 9   X9  9	B+  = 6
  9  BK  removeEventsEventManagerdisposesocketstandsInfologinedinitedheartBeatTickerunscheduleGlobalschedulerheartBeatTimeOutTikercanDispatchOperation		

self  * Ź   ¼-   9      X6  9  -  9 B 6  9    9  B -     9  + B K   Ą	init
resetpalaceBattleProxyGameGlobalunscheduleGlobalschedulerheartBeatTickerself   $Dø9    X2 3 6 9 ) B= 9  9   X6 ' B 9-  9-  9	B 9
B9   9 B2  K  K  ĄsendMsgfinish MODULE_FACTIONWAR_heartBeatMODULE_FACTIONWARcreateapp.control.FactionWarMsgrequireperformWithDelayGlobalschedulerheartBeatTimeOutTiker socket						



msgType self  $timeOut msg    -É9    XK  6 ' B 9-  9-  9B 9B9   9 BK  ĄsendMsgfinish'MODULE_PALACEBATTLE_enterVIPStandsMODULE_PALACEBATTLEcreateapp.control.FactionWarMsgrequiresocketmsgType self  msg 	 Ę 
 :Ļ9    XK  6 ' B 9-  9-  9B 9 B 9B= 9   9	 BK  ĄsendMsgenterPKStandsPosIdfinishaddInt&MODULE_PALACEBATTLE_enterPKStandsMODULE_PALACEBATTLEcreateapp.control.FactionWarMsgrequiresocketmsgType self  posId  msg  ģ  Z²×!9    XK    X)’’  X)’’  X)’’  X)’’  X)’’  X)’’6 '	 B	 9-
  9

-  9B
 99 B
 96 9	9
9B
 96 9	9
9B
 96 9	9
9B
 9 B
 9 B
 9 B
 9 B
 9 B
 9 B
 9B9  
 9 BK  ĄsendMsgfinishplayerUid	typeposrobInfopalaceBattleProxyGameGlobalenterPKStandsPosIdaddInt#MODULE_PALACEBATTLE_robPostionMODULE_PALACEBATTLEcreateapp.control.FactionWarMsgrequiresocket     !msgType self  [heroUId1  [heroUId2  [heroUId3  [heroUId4  [heroUId5  [heroUId6  [msg !:   -ł9    XK  6 ' B 9-  9-  9B 9B9   9 BK  ĄsendMsgfinish&MODULE_PALACEBATTLE_leavePositionMODULE_PALACEBATTLEcreateapp.control.FactionWarMsgrequiresocketmsgType self  msg 	 ¬ 	 9’9    XK  6 ' B 9-  9-  9B 9 B 9B9   9 BK  ĄsendMsgfinishaddInt$MODULE_PALACEBATTLE_leaveStandsMODULE_PALACEBATTLEcreateapp.control.FactionWarMsgrequiresocketmsgType self  posId  msg    -9    XK  6 ' B 9-  9-  9B 9B9   9 BK  ĄsendMsgfinish"MODULE_PALACEBATTLE_leaveCityMODULE_PALACEBATTLEcreateapp.control.FactionWarMsgrequiresocketmsgType self  msg 	   'b
9    XK  6 ' B 9-  9-  9B 9 B' )  ) M 9	6 8B A	Oł 9	B9   9
 BK  ĄsendMsgfinishtonumberaddInt#MODULE_PALACEBATTLE_adjustArmyMODULE_PALACEBATTLEcreateapp.control.FactionWarMsgrequiresocket					
msgType self  (cityId  (groups  (msg str   i  Ą 	 =9    XK    X)’’6 ' B 9-  9-  9B 9 B 9B9   9 BK  ĄsendMsgfinishaddInt(MODULE_PALACEBATTLE_getArmyCampInfoMODULE_PALACEBATTLEcreateapp.control.FactionWarMsgrequiresocketmsgType self  cityId  msg    -9    XK  6 ' B 9-  9-  9B 9B9   9 BK  ĄsendMsgfinish*MODULE_PALACEBATTLE_getJuesaiRankInfoMODULE_PALACEBATTLEcreateapp.control.MsgrequiresocketmsgType self  msg 	 -   „  9  BK  
resetself     T XĻ Ø6   ' B 6 ' B3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 3' =& 3) =( 3+ =* 3- =, 3/ =. 31 =0 33 =2 35 =4 37 =6 39 =8 3; =: 3= =< 3? => 3A =@ 3C =B 3E =D 3G =F 3I =H 3K =J 3M =L 3O =N 3Q =P 3S =R 2  L   dispose send_getJuesaiRankInfo send_getArmyCampInfo send_adjustArmy send_leaveCity send_leaveStands send_leavePosition send_robPostion send_enterPKStands send_enterVIPStands send_heartBeat 
reset send_login MODULE_PALACEBATTLE_login $MODULE_PALACEBATTLE_statusChg_r $MODULE_PALACEBATTLE_npcNumChg_r  MODULE_FACTIONWAR_heartBeat 'MODULE_PALACEBATTLE_enterVIPStands &MODULE_PALACEBATTLE_enterPKStands #MODULE_PALACEBATTLE_positonChg enterBattle #MODULE_PALACEBATTLE_robPostion !MODULE_PALACEBATTLE_result_r MODULE_PALACEBATTLE_bonus *MODULE_PALACEBATTLE_getJuesaiRankInfo &MODULE_PALACEBATTLE_leavePosition $MODULE_PALACEBATTLE_leaveStands "MODULE_PALACEBATTLE_leaveCity 'MODULE_PALACEBATTLE_positionRobbed #MODULE_PALACEBATTLE_adjustArmy "MODULE_PALACEBATTLE_standsChg (MODULE_PALACEBATTLE_getArmyCampInfo msgReceived getIncExp 	init removeEvents getFactionUIdByCityId create getIncGold 	ctorapp.const.Const_MsgTyperequirePalaceBattleProxy
class           $ ! ( % + ) d , h f  i ©  ­ Ŗ ¼ ® Ą ½ Ę Į É Ē Ó Ź Ö Ō é × š ź 6ń h7i¦Æ§µ°¾¶ŌæÕ#6$G8NIVOxW~y¤§„ØØPalaceBattleProxy UmsgType R  