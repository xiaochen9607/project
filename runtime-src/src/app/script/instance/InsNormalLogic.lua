LJ[@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\instance\InsNormalLogic.lua¿  #+  =  +  = +  = +  = 4  = ) = +  = 4  = 4  = *  =	 4  =
 4  = 4  = K  diedOrderssummonObjssummonerssummonUIdIndexenemysplayerssetTilesWhenDiedListenerscurTrapIndex
trapsbattleInfocheckScheduleIdsceneContextbattleFieldIdÀåóÿ		

self   b  --   9 B=L  ÀsceneContextnewInsNormalLogic self  scene  logic   
  44  4    X)    9    	 B  9 BK  showStoryinitPosition			





self  batType  posArr ePosArr  Q   &9   9 D checkGroupsAreDeadsceneContextself  tab   ÷  -¼Ñ*t9  99   X
9  9  X9  X9  X9  = = = 6  99  	 )
ÿÿ B=   X9  9B, 9 9	) ) ) Md8
  X`8
  X]9   9
898' 89B8989898989	89
  X
 94 :>:>>BX	 94 :>:>>B
  X=89
  X  9  8989B
  X 9 BX 9) B
	  X
=	6 	 BH9<FRüX5 =5 =6 99	 9	   BO9 9 6 9! B)  ) M¤8
  X 8
  X9   9
89889"89B8989898989	89
  X
 94 :>:>>BX	 94 :>:>>B
  X=9#)  X2  X6$  9%::B4 9&>9'> 89  X84  =89  X84  =6 989) 5( :>:>B6 989) 5) :>:>B89
  X  9  8989B
  X 9 BX 9) B
	  X
=	6 	 BH9<FRüX5* =5+ =9   9,9	 : B X6 99  9    BO\K  checkGroupIsMyFriend             yxgetCellPointMapUtiljobai	maxnenemysinsert
table    srcFriendlyPartys
pairssetPartysetTilesWhenDiedcreateTilesetTilesWhenAlivesetOriTilePositionsetOriPixPositionpriorAttackTargetsfriendlyPartysdir
party	tileposguardingRadiusNORMALuIdaddGroupplayersinitDropgetBattleInfoGameGlobal_insId_batType_sceneContextbattleInfo
insIdsceneContext		



          """""""""$$%''''((((((((**+++++----//0111122113556688888888==>>>>????AAAAAABBBBBBBBBBBCCDDEEFFGGHHIIJJJJJJJJJJLLLLLLLLLNNORRRRSSUUUUUUVVVVVVXXXXXXXYYYYYYYZZZZZZZZZZZ[[[[[[[[[[[]]]]^^^^^^^^``aaaaacccceefgggghhggikkllooooooooopppppppp?tself  ½batType  ½posArr  ½ePosArr  ½insId ºpos !tile  party  dir  friendlyPartys  setTilesWhenAlive  setTilesWhenDied  priorAttackTargets  players e e ei cgroup SA  k v  enemys ­maxN ©¥ ¥ ¥i £group tp 0G  k v        ÀK      Ä-   9   
   X -   9     9  6 ' B9) + + B K   À	IDLEapp.const.Const_ActionrequiredoAction	viewv  ¶ >¢²'4  9  9  = 9  X9 9  X9 
  X9   X6 9 )  B3 3 +  9  X9 9  X X 9	 
  X9	 	 9
6
 ' B
9

) + + +  B9   X9 	  
 B2  L callBackATTACKapp.const.Const_ActionrequiredoAction	view  insert
tabletouchEnabledleaveCallBacktriggerTimescurTriggerTimes
indexþÿÿÿ						





   !!!!!!!!!!!!!###$$$$&&v  ?target  ?needToRemoveTraps =k <playCompleteCallBack_stay %playCompleteCallBack_reset $cb # ì fÚ39 94  6 -  9BHQ9	9
	
  X
M 	 X
K)
 	 ) M
G8	 XC 9B+ + ) 9 ) M998: X	9	98: X=
+ XOð X9
  X9

  X+  =
9  B9  X
99 X6 9 )  B X-    B6  9  BX
O
¹FR­)  ) M-  
 98BOúK   ÀÀremoveTrapcombineTableTableUtilinsert
tablecurTriggerTimestriggerTimesleaveCallBackhitTileyx
tilesgetTilePositionactiveDelaylisteners
traps
pairstargetparamsþÿÿÿ				       !!!!!!&&'''''((((((*	00001111103self trapTriggered target  gparams  gtarget dneedToRemoveTraps cT T Tk Qv  Qlisteners PH H Hi Ftp @hit ?leaveHit >  t newNeedRemove 2  j  ô  I³4   6  -  9BH6) 6 99) M09
	
  X
9


  X
)9


=
9
)  
 X
"6
 9

  )  B
X
9


=
9
)  
 X
)
ÿÿ=
6
  -  9	9
B
H
4  4  =9=- -  9	 BFRôOÐFRÈ)   ) M-   98 BOúK   ÀÀremoveTraptargetparamsgroupssceneContextinsert
tabledurationactiveDelaybattleSpeedoptionProxyGameGlobal
traps
pairsþÿÿÿµæÌ³æý





self tileChanged needToRemoveTraps H9 9 9k 6v  61 1 1i /"  _ 
g  
param 	  j  ¨ b²
   X-  9- 98-  +  B)  ) M-  	 98
BOú9 9*  ) ' BK   ÀÀCUSTOM_OUTLINE
blink	viewremoveTrap
index
traps
beganµæÌ³æý
self trap trapTriggered type  v needToRemoveTraps   j  ú $iÙ­£  X+ 
  X*
  )  
 X)
ÿÿ  X+ 3  3 3 6 9 B+  
  X" X   X	3 9  9  B X9  9 B   X:6  9	::B 9
99B=9 5 ===========	=
==<9 	 X6  9  9 6 '  B9! B6  9  9 6 '  B9" B9 = 6#  2  D tonumberSTATE_ONSECONDSTATE_TILECHANGEDapp.event.StateEventrequireaddEventEventManagertouchEnabledremoveAniWhenTriggedactiveDelayremoveCallBackdurationleaveCallBackcallBacktriggerTimes
aniId
tileslistenerstilePos	view curTriggerTimes 
traps
indexyxsetPositiongetPixelPointMapUtiladdTrapNodesceneContext curTrapIndextostring   ÿþÿÿÿ,`¡¡¡¢¢¢¢self  jlisteners  jtiles  janiId  jtilePos  jtriggerTimes  jcallBack  jleaveCallBack  jduration  jremoveCallBack  jactiveDelay  jremoveAniWhenTrigged  jtouchEnabled  jtrapTriggered [tileChanged ZtimePass Yindex Vtrap UtouchCb pix  à 
  MpÑ6   B9 8  XK  9 89  X9 89
  X9 89 9+ B6 9 89B X6 ' B 9	9 89+ + B 9
+  + B9 9 9 B 99 89	 9B A9 89  X9 89 B9 +  <K  removeCallBackgetPositionsetPositionaddChildspriteLayersceneContext	initcreateapp.sprite.SkillAnirequirenumber	typesetVisible	viewremoveAniWhenTrigged
trapstostring






self  Nindex  Nindex Jeffect22 ( H   æ9  6  B8L tostring
trapsself  index   ¸   ré
  X9    X4  =  9  <)  ) M8:8	:		8
:

6  99 9 	 
 BOðK  terrainsceneContextsetWalkableMapUtilsetTilesWhenDiedListeners				

	self  group  setTilesWhenAlive  setTilesWhenDied    k tx ty val 	 ´  wý?+    X9  98X   XK  9  99	
 99B  X6 	 BH
<
F
R
ý99	9	
9
99
  X
 94 :>:>>
BX	 94 :>:>>
B
	  X 9	 BX 9) B
  X
=6  BH9<FRüX5 =5 =
  X=9
  X  9  99B 9B9  99 : B X6 99 9    B9 9BL 	tickAIPolicyinsert
tableplayerscheckGroupIsMyFriend	initsetTilesWhenDiedcreateTilesetTilesWhenAlive    srcFriendlyPartyssetPartysetOriTilePositionsetOriPixPositionpriorAttackTargetsfriendlyPartysdir
party	tilepos
pairsguardingRadiusaiuIdaddGroupsceneContextenemysbattleInfo								

&&'(((())((*,,--001444555555777999999999::::::::====>self  xindex  xposData  xgroupData  xextData  xenemys vgroup d  k v  pos Ztile Yparty Xdir WfriendlyPartys VpriorAttackTargets U&  k v   2   ¾9  8L summonersself  uId   3   Á9  8L summonObjsself  uId   ?   û9  9  X+ L + L ida  	b  	 ô BÙÊE) 6  '	 B89	6
  ' B

 9

)é+  	 B

 6
  ' B
898

9

=
8
9
	
=
	8
9


=

8
9

=
8
9

=
8
9

=
8
9

=
8
9

=
8
9

=
8
9

=
8
9

=
4
 89>
89>
89>
89>
=
4
 89>
89>
89>
6 >
=
8
9

=
=)
 ) ) M
98	  X99<O
ø6
  ' B
898

9

=
8
9
 
=
 =!*
 =
"
=
#9
% =
$  9
& +    5' B
9% =% 
  X9( 9$8  X9( 9$4  <6) 9*9( 9$8
 B9+ 9$<4    X(6, 9-BH6) 9*  BFRù3. 6) 9/  B+  )  ) M860 91892	 X

 93
94919, 95, BOî
 96
+ B  X67  98996  ': B9;5< 6  ': B9;==5> =!=?=
@=AB2  L
 paramsnpcDatasummoner  	type  STATE_ONBECKONSapp.event.StateEventsceneContextsendEventEventManagerupdateHeadHptotalDuration
adderaddStatecopyStateTosummonedidConfig_HeroSkill	sort 
state
pairssummonObjsinsert
tablesummoners summonObjectcreateSingleGroupsummonUIdIndexuIdnpcStrenthnpcBatType
npcId	nameunitTypesummonFactorcountryskillLv4skillLv3skillLv2skillLv1skillLvssk4sk3sk2sk1skillsaiguardingRadius
partylv	starquality	rank	inte
forcecmdrealJobjobIndexdata.Config_HeroJobjobcreate%app.proxy.vo.BattleUnitGroupDataheroIddata.Config_NpcDatarequireþÿÿÿÀÐ			


  !!!!!!!"""##$$$$$%%%%'''''''(((+,,----.....--67777789999:;;;;;;<<<<<<<<<<9@@@@AABBBBBBBBBBBBBBBBBBBBDDself  Úsummoner  ÚsummonLv  ÚsummonFactor  ÚnpcId  ÚposData  ÚgroupData ØnpcData ÕnpcDataConf ÔheroId ÓR	 	 	skLv group !_allStates F  k v  comp st   i  3     9  BK  startBattleself   	   Ã0+ 9  
  X6 9  BH9	9			 X	)	 
 ) M	8:8:8:6  99 9   BO	ðFRæ6 9 BH)	 
 ) M	999	89	 X+ X	  XX	O	óFRí6 9 BH.9	9		9				 X	))	 
 ) M	%5
 99=8=6  99 6 ' B95 6 ' B9==B89  X
9  X8)  =8 9BO	ÛFRÐ X9  9999	B
  X9 98  X9 94  <6 99 98999	BK  insert
tablesrcPartydiedOrdersgetGroupByUIdsetToDiehp
isDieisAlive	type  STATE_ONBECKONSDIEapp.event.StateEventrequiresendEventEventManagersummonObjectsummoner 
isDieuIdsummonersterrainsceneContextsetWalkableMapUtildefenderparams
pairssetTilesWhenDiedListeners		








                !!!!!!!"""####))*******++,,,,,,,,,---------0self  target  params  dieTargetIsSummonObject   k v    i tx ty val 	  k v    i 1 1 1k .v  .& & &i $tmparams tarGroup *     	ÄK  self    	 #QÉ  X+ )  ) 9   ) M9  89
 X9  89  X X	9  89)  X X Oê9   !L jobmountObjectisAliveenemys						self  $includeBuilding  $died   i  Ë   /Ü) 9   ) M9  89  X9  89 X9  89 X9  8L Oí+  L mountObjectsummonObjectisAliveplayersself    i  ²  2æ	)  ) 9   ) M9  89
 X9  89  X Oô9   !L mountObjectisAliveplayersself  died   i     #ö-   9   
   X -   9   9     X6  9     X
-   9   9     X6  9  9     XK  -     9  B K   ÀcheckBattleguidingnewBieProxystoryModeAPP_ENTER_BACKGROUNDGameGlobalbattlePausesceneContextself    3Dð6   9  9 6 ' B96 	  9
 B A9  9B9  9	B3
 6 
  X
6 9  X6 9 ) B= 9 96 99 X  9 B  9 B2  K  createMountcreateMasterwangzheConfig_GameDatabatTypescheduleGlobalcheckScheduleIdServerFunctionRunningConfig_Sysscheduler startBattlecheckAutodiedCallBackhandlerSTATE_ONDIEDapp.event.StateEventrequiresceneContextaddEventEventManagerself  4checkB   D¤+  6  '
 B
 9)é+  )éB -  9=-  -	  9			 	=	6 9=) =) =	) =
) =) =) ===) =' =4 > =6 9=  X)    X)    X)  5 =4 >>>>=) =- =L  À	namecountryskillLvs  À>Á>Â>Ã>skillsSINGLEConst_Form	formunitTypeMOUNTAIaiguardingRadius
partylv	starquality	rank	inte
forcecmdPIKEMANConst_JobjobsummonUIdIndexuIdcreate%app.proxy.vo.BattleUnitGroupDatarequire		

self mName aniId  Elv  Eparty  Esk1  Esk2  Esk3  Esk4  EgroupData C ä  _ÁÄ6   99 :9 :B5 9 86   9  )	 B+ -  9 9B)  )	 M6   9-  99	8
9
8
9 B  X+ 6   98
9
8
9B4 9
>9>= XOá  X!6  	 9-
  9

9
	
9
9+ )  + B	
  X:  XL  6  
 9:9
:9B4	 9

>
	9
>
	=	 L   ÀgetAroundsNodegetPixelPointyxterrainisWalkablegetAllGroupTilessceneContextgetRow3ColNTilesByDirdir	  posgetCellPointMapUtil														
self posData  `tile 	Warr VoppDir Tnodes Mfound LextBlock G     i pix nodes pix     +ß) 9   ) M9  8 X9 8L Oø)  L skillLvsskillshero  skId  	 	 	i  ¯ 1ü, ) 9   ) M5  X	9	  8	5	 4
  9B ?  =
	9
=
	 9
B
=
	9
=
		 9	  8		9		6
	 9


	
 X	9	  8		9		6
	 9

	
 X	9	  8	5	 4
  9B ?  =
	9
=
	 9
B
=
	9
=
		 OË) 9  ) M5  X	9	 8	5	 4
  9B ?  =
	9
=
	 9
B
=
	9
=
		 9	 8		9		6
	 9


	
 X	9	 8		9		6
	 9

	
 X	9	 8	5	 4
  9B ?  =
	9
=
	 9
B
=
	9
=
		 OË, ' 3 3	 3
 ,   XH6  99B    X>98
  )@B
  )AB
  )BB
  )CB	  B 6 89  9 +     ) 9    B5 =B6 99=9 =!5# ="5% =$5' =&5) =( 9*B 9+B  XH6  99B    X>98
  )@B
  )AB
  )BB
  )CB	  B 6 89  9 +     ) 9    B5, =B6 99=9 =!5- ="5. =$5/ =&50 =( 9*B 9+B2  K    ¿=  ¿=  ¿=  ¿= summonObjectmountObjecthideHeadgetLeader  ¿=bUnrevalled  ¿=canNotBeAttacked  ¿=canNotSkill  ¿=canNotBeSelectedfollowingAIPolicymountSkillIntervalbattlecurAttackIntervalheadId summonObjectmountObjectcreateSingleGroup	nameConfig_ItemskillLvsskillsgetMountAvatarIdConfig_GameData       enemys  COUNSELLORARCHERConst_JobjobfriendlyPartysdirgetDir
partypos  getPositionplayersÀþÿÿÿÈÒ																=X`abbccccccccddeeffffgggghhhhiiiijjjjkkkllllllllllllllllmmmmmnnooppqqrrsssssswwxxxxxxxxyyzz{{{{||||}}}}~~~~self  oneHero oneHero2  posData  posData2  6 6 6i 496 6 6i 4mountId 6lv  mName genGroupData fixPosData findSkillLv index itemId  sk1 8sk2 4sk3 0sk4 ,group sk1 '8sk2 4sk3 0sk4 ,group  « 
7d±+  6  ' B 9)é+  )	éB -  9=-  -  9 =6 9=) =) =	) =
) =) =) ===) =' =4 > =6 9=4  =4  =) =- =L  À	namecountryskillLvsskillsSINGLEConst_Form	formunitTypeMASTERAIaiguardingRadius
partylv	starquality	rank	inte
forcecmdPIKEMANConst_JobjobsummonUIdIndexuIdcreate%app.proxy.vo.BattleUnitGroupDatarequire		

self mName aniId  8lv  8party  8groupData 6 ä  _ÁÉ6   99 :9 :B5 9 86   9  )	 B+ -  9 9B)  )	 M6   9-  99	8
9
8
9 B  X+ 6   98
9
8
9B4 9
>9>= XOá  X!6  	 9-
  9

9
	
9
9+ )  + B	
  X:  XL  6  
 9:9
:9B4	 9

>
	9
>
	=	 L   ÀgetAroundsNodegetPixelPointyxterrainisWalkablegetAllGroupTilessceneContextgetRow3ColNTilesByDirdir	  posgetCellPointMapUtil														
self posData  `tile 	Warr VoppDir Tnodes Mfound LextBlock G     i pix nodes pix     +ä) 9   ) M9  8 X9 8L Oø)  L skillLvsskillshero  skId  	 	 	i  Î 7, ) 9   ) M5  X	9	  8	5	 4
  9B ?  =
	9
=
	 9
B
=
	9
=
		 9	  8		9		6
	 9


	
 X	9	  8		9		6
	 9

	
 X	9	  8	5	 4
  9B ?  =
	9
=
	 9
B
=
	9
=
		 OË) 9  ) M5  X	9	 8	5	 4
  9B ?  =
	9
=
	 9
B
=
	9
=
		 9	 8		9		6
	 9


	
 X	9	 8		9		6
	 9

	
 X	9	 8	5	 4
  9B ?  =
	9
=
	 9
B
=
	9
=
		 OË, ' 3 3	 3
 )  )  ,   XO6  999B  X6 6 9  X6 99  X)  8  X9	  B 9  9 +    9  X)
) 9B5 9 =!B6 9#9$="5& =%5( ='5* =)5, =+=- 9.B  9/6 9  X6 996 90  X6 909B   XG6  999B  X?	  B 9  9 +    9  X)
) 9B51 9 =!B6 9#9$="52 =%53 ='54 =)55 =+=- 9.B  9/B   X X 96B 96BX	 X 96BX 96B2  K  hideMaster  ¿=  ¿=  ¿=  ¿= isMastermasterSidesummonObjectmountObjectlocalPlayeraddMaterHeadgetLeader_groupModel  ¿=bUnrevalled  ¿=canNotBeAttacked  ¿=canNotSkill  ¿=canNotBeSelectedmountSkillIntervalbattlecurAttackIntervalheadIdid summonObjectisMastermountObject
aniIdcreateSingleGroup	namewearedTitleIdtheTitleProxyGameGlobalConfig_SpecialPeeragesskillLvsskillsgetMasterInfoConfig_GameData       enemys  COUNSELLORARCHERConst_JobjobfriendlyPartysdirgetDir
partypos  getPositionplayersÀÈÒ																5PXYYZ[[\\\\\\]]^^^^^^^^^^^^``aaaabccccccccccccccccdddddeeffgghhijjjjkkkkkkkkkkkkkkkkkkooppppppqqrrrrsttttttttttttttttuuuuuvvwwxxyyz{{{{||||}}~~self  oneHero oneHero2  posData  posData2  6 6 6i 496 6 6i 4masterId 6£lv  £mName ¢genGroupData ¡fixPosData  findSkillLv masterValue1 masterValue2  leader1 leader2  masterInfo Igroup %$masterInfo2 ,Agroup * »   ¡6  9 99 99 9B9  9BK  setSideQuestComplet
insIdchapterIdsceneContextsend_triggerInstSpeIteminstanceProxyGameGlobalself   ·  
 6¥
6   9  B9   X6 99 B+  = +  = +  = +  = 6	   BH+  < FRüK  
pairssummonerssetTilesWhenDiedListeners
trapssceneContextunscheduleGlobalschedulercheckScheduleIdremoveEventsEventManager
self    k v   à  2 5| ³6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 3' =& 3) =( 3+ =* 3- =, 3/ =. 31 =0 2  L   dispose getExtraReward createMaster createMount startBattle checkAllPlayersAliveLeft findFirstAlivePlayer checkAllEnemysAliveLeft checkBattle diedCallBack showStory addSummonGroup getSummonerBySummonObjUId !getSummonGroupsBySummonerUId createSingleGroup createTile getTrap removeTrap addTrap initPosition checkGroupsAreDead runLogic create 	ctorInsNormalLogic
class       %  ( &  * P­ eQhfxi¼}À¾ÃÁÊCFD[Id\ofp¤¡¯¥²²InsNormalLogic 2  