LJX@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\arenaIns\ArenaLogic1.lua�  
*6  ' B 9B=9.  L  �runLogicsceneContextnew'app.script.instance.InsNormalLogicrequire_runLogic self  scene  tar  �  @	
-   9  B==+  =99=4  =4  =+  =L �tmpTimeSchedulerjumaPosguardTowersterrainstartDelaySchedulerbatStrsceneContextnew	ArenaLogic1 self  scene  batStr  logic  0     9  BK  showStoryself   � 
  )L
9 9 =    9 B  9 9 9  B9 96 99 X�9  9) + + +	 B:9: 9	) B  9
   BK  pvpBattleInitgotoAndStop	listgetGroupByPartyId
rotlaConfig_GameDatabatTypeinitPositionposInitsceneContextterrain					
self  *posArr #ePosArr  #side2  D   $9   9D getAllGroupTilessceneContextself   �  & Mh'4 5 5  =5 =>5 5 =5 =>5	 5 =5
 =>5 5 =5 =>5 5 =5 =>5 5 =5 =>4 5 5 =5 =>5 5 =5 =>5 5 =5 =>5 5 =5 =>5! 5  =5" =>5$ 5# =5% =>  J    dir
party  	   dir
party  
   dir
party     dir
party     dir
party  	   dir
party  
   dir
party     dir
party     dir
party     dir
party     dir
party  friendlyPartys  	tile dir
party  self  NposArr &(ePosArr % ] 	  #k)�� 9  +   BK  countPureDamagetarget  	group  	damage  � = ��=<9  =  4  = 99
  X�4 5 >5 >5 >) 99) M�9	 	 9		+  ) ) )�5	 8=
5 =B	6
 9

9 	 B
O�99
  X�4 5 >5 >5 >) 99) M�9	 	 9		+  ) ) )�5 8=
5 =B		 9
	+  5 B
O�99
  X3�4 5 >5 >5 >5 >5 >= ) 99) M"�9	 	 9		+  ) ) )�5  4 5 8:>8:>>=!4 5" 8:>8:>>=#8=
5$ =B	O�99%
  X2�4 5& >5' >5( >5) >5* >) 99%) M"�9	 	 9		+  ) ) )�5, 4 5+ 8:>8:>>=!4 5- 8:>8:>>=#8=
5. =B	O�99/
  X/�30 4 51 >52 >53 >54 >55 >96  97)	 +
 + + B) 99/)	 M�96  98 4 4 8
:>8
:>>)
 +  )  , )��),BO�96  99)��': 5	; B  9< BK  getReady  NORMAL_ForServerchangeAIPolicycallGroupByPartyFunctionaddTrapgetGroupBySrcPartyIdsceneContext    	       	trap       
partydir               rushCar  setTilesWhenDied    setTilesWhenAlive 
partydir     jumaPos    
    	  	juma  setDirLimit   dir
party      stoneCarplayerFactionTechinsert
tablefriendlyPartys  	tile dir
partyaddSummonGroup  	    guardTowerenemyFactionTechguardTowers
logicbattleInfo












####$$$$$$$$$$$%%%%%'''''''''''''''''''''''''''''''''%----23333333333344444444555556666666666666666666665:::::::;;;<self  �posArr  �ePosArr  �battleInfo �posArr   i tar posArr   i tar posArr (# # #i !tar ! posArr '# # #i !tar ! triggered .posArr #groups   i trapId   �  ;z9   	  X�+ L )  ) 9   ) M�6  99	 9
  8

:

9  8:B X�+ L O�+ L terrainisWalkableMapUtiljumaPos self  count   i  �  T��-   9   
   X �6  9  -  9 B -   9    9  ) ' 5 B -   9    9  ) ' 5 B )  -  ) M �- 89  X
� 9	B 9
999	9		BO �)  -  ) M �- 89  X
� 9	B 9
999	9		B6  9-   9		B	6
 ' B
9

BO �-     9  B K   ���pvpStartSPRITE_MOVE_COMPLETEapp.event.SpriteEventrequireremoveEventEventManageryxoriPositionsetPositiongetLeaderinitHp    stopMovingcallGroupByPartyFunctionsceneContextunscheduleGlobalschedulertmpTimeScheduler 					

	self side1 side2   k v   k v  � ���S9   9) + + + B9   9) + + + B)��)��4	 5 >5 >5 >5 >5 >5 >5 >5	 >) ) :
  X�:
 9
B9:
  X�:
 9
B93 )	 
 ) M	3�8 9B9	  X� 9+ BX&� 9
B 98: 8: B 9+ B 9999999B9)  X	� 9999999BO	�+	 )
  ) M
B�8 9B9	  X� 9+ BX5� 9
B 98: 8: B 9+ B	 X�6  9   9
B6 ' B9 B 9999999B9)  X	� 9999999BO
�6
 9

 ) B
=
 2  �K  performWithDelayGlobalschedulertmpTimeSchedulerSPRITE_MOVE_COMPLETEapp.event.SpriteEventrequireaddEventEventManagerjobyxoriPositionmoveTotogethersetPositionsetToDieinitHpgetPosition dirgetLeader  ����2  ����   ��������   ����  d����  d   d2   2getGroupByPartyIdsceneContext 		

.////01112224444466666666666677778888888889999:::::::::/>????@AAABBBDDDDDFFFFFFFFFFFFGGGGHHIIIIIIIIIIIIIKKKKKKKKKLLLLMMMMMMMMM?RRRRRRSSself  �side1 	�side2 �offsetX �offsetY �offsetDir �side1Dir �side2Dir  �com �4 4 4k 2v 1posX .posY  .added 0NC C Ck Av @posX =posY  = { 
  2�9   9  	 D getNearestEnemyGroupsceneContextself  group  ignoreGroup  checkReach   _   �9   9  D groupCheckCanUseSkillsceneContextself  uId  sw   �  @g�9  9  X;�6  99 ' B6 :B6 :B	  X�)  	 X�9   9)  B	 X#�) 9 9	6
 99  
 9) B A !	 X�) 9 9	6
 99  
 9) B A !)  X�) 9   9 BK  getGroupBySrcPartyId	nums
tableplayersTotalGroupbattleInfobattleResulttonumber|batStr
splitStringUtilskipBattlesceneContext���� 

self  Aarr 5seed 2isWin /starNum " �  |��-9  9  X�K  6  99 ' B6 :B4  4  4  +  :
  X�6 	 9:
' + B )  )	 M	� 
8
  X�8
 
8<O�:
  X�6 	 9:
' + B )  )	 M	� 
8
  X�8
 
8<O�:
  X�6 	 9:
' + B )  )	 M	� 
8
  X�8
 
8<O�9  	 9
   B6	 	 9

 B9   X�6 99	 B+  = 	  9 B6 96	   9 B	)
 B= K  pvpStart2handlerperformWithDelayGlobalstartDelaySchedulerstartBattleunscheduleGlobalschedulerpvpTickScheduleIdsetSeedBattleRandomsetRecBattleData,tonumber|batStr
splitStringUtilskipBattlesceneContext	


%%%%%%%&&&&&'''''''((***,,,,,,,,,-self  }arr qseed n_damage k_beDamaged  k_cure  kbDataTmp j
 
 
i 
 
 
i 
 
 
i  �   �-     9   6 ' B9- , B K   ��	IDLEapp.const.Const_ActionrequiredoActionattacker dir       �K   �  \��  9    9B  9 B=3   9 6 '	 B9 +	  +
 +   B+  9	 6 '
 B9 X�6 ' B:f999:9  9  	 B9	 6 '
 B9 X�6 ' B:h999:9  9  	 B3 6 9 96	 9			 9		) B	6
 9


 9

 B
 A	  9 B	 9
 B2  �K  runActionCallFuncDelayTimecreateSequencecc COUNSELLORforceShootEnemy
paramscriptattackactiondata.Config_SpriteDataARCHERapp.const.Const_JobjobATTACKapp.const.Const_ActionrequiredoAction dirgetLeaderattachGroupgetAttackerDir	






attacker  ]unit  ]dir Wcb Rparam EdelayCom +aaa 	 �  	u��-   9      X�6  9  -  9 B -   9    9  ) ' 4 6 ' B9>B -   9    9  ) ' 4 6 ' B9>B -   9    9 	 + B -  	   X �0 -  	  X �-   9    9 
 )  B -  	  X (�)  -  996 9-  9 9) B A !	 X�)  -  996 9-  9 9) B A !)  X�)  -  9 9
  B-  -   X �-   9  9    X 
�-   9  9    X �6  9    9  B K   ���send_pvpErrorLogloginProxyGameGlobalisBattleReportskipBattlegetGroupBySrcPartyId	nums
tableplayersTotalGroupbattleInfobattleResultsetBattlePause	IDLEapp.const.Const_ActionrequiredoActioncallGroupByPartyFunctionsceneContextunscheduleGlobalschedulerpvpTickScheduleId���� 


self isWin clientIsWin starNum ;' @   �9  9  X�+ L + L disa  	b  	 ����G  9  B
  X�9 X��9 	  XC�-  9 )   X=�4  ) -  9 ) M#�-  989 X�6 9
 5 -  98=6 9	6 9
  9 B A 6 9
-  98 9B A  A=BO�3  )   X�6 9  B:9X� 	 X�-  4  =9 	 X�6  9  9 B	  9 B) B-  9 9   )	 +
 + B   9  B2  �K  
  X�9 XB�6  9  9 B	  9 B) B)  ) M(�-  9
 98  ) + + B   X�9  X	�9  X	�
 9B  X�X�  X�9  X	�+    X�
 9B  X	�+  O�  X	�-  9 9  +  	 B   9  BX�  X�  X�-   9  +   B   9  BX �  X�X �  9  B2  �L  �getNearestEnemyGroupcheckCanNotBeSelectedmountObjectgetPosByDirAndDissetMyTargetGroupgetGroupByTilesceneContextgetDirgetTilePositiongetOnePosByDisAndDisMapUtil	sort disgetPositionppGetDistancecctarget  insert
tableguardTowers
npcIdisAlivegetMyTargetGroup�N �N																												  """""%%%%%%%%%%%&&&&'''''''''''(((((((((((((()))))*,,,,,,,-&0011111111144444668899999999::::;@@@EEEEFFself attacker  �checkReach  �defender �gts <$ $ $o "comp $tp  tiles !7) ) )i ' � %V�9    X �9   9 B X�-    + B-  99 + B  X�- 9 99 B9 	 X�- . + L + L � �
�
partygroupUseSkillsceneContextuIdgroupCheckCanUseSkillgetMaxMoralemoralehasInitiativeSkillId����						


findTargetForAttacker self totalTime attacker  & � 	 'o�  X�  9  6 ' B9BK  9 X�  9  6 ' B9BK   9B 9 9 B  X�  9 B-     BK  �uIdunitBeAttackHandle_forcegetRandomMemberAliveisAlive	IDLEapp.const.Const_ActionrequiredoAction	doAttackAction attacker  (defender  (unit canAttack 
attackerUnit  �   W�6   9  B6   999B6   999	B6   9	 
  BL getMinDistancePointyxgetPixelPointgetPixelPointsMapUtilnodes  enemyTp  myTp  pixNodes ePix pix v index   @   �9  9  X�+ L + L uIda  	b  	 �  
3�� -   -  ) M '�- 8
  X"�9   X� 9B
  X� 9B9  X�-  + B  X�X � 9	 B 9B  X� .  K  X �O �1  0  0 -     .  K  �����timePassScheduleTicksetMyTargetGroupgetMyTargetGroupisAlive���� timePassArrIndex timePassArr findTargetForAttacker beginGroupsIndex i ( ( (u &v $tmp castRestrainSkill 
 �  %�K  -      X �-  -    X �-  .   6     9  6 9B K  ��syncingBattleConfig_LanguageaddMessageFloatMessage PlastShowMessage i  �4  a����6   9     X�K  -      X �-  9  
   X �-  9  9  
  X �-  9  9     X	�6   9     X�-  9  9     X�K  -  B -      X �K  -  -   X�6  9+  6 9	9
B
  X�6 9- B=1 - -  X�0 - BK  - 	 X �- 9 9) + + + B- 9 9) + + + B- 99  X�+     X�+  - :
  X� X+�-	 	 X
�)  ) M�8
 9BO�X	�)  ) M�8
 9BO�6 9 B	 X�0 - BK  6 9 B	 X�0 - BK  K  6 9- ) B6  9 ' B6 96 :B X�6  96 :
B A6  9:'	 B)  ) M�6
 8	B


  X�- 998
9  X
�- 998
 9+ B-
 BO�: X��6  9:	'
 B)  )	 My�6 8
B6 
8B6 
8B6 
8B6 
8B- 998 9B- 9989 
  X�- 9989 9! X�9" X�6#  9$  B- 998 9%9!9"B- 998 9&6' 9(  B+ B)   X�- 9989 X	�- 998 9)B-
 B- 9989* X�- 998 9+ B- 998 9,B- 9989- X �O�6 9 B	 X�0 - BK  6 9 B	 X�0 - BK  - 9
  X�- 99
 X�- 99  X	�6  9  X�- 99  X�K  , )��- 	  X�- 9 9.B0 - - - 99/ ) MR� - 9
  X�- 99
 X�- 99  X		�6  9  X	�- 99  X	�. X8�- 99/89  X	0�90	 X�- 
 B  X	�. X&�90	 X�
 91B92  X	�93  X�946	5 9	6	9	7		 X
�- 9
 9899+  + B)  =4
 9:'; B)	  	 X	�9	4	 X	��9	0		 X	��9	2 	 X	�� 9	<B		 +	   X
�+	  9
=B
 
 X�X
	�-
 9


 9
>
 +  	 B

 
  X
� 9
? B

 X
�-
  + B

   X
�9
@
 X
 �  X
΀+
  +  9B
  9? B  9B  X�-   BX��+ + 9A	 X
�9@ X�-  9BB  X�+   X�� 9CB
 X� 9DB X��9E)   X��-  9FB  X �4  +  9@	 X%�6#  9G 9B 9HB) B6#  9I- 9J9!9"B  X"�- 9 9K  )  + + B  X�4 > X�-  9FB 6#  9L- 9J9!9"+ )  + B	 
  XM� )   XI�)  	 X�X�-  
  B 8*	  9:'E B
#6#  9M  B- 99N6 9O) B# X� X� X�	 X�- 99N6 9P#B 9& B=0+ =Q= 6#  9$9!9"B 9RB 9S9!9"B+ X �  X� 9T6U 'V B9WBO�~- 9
  X�- 99
 X�- 99  X	�6  9  X�- 99  X�K  - 99/  X+�6X  9Y- 96U '
Z B9[5	\ 6
U 'Z B
9
[
=
]	B1 4  . 0  6^ - 99BH�6	 9	_	-  B	FR�- . 6 9`- - B- BK  � ����������������
��	sortinsert
pairs	type  STATE_ONSECONDapp.event.StateEventsendEventEventManager	IDLEapp.const.Const_ActionrequiredoActionmoveTogetLeaderfinishOneTile	ceil	sqrttileWidthgetDirByTilePosgetAroundsNodegetGroupByTileterrainisWalkablegetDirgetOnePosByDisAndDisgetAllGroupTilesmoveSpdcheckCanNotActioncheckCanNotMovecheckJumaAllBlocksrcParty
npcId"checkThisGroupInMyAttackRangeattackPikeManAndChariotcheckBeSneergetMyTargetGroupatkSpdgetAttribValueuIdgroupUseSkillmountSkillIntervalbattleConfig_GameDatacurAttackIntervalisMastermountObjectuseAwakeSkillpvpMovingCountrandomOrderGroupsdoRandomOrderGroupsmoraleupdateHeadHp
setHphpsetToAlivepccsetTilePositionsetPositiongetPixelPointMapUtilyxAPathNextTilegetTilePositionisAlivegroups,setSeedtonumberrandomSeedBattleRandom#
splitStringUtilremove	maxn
tablesetToDieskipBattlegetGroupBySrcPartyId
floor	mathcurBattleTime	nameBATTLEUIConfig_UIgetUILogicByNameUIManagerstoryModebattlePausebattleStartedsceneContextAPP_ENTER_BACKGROUNDGameGlobal���� �N�N����������������
��̙����                                                                                                   ! ! " " " " $ $ $ & & & & ' ' ' ' & ( + + + + , , , , + / / / / / / / / / / 0 0 0 0 0 0 0 0 0 0 1 3 3 3 3 3 5 5 5 5 5 5 6 6 6 6 6 6 6 8 8 8 8 8 8 8 : : : : : : ; ; ; ; < < < > > > > > > > > > @ @ @ @ @ @ @ @ A A ; D D D E E E E E E F F F F G G G H H H H I I I I J J J J K K K K L L L L L L L M M M M M M M N N N N N P P P P P P R R R R R R S S S S S S S S S T T T T T T T T T T T T T V V V V V V V V V V X X X X X X X Y Y [ [ [ [ [ [ [ ] ] ] ] ] ] ] ] ^ ^ ^ ^ ^ ^ ^ ` ` ` ` ` ` ` F g g g g g g g g g g h h h h h h h h h h j j j j j j j j j j j j j j j j j j j j j j j j k o p p p q q q q q r t u u u u u u u v w w w w w w w w w w w w w w w w w w w w w w w w w x x x x z z z } } } } } } } } ~ ~  � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � u � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � timePassArrIndex self handleGroupTimePass needToLogI i maxI clientIsWin result pvpBattleSync isWin showFloatMessage beginGroupsIndex checkCanUseSkill findTargetForAttacker beginAttack compNodes timePassArr totalTime compUId needSync (�logic 	g1 �g2 	�syncStr �
  sy 	  sy syncArrTmp %�diesArr �  tmpI uId syncArr }z z ztmpI xuId utx qty mhp imorale eoldTilePos ^syncPix attacker t�defender  �index �� � �k �spd L�force �enemyTp '�reachAttackRange �myTp �found �cont �allGroups !�allGroups �nodes �tmpNode idx 3GtarT <moveTickInterval ;r 5tDir /s 'tickCount tarPos 	K  k v   � 3���6   99 ' B6 :B)��+  )��6   96	 9		 	 X
�'	 '
 B3 6	 
 9
B6	 )
  )�) )��3 + 3 3 3 3 3 3 )  3 3 6 9 *  B= 2  �K  scheduleGlobalschedulerpvpTickScheduleId         	seedgetSystemTime
CUtil lastPvpBattleStrGameGlobaltonumber|batStr
splitStringUtil��̙����                      " $ $ $ $ % & ( ) * F G � � � � � � � � ���������self  4arr -isWin *clientIsWin )timePassArr (timePassArrIndex 'pvpBattleSync 
doAttackAction t1 battleStr totalTime maxI i beginGroupsIndex result needToLogI findTargetForAttacker checkCanUseSkill beginAttack compNodes compUId handleGroupTimePass lastShowMessage 
showFloatMessage 	tick  �   �9  
  X�6 99  B9 
  X�6 99 B9   X�6 99 BK  pvpTickScheduleIdstartDelaySchedulerunscheduleGlobalschedulertmpTimeSchedulerself   �   #a �+   6  ' 3 B3 =3 =3 =3
 =	3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =2  �L  dispose pvpStart2 pvpStart checkBattle groupCheckCanUseSkill getNearestEnemyGroup getReady checkJumaAllBlock pvpBattleInit posInit getAllGroupTiles showStory runLogic create ArenaLogic1
class      	   #  & $ < ' y = � z � � � � � � � � �  $%%_runLogic "ArenaLogic1   