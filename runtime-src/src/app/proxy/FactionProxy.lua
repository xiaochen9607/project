LJO@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\proxy\FactionProxy.lua�  + S[7+ =  4  = )��= ' = )  = )  = )  = )��= )  =	 ' =
 )  = ' = 4  = )  = )��= 4  = )  = )  = )  = 4  = 4  = ' = ' = 4  = 4  = 4  = )d = )	 = 4  = +  = 4  =  )  =! )  =" )  =# )��=$ 4  =% 4  =& )  =' )��=( )��=) )��=* K  kingFactionUIdpointEnemy+lastRequestAllCityManorRewardTimeStampofficialSystemIdofficialInfomyWarCitysofficialPosdeclareNummanorNumexploittechItemsfirstCreatehasJoinBattleeachCityTitlePositionCountfactionJobTitleCanGetGoldstandbyGroupsdefGroupsatkGroupsiconStringDefault1_3_0_4iconStringcityStatesfactionCampselectedAttackOrDefendselectedGateselectedCityIdselectedCityInfosendMembersInfoTimeStampignoreWarTimesLeftmembersnotice	fundfactionDescmyContribution
myJobfactionMembersNumfactionExpfactionLvfactionNamefactionUIdlastEnterBatInfogetFactionInfoRequested  !!""##$$&&''(())**++,,--..0022334455667self  T �  ,�=4    X�9    X�L 6 ' B)  ) M�8:8	:		8
' 	 &8

6  9
 ' + B:::	  X�6 9 5	 =
=BO�K  id  insert
table_
splitStringUtillvdata.Config_FactionTechrequiretechItems							
self  -info  -tab +factionTechConf 	"  i id lv str typeArr type skId 
skLv 	 y   )P) 9   ) M�9  8 X�+ L O�+ L hasJoinBattleself  uId    i  � 	 
 &V:  X	�6  9:' + B= X�4  = 6  9  6 ' B9	BK  getCanDispatchHeroapp.event.FactionEventrequiresendEventEventManager,
splitStringUtilhasJoinBattle-1self  arr   �  "A^
:	  X�6   9  6 '
 B95	 =	B6  96 '		 B9
B6 9 9 B6 9 9BK  $send_getFactionCityJobTitleInfo$send_getFactionCityJobTitleListfactionGameGlobalactionSuccessdata.Config_LanguageaddMessageFloatMessageop  offerCityJobTitleapp.event.FactionEventrequiresendEventEventManager					
self  #arr  #param  #param2  # �  ;Oi:	  X2�6  9 96  996  99 B6  96 9	 9
B 9B6 99+  5 '	 6
  9

9

&	
	=	B6 96 9 6  99B 6  9 B6  9 9BK  $send_getFactionCityJobTitleInfoaddMessageFloatMessageformatstringlingqufengluConfig_Language
items isShow	1_1_	nameACQUIREITEMSSIMPLEConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerfactionJobTitleCanGetGoldfaction	goldsetGoldlocalPlayerGameGlobal




self  <arr  <str ) � 	 (u:	  X�6   9  6 ' B9B6  96 ' B9B6	 9
 9BK  $send_getFactionCityJobTitleInfofactionGameGlobalactionSuccessdata.Config_LanguageaddMessageFloatMessagequitCityJobapp.event.FactionEventrequiresendEventEventManagerself  arr   � 	 (~:	  X�6   9  6 ' B9B6  96 ' B9B6	 9
 9BK  $send_getFactionCityJobTitleInfofactionGameGlobalactionSuccessdata.Config_LanguageaddMessageFloatMessagecancelApplyForCityJobTitleapp.event.FactionEventrequiresendEventEventManagerself  arr   � 	 $2�:	  X�6   9  6 ' B9B6  96 ' B9B:	 X	�6  96 ' B9	BK    9
 BK  $send_getFactionCityJobTitleInfoyibeirenmingactionSuccessdata.Config_LanguageaddMessageFloatMessageapplyForCityJobTitleapp.event.FactionEventrequiresendEventEventManager����


self  %arr  % � 	  �6   9  6 ' B95 =BK  arr  getFactionCityJobTitleListapp.event.FactionEventrequiresendEventEventManagerself  arr   � 	 !/�:  X�6   9+  6 ' B99BK  6 9 ) B:= 6	  9
  6 ' B95 =BK  arr  getFactionCityJobTitleInfoapp.event.FactionEventsendEventEventManager
myJobremove
table	nameFACTIONJOBTITLEINFOUIdata.Config_UIrequireremoveUIUIManager




self  "arr  " G  "�-   9 BL �newFactionProxy self  proxy  �  @���l  X�K  +  6   B X�  9'	  9
B
&	
	B 9B X� 9	 B  X� 9+	 BL  9+	 B X�  X�9	 6
  9	 '
 B:  X�)��>:
  X�:
  X	�:
  X�:
  X�:  X�	 9+
 BL :' 6	 ' B	'
 :&

8	
	'
 :' 6 ' B' :&8' :&6
 	 9
 ' + B,	 9
 
 X
� 9
' B

 	  9
' B

  9
:B
 9
6  9:B A
X
O�6
 9

B

 9
 B 9
 B 9B
 9
  B 9' B 9B 9B 9 B
 9
 B 9)  )  B 9B 9B6 9 5! :="6  9:B=#6 9$=%B  9' B
 9
 B 9& 9'B A	
  9
+ B
	 9
	' B

 9

+ B
	 9
	' B

 9

)  )  B
  X
�6
( :B
6) 9*9+
 X
�6
) 9
*
9
+
	
  X
�  X
h�6
) 9
,
'-  &8

 
 X`�6
) 9
,
'-  &8

6( :B
 X
U�	 9
	' B

 9
.
) B
	 9
	' B

 9
.
) B
4
  	 9	'/ B
  X�	 9	'/ B
 X�6 '0 B 91* + + B
 
 92
+  + B	 9	
 B 9+ B
 9.
) B
 9
)   9'BB
 9&
 9'BB	 9	' B 963 94)� )� )  B AX

�	 9
	'/ B


  X
�	 9
5	'/ B
 9
663 97)  )  )  )� B) B
 9
8'9 :': &6; 9<9=B
 9
>B
 9
6  9:)� B A
	 9
?	+ B
L	 setCascadeOpacityEnabledgetColorplistTypeTextureResType	ccuiqi.pngcommon_loadTexturec4fenableOutlineremoveChildByNamec3bcc	initcreateapp.sprite.SkillAniKINGFACTIONsetLocalZOrderfactionUIdkuaFuProxyemperorFactionUIdpalaceFunProxyGameGlobaltonumbergetScalesetScale
alignTEXT_ALIGN_CENTER
color	text 	fontsimhei.ttfy 	size.x newTTFLabelgetContentSizereleaseremoveChildgetParentretainsetPositiongetPositionaddChildnewNodedisplayconvertHexToRGBDisplayObjectUtilsetColorsetStringtxtsetLayoutParameterqapp.const.Const_colorDatarequire_
splitStringUtiliconStringDefaultsetVisible-1getChildByNamegetName	iconsetNameuserdata	type������2����̙��					                      !!!!!!!"$$$&&&&&'((((())))*********---....////0001111122223334444444555566666777888999;;======@@@9ABBBBCCCCDDDDDDEGGGGIIIIIIIIJJJJJJJJJMMMMMMMMMMMMMMMNNNNNNNNNNNNNNNNNNNNNOOOOOOOOPPPPPPPPQRRRRRRSSSSSSUUUUUUUUUUVVVVVWWWWYYYYZZZZ[[[[[[[[\\\\\\\]]]]]]]]]]]]]]______````fffffffffffgggggggggghhhiiiiiiiiijjjjkself  �container  �iconName  �iconString  �serverId  �icon �tmp .�iconData 6�txt �ret  �iconImage LposX AposY  AcontentSize "spriteAni iC �   9� 9 ' B 9 B 9 ' B 9 B 9 ' B  X� 9 ' B 9 BK  KINGFACTIONtxtsetVisible	icongetChildByNameself   node   bVisible    �
 
7x��46  9 9B 9B:	  XY�6  9 -  99+  5	 B+ =	 4  =
 )��= ' = ) = )  = )  = )��= )  = ' = )  = ' = 4  = )  = )��= 4  = )  = )  = )  = 4  = 4  = '  = '  =! 4  =" 4  =# 4  =$ )d =% )	 =& 4  =' +  =( 4  =) )  =* 4  =+ 6,  9-  6. '	/ B90B  91 BK    91 B:	 X�62  9364 95BX�62  9364 96BK   �	czsbcannotexitConfig_LanguageaddMessageFloatMessagesend_getFactionInfoleaveFactionapp.event.FactionEventrequiresendEventEventManagermyWarCitysexploittechItemsfirstCreatehasJoinBattleeachCityTitlePositionCountfactionJobTitleCanGetGoldstandbyGroupsdefGroupsatkGroupsiconStringDefault1_3_0_4iconStringcityStatesfactionCampselectedAttackOrDefendselectedGateselectedCityIdselectedCityInfosendMembersInfoTimeStampignoreWarTimesLeftmembersnotice	fundfactionDescmyContribution
myJobfactionMembersNumfactionExpfactionLvfactionNamefactionUIdlastEnterBatInfogetFactionInfoRequested idO	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc����		

  !!""##$$%%''(((((((((***+...///00000002222224uiConfig self  yarr  ycurScene 	p � 
y��-6  9 9B 9B:	  XB�9 	  X�) = ) 9  ) M�9 896 9	9
 X�9 8) =O�) 9  ) M�9 899  X�9 89 =O�6  96 ' B9B6  9  6 '	 B9B6  9  6 '	 B9BK  :	 X	�6  96 ' B9BK  :	 X	�6  96 ' B9BK  :	 X �:	 X �6  9 -  99+  5	 B  9 BK   �send_getFactionInfo id'	nameMESSAGEBOX
addUIUIManagerthisJob24ththisJobFullgetMembersInfochangeJobTitleapp.event.FactionEventsendEventEventManageractionSuccessdata.Config_LanguagerequireaddMessageFloatMessagecurChangeJobTitleUIdjobTitleplayerUIdlocalPlayerGameGlobaluIdmembers
myJobcurChangeJobTitlegetRunningScenegetInstanceDirectorcc���������������� ###'''**********,,,-uiConfig self  zarr  zcurScene 	q  i   i 
 � @o�6  9 9B 9B:	  X$�) 9  ) M�9 899  X�6 99	 
 BX�O�6	  9
  6 '	 B9B6  96 ' B9BX�  9 B6  9 -  99+  5	 B  9 BK   �send_getFactionInfo id'	nameMESSAGEBOX
addUIUIManagersend_getMembersInfoactionSuccessdata.Config_LanguageaddMessageFloatMessagegetMembersInfoapp.event.FactionEventrequiresendEventEventManagerremove
tablecurKickMemberuIdmembersgetRunningScenegetInstanceDirectorccuiConfig self  Aarr  AcurScene 	8  i  � 
+M�6  9 9B 9B:	  X�9  =   9 9 B6  9 -  9	9
+  5	 BK  6  9 -  9	9
+  5	 B  9 BK   �send_getFactionInfo id' idM	nameMESSAGEBOX
addUIUIManagerselectedCityIdsend_getOneCityInfoignoreWarTimesLeftgetRunningScenegetInstanceDirectorcc										uiConfig self  ,arr  ,curScene 	# �   D��4  :  X?�)  ) M0�4  6 
 98' + B6	 :B	=	6	 :B	=	6	 :B	=	6	 :B	=	:	=		:	=	
:	=	6	 :B	=	6	 :	B	=	6	 :
B	=	6	 9		  B	O�6  9  6 '	 B95 =BK  cityBattleInfos  getCityBattleGroupapp.event.FactionEventrequiresendEventEventManagerinsert
tablefireOncityAtkNpcTypetostring
defIdiconInfo	name	timetimeLeftisFightingattackerTypetonumbercityId,
splitStringUtil-1				

self  Earr  EcityBattleInfos C1 1 1i /cityBattleInfo .ss ' � 
&H�	:	  X�6  9 9:B6  9  6 ' B9BK  6 9	 9
B 9B6  9 -  99+  5	 BK   � id'	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorccdispatchHeroapp.event.FactionEventrequiresendEventEventManager
setAplocalPlayerGameGlobal	uiConfig self  'arr  'curScene  y   	�-   + =  -    9  - B K     � startInstanceScriptplayerInBattleFieldself scene batStr  � 	&q�-   9      X�-  9    9  - B 2 �6    9  B 6  ' B   9  - - - - + - B 3 6	  9
  *   B2  �K  K   �������	�repalceSceneGameGlobal createapp.scenes.BattleScenerequire
clearUIManagernextBattle
logicplayerInBattleField����self curScene batStr batType chapterId insId hard items scene 
entered 	 � +���69  99  99  99  96 9	 9B	 9B+  	  X	�6		 '
 B	8	4	   X
"�
  X
 �6
 
 9

 ' + B
6 9
 B)  ) M�6 9	 6 9	 B6  98
' + B AO�3
 96	 ' B96	 ' B'  &86	 ' B6  99' B4  6  9  B6  9+      B 9B6  9  B6  9 B6   9!B6  9"B 9#B6  9"B 9$B6  9"B 9%B6  9"B 9#B6  9"B 9&6  9"B9'9(B6   9) 9* +  
 + B2  �K  	name
addUIBATTLESCENEsceneNametblsetCurScenepurgeCachedDataUseEngineretainConstTexInMemoryshowTexCacheInfogetResourceManagerremoveNodeFromCacheUIManagerremoveDuplicateItemsgetPreloadResgetBattleInfoGameGlobalcombineTableTableUtilresapp.utils.StringUtilBATTLEFIELDLOADINGdata.Config_UIbattleFieldId _insert	maxn
table,
splitStringUtildata.Config_CityrequiregetRunningScenegetInstanceDirectorccbatType	hard
insIdchapterIdlastEnterBatInfo
						
 !""""#######$$$%%%%%%&''''''(((((((((((())))))*****....///////0000000111111122222223333333333333555555555566self  �itemStr  �batStr  �chapterId �insId �hard �batType �curScene �insInfo �items �tmp len   i loadComplete lbattleFieldId kconf gbattleFieldConf `battleFieldResArr 	Warr VbattleRes D �  ,h�:	  X(�4  )  ) M�4  6  
 98' + B:	=	:	=	:	=	:	=	:	=	6	 9			  B	O�6
  9  6 '	 B95 =BK  groupsInfo  getAdjustArmyInfoapp.event.FactionEventrequiresendEventEventManagerinsert
tablecombatPowerlvplayerNameplayerUiduId,
splitStringUtil		

self  -arr  -groupsInfo '  i group groupInfo  � 	 ';�:	  X�6   96 ' B9B6  9  6 ' B9BK  6 ' B'	 :&8
  X�6   9 B  9
 BK  send_getArmyCampInfoadjustArmy_erradjustArmyapp.event.FactionEventsendEventEventManageractionSuccessdata.Config_LanguagerequireaddMessageFloatMessageself  (arr  (str  �  V��4  =  4  = 4  = 4  = : X
� X�6  9:' + B= )  ) M3�8 X/�6 	 98
' + B4  6	
 :B	=		)	  =	6	
 :B	=	:	=	6	
 :B			  X	�6	 9		9   B	X	�6	
 :B			 X	�6	 9		9  B	X	�6	 9		9  B	O�6  9  6 '	 B9BK  getPlayerDispatchHeroapp.event.FactionEventrequiresendEventEventManagerinsert
tableheroInfoslocation
statetonumberuId,
splitStringUtil-1myWarCitysdefGroupsatkGroupsstandbyGroups 				


	self  Warr  Wstr 
M4 4 4i 2infos 
(groupInfo ' � 
 8S�:	  X�6  ' B9 899 6  ' B998!= 6  9	  6  '	
 B95 :	=	BX�6  ' B' : &8  X	�6  96  ' B9BX�6  9 BK  faction_declareWar_reason0addMessageFloatMessagefaction_declareWar_reasondata.Config_Languageresult  declareWarapp.event.FactionEventsendEventEventManagerdeclareWarNeedFundfactiondata.Config_GameData	fundcityTypeselectedCityIddata.Config_Cityrequire








self  9arr  9type 
str  � 	 w��":	  Xs�: X_�9  6 :B=9  6 :B=9  :=9  6 :B=9  6 :B=9  :=9  6 :B=9  6 :	B=	9  6 :
B=
9  :=6 :B= 9  6 :B=9  6 :B=9  6 :B=9  6 :B=:= 9  6 :B=9  9 =9  6 :B=9  9	 X�9  ' =9  6 :B=  9 9 6 9  B A6  9  6 ' B9BX �K  getOneCityInfoapp.event.FactionEventrequiresendEventEventManager
clonesetCityStateByIdfireOn-1atkFactionUIdselectedCityIdidnpcDeclaringWarfactionMembersNumdefFactionUIddefGroupNumTotalattackerTypedefPlayerNum
myJobdefenderIconString
defLvdefCombatPowerdefGroupNumdefenderNameatkCombatPoweratkGroupNumattackerName	timetonumber	statselectedCityInfo����			




"self  xarr  x �   "�4   -  =  )  = )  = ' = ' = ' = )��= )  =	 )  =
 )��= )  = L  �fireOnatkFactionUIdattackerTypenpcDeclaringWardefFactionUId-1defenderIconStringdefenderNameattackerName	time	statid		

id tmp  � J�3  9 
  X�9  	  X� 2  �D ) 9  ) M
�9 89 X�9 82  �L O� 2  �D idcityStates  self  id  createEmptyState   i 	 �  7�9  
  X�9   	  X�+  L ) 9   ) M�9  89 X�9  <O�K  idcityStates self  id  obj  	 	 	i  �  v��(4  =  : X�K  )  ) M^�8
  X�6 8	B X�6 	 9
 BXP�6 	 98
' + B9  4	  <	9  86	
 :B	=		9  86	
 :B	=	9  86	
 :B	=	9  8:	=	9  8:	=	9  8:	=	9  86	
 :B	=	9  89	  X�9  8'	 =	9  86	
 :B	=	9  86	
 :	B	=	9  86	
 :
B	=	9  86	
 :B	=	O�6  9  6 '	 B9B  X� BK  getAllCityStatusapp.event.FactionEventrequiresendEventEventManagerfireOnatkFactionUIdattackerTypenpcDeclaringWardefFactionUIddefenderIconStringdefenderNameattackerName	time	stattonumberid,
splitStringUtil	dumpLogger
table	type-1cityStates����	!!!!!!""""""######$$$$$$&&&&&&&&&''''(self  warr  wcb  w
_ _ _i ]tmp H � 
Su�:	  X�6   9  6 ' B9B6 9 9:B  9 BK  6	 9
 9B 9B:	 X�6  9 -  99+  5	 BK  :	 X�6  9 -  99+  5	 BK  :	 X�6  9 -  99+  5	 BK  6  9 -  99+  5	 BK   � id' idpvpServerError idlevelNotEnough id	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorccsend_getArmyCampInfosetArmyFoodlocalPlayerGameGlobalassembleArmyapp.event.FactionEventrequiresendEventEventManager������������







uiConfig self  Tarr  TcurScene 5 � 
 j��*:  X�6   96 ' B' :&8B  9 BK  ) 9  ) M�9 899  X�6	 9
9 	 BX�O�) 9  ) M�9 899  X�6	 9
9 	 BX�O�) 9  ) M�9 899  X�6	 9
9 	 BX�O�) 9  ) M�9 899  X�6	 9
9 	 BX�O�6 9 9:B6  9  6 ' B9BK  withdrawnArmyapp.event.FactionEventsendEventEventManagersetArmyFoodlocalPlayerGameGlobalstandbyGroupsdefGroupsatkGroupsremove
tablecurWithdrawnArmyUIduIdfactionCampsend_getArmyCampInfowithdrawnArmy_errdata.Config_LanguagerequireaddMessageFloatMessage





     !!!!!!"""""# (((((()))))))))*self  karr  k  i   i   i   i  �   ?m�4  =  : X0�6 9 B)  ) M(�6 '	 B	 9B6 
 98'	 + B6	 :B	=	
6	 :B	=	:	=	6	 :B	=	6	 :B	=	6	 :B	=	:	=	9	  <	O�6  9  6 ' B9BK  getArmyCampInfoapp.event.FactionEventsendEventEventManagerheroInfoStringbatPowerlvid	nameplayerUIdtonumberuId,
splitStringUtilcreateapp.proxy.vo.CampInforequire	maxn
tablefactionCamp							



self  @arr  @len 
,) ) )i 'tmp !data  �  R��:	  XJ�4  =  6 9 B)  ) M4�6 	 98
' B6 '
 B
 9B6	
 :B	=		:	=	6	
 :B	=	6	
 :B	=	:	=	6	
 :B	=	6	
 :B	=	6	
 :B	=	9		6
 9

9

	
 X	�9	=	 9	  
 <
	O�6  9  6 '	 B95 =BK  6  9BK  returnHome
param  getMembersInfoapp.event.FactionEventsendEventEventManager
myJobplayerUIdlocalPlayerGameGlobalofficialPosbatPowerlastOperationcontributionjobTitlelv	nametonumberuIdcreateapp.proxy.vo.FactionMemberrequire,
splitStringUtil	maxn
tablemembers		



self  Sarr  Slen 
D5 5 5i 3tmp2 -member ' � 
k��!6   9  6 ' B95 =B6 9 9	B 9
B:	  X�9  = 6  96 ' B9B  9 B  9 BK  :	 X�6  9 -  99+  5	 BK  :	 X�6  9 -  99+  5	 BK  :	 X�6  9BK  :	 X�6  96 9BK  :	 X�6  96 9BK  6  9 -  99+  5	 BK   � id'	wmsj	jtymConfig_LanguagereturnHomeGameGlobal id) id(	nameMESSAGEBOX
addUIUIManagersend_getApplyssend_getMembersInfoactionSuccessdata.Config_LanguageaddMessageFloatMessagefactionMembersNumgetRunningScenegetInstanceDirectorcc
param  validApplyapp.event.FactionEventrequiresendEventEventManager��������������������			
          !uiConfig self  larr  lcurScene X � 	 �:	  X�6   9  6 ' B95 =B:= K  applyString
param  getApplysapp.event.FactionEventrequiresendEventEventManagerself  arr   � 
 i��:	  X&�:=  6  96 99) 6 '	 B99	B6
 9 96 ' B99	 B6  9  6 ' B95 =BK  6 9 9B 9B:	 X�6  9 -  99+  5	 BK  : X�: X�:	 X
�6  9 -  99+  5	 B:	 X
�6  9 -  99+  5	 B:	 X�6  96 9BK   �	wmsjaddMessageFloatMessage idflagOccupy id. idR	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc
param  app.event.FactionEventsendEventEventManagermodifyGoldlocalPlayerGameGlobalcreateNeedGoldfactiondata.Config_GameDatarequirecreateFactionstatisticsConfig_LanguagesetOnPurchaseTalkingDataManagerfactionUId������������������������								uiConfig self  jarr  jcurScene 28 � 
 $n��:+ =  6 :B= 9 	  X�6  9  6 '	 B95 =	B  X� BK  :=
 6 :B= 6 :B= 6 :B= 6 :B= := 9  X�6 9= := 6 :	B= 6 :B= 6 :B= := 9  X�9 = := := := := := := := 9   X�6   9!'" B6  9  6 '	 B95# =	B  X� BK    6MODULE_FACTION_getFactionInfo exploit变nil了！throwErrorLoggerdeclareNummanorNumcallRollTimesresetCallTimescallHeroUidexploiticonTimesiconStringDefaulticonStringmyContributionignoreWarTimesLeft	fundnotice	djccConfig_LanguagefactionDesc
myJobfactionMembersNumfactionExpfactionLvfactionName
param  getFactionInfoapp.event.FactionEventrequiresendEventEventManagertonumberfactionUIdgetFactionInfoRequested����    !!"""###%%&&&&(((())))**+++,,..//001122334455566666888888888889999:self  oarr  ocallBack  o � 
Y{�6  9 9B 9B:	  X�6  9 -  99+  5	 B6	  9
  6 '	 B95 =BK  :	 X�  9 BK  :	 X�6  9 -  99+  5	 BK  :	 X�6  9 -  99+  5	 BK  :	 X�6  96 9BK  6  9 -  99+  5	 BK   � id 	wmsjConfig_LanguageaddMessageFloatMessage id# idsend_getFactionInfo
param  applyJoinFactionapp.event.FactionEventrequiresendEventEventManager id	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc����������������


uiConfig self  Zarr  ZcurScene 	Q � 
.P�) >6  9 9B 9B:	  X�6  9 -  99+  5	 B6	  9
  6 '	 B95 =BX
�6  9 -  99+  5	 BK   � idcancelFaction2
param  cancelApplyJoinapp.event.FactionEventrequiresendEventEventManager idcancelFaction1	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorccuiConfig self  /arr  /curScene $ �   8�4  =  6  BH�6 99	  
 BFR�6  9  6 ' B95	 =
BK  
param  getTotalFactionsapp.event.FactionEventrequiresendEventEventManagerinsert
table
pairstotalFactionself  arr    _ v   � 	 +9�	:	  X!�9 =  6  96 9 9B 9B6 '	 B9
9+  5 B6  9  6 ' B95 =BX�6  96 9BK  czsbjyzfConfig_LanguageaddMessageFloatMessage
param  changeFactionDescapp.event.FactionEventsendEventEventManager id&	nameMESSAGEBOXdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagercurStrfactionDesc	self  ,arr  , � 	  �6   9  6 ' B95 =BK  
param  resetCallRollHeroapp.event.FactionEventrequiresendEventEventManagerself  arr   � 	 '�:	  X
�:=  9    X�6  9' B6  9  6 ' B95	 =
BK  
param  opeCallRollapp.event.FactionEventrequiresendEventEventManager3MODULE_FACTION_opeCallRoll exploit变nil了！thowErrorLoggerexploitself  arr   � 	 AO�
:	  X*�6   96 9 9B 9B6 ' B99	+  5
 B9  =   9 B6  9  6 ' B95 =B6 9 9BX�6   96 9 9B 9B6 ' B99	+  5 BK   iddianmao1!send_getPlayerSomeInfoChangeloginProxyGameGlobal
param  upgradeFactionLvapp.event.FactionEventsendEventEventManagersend_getFactionInfofactionLv idfactionlvup1	nameMESSAGEBOXdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager
self  Barr  B � 	 ���:	  X�6   96 9 9B 9B6 ' B99	+  5
 B6  9  6 ' B95 =BXo�:	 X�6   96 9 9B 9B6 ' B99	+  5 BXX�:	 X�6   96 9 9B 9B6 ' B99	+  5 BXA�:	 X�6   96 9 9B 9B6 ' B99	+  5 BX*�:	 X�6   96 9 9B 9B6 ' B99	+  5 BX�6   96 9 9B 9B6 ' B99	+  5 BK   idemailfail idlevelNotEnough idmsgFile idtitleFile id
param  masterSendMailapp.event.FactionEventsendEventEventManager idemailsuccess	nameMESSAGEBOXdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager����������������																				


self  �arr  � � Jq�:	  X*�6   96 99) 6 '
 B89B6 9	 9
6 9	96 '	 B89!B  9 B6  9  6 '	 B95 =BX�:	 X�6 9 9B 9B6  9 -  99+	  5
 BX�6  96 9BK   �	czsbaddMessageFloatMessage idflagOccupy	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc
param  modifyFactionEnsignapp.event.FactionEventsendEventEventManagersend_getFactionInfo	goldsetGoldlocalPlayerGameGlobalneedMoneydata.Config_FactionEnsignrequiremodifyEnsignstatisticsConfig_LanguagesetOnPurchaseTalkingDataManager����





uiConfig self  Karr  Kid  KcurScene 9
 � 	 =K�	:	  X�  9  B6  9  6 ' B95 =BX*�:	 X�6  9	6
 9 9B 9B6 ' B99+  5 BX�6  9	6
 9 9B 9B6 ' B99+  5 BK   id. id'	nameMESSAGEBOXdata.Config_UIgetRunningScenegetInstanceDirectorcc
addUIUIManager
param  modifyFactionNameapp.event.FactionEventrequiresendEventEventManagersend_getFactionInfo 	self  >arr  > � 	 !�:	  X�  9  BX�6  9  6 ' B95 =BK  
param  getFactionDeclareCityapp.event.FactionEventrequiresendEventEventManagersend_getFactionDeclareCity self  arr   � 	  '�:=  := 4  = 6  9:' B= 6  9  6 '	 B9
5 =BK  
param  getFactionShopapp.event.FactionEventrequiresendEventEventManager,
splitStringUtilshopItemsshopRefreshNextshopRefreshTimesself  arr   � 	 '5�
:	  X�6   9' BX�:	 X
�:= 6  9:' B= X�6   9' B6	  9
  6 ' B95 =BK  
param  refreshFactionShopapp.event.FactionEventrequiresendEventEventManager刷新失败,
splitStringUtilshopItemsmyContribution功勋不足addMessageFloatMessage����											
self  (arr  ( � 	 $2�:	  X�6   9' BX�:	 X�:= := := X�6   9' B6  9  6	 '
 B95 =BK  
param  buyFactionShopItemapp.event.FactionEventrequiresendEventEventManager购买失败buyItembuyHeromyContribution功勋不足addMessageFloatMessage����










self  %arr  % �	  ���	/:	  X�6   9' BX��:	 X��4  4  = 4  = 4  = : X�6  9:'	 B )  ) M�6 	 98
'
 + B6 99
  BO�: X�6  9:'	 B )  ) M�6 	 98
'
 + B6 99
  BO�: X�6  9:'	 B )  ) M�6 	 98
'
 + B6 99
  BO�:= := := := :	= 6  9:
'	 B4  = :
 X�:
 X�)  ) M�9 4	  <	9 6	 	 9		8'
 + B	<	O�:= 6  9  6 '
 B95	 =	BK  
param  getFactionManorInfoapp.event.FactionEventrequiresendEventEventManagerabandonTimes-1manorCityRewardmanorItemsmanorTime2manorTime1manorSilvermanorTechaninsert
table_,
splitStringUtil
manormanorEnemymanorNeutral失败addMessageFloatMessage 							




  !!$$$$$$%%&&&&&&''''((()))))))))',,-----------/self  �arr  �tmp �  i aa   i aa   i aa tmp &  i  � 	  .�	
:	  X�6   9' BX�:	 X�:= := := := 6  9  6	 '
 B95 =BK  
param  acqFactionManorRewardapp.event.FactionEventrequiresendEventEventManagermanorTime1manorItemsmanorGetItemsmanorTechan失败addMessageFloatMessage 
self  !arr  ! �  Cv�	:	  X�6   9' BX9�:	 X6�4  4  = : X �6  9:' B 6  BH�4  6	 	 9		 '	 + B		 5	
 :
=
	:
=
	6
 9

9 	 B
FR�6  9  6 '	 B95 =B6 9 9BK  updateAllHeroFactionSkilllocalPlayerGameGlobal
param  getFactionTechapp.event.FactionEventrequiresendEventEventManagerinsert
tablelvid  _
pairs,
splitStringUtiltechItems失败addMessageFloatMessage 	







self  Darr  Dtmp 5  _ v  tmp1 tmp2  �  <j�	:	  X�6   9' BX2�:	 X*�:= + 6 9 BH�9		 X	�9			=	+ FR�  X�6 9	9 5
 =B6  9  6 '
 B95	 =	B6 9 9+ BX�6   9' BK  升级失败updateAllHeroFactionSkilllocalPlayerGameGlobal
param  upFactionLvTechapp.event.FactionEventrequiresendEventEventManager lvinsert
tablelvidtechItems
pairs	fund军资不够addMessageFloatMessage����	self  =arr  =id  =isFound &
 
 
_ v   � 	 ?M�	:	  X�6   9' BX5�:	 X�6   96 9BX+�:	 X#�:= := := := :=	 :=
 := 4  = 6  9:	' B= 6  9  6 ' B95 =BX�6   9' BK  失败
param  getStarMissionapp.event.FactionEventrequiresendEventEventManager,
splitStringUtilstarRewardnextTimenextIdcurStarProcessstarFactionNeedScorestarFactionScorestarEndTimecurStarIDtianxingTimeConfig_Language活动未开始addMessageFloatMessage��������		

self  @arr  @ � 
 5P�
:	  X�6   9' BX+�:	 X#�:= := 6  9:' B= 4  =	 )  ) M�6
 99	 8	BO�6  9  6 ' B95 =BX�6   9' BK  失败
param  getStarMissionRankapp.event.FactionEventrequiresendEventEventManagerinsert
tablestarPlayerRank,
splitStringUtilstarRankRewardstarMyRankstarMyScore活动未开始addMessageFloatMessage����					self  6arr  6  i  � 	 6D�
:	  X�6   9' BX,�:	 X�6  9  6 ' B95 =	B6
 9 9BX�:	 X�6   9' BX�:	 X�6   96 9BX�6   9' BK  失败tianxingTimeConfig_Language条件未满足!send_getPlayerSomeInfoChangeloginProxyGameGlobal
param  acqStarMissionRewardapp.event.FactionEventrequiresendEventEventManager活动未开始addMessageFloatMessage������������							self  7arr  7 � 	 .<�
:	  X�6   9' BX$�:	 X!�6 9 96 99: B9 : = 9   X�6  9	'
 B6  9  6 ' B95 =BK  
param  acqFactionManorMoneyapp.event.FactionEventrequiresendEventEventManager<MODULE_FACTION_acqFactionManorMoney exploit变nil了！throwErrorLoggerexploitsilversetSilverlocalPlayerGameGlobal失败addMessageFloatMessage 											self  /arr  / � 	  �
4  =  =  6  9  6 ' B95 =BK  
param  getAllCityManorRewardapp.event.FactionEventrequiresendEventEventManagerallRewardself  arr   � 	  �
4  =  =  6  9  6 ' B95 =BK  
param  getFactionNewsapp.event.FactionEventrequiresendEventEventManagerfactionNewsself  arr   � 	  �
6   9  6 ' B95 =BK  
param  acqCityWarKillRewardapp.event.FactionEventrequiresendEventEventManagerself  arr   � 
  &�
6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish(MODULE_FACTION_acqCityWarKillRewardMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 	  �
6   9  6 ' B95 =BK  
param  getCityWarRankapp.event.FactionEventrequiresendEventEventManagerself  arr   � 
  &�
6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish"MODULE_FACTION_getCityWarRankMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 	  �
6   9  6 ' B95 =BK  
param  getAllCityKillArmyInfoapp.event.FactionEventrequiresendEventEventManagerself  arr   � 
  &�
6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish*MODULE_FACTION_getAllCityKillArmyInfoMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�
6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish"MODULE_FACTION_getFactionNewsMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�
6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish)MODULE_FACTION_getAllCityManorRewardMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  �   0�
6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt(MODULE_FACTION_acqFactionManorMoneyMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  pos  msg  �   /�
6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt(MODULE_FACTION_acqStarMissionRewardMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  id  msg  � 
  &�
6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish&MODULE_FACTION_getStarMissionRankMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�
6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish"MODULE_FACTION_getStarMissionMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  �   1�
6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B4 >BK  handlersendMsggameSocketGameGlobalfinishaddInt#MODULE_FACTION_upFactionLvTechMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  id  msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish"MODULE_FACTION_getFactionTechMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish)MODULE_FACTION_acqFactionManorRewardMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish'MODULE_FACTION_getFactionManorInfoMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  �   0�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt&MODULE_FACTION_buyFactionShopItemMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  pos  msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish&MODULE_FACTION_refreshFactionShopMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish"MODULE_FACTION_getFactionShopMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish)MODULE_FACTION_getFactionDeclareCityMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  �   0�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddString%MODULE_FACTION_modifyFactionNameMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  str  msg  �   7�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 
  9 B4	 >	BK  handlersendMsggameSocketGameGlobalfinishaddString'MODULE_FACTION_modifyFactionEnsignMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  str  id  msg  �    @�6  ' B 96 96 9B 9 B 9 B 9B6 9	 9
 6 
  9 B AK  handlersendMsggameSocketGameGlobalfinishaddString"MODULE_FACTION_masterSendMailMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  !title  !content  !msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish$MODULE_FACTION_upgradeFactionLvMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinishMODULE_FACTION_opeCallRollMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  �   4�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt%MODULE_FACTION_resetCallRollHeroMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  heroUid  msg  �   4�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt%MODULE_FACTION_resetCallRollHeroMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  heroUid  msg  �   1�6  ' B 96 96 9B=  9 B 9B6	 9
 9 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddStringcurStr%MODULE_FACTION_changeFactionDescMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  str  msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish&MODULE_FACTION_getCityBattleGroupMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  �   ([�	6  ' B 96 96 9B 9 B' )  ) M� 9	6 8B A	O� 9	B6
 9 9 6	   9 B	 AK  handlersendMsggameSocketGameGlobalfinishtonumberaddIntMODULE_FACTION_adjustArmyMODULE_FACTIONmsgTypecreateapp.control.Msgrequire	self  )cityId  )groups  )msg str   i  � 
  (�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B+  + BK  handlersendMsggameSocketGameGlobalfinish)MODULE_FACTION_getPlayerDispatchHeroMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 
  *�6  ' B 96 96 9B 99 B 9B6	 9
 9 6   9	 B AK  handlersendMsggameSocketGameGlobalfinishselectedCityIdaddIntMODULE_FACTION_declareWarMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  �   3�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt"MODULE_FACTION_getOneCityInfoMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  cityId  msg  �    <�6  ' B 96 96 9B 9 B 9 B 9B6 9	 9
 6 
  9 B AK  handlersendMsggameSocketGameGlobalfinishaddIntMODULE_FACTION_validApplyMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  !agree  !uId  !msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinishMODULE_FACTION_getApplysMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  �    <�6  ' B 96 96 9B 9 B 9 B 9B6 9	 9
 6 
  9 B AK  handlersendMsggameSocketGameGlobalfinishaddString!MODULE_FACTION_createFactionMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  !name  !flag  !msg  �   )I�6  ' B 96 96 9B=  9B  X�6 9	 9
 6 
  9 B+	  BX�6 9	 9
 6 
  9 B4	 >	BK  handlersendMsggameSocketGameGlobalfinishfirstCreate"MODULE_FACTION_getFactionInfoMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  *flag  *callBack  *msg  �   0�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt#MODULE_FACTION_cancelApplyJoinMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  uId  msg  �   3G�	6  996 9999 X�6  9	6
 96 9999&BK  6 ' B 96 96 9B 9 B 9B6  9 9 6 	  9
 B AK  handlersendMsggameSocketfinishaddInt$MODULE_FACTION_applyJoinFactionMODULE_FACTIONmsgTypecreateapp.control.MsgrequirexywjdjConfig_LanguageaddMessageFloatMessagelvfactionopenLvsnewBieConfig_GameData
levellocalPlayerGameGlobal	self  4uId  4msg " � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish$MODULE_FACTION_getTotalFactionsMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 
  +�6  9B=  6 ' B 96 96 9B 9	B6 9
 9 6   9	 B AK  handlersendMsggameSocketfinish"MODULE_FACTION_getMembersInfoMODULE_FACTIONmsgTypecreateapp.control.MsgrequiregetServerTimeGameGlobalsendMembersInfoTimeStampself  msg  �   6�  X�)��6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt#MODULE_FACTION_getArmyCampInfoMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself   cityId   msg  �   1�=  6 ' B 96 96 9B 9 B 9B6	 9
 9 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt!MODULE_FACTION_withdrawnArmyMODULE_FACTIONmsgTypecreateapp.control.MsgrequirecurWithdrawnArmyUIdself  uId  msg  �   0D�
6  ' B 96 96 9B 9:B 9:B 9:B 9:B 9:B 9:B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt MODULE_FACTION_assembleArmyMODULE_FACTIONmsgTypecreateapp.control.Msgrequire										
self  1arr  1msg & �   *=�6  ' B 96 96 9B 9B  X�6 9 9	 6
 	  9
 B+  +	 BX�6 9 9	 6
 	  9
 B4 >+	 BK  handlersendMsggameSocketGameGlobalfinish$MODULE_FACTION_getAllCityStatusMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  +cb  +msg   �   3�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddIntMODULE_FACTION_unableFightMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  cityId  msg  �   1�=  6 ' B 96 96 9B 9 B 9B6	 9
 9 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt%MODULE_FACTION_kickFactionMemberMODULE_FACTIONmsgTypecreateapp.control.MsgrequirecurKickMemberself  uId  msg  �   "A�=  = 6 ' B 96 96 9B 9 B 9 B 9	B6
 9 9 6 
  9 B AK  handlersendMsggameSocketGameGlobalfinishaddInt"MODULE_FACTION_changeJobTitleMODULE_FACTIONmsgTypecreateapp.control.MsgrequirecurChangeJobTitleUIdcurChangeJobTitleself  #uId  #jobTitle  #msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish MODULE_FACTION_leaveFactionMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish.MODULE_FACTION_getFactionCityJobTitleInfoMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  �   1�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt.MODULE_FACTION_getFactionCityJobTitleListMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  city  msg  �   1�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt(MODULE_FACTION_applyForCityJobTitleMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  city  msg  �   1�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt.MODULE_FACTION_cancelApplyForCityJobTitleMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  city  msg  �   'G�6  ' B 96 96 9B 9 B 9 B 9 B 9B6 9	 9
 6	   9 B	4
 >
>
BK  handlersendMsggameSocketGameGlobalfinishaddInt%MODULE_FACTION_offerCityJobTitleMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  (city  (uId  (op  (msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish&MODULE_FACTION_getCanDispatchHeroMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  �   1�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddIntMODULE_FACTION_quitCityJobMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  city  msg  �   1�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt)MODULE_FACTION_getCityJobTitleSalaryMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  city  msg  � 	 .<�:	  X�6   9' BX$�:	 X!�6 9 96 99: B9 : = 9   X�6  9	'
 B6  9  6 ' B95 =BK  
param  oneKeyAcqFactionManorMoneyapp.event.FactionEventrequiresendEventEventManager<MODULE_FACTION_acqFactionManorMoney exploit变nil了！throwErrorLoggerexploitsilversetSilverlocalPlayerGameGlobal失败addMessageFloatMessage 											self  /arr  / � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish.MODULE_FACTION_oneKeyAcqFactionManorMoneyMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 	 %3�	:	  X�6   96 9BX�:	 X�6   96 9B  9 B  9 B6  9  6	 '
 B95 =BK  
param  impeachMasterapp.event.FactionEventrequiresendEventEventManagersend_getMembersInfosend_getFactionInfo	czcg	czsbConfig_LanguageaddMessageFloatMessage 	self  &arr  & � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish!MODULE_FACTION_impeachMasterMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 	  �6   9  6 ' B95 =BK  
param  getFactionTreasureInfoapp.event.FactionEventrequiresendEventEventManagerself  arr   � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish*MODULE_FACTION_getFactionTreasureInfoMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 	 $�:	  X�6   9  6 ' B95 =BX�6  96	 9
BK  	czsbConfig_LanguageaddMessageFloatMessage
param  operFactionTreaapp.event.FactionEventrequiresendEventEventManagerself  arr   � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish#MODULE_FACTION_operFactionTreaMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish)MODULE_FACTION_getFactionCityJobInfoMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  � 	 	 "�:=  : X�  9 :B= 6  9  6 ' B9BK  getFactionCityJobInfoapp.event.FactionEventrequiresendEventEventManagerofficialStrConvertofficialInfoofficialSystemIdself  arr   �    9�6  ' B 96 96 9B 9 B 9 B 9B6 9	 9
 6 
  9 B AK  handlersendMsggameSocketGameGlobalfinishaddInt MODULE_FACTION_offerCityJobMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  !id  !uId  !msg  � 	 DR�:	  X	�6   96 99BK  X$�:	 X�X �:	 X�6   96 99BX�:	 X�6   96 99BX
�:	 X�6   96 99B:= :	 X�  9 :B=
 6  9  6 ' B9BK  offerCityJobapp.event.FactionEventrequiresendEventEventManagerofficialStrConvertofficialInfoofficialSystemIdSYSTEMCHANGEBEENASSIGNEDHAVENOPERMISSIONOFFERERRORofficialConfig_LanguageaddMessageFloatMessage ������������			






self  Earr  E �   7�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 
  9 B4	 >	BK  handlersendMsggameSocketGameGlobalfinishaddInt!MODULE_FACTION_cancelCityJobMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  id  uId  msg  � 
 Tu�:	  X	�6   96 99BK  X$�:	 X�X �:	 X�6   96 99BX�:	 X�6   96 99BX
�:	 X�6   96 99B) 9  ) M�9 89	 X�9 8)  =
X�O�:= : X�  9 :B= 6  9  6 '	 B9BK  cancelCityJobapp.event.FactionEventrequiresendEventEventManagerofficialStrConvertofficialInfoofficialSystemIdofficialPosuIdmembersSYSTEMCHANGEHAVENOASSIGNEDHAVENOPERMISSIONCANCELERRORofficialConfig_LanguageaddMessageFloatMessage ������������			






self  Uarr  UuId  U5  i 
 �  J��4  4  6   9 ' B)  ) M(�6	  	 9		8' B	6
 :	B

 
	
 X�)
 5 6 :	B=:	=6 :	B=6 :	B=	<
:	
  X�6 :	B6 :	B<O�) 9
  ) M�9	
 8		9			8		
	  X	�9	
 8		9

 8

9
	
8

=
	O�  J officialPosmembersuIdheadId	namebTenure  tonumber_,
splitStringUtil 
self  Kstr  KofficialInfo IplayerIds Htmp B) ) )i 'item !index "  i  �  :�4  ) ) ) M
�6  9	 6
   8

BO�L Config_FactionCityJobinsert
tableself  id  officialTable   i 	 �   /�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddIntMODULE_FACTION_giveUpCityMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  id  msg  �  BP�:	  X�:=  6  96 9B  9 BX2�:	 X�6  96 99BX'�:	 X�6  96 99BX�:	 X�6  96 99	BX�:	 X�6  96 99
BX�6  96 9BK  	czsb	sjwd	fqsxdqgz	fqccsend_getFactionManorInfo	czcgConfig_LanguageaddMessageFloatMessageabandonTimes����������������			







self  Carr  C � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish#MODULE_FACTION_dissolveFactionMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  msg  �  0>�:	  X�6   96 9BX%�:	 X�6   96 9BX�:	 X�6   96 9B  9 B6  9+  6	 9
9BX�6   96 9BK  	czsb	nameNEWPALACEUIConfig_UIremoveUIUIManagersend_getFactionInfo	czcg
jsjt2
jsjt1Config_LanguageaddMessageFloatMessage��������





self  1arr  1 �  "�:	  X �  9   B6 9 9BK  !send_getPlayerSomeInfoChangeloginProxyGameGlobalsend_getOneCityInfoself  arr  city   �   "<�6  ' B 96 96 9B 9 B 9 B 9B6 9	 9
 6 
  9 B4	 >	BK  handlersendMsggameSocketGameGlobalfinishaddIntMODULE_FACTION_fireOnCityMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  #city  #op  #msg  ?    �6     9  B K  returnWorldMapGameGlobal � -O�:	  X�  X� B2 $�6  96  ' :&8
  X�6  ' :&8  X�6  93 6  96 996		 '
 B	9		9		+
  5 ==BK  K  
paramfun idgeneralError	nameMESSAGEBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager 	czsbMODULE_FACTIONWAR_loginErrConfig_Language							




self  -arr  -cb  -str "finish  �   :�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 
  9 B4	 >	BK  handlersendMsggameSocketGameGlobalfinishaddInt#MODULE_FACTION_cityLoginVerifyMODULE_FACTIONmsgTypecreateapp.control.Msgrequireself  cityId  cb  msg  �-  � �� �6   ' B 6 ' B3 =3 =3	 =3 =
3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3! = 3# ="3% =$3' =&3) =(3+ =*3- =,3/ =.31 =033 =235 =437 =639 =83; =:3= =<3? =>3A =@3C =B3E =D3G =F3I =H3K =J3M =L3O =N3Q =P3S =R3U =T3W =V3Y =X3[ =Z3] =\3_ =^3a =`3c =b3e =d3g =f3i =h3k =j3m =l3o =n3q =p3s =r3u =t3w =v3y =x3{ =z3} =|3 =~3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3� =�3 =�'3<'3<'3<'3<'	3
<'3<'3<'3<'3<'3<'3<'3<'3<'3<'3<2  �L  send_cityLoginVerify #MODULE_FACTION_cityLoginVerify send_fireOnCity MODULE_FACTION_fireOnCity #MODULE_FACTION_dissolveFaction send_dissolveFaction MODULE_FACTION_giveUpCity send_giveUpCity getPositionConfig officialStrConvert !MODULE_FACTION_cancelCityJob send_cancelCityJob  MODULE_FACTION_offerCityJob send_offerCityJob )MODULE_FACTION_getFactionCityJobInfo send_getFactionCityJobInfo send_operFactionTrea #MODULE_FACTION_operFactionTrea  send_getFactionTreasureInfo *MODULE_FACTION_getFactionTreasureInfo send_impeachMaster !MODULE_FACTION_impeachMaster $send_oneKeyAcqFactionManorMoney .MODULE_FACTION_oneKeyAcqFactionManorMoney send_getCityJobTitleSalary send_quitCityJob send_getCanDispatchHero send_offerCityJobTitle $send_cancelApplyForCityJobTitle send_applyForCityJobTitle $send_getFactionCityJobTitleList $send_getFactionCityJobTitleInfo send_leaveFaction send_changeJobTitle send_kickFactionMember send_unableFight send_getAllCityStatus send_assembleArmy send_withdrawnArmy send_getArmyCampInfo send_getMembersInfo send_getTotalFactions send_applyJoinFaction send_cancelApplyJoin send_getFactionInfo send_createFaction send_getApplys send_validApply send_getOneCityInfo send_declareWar send_getPlayerDispatchHero send_adjustArmy send_getCityBattleGroup send_changeFactionDesc  send_resetCallRollHero send_opeCallRoll send_upgradeFactionLv send_masterSendMail send_modifyFactionEnsign send_modifyFactionName send_getFactionDeclareCity send_getFactionShop send_refreshFactionShop send_buyFactionShopItem send_getFactionManorInfo send_acqFactionManorReward send_getFactionTech send_upFactionLvTech send_getStarMission send_getStarMissionRank send_acqStarMissionReward send_acqFactionManorMoney send_getAllCityManorReward send_getFactionNews  send_getAllCityKillArmyInfo *MODULE_FACTION_getAllCityKillArmyInfo send_getCityWarRank "MODULE_FACTION_getCityWarRank send_acqCityWarKillReward (MODULE_FACTION_acqCityWarKillReward "MODULE_FACTION_getFactionNews )MODULE_FACTION_getAllCityManorReward (MODULE_FACTION_acqFactionManorMoney (MODULE_FACTION_acqStarMissionReward &MODULE_FACTION_getStarMissionRank "MODULE_FACTION_getStarMission #MODULE_FACTION_upFactionLvTech "MODULE_FACTION_getFactionTech )MODULE_FACTION_acqFactionManorReward 'MODULE_FACTION_getFactionManorInfo &MODULE_FACTION_buyFactionShopItem &MODULE_FACTION_refreshFactionShop "MODULE_FACTION_getFactionShop )MODULE_FACTION_getFactionDeclareCity %MODULE_FACTION_modifyFactionName 'MODULE_FACTION_modifyFactionEnsign "MODULE_FACTION_masterSendMail $MODULE_FACTION_upgradeFactionLv MODULE_FACTION_opeCallRoll %MODULE_FACTION_resetCallRollHero %MODULE_FACTION_changeFactionDesc $MODULE_FACTION_getTotalFactions #MODULE_FACTION_cancelApplyJoin $MODULE_FACTION_applyJoinFaction "MODULE_FACTION_getFactionInfo !MODULE_FACTION_createFaction MODULE_FACTION_getApplys MODULE_FACTION_validApply "MODULE_FACTION_getMembersInfo #MODULE_FACTION_getArmyCampInfo !MODULE_FACTION_withdrawnArmy  MODULE_FACTION_assembleArmy $MODULE_FACTION_getAllCityStatus setCityStateById getCityStateById "MODULE_FACTION_getOneCityInfo MODULE_FACTION_declareWar )MODULE_FACTION_getPlayerDispatchHero MODULE_FACTION_adjustArmy %MODULE_FACTION_getAdjustArmyInfo enterBattle  MODULE_FACTION_dispatchHero &MODULE_FACTION_getCityBattleGroup MODULE_FACTION_unableFight %MODULE_FACTION_kickFactionMember "MODULE_FACTION_changeJobTitle  MODULE_FACTION_leaveFaction handleFactionIconVisible handleFactionIcon create .MODULE_FACTION_getFactionCityJobTitleInfo .MODULE_FACTION_getFactionCityJobTitleList (MODULE_FACTION_applyForCityJobTitle .MODULE_FACTION_cancelApplyForCityJobTitle MODULE_FACTION_quitCityJob )MODULE_FACTION_getCityJobTitleSalary %MODULE_FACTION_offerCityJobTitle &MODULE_FACTION_getCanDispatchHero checkHeroCanDispatch getSkillsInTechs 	ctorFactionProxy
classdata.Config_UIrequire      :  O = U P ] V h ^ t i } u � ~ � � � � � � � � � R�S����������#aFrb���������9O:jP�k�������%(&1)<2L=YMcZjdqk|r�}���������	&2'73<8@>EAIGNJRPWS]Yc_jeqlws}y����������������������������������� �, 2-<3A=GBNHUO`Viapkxr�y��������������������������������������� % )@)B\B_e_glgm}m������������������uiConfig �FactionProxy �  