LJX@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\scenes\BattleSceneForServer.lua	  4 em5+  =  +  = +  = +  = )d = +  = +  = ' = +  =	 +  =
 +  = +  = +  = +  = )d = )d = +  = +  = +  = +  = + = + = + = + = 4  = 4  = )ÿÿ= + = + = +  = +  = +  =  +  =! +  =" )  =# + =$ +  =% '' =& 4  =( 4  =) +  =* +  =+ 4  =, 4  =- 4  =. + =/ 4  =0 )  =1 +  =2 )x =3 K  battleTimeLimitpvpBattleLogcurPvpTickpartyAvgToughValueneedRreshenGroupgroupUnderAttackinggroupOnMapTilebattleDatarandomOrderGroupsfriendOrEnemyCachestateHitEventstrapNodesbattleStrcurDropItemInfoautoBattleuserClickEnemyOrFriendlastEnvEffectTypeenvEffectcheckEnvEffectTimertouchMoveTimerstartBattleTimeruiLoadedbgLoadeduserLastClickTimeStampstateSortCacheStateEventRegistersbattlePausebattleEndedbattleStartedstoryMode
logicgroupscolrowtileHeighttileWidthterrainbattleFieldIdschedulerIdselectedGroupwholeLayerspriteLayerBattleSceneForServersceneNamebgLayeruiLayerbgSize	hard
insIdchapterIdbatType		

  !!""##$$%%&&''((++,,--..//00112233445self  f 6    (<K  self  id  completeCallBack  loop   µ   nA  9   B9 X  9  B
  X9  9   B9 X  9  B
  X99 98  X9 9)  <9 98  X9 9)  <9 98  X9 9)  <9 98  X9 9)  <9 98  X9 9)  <9 98  X9 9)  <)   X9 99 98 <)   X9 99 98!<9 99 98!<K  	curebeDamageddamagebattleDatauIdgetSummonerBySummonObjUIdsummonObjectgetGroupByUId				

self  ouId1  ouId2  ovalue  otar tar     V`  X+ 4  6  9 BH9		 X	 X	6	 9		  B	X	9	 	 X
6	 9		  B	FRëL isAliveinsert
tablesrcPartygroups
pairs


self  srcParty  includeDead  arr   k v   W    t9  98  X4  L diedOrders
logicself  srcParty  ret  <   y9  98L summoners
logicself  uId   =   |9  98L summonObjs
logicself  uId      ¸9   9        	 
   D addTrap
logicself  listeners  tiles  aniId  tilePos  triggerTimes  callBack  leaveCallBack  duration  removeCallBack  activeDelay  removeAniWhenTrigged  touchEnabled   G   9   9 BK  removeTrap
logicself  id   B   9   9 D getTrap
logicself  index   5   +  =  K  friendOrEnemyCacheself   *    K  self  battleUnitGroup   (    K  self  id  callBack   N   9  88) <K  groupOnMapTileself  x  y  uId   N   9  88+  <K  groupOnMapTileself  x  y  uId    %¢8-  	 9 B6 99=======+    X	 X		 X	6		 '
 B	8		 X	4  6	 9
 8	
	9		=		 X	4  6	 8		9		=		 X	6		 ' B	8		 X	6		 ' B	8		 X	6		 ' B	8	 X	6	 9		9			 X	6		 ' B	8			 X	6		 ' B	8		
 X	4  )	è=		 X	4  )	è=		 X	4  )	è=		 X	6		 '
 B	8	 X		 X	4  =6	 9		9			 X	6		 ' B	8	6	 9		9			 X	6		 ' B	8	  X	5 6	 	 9		B	9	=	6
 
 9

99B
4
  =
)
  =
  4
  =
!9
!4  ="
9
!4  =#
9
!4  =$
L  À	curebeDamageddamagebattleDatabattleTimePassgroupstileHeighttileWidthsetTileSizeMapUtil resetBattleTimePassCallBack battleFieldIdèdata.Config_Rotla
rotlasanjundata.Config_Citydata.Config_ArenaInstpalaceBatRobPositionConfig_GameData!data.Config_FourSidesWarInstdata.Config_HeroTrialsInstdata.Config_ClassicPointConfig_QijinInstbattleIdConfig_DuelInstbattleFieldIddata.Config_InstanceDatarequire	hardchapterIdbatType
insIdcurDropItemInfooptionProxyGameGlobalautoBattlenew 
"$(	!!!!!!!!!'''((((*.//////0011224445556667BattleSceneForServer self  batType  chapterId  insId  hard  editState  curDropItemInfo  scene insInfo battleFieldId q =   Ô9  98L summoners
logicself  uId   F   ×9   9D checkAllPlayersAliveLeft
logicself     $Ü-  = -  =-   96  9	 
 B AK  ÀgetCellPointMapUtilsetTilePositionyxtrap self  x  y   Á  /á-  9   X-  4  = -  9 99 X-  9 99 XK  -  9 9=-  9 9=K  ÀyxtilePositiontrap self  tp        é K         ê K    0   ë -   9   -  9J  Àyx     trap  Ô  )Ú4  3 = 3 =3 =3 =3	 =6
 99  B2  L trapNodesinsert
table getPosition setVisible doAction setTilePosition setPositionself  aniId  trap   	  
%ð=   X  9 ) ' + BK  isAlivemodifyGroupByPartyAttribbattleTimePassself  timeLimit  pass   ,   
÷9  L battleTimePassself      $Hú=  6 9=   9 B  9 ) B6  BH+  =+  =)  =
 9	+  B
 9
BFRñ  X  9 BK  hideRestrictionIconstopMovingsetMyTargetGroupuserCommandFaileduserLastClickPosuserSelectedTargetGroup
pairsgetGroupByPartyIdcheckAutooptionProxyGameGlobalautoBattle				


self  %sw  %arr   k v   >   =  9 K  groupsstoryModeself  sw  arr     2=  9  X	6  BH
 9BFRûK  stopMoving
pairsgroupsbattlePauseself  sw  arr   k v      9   X  9 ) ' )
 BX  9 ) ' ) BK  guardingRadiusmodifyGroupByPartyAttribautoBattleself   2    Â   X+ X+ L a  b   Ã  'Y»9    X2 "+ =  4  6 9 BH6 9	 
 BFRù6 9 3 B4  )  ) M6 9	 9
 88

BOø= K  K  randomOrderGroups 	sortinsert
tablegroups
pairsneedRreshenGroup	
self  'arr   k v  tar 	 	 	i  â  ;Ì9   	  X+ L )  ) 9   ) M6  99	 9
  8

:

9  8:B X+ L Oð+ L terrainisWalkableMapUtiljumaPos self  count   i  ^ 	  #)ðØ 9  +   BK  countPureDamagetarget  	group  	damage     
#¦  9    9B  9 B=K  dirgetLeaderattachGroupgetAttackerDirattacker  unit  dir  @   Ü9  9  X+ L + L disa  	b  	 Ð°ÏF  9  B
  X9 X®9 	  XC-  9 )   X=4  ) -  9 ) M#-  989 X6 9
 5 -  98=6 9	6 9
  9 B A 6 9
-  98 9B A  A=BOÝ3  )   X6 9  B:9X 	 X-  4  =9 	 X6  9  9 B	  9 B) B-   9   )	 +
 + B   9  B2  K  
  X9 X@6  9  9 B	  9 B) B)  ) M'-  
 98  ) + + B   X9  X	9  X	
 9B  XX  X9  X	+    X
 9B  X	+  OÙ  X-   9  +  	 B   9  BX  X  X-   9  +   B   9  BX   XX   9  B2  L  ÀgetNearestEnemyGroupcheckCanNotBeSelectedmountObjectgetPosByDirAndDissetMyTargetGroupgetGroupByTilegetDirgetTilePositiongetOnePosByDisAndDisMapUtil	sort disgetPositionppGetDistancecctarget  insert
tableguardTowers
npcIdisAlivegetMyTargetGroupN N																												  """""%%%%%%%%%%%&&&&''''''''''(((((((((((((()))))*,,,,,,,-&0011111111444446677888888889999:???DDDDEEself attacker  ÑcheckReach  Ñdefender Ígts <$ $ $o "comp $tp  tiles  5( ( (i & Ô #T9    X9   9 B X-    + B-  99 B  X-  99 B9 	 X- . + L + L À À
partygroupUseSkilluIdgroupCheckCanUseSkillgetMaxMoralemoralehasInitiativeSkillIdþÿÿÿàÿ




findTargetForAttacker self totalTime attacker  $ è  I©  XK  9  XK   9B 9 9 B  X-     BK  ÀuIdunitBeAttackHandle_forcegetRandomMemberAliveisAlivedoAction attacker  defender  unit canAttack     Wº6   9  B6   999B6   999	B6   9	 
  BL getMinDistancePointyxgetPixelPointgetPixelPointsMapUtilnodes  enemyTp  myTp  pixNodes ePix pix v index   @   Í9  9  X+ L + L uIda  	b  	 ¶u> ì¢'Ö6 ' B 9  B=  9   99 + B+  9   X9  X9 	 X6 ' B9 89 	 X4  6	 9 89
=9 	 X4  6 9 89
=9 	 X6 ' B9 89 	 X6 ' B9 89 	 X6 ' B9 89  X9 6 99 X6 ' B9 89 		 X6 ' B9 89 	
 X4  )è=9 	 X4  )è=9 	 X6 ' B9 89 6 99 X6 ' B9 89  X9 	 X4  9 =9 	 X4  )è=9 	 X4  )è=9 6 99 X6 ' B9 86 ' 9 &B 9  6 B=  9 6 99 X6 ' 9 &B 9  6 B=    X5 99 	 X9 6 99 X	9 
 X9  X9 	 X)è= 6 ' B85 9:=9:== 9 =  9!=! 6#  9$9	"9
 9!B=" ) 9  ) M9
% 4  <	
)
 9! ) M
9% 8	4  <O
ûOó6 '& B)  ='9  9(  X6)  9*	  9
 )ÿÿ9 B	 9+B9,9-4	  4
  9  X9 	 X6 '.  &B 9/B
 	 X9 6 99 X6 ' 9 &B 9/B
 	 X6 '0 B 9/B
 	 9   919 	 
 B9 6 99 X62 93 BH94	 X95) =6FRø9   97B9   98B  99 )ÿÿ': 5; B  9< ) B  9< ) B)  ) M89=	  X 9>BOø)  ) M89=	  X 9>BOø4  =? 9@9A
  X4 5B >5C >5D >) 9@9A) M9   9E+  ) ) )5F 8=G5H =IB6J 9K9?  BOí9L9M
  X4 5N >5O >5P >) 9L9M) M9   9E+  ) ) )5Q 8=G5R =IB 9S+  5T BOí4  =U 9@9V
  X34 5W >5X >5Y >5Z >5[ >=U ) 9@9V) M"9   9E+  ) ) )5] 4 5\ 8:>8:>>=^4 5_ 8:>8:>>=`8=G5a =IBOÞ9L9b
  X24 5c >5d >5e >5f >5g >) 9L9b) M"9   9E+  ) ) )5i 4 5h 8:>8:>>=^4 5j 8:>8:>>=`8=G5k =IBOÞ9@9l
  X-3m 4 5n >5o >5p >5q >5r >  9s ) + + + B) 9@9l) M  9t  4 4 8:>8:>>)
 +  )  , ) ÿÿ+! BOë3u 6v  9wB  X6x 9yB 6z 9{ B6z 9|6z 9}BB 6~  9 B  9 B4  = 9 )  >9 )  >  9< ) + + + B)  ) M9 9 :8 9' B >Oõ9 6z 99 : #B>  9< ) + + + B)  ) M9 9 :8 9' B >Oõ9 6z 99 : #B>)ÿÿ )  )ÿÿ+  = + +  )  3 3 3 3 3 9 6 99 X) = ) 9 ) MÀ=    X!   ! 	!  X!$#  9!s )$ +% +& +' B!%  9#s )& +' +( +) B#9% %  X%6% '% 9%%B%=% 9% '% 9%%6(~ 9((B%9% '% 9%%'( B%+%  )& '$ )( M&9* ,* 9**8-)$9--B**$ )* X*9* ,* 9**'- B*X**$ )* X*	*" )+  +* X*9* ,* 9**'- B*O&ä)& '" )( M&9* ,* 9**8-)"9--B**" )* X*9* ,* 9**'- B*O&ñ9& (& 9&&') B&)& '# )( M&]9* ,* 9**8-)#9--B*9* ,* 9**'- B*8*)#,* 9**B*8+)#9++
+  X+8+)#9*+9+ -+ 9++9.*B+9+ -+ 9++'. B+9+ -+ 9++9.*B+9+ -+ 9++'. B+9+ -+ 9++6.z 9..80)#900B. A+9+ -+ 9++'. B+)+  8,)#9,,
,  X,6,z 9,,8.)#9..B,+, 9, ., 9,,/+ B,,# ), X,9, ., 9,,'/ B,X,,# ), X,	,! )-  -, X,9, ., 9,,'/ B,O&£)& '! )( M&P9* ,* 9**8-)!9--B*9* ,* 9**'- B*8*)!,* 9**B*8+)!9++
+  X+8+)!9*+9+ -+ 9++9.*B+9+ -+ 9++'. B+9+ -+ 9++9.*B+9+ -+ 9++'. B+9+ -+ 9++6.z 9..80)!900B. A+9+ -+ 9++'. B+)+  8,)!9,,
,  X,6,z 9,,8.)!9..B,+, 9, ., 9,,/+ B,,! ), X,9, ., 9,,'/ B,O&°6&J 9&&(# B&	&  X&)  X¢6&J 9&&(! B&	&  X&) X9& (& 9&&') B&,!" )#ÿÿ	 X$&  9$ B$) # $ 9% %% )& M$*#' 9( 
( X(
9(  ( X)6() 9( ( ( X)9(¡  ( X)' X$9( 8!'(9(¢! ( X)9(£!	(  X(( *! B( ( X) 9(£!	(  X(*! 9(¤!B(*! 9(!'+¥ B(9)¦! ) X*9)§! ) X)9)¨!6* 9*©*9*ª**) X)+  9)« 9,!+- B)))  =)¨!))  )( X)ì9)¨!() X)é9)£!	)  X)æ9)¦! ) X)ã+! 9)¬!B)") +) "  X*+) ,! 9*­!B* * X+X*,  9*® -! +.  /) B*"* 
"  X*,! 9*¯!-" B** X** ,! +- B*"* "  X*9*°!* X*  " X*º+*  ++ ." 9,"B,*, .! 9,¯!/" B,+, .! 9,!B, + X-- /! 0" B-X-¥+- 9.±!	. X.	9.°!. X.0  9.² B. . X/+-  - X.0! 9.³!B.
. X.0! 9.´!B.. X.9.µ!)/  /. X. " X. 4.  +/  90°!	0 X0"60# 20 90¶05! 93!B36! 94·!B4)5 B061# 31 91¸194" 950960B1 1 X23  91¹ 40 5! )6  +7 +8 B11  X141 >01/1 X02  90º B0.0 60# 20 90»093" 94,95,+6 )7 8. +9 B0	/0 +0  
/  X1L1/ )2  21 X1H)1 2/ 	2 X2X22 4/ 5* 6, B212 821/*3 6! 94!'7µ B444#43465# 75 95¼58, 92 B596½ 67z 97¾7)9 B7#6765 X75 X75	 X7	5 X796½ 67z 97|7#94699B7:! 98¿!;2 B8=7£!+8 =8À!=2!68# :8 98Á89;29<2B8;! 99Â!B9=5Ã9;! 99Â!B9;9 99Ä99<89=8B9X1 O$Ö~9$ 
$ X$	9$  $ X%9$   $ X%9$¡  $ X%2  K  9$ $$ $# X$J6$Å &$ 9$Æ$'  6( '*Ç B(9(È(5)É 6* ',Ç B*9*È*=*Ê)B$4$  6%2 9'3 B%H(6*J 9*K*,$ -) B*F(R(ù6%J 9%Ë%'$ ( B%)% &$ )' M%$8)($
)  X* 9*¢) * X+,) 9*¬)B*
*  X*,) 9*¬)B*9*¢** X** ,) +- B**  X+X+ -) 9+Ì).* B+,) 9*Í)B* * X+X+ O%Ü)ÿÿO@}	 X  9s )  +! +" +# B!  9s )" +# +$ +% B)  6!J 9!!# B!	!  X!)  X!6!J 9!!# B!	!  X!) 	  X 	 X  '  '  ! '" # '$ &$	 X?  9Î )  B)  ) )  )! M8#"
#  X#8#"# X#Oø )     X  X
 8"  9 Ï # B +! =!¢ )! =! ) )  )! M8#"
#  X#%  9#Ï 8&"9&&B#9$#% &$ '' 6(z 9(|(9*#B(') )*  '+Ð &+%X## '$Ñ &$#Oç	  Xl  9Î )  B)  ) )  )! M8#"
#  X#8#"# X#Oø )     X  X
 8"  9 Ï # B +! =!¢ )! =! ) )  )! MF8#"
#  X#4%  9#Ï 8&"9&&B#9$#9% %
 X%9% 6& 9&&9&Ò&%& X%9% 6& 9&&9&Ó&%& X%9%Ô#	% X%$$% &$ '' 6(z 9(|(9*#B(') )*  '+Ð &+%9% 6& 9&&9&Õ&%& X%6%) 9%Ö%9%×%4& 9'#>'&9'#>'&<&"%X## '$Ñ &$#9# 6$ 9$$9$Õ$#$ X#6#) 9#Ö#9#×#5$Ø <$"#Oº6Ù 9Ú )  ! !!B  ' &62 9Û 9ÜBH 	" #  '$ 6%z 9%%'! B%'& &&"F R õ ' &62 9Û 9ÝBH 	" #  '$ 6%z 9%%'! B%'& &&"F R õ ' &62 9Û 9ÞBH 	" #  '$ 6%z 9%%'! B%'& &&"F R õ9  9ßB6à   XXH   9á B  XC6Å   9âB62 6 ) BH!6#Ê %" B##J X#9#ã"
#  X#%" 9#ã"B#F!R!ó62 6 ) BH!6#) +$  <$!#F!R!û62 6 ~ BH!6#~ +$  <$!#F!R!û+  7) +  7~ 6ä 9å+  =æ6ä 9å+  =ç6ä 9å+  =è6 ' æ B6 ' ç B6 ' è B6é ' ê B 'ë   &  2  J @collectcollectgarbageapp.control.EventManagerapp.control.BattleRandomapp.control.GameGloballoadedpackagedisposeremoveAllEventonExitFROM_TEST_CASE
toStr	curebeDamageddamagebattleDatasubstring  ÿÿÿÿ arenaEnemyHeroStatenormalProxyhuangjinheroTypezhanshan	sgdl-1;;getGroupByUIdgetDieOrderstimePassScheduleTicksetMyTargetGroup	sort	type  STATE_ONSECONDapp.event.StateEventsendEventEventManagersetPositiondirgetLeadergetPixelPointfinishOneTilesetTilePosition	sqrttileWidthgetDirByTilePosgetAroundsNodegetAllGroupTilesgetGroupByTileisWalkablegetDirgetOnePosByDisAndDismoveSpdcheckCanNotActioncheckCanNotMovecheckJumaAllBlocksrcParty
npcId"checkThisGroupInMyAttackRangeattackPikeManAndChariotcheckBeSneergetMyTargetGroupgroupUseSkillmountSkillIntervalbattlecurAttackIntervalisMastermountObjectatkSpduseAwakeSkillpvpMovingCountisAlivestoryModeeditStatebattlePausebattleStarteddoRandomOrderGroups|	maxnmoralehpyxAPathNextTilegetTilePosition,uId#randomSeedappendgetStringBufferStringUtilpvpBattleLogcurPvpTickbattleTimeLimit     randomOrderGroups
floortoughValuegetAttribValuepartyAvgToughValuestartBattlesetSeedBattleRandomrandom	ceilrandomseed	math	timeosgetSystemTime
CUtil addTrapgetGroupBySrcPartyId    	       	trap       
partydir               rushCar  setTilesWhenDied    setTilesWhenAlive 
partydir         
    	  	jumajumaPos  setDirLimit   dir
party      stoneCarplayerFactionTechinsert
tablefriendlyPartys  	tile dir
partyaddSummonGroup  	    guardTowerenemyFactionTechguardTowerssetToDieinitHpgetGroupByPartyId  NORMAL_ForServerchangeAIPolicycallGroupByPartyFunctioncreateMountcreateMasteratkDisdirectAddAttr
partygroups
pairsinitPosition$app.script.arenaIns.ArenaLogic1posInit&app.script.arenaIns.WushuangLogicenemysplayersinitDropgetBattleInfoGameGlobalbattleInfoaStarForCdata.Config_SysgroupOnMapTilegetArrByStrMapUtilterrainrowcolheight
width  	sizebgSizedata.Config_MapTerrain battleFieldIdèapp.script.rotla/batStrapp.script.arenaIns/sanjundata.Config_Rotla
rotladata.Config_Citydata.Config_ArenaInstpalaceBatRobPositionConfig_GameData!data.Config_FourSidesWarInstdata.Config_HeroTrialsInstdata.Config_ClassicPointConfig_QijinInstbattleIdConfig_DuelInstbattleFieldId
insIddata.Config_InstanceDatabatTyperunLogiccreate'app.script.instance.InsNormalLogicrequire
logic 
",$(¯_þÿÿÿNN÷Ñðúáõý÷ÑðúáõüµæÌ³æýàÿ                                               ! ! ! ! ! ! ! ! ! " " " " " " " " # # # # # # # # $ $ $ $ $ $ $ $ % % % % % % % % % % % % % % & & & & & & & & ' ' ' ' ' ' ( ( ( ( ( ( * * * * * * * * + + + + + + + + + + + , , , , , , - . . 0 0 0 1 2 2 4 4 4 5 6 6 8 8 8 8 8 8 9 9 9 9 9 : : : : : : : : : : : < < < < < < = = = = = = = = = = = ? ? ? @ A A A A A A A A A A A A A A A A A A A E G G G G H H H H H H H H I I J J K K K K K K K K L L L L M M M N N N N O O O O N L T T T T T U U U U U U U U U U U U W W W Y Z \ \ ] ] ] ] ] ] ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ _ _ _ _ _ _ ` ` ` ` ` ` ` ` ` ` ` b b b b b b b b w w w w w w w x x x x x x y y y y z z z { { { y y                                                                                         ¤ ¤ ¤ ¤ ¦ ¦ ¦ ¦ ¦ ¦ ¦ § § § § § ¨ ¨ ¨ ¨ ¨ ¨ ¨ ¨ ¨ ¨ ¨ ¨ ¨ © © © © © § ® ® ¯ ¯ ¯ ¯ ° ° ° ° ° ° ° ° ° ° ° ± ² ² ² ² ² ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ´ ² ¹ ¹ ¹ ¹ º º º º º º º º º º º » » » » » ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ ½ » Â Â Â Â Ç È È È È È È È È È È È É É É É É É É Ê Ê Ê Ê Ê Ë Ë Ë Ë Ë Ë Ë Ë Ë Ë Ë Ë Ë Ë Ë Ë Ë Ë Ë Ë Ê Ó Õ Õ Õ Õ Ø Ø Ù Ù Ù Ù Ú Ú Ú Ú Û Û Û Û Û Û Û Û Ý Ý Ý Ý Ý Þ Þ Þ á á â â â ã ã ã ä ä ä ä ä ä ä å å å å æ æ æ æ æ æ æ æ æ æ å è è è è è è è è è é é é é é é é ê ê ê ê ë ë ë ë ë ë ë ë ë ë ê í í í í í í í í í ð ñ ò ó ô ô õ ÷ ø ?Rcuz   ¡¡¡¡¡¤¤¤¤¤¥¥¥¥¦¦¦¦¦¦§§§§§¨¨¨¨©©©©ªª¬¬¬¬¬­­­­­®®®®®¯¯¯¯¯°°°°°°°°°±±±±±²³³³³´´´´´´¶¶¶¶¶···¸¸¸¸¸¸¹¹¹ºººº»»»»»¥¿¿¿¿ÀÀÀÀÀÀÁÁÁÁÁÂÂÂÂÃÃÃÃÄÄÆÆÆÆÆÇÇÇÇÇÈÈÈÈÈÉÉÉÉÉÊÊÊÊÊÊÊÊÊËËËËËÌÍÍÍÍÎÎÎÎÎÎÐÐÐÐÐÑÑÑÒÒÒÒÒ¿ÖÖÖÖÖÖÖÖ××××××××ØØØØØÛÞßßàààáãäääääåæææææææææææææææççéééììììììììïïïðððóóóóõõõõõõõõõõõõööööö÷÷úúúúúúúúúúúúüüüüýþþþÿÿÿÿÿÿ                ""&'((()))))))))))+++++++++++++++++++,,,-////111111111111344444456666888888:>??????@@@@@@BBBBBBCCCCCCCCDFFFFFHHHHIJJKLLLLLLMMMMNNNNNNNNNä[[[[[[[[[[[[[[\\\\_______________abbbbcccccbbfffffgggghiiiiilllllllllllmmmmnnnssssuuuwwxxg    ¡¡¡¡¡¡¢ ¦¦¦¦¦¦¦§§¨¨¨¨©©ªª¬¬¬¬­­­®®®®®¯°°°°°°°°°°°°²²²¬··¹¹¹¹º¼¼¼¼½½½½½½¾¼ÁÁÁÁÁÁÁÂÂÃÃÃÃÄÄÅÅÇÇÇÇÈÈÈÉÉÉÉÉÊËËËËËËËËËËËËËËËËËËÌÎÎÎÎÎÎÎÎÎÎÎÏÏÏÏÏÏÐÐÐÐÐÐÐÐÐÑÓÓÓÔÔÔÔÔÔÕÕÕÕÕÇÛÛÛÛÛÛÛÛáááâââââãããããããããââåååæææææçççççççççææéééêêêêêëëëëëëëëëêêòòòòøøøøûûûüüýýýýþþþþÿÿÿÿÿ   þþ			self  seed  notClearAll  insInfo battleFieldId ­âmapData Ê  i   j battleInfo players enemys posArr ePosArr  :	 	 	k v  side1 ¸side2 ´	 	 	k v 
	 	 	k v posArr   i tar posArr   i tar posArr (# # #i !tar ! posArr '# # #i !tar ! triggered ,posArr !groups   i trapId  doAction ³	t1 ¯	tmpArr )	  i 
tmpArr ç  i 
isWin ÎbattleStr ÍtotalTime ÌbeginGroupsIndex ËneedToLogI ÈtotalRound ÇtotalTimeTemp ÆfindTargetForAttacker ÅcheckCanUseSkill ÄbeginAttack ÃcompNodes ÂcompUId ÁÁ Á Ái ¿g2 dies2  g1 dies1  tp   gx   gx ^ ^ ^gx \tp Mmorale )$(Q Q Qgx Otp @morale )attacker .defender  index « « «k ©spd 'force $ÞenemyTp %¹reachAttackRange ¸myTp ¬cont ¤allGroups nodes tmpNode tarT (Nidx FtarT ;moveTickInterval :r 4tDir .s (tickCount tarPos arr 0:  k v  % % %u #v "tmp castRestrainSkill 
g2 dies2  g1 dies1  orders #;totalPlayers :	 	 	i lastOneUId target   i target uId orders htotalEnemys g	 	 	i lastOneUId target G G Gi Etarget .uId -L  k 	v  	  k 	v  	  k 	v  	totalPvpBattleLogStr S  k v    k v    k v   û  ]£	.  9   B 9B X+ L  9B X+ L 9 X+ L 9 9B X+ L  9B:  X+ L 6  9'	 9	
'
 &
B X+ L 99
8
  X99
8)   X+ L 6 ' 9
&B 9 +	  9

9+ B+ 9  X+ X		 9B  X X+ X L checkCanUselvcreateapp.script.skill.SkillrequireskillCD	.luaidapp/script/skill/SkillcheckFileExistGameGlobalfindInitiativeSkillgetMaxMoralemoraleisAlivecheckCanNotActioncheckCanNotSkillgetGroupByUId 


 !!!""$$$%%%%&&-self  ^heroUId  ^group Yskills ;skill :script *canUse reason    
+MÍ	
-   9   
   X -   9      X -  9  - 9-  9 < 5  - = - 9= 6  9- 6 ' B9	5
 6 '	 B9	== B-  9+ BK   À    setStoryModeparams	type  STATE_ONUSESKILLapp.event.StateEventrequiresendEventEventManagertarget  idskillCDcdþÿÿÿ					
script group skill self params  ß   #Ú	-   9     X 6    9  -  -  6 ' B9B -  B K    À%BATTLECONTROL_STORY_MODE_CHANGED!app.event.BattleControlEventrequireremoveEventEventManagerstoryModeself skScriptCom    8lÅ	 -   9      X 2 2-     9  B 6  ' - 9&B   9  - - - 9- 9+ B -  9)  B  9 B3	 -  9
  X3 6  9-  -  6 '
 B9	 BX B2  K  K   ÀÀÀ%BATTLECONTROL_STORY_MODE_CHANGED!app.event.BattleControlEventaddEventEventManager storyMode useSkillsetMoralelvcreateidapp.script.skill.SkillrequireclearStateHitbattleEnded  self skill group script skScriptCom 	backFunc  ³ 	 +¼	4  X  9   B X2    9  B 9B:  X2 3 )  =	 9B
  X	
 9  B 9	B	=	 B2  K  K  K  dirgetLeadergetAttackerDirgetMyTargetGroupcurAttackInterval findInitiativeSkillgetGroupByUIdgroupCheckCanUseSkill)**,,,--.....////3344self  *heroUId  *force  *group skills skill comCallBack myTargetGroup dir  |   (õ	  X+  X9  +  <K  9 8=  K  groupsselectedGroupself  uId  selOrUnSel   1   ý	9  8L groupsself  index   @    1
K  self  myGroup  addDis  priorAttackTargets   õ  Ä
8+  *    9  	 B)  )	 MB8

  X>9  X; 9B  X6 9B  X1+ 
  X
)  ) M8 X+ XOú  X" 9B6 96  999	B A  9B 6 96  999	B A 6 9
  B X  O¾
  X> X<	 9B
 9 B X36 
 99 99	+  9' B  9 B+ B	6	 9		 B			 X	  X	4  6	 9		 )  B	6	 9		 B	  9
   B


 	
 X	+	  L	 X	  9	    B	L getNearestEnemyGroupinsert	maxn
tablegetAllGroupTilesatkDisgetAttribValueterraingetAroundsNode"checkThisGroupInMyAttackRangepGetDistanceyxgetPixelPointMapUtilpccgetTilePositioncheckCanNotBeAttackedisAlivefindEnemyGroupÀ 		




  !!"""&&&&&&''''''''''''''''((((((***++++++-----------...1111117self  myGroup  ignoreGroup  checkReach  choose dis myEnemys C C Ci Av @needToCheck 0  ig tmp ep 	myp 	curDis myTargetTilePoint 9aroundNodes # .    À
K  self  group  me  ignore   ¤ 
  1Ã
6  99 B6 9 BH
  X	 9BFRù+  = K  dispose
pairsgroups	maxn
tableself  len   k v      	HÑ
9   9	 
    D addSummonGroup
logicself  
summoner  
summonLv  
summonFactor  
npcId  
posData  
    VºÔ
6  ' B 9  	 
   B6 99B+  ) 	 )
 M98  X9:4  + = 9 BOò
 9+ B
 9	B
 9
B9 <+ = 9   X
  9  B
  9 B9 98  X9 9)	  <	9 98  X9 9)	  <	9 98  X9 9)	  <	L 	curebeDamageddamagebattleDataclearFriendOrEnemyCachesetSelectedGroupselectedGroupneedRreshenGroupgroupsupdateStateIconupdateHeadHptogetheraddisAliveunitType	maxn
tablecreate(app.sprite.BattleUnitGroupForServerrequire	

self  WgroupUId  WgroupData  Wai  WguardingRadius  Wgroup Klen Gsprite F  i unitData      	ï
K  self   /   õ
9  8L groupsself  uId   ´ 
  8bø
  9  B6 9 BH9  X 9BFRø+ = 6 9 BH	 9B 9B 9BFRõ4  =	 9	 )  >9	 )  >6
  9  6 ' B95 6 '	 B9=BK  	type  STATE_BATTLECONTROL_STARTapp.event.StateEventrequiresendEventEventManagerpartyAvgToughValue checkBufferOrDebufferEffectrefreshBufferValueupdateStateIconbattleStarted	initinitedgroups
pairsinitStateEventRegisters				


		self  9	 	 	k v    k 	v  	 O   4  =  4  = K  stateSortCacheStateEventRegistersself   1   4  =  K  stateHitEventsself   Ñ   "+ 9  9  X9 9 X
9 999  X+ X+ L 9 9  X+ X+ L 9  9   X+ X+ L uIdmeidprioritya  #b  #  \4  6  -  9BH 6  
 BH9  X6 9  BFRöFRï6 9 3 B2  L  À 	sortinsert
table	typeStateEventRegisters
pairsself obj  arr   k v  state   k2 v2   ñ  ]«¬+4  -  9 98  X-  9 989  X"-  9 98-  B=-  9 98+ =X-  9 94  <-  9 98-  B=-  9 98+ =-  9 989  X4  6 9 B+  )  ) M+ -
  9

8	8


  X
-
  9

8	4  <
8
	 
 X8
	98

 
 X8
	98

8	9B
OåK   ÀÀparamsstateHitEvents	maxn
tablearrneedSort	typestateSortCache					







%%%%%%%%''''''+self stateSortFunc target  ^obj  ^arr \arr 7%len !needToHit    i  ñ  WJ3  3 6 ' B6  BH6	 	 9		      B	FRö2  K  addEventEventManager
pairsapp.event.StateEventrequire  DFFFGGGGHHHHHHHHGGJJself  stateSortFunc handleStateEvent all   k v   Ò   ?Þ9  8  X9  4  <9 8  X9 4  <9 8+ =9  8) <K  needSortstateSortCacheStateEventRegisters				



self  register  evtType  priority   ã 	  >ê
9  8  X6 9  8BH9 8  X9 4  <9 8+ =FRó9  +  <K  needSortstateSortCache
pairsStateEventRegisters			
self  register  	  k v   @   û9  9  X+ L + L uIda  	b  	 ² ÌöX  X+   X+   X+ 4  3  9 
  Xo9 9	8	
  Xj9 9	8	9
  Xd) 9	 9
8	
	9				 )
 MI9 9898
  X( 9B 9B9  X86  9  B X0  X	9  X6	 9
  BX%9  X"9  X6	 9
  BX9  X  X	9  X6	 9
  BX9  X9  X6	 9
  BO· X
6	 9

 6	 9 B  B6	 9
  B2  L 9   X4  = 9 9	8	  X9 9	4
  <
	9 9	8	4	  =	  X9  X	96		 9		 B	)
 	 ) M
Y  9 8+ B6  BHM XK6	 9
9 989 B
  X( 9B 9B9  X86  9  B X0  X	9  X6	 9
  BX%9  X"9  X6	 9
  BX9  X  X	9  X6	 9
  BX9  X9  X6	 9
  BFR±O
§ X

6
	 9


 6	 9 B  B
6
	 9

  B
2  L 
pairsgetGroupByPartyIdfriendlyPartyssrcFriendlyPartys	sort	maxnsummonObjectinsert
tableisMasterdisForTileMapUtilisAlivegetTilePositionfrienduIdfriendOrEnemyCache 														








%%&&&&&&&&&&((((())-----........./////00000011112222333334444557777777799:::;;;<<<<<<<<<<<=====>>>>>>@@@@@@AAAAADFFFGGGGGHHHHHHJJJJJJKKKKK442SSTTTTTTTTTTVVVVVWWself  group  range  includeMyself  includeSummonObj  isSrcParty  groups comp ÿJ J Ji Hv CmyTp $hisTp !array htlen2 pZ Z Zi Xarr SP P Pi Mv  MmyTp $hisTp ! @   Ô9  9  X+ L + L uIda  	b  	 À  ÓüÐ4  3    XQ9 
  X9 98
  X9 989
  X) 9 989 ) M39
 98

9

8
	

  X 9B
 9
B9
  X"6  9  B X9
  X9	
  X6
 9 
 BX9
  X9
  X9	
  X6
 9 
 BOÍ6
 9 	 B2  L XP9 
  XM9 98
  XH9 989
  XB) 9 989 ) M39
 98

9

8
	

  X 9B
 9
B9
  X"6  9  B X9
  X9	
  X6
 9 
 BX9
  X9
  X9	
  X6
 9 
 BOÍ6
 9 	 B2  L 4  4  4    X	96	
 9		 B	)
 	 ) M
  9 8+ B6  9  BO
ôX	96	
 9		 B	)
 	 ) M
  9 8+ B6  9  BO
ô9	 	  X	4	  =	 9	 9
8	
		  X	9	 9
4  <
	4	  +
  6 9 BH +
 )  ) M8 X+
 XOú 
 X9  X9  X9	  X
6
 9  B6
 9	  BFRÞ  X9 98=	X9 98=	  X6
 9  B2  L 6  BH'
  X 9B 9B6  9  B X9  X9	  X6
 9  BX9  X9	  X6
 9  BFR×6
 9  B2  L groups
pairsgetGroupByPartyIdfriendlyPartyscombineTableTableUtilgetGroupBySrcPartyId	maxnsrcFriendlyPartys
enemy	sortinsert
tableisMastermountObjectdisForTileMapUtilisAlivegetTilePositionsrcEnemyuIdfriendOrEnemyCache !!!!!""#%%%%%%%%%%%%%%&&&&&&&&'''''))***+++,,,,,,,,,,,------.....022233333344444&99999::>?@AABCCCCDDDDEEEEEFFFFFFDGIJJJJKKKKLLLLLMMMMMMKPPPPPQQQQQQQQQSTVVVVWXXXXYYYZ[X^^^^^______`````bbbbbVVffgggggiiiikklllllmmpppprrssstttuuuuuuuuvvvvvvwwwwwy{{{{{{|||||ppself  Ôgroup  Ôrange  ÔisSrcParty  Ôgroups Òcomp Ñ4 4 4i 2v -myTp hisTp C4 4 4i 2v -myTp hisTp arr .­frArr ¬groupFriendParty «len2   i tmp len2   i tmp resultEnemy oisEnemy n# # #k  v     i 4* * *i 'v  'myTp hisTp   RÝ+ -  	  X+ -   X  9  B  X+ - 
  X-   X+ -  	 X-  9-   B  X+ -   X  9  B  X+ - 
  X-   X+ -  	 X-  9-   B X+ -   X  9  B  X+ - 
  X-   X+ 9  X+ L À ÀisAlivecheckGroupIsMyFriendisMoving 									






friendOrEnemy onlyFindfStop me self group  Sboo Q @   9  9   X+ X+ L uIda  	b  	 ® 
 J¿Ù4  X)    X+   X+ 3  +  9 9	8	
  X9 9	8	9	8	
  X9 9	8	9	8	  X+  2  L 4  6	  B	H  9  B  B  X6 9  BFRð	 )
  
	 X	6	 9		 3	 B	  X	2  L X	:	2  L	 +	  2  L	  	sortinsert
tablegetGroupByUId
pairsyxgroupOnMapTile !""""####$$$$$%%%%%""))))***,*--...000333self  Ktp  Kme  KfriendOrEnemy  KonlyFindfStop  KfindAll  KcheckGroup @groupsArr ?nArr (  k v  group 
 í !@-  	  X+ L -  	 X
-  9 -   B  X+ L -  	 X
-  9 -   B X+ L + L À ÀÀcheckGroupIsMyFriend friendOrEnemy self me group  " ¦  93  6 9 BH/9
 8



  X
+9
 8

9

 
 X&9
 8

9



  X!9
9 X9
9 X  X
9 8  B  X2  L X9 8 X	9 8  B  X2  L FRÏ+  2  L yxAPathNextTileisAlivegroups
pairs 			









self  :tp  :me  :friendOrEnemy  :checkGroup 82 2 2i /v  /gt #group group  Ö  
 O¦² 4  9    X+ 
  X  X  9 	 B X  9 	 B 6  BH	48	
  X18	9  X-8	9
  X  X8	 9B XX 6 9 ) 8	9BX8	 9	B
  X  X8	 9B XX	6 9 ) 8	 9	B AF	R	ÊL getTilePositioninsert
tableisMovingAPathNextTileisAlive
pairsfindEnemyGroupfindFriendGroupgroupsself  Pme  PfindPartyFriendOrEnemy  PonlyFindStop  Ptiles Ngroups M7 7 7i 4v  4  
  ![Ô  9   + 	 B)  ) M8	9			  X	8	9			 X	8	L	 8	9		
	  X	8	9			 X	8	L	 Oë:L headIdid
npcIdgetGroupByPartyId		self  "pId  "heroId  "needAliveOnly  "arr   i  @   9  9  X+ L + L uIda  	b  	  
b¶ä&  X+   X+   X+ 4  6  9 BH	K+ 9
 X X+   XB9
 X  X  X9
  X6 9 6 9 B 
 BX  X
6 9 6 9 B 
 B9
 X X  X9
  X6 9 6 9 B 
 BX  X
6 9 6 9 B 
 BF	R	³6 9 3		 B2  L  	sort	maxninsert
tableisAlive
partysummonObjectgroups
pairs	!!!$!%%self  cpid  cequ  cneedAliveOnly  cincludeSummonObj  carr XN N Ni Kv  Kboo J @   ²9  9  X+ L + L uIda  	b  	 þ 
wÒ+  X+   X+   X+ 4  4  6  9	 BH
]+ 9 X X+   XT9 X'  X%  X9  X6 9 6 9 B  BX6 9 6 9 B  BX
6 9 6 9 B  B9 X' X%  X9  X6 9 6 9 B  BX6 9 6 9 B  BX
6 9 6 9 B  BF
R
¡6 9	 3
	 B  2  J  	sort	maxninsert
tableisAlivesrcPartysummonObjectgroups
pairs		
!!!!!!!!!!&&&)&****self  xpid  xequ  xneedAliveOnly  xincludeSummonObj  xarr mdies l` ` `i ]v  ]boo \ º  C¹  X)ÿÿ6  9 BH	9	 	 X
9		 X		  X	<FRõK  
partyisAlivegroups
pairsþÿÿÿself  pid  attrib  value    i 	v  	 þ  	hÂ#  X)ÿÿ6  9 BH^9	 	 X
[9		 X		  X	V  X	8	 B	X	P6	 9		 B			 X
8
 :B
		 X
8
 ::B
		 X
8
 :::B
		 X
8
 ::::B
		 X
8
 :::::B
		 X
	8
 ::::::B
		 X

8
 :::::::B
			 X
8
 ::::::::B

FR K  	maxn
table
partyisAlivegroups
pairsþÿÿÿ
				#self  ipid  ifunName  iparam  ia a ai ^v  ^len L    /
  9  B 9 B X X X+ L + L + L getPosition		a  b  x1 y1  x2 y2   Æ
 ¶õ<4   6  -  9BH9  X- -  988  X6 9  )	 
 BFRî6 9  B)  X2 3 6 9   B6 9  B: - ) <)  ) M8 
 9B9	
 9
B8
 
 9

B
9
	

 9

B

 9

6 9 	 B A
8  9B9	 9B9 =9= 9B9	 9
B 9B9	 9B 96 9  B A 9B9	 9B9 =9=6 99
9
99B6 99999B6 9  B  X!9
99 8  9B9	 9B 96 9  B A8  9B9	 999BX O- BK  K   ÀÀÀsetPositionconvertToNodeSpacerectIntersectsRectyx	rectheight
widthgetContentSizepccconvertToWorldSpacegetParentgetPositionheadInfogetLeader	sort 	maxninsert
tableisAlivegroups
pairsÿçÌ³³æ¬ÿ
	                !!!!!!!!"""###%%%%%%%&&&&&&&&&&&&&&&'''''''((()))+++++++,,,,,,,///////244444555555555555555566666666666;;<	self ignore sortFun needToSort ´  i v  comp len 	last   i cNodePosX wcNodePosY  wcPos gcSize _lNodePosX RlNodePosY  RlPos ClSize <cRect /lRect (fixX fixY fixP 
 ¿ /tæM4  6  ' B6 9 BH 9  X	)  9	)
 
	 X	)ôÿ9	9


  X
	9

  X
6
  ' B
98

9	
 9
	B
9



 9

 8	9B
FRÞ3  B2  K   hpPosYsetPositionheadInfogetLeaderjobIndexdata.Config_NpcData
npcIdjobisAlivegroups
pairsdata.Config_HeroJobrequireþÿÿÿ						KLLMMself  0ignore .jobConf +# # #i  v   x jobIndex sortFun  ± 
  ;µ6  99B)  ) M989		 X+ L Oø+ L srcPartyfriendlyPartys	maxn
tableself  me  group  len2 	 	 	i  U   ¾9    X9   9BK  stopAllActionswholeLayerself  	 8    í-   
   X -   B K  ÀcallBackFun  À °Ä8  X   B2   X2   9  B  X)    X)  , 9  X99X	 9B  6 99 !6 99 !9	 9		6
 9

9

!	
	9
 9

6 9	9!

)   X)  )   X)  6
 9 B	 X	 6
 9 B
 X
 )  
 X 3 )   X26 9 96 9 96 9 9 6 9  B A A6 9 96 9 9 6 9  B A A6 9 9 B A9  9 B2  K  9  9  B  X   B2  K  K  K  setPositionrunActionwholeLayerCallFuncpMoveToEaseBackOutcreateSequencecc abs	mathdesignSizebgSizeheight
widthActualDesignSizeUIManageryxgetPositionstopCameraTween			


      !######$%%%&-///000000000000000000000000000000000000000000011111224444445566688self  group  tweenSec  callBackFun  completeDelay  x ~y  ~layerNewPosX nlayerNewPosY imaxXDistance cmaxYDistance ]action_callback Baction . Y    :þ  X BK  self  id  scale  zOrder  cb  isRepeatForever   7    (K  self  effect  dir  endPos  time   h 	   I  X BK  self  id  posTable  zOrder  cb  isRepeatForever  container   B     9  + BK  setBattlePauseself  star   á  
>6   99 B4  6 99 B4  	  X9 	 XL ) )d ) M(6
 9

) ) B
	
 X
6
 9

9 ) B
6 9 6 9	 B
 B6
 9
	
 B

 X
 XX	6 9) ) B	 XXOØL 	maxninsertremoverandom	math	nums
tablecurDropItemInforandomSortTableUtilþÿÿÿ 					self  ?min  ?max  ?drops 8len 4indexs 3	) ) )i 'v 
curDropLen      	¬K  self      5±+  )  ) M	  9  8
B 9  X+ L Oõ+ L isAlivegetGroupByUIdself  arr  group   i 
 ·   ¹+ =  6  9  6 ' B9BK  BATTLECONTROL_UPDATETASK!app.event.BattleControlEventrequiresendEventEventManagersideQuestCompletedself   §   ÀÍ))  )  -  9 9 8  X-  9 9 8 -  9 98  X-  9 98   9 B  X 9B  X+ L   9 B  X 9B  X+ L 9   X9  X+ L 9   X9  X+ L 9   XU9  XR9 6 9 X9 6 9 X96 9 X96 9 X+ L 9 6 9 X9 6 9 X96 9 X96 9 X+ L 9 6 9 X9 6 9 X96 9 X96 9 X X+ L X X+ L X9 9  X+ X+ L 9 9  X+ X+ L  ÀCHARIOTPIKEMANConst_JobjobmountObjectcheckCanNotBeSelecteduIdgroupUnderAttacking										

  !!!########((((((((self a  ¡b  ¡len1 len2  Õ  N¾E  X)    X+   X
  XA 9 B
  X< 9 B96 9 X4 9 B96 9 X,  9  
 9' B B
  X! )   X3 6	 9
 	 B:9  X+  2  L : 9B  X+  2  L  9:	B:2  L +  2  L setMyTargetGroupcheckCanNotBeSelectedmountObject	sort
table atkDisgetAttribValuefindEnemyGroupCHARIOTPIKEMANConst_JobjobgetMyTargetGroup899999::::;;;======>>>@@@@AAADDDself  Ogroup  OextDis  Oforce  Oarr )#compJob  ¤   #B4  =  +  6 9 BH9  X	 9B 
  X9  98  X9  94	  <	6 99	  9
8	
	9
BFRåK  insert
tableuIdgetMyTargetGroupisAlivegroups
pairsgroupUnderAttackingself  $tmp    k v   å   $,  9  B+  = +  = +  = +  =   9 B+  = 9 
  X 6  9	  B9
 
  X9
  9B+  =
 + = K  needRreshenGroupdispose
logicremoveEventsEventManagerschedulerIdgroupsclearGroupsselectedGroupwholeLayerspriteLayerbgLayerclearStateEventRegisters			self  % ¹   Ñ ¥6   ' B 6   ' B 6   ' B 6  ' B 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 3& = 3( =' 3* =) 3, =+ 3. =- 30 =/ 32 =1 34 =3 36 =5 38 =7 3: =9 3< =; 3> == 3@ =? 3B =A 3D =C 3F =E 3H =G 3J =I 3L =K 3N =M 3P =O 3R =Q 3T =S 3V =U 3X =W 3Z =Y 3\ =[ 3^ =] 3` =_ 3b =a 3d =c 3f =e 3h =g 3j =i 3l =k 3n =m 3p =o 3r =q 3t =s 3v =u 3x =w 3z =y 3| ={ 3~ =} 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  L   onExit reCountAllGroupsTarget attackPikeManAndChariot setSideQuestComplet checkGroupsAreDead createBlackRectOnTop randomDropItems battleResult playEffectAni effectMoveTo playFullScreenEffectAni cameraTo stopCameraTween checkGroupIsMyFriend sortGroupHeadInfo callGroupByPartyFunction modifyGroupByPartyAttrib getGroupBySrcPartyId getGroupByPartyId getGroupByPartyIdAndDefId getAllGroupTiles getGroupByAPathNextTile getGroupByTile findEnemyGroup findFriendGroup stateEventRemoveRegisters stateEventRegisters initStateEventRegisters clearStateHit clearStateEventRegisters startBattle getGroupByUId addEventListener addGroup addSummonGroup clearGroups getNearestUnitInGroup getNearestEnemyGroup *getNearestEnemyGroupInMyGuardingRange getGruop setSelectedGroup groupUseSkill groupCheckCanUseSkill startInstanceScript checkJumaAllBlock doRandomOrderGroups checkAuto setBattlePause setStoryMode setAutoBattle getBattleTimePass setBattleTimePass addTrapNode checkAllPlayersAliveLeft  create removeGroupOnMapTile addGroupOnMapTile changeBg userClickEnemyHandle clearFriendOrEnemyCache getTrap removeTrap addTrap getSummonerBySummonObjUId !getSummonGroupsBySummonerUId getDieOrders getGroupsBySrcParty recBattleData 
setId 	ctorBattleSceneForServer
classapp.control.GameGlobalapp.utils.MapUtilapp.control.EventManagerrequire            ;  > < ^ A q ` x t { y ~ |                 Ó  Ö Ô Ù × î Ú õ ð ù ÷ 	ú 
J;TLmV»ð¼üõÿý>B@KCSQnTqowuxÝéÞôêNöÒPÙ.R2bTd·À¹åÂ3æ=5B>|D~«¯¬¸±¼¹	¾		$		%	%	BattleSceneForServer   