LJ\@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\sprite\BattleUnitGroupForServer.luaï  x ÃÌ	+  =  +  = +  = +  = +  = +  = 4  = +  = 4  = + =	 +  =
 + = +  = +  = +  =  +  = )  = +  = +  = +  = +  = )  = +  = ) = ) = )  = )  = )  = )  = )  = )  = )  = )  = )  =  ) =! ) =" ) =# ) =$ ) =% ) =& )  =' )  =( )  =) )  =* )  =+ )  =, )  =- )  =. )  =/ 4  =0 ) =1 ) =2 64 9593=3 64 9596=6 )  =7 )  =8 )  =9 +  = 4  =: 4  =; 4  =< )ÿÿ== + => +  =? +  =@ )è=A + =B +  =C )  =D 4  =E +  =F +  =G 4  =H )ÿÿ=I )  =J )  =K ) =L + =M + =N 4  =E 4  =O 4  =P 4  =Q 4  =R 4  =S 4  =T 4  =U 4  =V + =W )  =9 )  =X +  =Y +  =Z + =[ 5_ 6] '^ B9=6] '^ B9=6] '^ B9=6] '^ B9=6] '^ B9'='6] '^ B9)=)6] '^ B9(=(6] '^ B9&=&6] '^ B9=6] '^ B9=6] '^ B9=6] '^ B9"="6] '^ B9#=#6] '^ B9$=$6] '^ B9.=.6] '^ B92=2=\ + =` +  =a 4  =b 4  =c 4  =d 4  =e 4  =f 4  =g )ÿÿ=h )ÿÿ=i )  =j 4  =k 4  =l +  =m +  =n +  =o 4  =p 4  =q +  =r )  =s 4  =t 4  =u 4  =v +  =w K  heroAttribUpdaterCacheawakeAddAttrallTheTitleAddAttrallAdvanceAddAttrskillPowerUpattachMountsrcFriendlyPartysunderAttakByGroupallArtiFactAddAttrnoTypeSKillAddAttrdelaySetPositiontotalAttribgrowAttribpvpMovingCountinitMoraleinitHpdirectAddAttrpermenetAddAttrtreasureAddAttrallYuanAddAttrallEquipAddAttrcountDamageQueuestopMovingSchedulerattackHandled  data.Config_LanguagerequireneedToShowAttrChangedshouldRefreshBuffbuffAnidebuffAnihealExtaPathOnlyMoveOneStepbeSneerbPuzzledbRevivedbUnrevalledcanNotBeAttackedcanNotSkillcanNotActioncanNotMovemountObjectsummonObjectsummonFactornpcStrenthnpcBatType
npcIdskillCDblinkScheduletempBufferValuecanNotBeSelectedcurAttackIntervalAPathNextTileinitedcastRestrainTickleaderSpritetilePositionreturninghasInitiativeSkillId
stateskillLvsskillscontrolTimeExtendrestrainSkTimeExtendstateTimeExtendmoraleIncBeAttackedbattleConfig_GameDatamoraleIncAttackmoraleIncSpdrestrainLevelpureLvAttribawakeMoralemoralerestrainValuerestrainTypecriDmgToughRatedamageValuePerdodgeValuecriValuehitValuetoughValue
dodgemoveSpdatkDisatkSpdcriDmgRate
toughcridefatkhp	inte
forcecmdexp	star	rankjobevolveLvoriPositionidqualityuIdtotalUnit	form
maxHppauseAIScheduleAIPausing_myTargetGroupisAlivefriendlyPartyssceneContextpriorAttackTargetsAIPolicyguardingRadiusoriGuardingRadius	listsrcParty
party		

  !!""##$$%%&&''(())**++--..//0011335566778899::;;<<<<====>>??@@DDEEFFGGHHIIJJKKLLMMOOPPQQSSTTUUWWXXYYZZ[[\\]]^^__``aabbccddeeffgghhjjkkllopppppqqqqqrrrrrssssstttttuuuuuvvvvvwwwwwxxxxxyyyyyzzzzz{{{{{|||||}}}}}~~~~~self  Ä d   "¤)  9    X9  8  X9  8L growAttribself  attr  value 
 e   "¬)  9    X9  8  X9  8L totalAttribself  attr  value 
    -³  9  B 9  B6 99 BK  	list	maxn
tablesetDirLimitgetLeaderself  action  dir  maxLen  :   º  9  B9L dirgetLeaderself   ý  #7Ä-  9   X-  4  = -  9 99 X-  9 99 XK  -  9 9=-  9 9=-  9 9 BK  ÀsetTilePositionattachGroupyxtilePositionleader self  $tp  $     	ÍK  self   '    ÐK  self  action  dir     &Ó-  = -  =-   96  9	 
 B AK  ÀgetCellPointMapUtilsetTilePositionyxleader self  x  y        Ø K    2   Ù -   9   -  9J  Àyx     leader  g 	 	&Ú-   9   B-  =K  ÀdirsetPositionleader self  
x  
y  
dir  
      Þ K         ß K         à K         á K    Ü 	 ?â6  ' B6  96 9 6 9 #B5 8L 
  pi	math
roundMathUtilapp.utils.MathUtilrequireself  dx  dy  angle  tmp_dir tmpArr  ì	= pü½W-   9 B4  )  =)  ==3 =3 =3	 =3 =
3 =3 =3 =3 =3 =3 =3 =3 ===) ===6  
 BH<FRý X) =!9!="=#4  =$6& '
' B
 9(  B=%
 9)B6	* 9	+	 B	)
  
	 X
:
9
-
=
,9
/=
.9
1=
0 9
2'3 B
=
/6
4 
 9
5
 '1 B
=
19
1=
66
7 
 9
8
  6& '9 B9:6;  9<B A
2  L À	inithandlerBATTLECONTROL_START!app.event.BattleControlEventaddEventEventManagerawakeMoralegetPermenetSkIncAttrValueHeroAttribUpdater
maxHpgetAttribValuemoraleinitMoralehpinitHpidhasInitiativeSkillId	maxn
tablefindInitiativeSkillcreateapp.ai.NORMAL_ForServerrequireAIPolicy	listaioriGuardingRadiusguardingRadius
pairsuIddirsceneContextleaderSprite getDir hideMaster updateHeroAwakeMorale addMaterHead hideHead moveTo getPosition doAction setPosition setDirLimit stopMoving setTilePositionattachGroupyxnew  !!""##$$++,-..1244445447777889::BBBBBBBBBDDDEEEEFFFGGGJJKKLLLLLNNNNNNNOOUUUUUUUUUUUUUUVVBattleUnitGroupForServer self  qsceneContext  quId  qgroupData  qai  qguardingRadius  qspriteGroup lleader k&  k v  tab ,len ( Q   	6  9 B
  X+ L + L bUnrevalled	nextself  
 ³   (P5  = ==6 ' B99==	 X6
  99 6	 ' B	9		5
 6 ' B9=
=
B9 X9 ) <X9 +  <K  bUnrevalledparams  STATE_ONABNORMALSTATEsceneContextsendEventEventManager
adder	typeUNREVALLEDONABNORMALSTATE_TYPEapp.event.StateEventrequirestateIdabnormalStatetarget  			self  )stateId  )sw  )adder  )params  N   	ª6  9 B
  X+ L + L bRevived	nextself  
 ­   (P±5  = ==6 ' B99==	 X6
  99 6	 ' B	9		5
 6 ' B9=
=
B9 X9 ) <X9 +  <K  bRevivedparams  STATE_ONABNORMALSTATEsceneContextsendEventEventManager
adder	typeREVIVEDONABNORMALSTATE_TYPEapp.event.StateEventrequirestateIdabnormalStatetarget  			self  )stateId  )sw  )adder  )params  N   	¾6  9 B
  X+ L + L bPuzzled	nextself  
 ­   (PÅ5  = ==6 ' B99==	 X6
  99 6	 ' B	9		5
 6 ' B9=
=
B9 X9 ) <X9 +  <K  bPuzzledparams  STATE_ONABNORMALSTATEsceneContextsendEventEventManager
adder	typePUZZLEDONABNORMALSTATE_TYPEapp.event.StateEventrequirestateIdabnormalStatetarget  			self  )stateId  )sw  )adder  )params  h   
#Ò6  9 BH+ L FRü+ L canNotSkill
pairsself    k v   ´   (PÙ5  = ==6 ' B99==	 X6
  99 6	 ' B	9		5
 6 ' B9=
=
B9 X9 ) <X9 +  <K  canNotSkillparams  STATE_ONABNORMALSTATEsceneContextsendEventEventManager
adder	typeCANNOTSKILLONABNORMALSTATE_TYPEapp.event.StateEventrequirestateIdabnormalStatetarget  			self  )stateId  )sw  )adder  )params  x   æ6  9 B  X  9 B  X+ L + L checkRevivedcanNotAction	nextself   ¶   (Pï5  = ==6 ' B99==	 X6
  99 6	 ' B	9		5
 6 ' B9=
=
B9 X9 ) <X9 +  <K  canNotActionparams  STATE_ONABNORMALSTATEsceneContextsendEventEventManager
adder	typeCANNOTACTIONONABNORMALSTATE_TYPEapp.event.StateEventrequirestateIdabnormalStatetarget  			self  )stateId  )sw  )adder  )params   	  &û6  9 BH  9 B+ L FRù+ L stopMovingcanNotMove
pairsself    k v   ²   (P5  = ==6 ' B99==	 X6
  99 6	 ' B	9		5
 6 ' B9=
=
B9 X9 ) <X9 +  <K  canNotMoveparams  STATE_ONABNORMALSTATEsceneContextsendEventEventManager
adder	typeCANNOTMOVEONABNORMALSTATE_TYPEapp.event.StateEventrequirestateIdabnormalStatetarget  			self  )stateId  )sw  )adder  )params  ¬   (P5  = ==6 ' B99==	 X6
  99 6	 ' B	9		5
 6 ' B9=
=
B9 X9 ) <X9 +  <K  beSneerparams  STATE_ONABNORMALSTATEsceneContextsendEventEventManager
adder	typeBESNEERONABNORMALSTATE_TYPEapp.event.StateEventrequirestateIdabnormalStatetarget  			self  )stateId  )sw  )adder  )params  d   
#6  9 BH+ L FRü+ L beSneer
pairsself    k v   m   
#¡6  9 BH+ L FRü+ L canNotBeAttacked
pairsself    k v   ¾   (P¨5  = ==6 ' B99==	 X6
  99 6	 ' B	9		5
 6 ' B9=
=
B9 X9 ) <X9 +  <K  canNotBeAttackedparams  STATE_ONABNORMALSTATEsceneContextsendEventEventManager
adder	typeCANNOTBEATTACKEDONABNORMALSTATE_TYPEapp.event.StateEventrequirestateIdabnormalStatetarget  			self  )stateId  )sw  )adder  )params  m   
#µ6  9 BH+ L FRü+ L canNotBeSelected
pairsself    k v   ¾   (P½5  = ==6 ' B99==	 X6
  99 6	 ' B	9		5
 6 ' B9=
=
B9 X9 ) <X9 +  <K  canNotBeSelectedparams  STATE_ONABNORMALSTATEsceneContextsendEventEventManager
adder	typeCANNOTBESELECTEDONABNORMALSTATE_TYPEapp.event.StateEventrequirestateIdabnormalStatetarget  


self  )stateId  )sw  )adder  )params   	  +Ë6  9 BH X9 8L FRù)  L allSkillLvsallSkills
pairsself  id    k v   a  'Ô9    X-  9L ÀmaxMorale_maxMoraleBattleUnitGroupForServer self   1   Ø=  K  _maxMoraleself  morale   ¸   EfÜ:::6   9 	 B5 9=9=== 9 
  X	9  9	9	 9		9
 9

9
 B6 9 	 B= 9  99	 9		9
 9

9
 B  9 B 99	9
B  9 B=  9 6	  	 9		99B	 A  9 +	 BK  togethergetCellPointsetTilePositionsetPositiongetLeaderaddGroupOnMapTilepccuIdremoveGroupOnMapTilesceneContexttilePositiondiry  xoriPositiongetPixelPointMapUtil						








self  Fpos  Fx Dy Cdir Bpp < ¿   U|ó:::9  )   X6 ' B6 ' B9  8989)   X6  9 	 B6  99		9

B9	9
5 =	=
==   9 B=  9 B 9 	 B9 
  X	9  99 9	9	 9	
	9
 B6  9 	 B= 9  99 9	9	 9	
	9
 B  9 + BK  togetheraddGroupOnMapTileuIdremoveGroupOnMapTilesceneContexttilePositionsetPositiongetLeaderdir  oriPositionyxgetPixelPointgetCellPointMapUtilatkSpdjobIndexdata.Config_NpcDatadata.Config_HeroJobrequire
npcId	
self  Vpos  Vx Ty Sdir Rtp pix    
 +6  99	 B) 	 )
 M9   X9 89  X  X9 899 8 9      BOç6 '
 B9 X
  9	 BK  setToDieDIEapp.const.Const_ActionrequiredoActiondirisAlive	list	maxn
table





self  ,action  ,dir  ,alsoPlaySnd  ,actionLoop  ,forceRender  ,callBack  ,maxLen '  i     Y¡  X+ 6  99 B)  ) M9	  	 X
9	 8		9		 	 X

9	 8			 9		  B	  X	XOíK  shootEnemy_forceisAlive	list	maxn
tableself   target   param   oneShoot   maxLen   i  =   ­  9  B9L movinggetLeaderself    	 	 =±  X  9  B6  999B  9 B 999B  9 + B  9 B 9BK  stopMovingtogethersetPositiongetLeaderyxgetPixelPointMapUtilgetTilePositionself  stopAtOnce  tp pp  *   
º9  L tilePositionself      >T½9  
  X9  99 X9  99 XK    X+ 9  
  X	9  99  99  99 B=  9  99  99  99 B)  =   X6  9	9 6
 '	 B95 6	
 ' B	9		=	5	 = 	=	BK  paramstarget  	type  STATE_TILECHANGEDapp.event.StateEventrequiresendEventEventManagerpvpMovingCountaddGroupOnMapTileuIdremoveGroupOnMapTilesceneContextyxtilePosition									self  ?p  ?sendMsg  ? W   Ñ6   9   BK  updateHeroAttribUpdaterself  param   Ã 	  +Ô9  
  X9   9B+  =  6 '  &B 99    B=  K  sceneContextcreateapp.ai.requiredisposeAIPolicyself  ai  param   Ä  %_Ý  X X8 L )  )  9 8
  X9 89 8
  X9 8X 8   9 	 
 B   *   X X*  L atkSpdgetBuffValuepermenetAddAttrdirectAddAttrhpmoraleµæÌ³¦þ



self  &attrName  &ignoreBuff  &value value2 newVal  J   ò9    9 '  B L getBuffValueatkDisself   ,   
õ9  L _myTargetGroupself   ó   4hø  9  B  X  XK  5 == 6  99 6 '	 B9	5
 6	 ' B	9			=	=B9+ 9  X+   X9 
  X 
  X9  X =   X9  9B+ L reCountAllGroupsTargetisAlive_myTargetGroupparams	type  STATE_ONSETTARGETapp.event.StateEventrequiresceneContextsendEventEventManagerattackertarget  checkBeSneer			self  5tg  5params )needReCountAllTargetsTarget  ¥ '³ð?9    XK  )  = + =  6 9 8  X6 9 89  X	9 )   X6 9 89= 9   X9 96 99 X	9	   X  9
   )) B6 99 B)  ) M;9 8)   X59 8	  X9 6 )89:9 8" = X%9 8
  X!-  9 88
  X-  9 8896 '	 B9 X9 89 8
  9
     , * +  + +  + BOÅ  9 B4  = +  =   9 B6  9  B9  X9 = X  9 ' B= 6  9   ' B= 9!  X9!  X9! = 9 ="   9# B6 9 B)   X:9%=$ 9 )   X  9& + BK   ÀsetToDieidhasInitiativeSkillIdfindInitiativeSkillawakeMoraleinitMoralegetPermenetSkIncAttrValuemorale
maxHpgetAttribValuehpinitHpaddPermenetIncToObjectHeroAttribUpdaterupdateheroAttribUpdaterCachepermenetAddAttrinitAwakeStateTYPE_PASSIVEapp.const.Const_Skillrequire	typeparamsConfig_HeroSkillskillsskillLvs	maxn
tableaddStatesummonObject
rotlaConfig_GameDatabatTypesceneContextaddPertreasureConfig_HeroTreasureskillPowerUpinited²FÝÛþÿÿÿ 












!!""###$$$$$&&&'''))))),,,,,,,------..//4445555666777::::;;;;?skillConf self  ´len 4< < <i :id ,lv tab ;len  á  9×6   9  B6  BX	  9 
  99, *  +  + +  + BERòK  lvidaddStateipairsgetGroupAwakeStateConfig_GameDataÝÛself  sList   k v       	ÞK  self   ç  	 (vâ 9 B6  999B 9 B 6  999	B99!99!6 9
  B 9	B		 9		   B	L	 getDirgetLeader
atan2	mathyxgetPixelPointMapUtilgetTilePosition			




self  )attacker  )defender  )tp %ePoint myPoint 
dx dy angle 
dir 	 ë 	 ,Pñ9    X	9    X9  9  9 =K  9  99 + + + B)  ) M89  X89  X8=  9  9  9 =K  Oï)ÿÿ=  K  isMastermountObjectsrcPartygetGroupByPartyIdsceneContextcurAttackIntervalattachMountþÿÿÿ					
self  -inc  -groups   i  ü  Jäµ9  9 X9  9  X6 9  X	9  9  X6 99  XK  9 
  X#9 9 9	 =	9 9	)   X  9
 B 99 99 9B  9
 B9 9=9 9
  X9 9B+  = 9   X)9  ) )  ) M"9 89 89	 =	9 89	)   X9 86 99
  B
  9 99999+  99B
OÞ9   9B9   X9  = 9 )   X+  9 B X&  9  B X!9 = 9 *   X6!  9"9# 99# 9B  9
 B 999B+  =# )  = + =$   9% +  B  9& B9'  X	  9( )  B  9) )  BK  6* 9+ BH
)   X)   X)  9+ <FRô9   X  9, '- B  9.  B  9( 9/  B  90  B9  9 X9  9  X6 9  X	9  9  X6 99  XK  + 91  =1 62 9394  9, '5 B 91  X=1 +  91  XH9 	 XE  96 B X@+ 62  979  98B  X99 62 939: X+ X	6 9;9<62 939: X+   9= B
  XX   X
  X9'  X  9> 	  
 B X9   X  9? 	 B  X	+   9@ B5A = B=C X 4  6* 9D BH9
E	
 
=
E	9
E	9F	
 X
6
 9
G
 9H	B
FRò)  ) M  9	I 8B	OûL removeStateidinserttotalDurationcurDuration
statedefenderattacker  castRestrainSkill"checkThisGroupInMyAttackRangegetRestrainValuegetMyTargetGroup
levellocalPlayercastRestrainNeedLvlvbatTypeisPvpBattlecheckCanNotSkillrestrainSkTimeExtendmaxCastRestrainTickbattleConfig_GameDatacastRestrainTickmodifyAwakeMoralemoraleaddMoraleForMountmoraleIncSpdgetAttribValueskillCD
pairssetAwakeMoralesetMoraleisAlivecheckNormalAttacksetMyTargetGroupfinishOneTileAPathNextTilegetPixelPointMapUtilcheckCanNotActioncheckCanNotMovepvpMovingCountcurAttackIntervalmountObjectclearStateHitrealDamage countDamageCompleteCallBackskillIdisCastRestrainSkilldirectValuebeAttackUnitattackerGroupcountDamageremove
tablecountDamageQueuecallBackdiryxsetPositiongetLeader
delaydelaySetPositionguidingnewBieProxystoryModeAPP_ENTER_BACKGROUNDGameGlobalbattlePausebattleStartedsceneContextµæÌ³æýÈ 					




 !"#$%&(*....0001114444444444444455566668888888899999999::;;<<>>>>BBBDDDEEEEFFFFGJJJJKKKLMMMNPPJJSSSTTTTTUUUUVVVVVWWWWZZZZZZZZZZZZZZZZZZZZZ[]^^^````````aaaacdddddddddddfhhhhhhhhiiiiiijkmmmmmmmmnrrrsssxxxxxxxxxxxxxxxxxzzzzzz{}}}~~~~~self  ålen B'index &# # #i !damInfo pixP :$  k 
v  
inc canCastRestrainSkill $xneedTick mcastRestrainSkill hlvEnoughCanCast ?myGroupTarget #needToRemove $  k v    i  ¦ 4e4  6  99 B)  ) M*9 8)   X$9 8
  X 9 8  X-  9 8896 '
 B9 X5 9 8=	9 8=
6  9
 6  9 B BOÖL  Àinsertlvid  TYPE_INITIATIVEapp.const.Const_Skillrequire	typeskillsskillLvs	maxn
tableþÿÿÿ										skillConf self  5tab 3len /+ + +i )obj 
 Ì  7¥Ç¦c
  X+
 9   XK  9 8
  X9 89 X9 89	  XK    X9 )  XK  6 89	  X9   XK  6  9	'
  ' &B XK  9  9B9 8
  X9 8
  X9 89	  X  9  , + B9 8
  X9 89	  X 6 '  &B9  9     + B<9 8) =9 89)  X X9 8)  =X9 86 99 899 89 B=
  X  X)  9 8  9  5 ==B=9 8= 
 X  9 B)  9 89
  X	9 89 X9 89
  X6 ' B89	  X6 ' B89  X  9  '! B 6 ' B89	  X6 ' B89	  X6 ' B89	  X 9 '" B 9 8=#9 8)  =$ 	 X9 8+ =%6 ' B89&	  X 
 X  9' B
  X X6(  9)9 6 '* B9+5, 6 '* B9+=-5. =/=0= 1=2BX6(  9)9 6 '* B9354 6 '* B93=-55 =/=0= 1=2B9 8  XK   
 X  96 BK  update    STATE_ONPASSIVESTATE_INITparamstargetid
adder  	type  STATE_ONADDapp.event.StateEventsendEventEventManagerrefreshBufferValueneedCalculateisShieldcurDurationtotalDurationcontrolTimeExtendstateTimeExtendgetAttribValueisControlSkillbTimeExtenddata.Config_HeroSkill	timeupdateStateIconeffectIdisRepeatForeveroffset 
orderplayEffectAnieffAnimin	mathcurStackcreateapp.script.skill.SkillrequireremoveStateclearFriendOrEnemyCachesceneContext	.luaapp/script/skill/SkillcheckFileExistGameGlobalmountObjectisHarmConfig_HeroSkilljob
stacklv
stateisAliveþÿÿÿÐ		



"""""""""$$$$$%%%%%%%%%%&&&&''''''''(((()+++++++++++++..///000000000011133444788888888889999;;;>>>>>>>>>>>>>>?????BBBBBBBBBBBBBBBBBBBBBCCCCCEEEFFFFIIJJJJLLLLLLLMMNNNSSSSTTTTTTTTTTTTTTTTTTTTTVVVVVVVVVVVVVVVVVVVVYYYYZ^^___cself  ¦adder  ¦id  ¦lv  ¦effAni  ¦apyOffset  ¦time  ¦aniIsRepeatForever  ¦isPassiveStateInit  ¦isShield  ¦updateNow  ¦isNoJob  ¦script Wduration @ Ã  oÏ)  X+ 9  8  XK    X9  X6 ' B89	  XK  9  9B  X+ 9  89  89
  X9  89	 9B	 9	9
  8

9

B9  8+  =9  +  <6 '	 B89
	 X  X	  9 B
  X X6 	 99
 6 ' B95 6 ' B9=5 == =B9 	 9
 B9
  X	 9B  X	  9 B  X	  9 BK  updateStateIconupdatedisposestateEventRemoveRegistersparamstargetid  	type  STATE_ONREMOVEapp.event.StateEventsendEventEventManagerrefreshBufferValueneedCalculateremoveChildgetParenteffAniclearFriendOrEnemyCachesceneContextdelWhenDiedata.Config_HeroSkillrequireisAlive
state !!"""##$$$)self  pid  pupdateIconToo  pstillDelWhenDie  pdispatchEvent  pneedUpdate  pneedToRemoveState Q     	´K  self   E³º4 G ?   )  ) M9  88  X9  88	 9BOô  9 ' B4  = + = ) -  9 ) M
-  989	   9
  B
<
	Oö+ =   9 ' B6 9		  9
 B"#B  9 	 B  9 B  9 BK  À checkBufferOrDebufferEffectupdateHeadHp
setHp
getHp
floor	mathgetBuffValueshouldCalculatedBuffAttrshouldRefreshBufftempBufferValue
maxHpgetAttribValuerefreshBufferValue
stateÀ				

BattleUnitGroupForServer self  Farg Bn A  i oriMaxHp -	  i 	attrName curMaxHp curHp  2    Û   X+ X+ L a  b     =Ô  X+ 6  ' B4  6 9 BH	6 9 	 BF	R	ù6 9 3	 B)  ) M  X
	  9
 8	+  +   B
X
8
	8

9
	

 X
  9
 8	+  +   B
Oç  9
 B4  =   9 BK  updateStateIconrefreshBufferValueisHarmremoveState 	sortinsert
table
state
pairsdata.Config_HeroSkillrequire	




self  >isHarm  >stillDelWhenDie  >needUpdate  >skConf 7arrId 6  k v    i  J   ì9    X+ L + L underAttackScheduleself   :    +ðK  self  beAttackUnit  attackerGroupUId   á   <}ó9   9 B 9' B9 X- 9B X(9   9B)  =5 == 	6
  99	  6
 ' B
9

5 6 ' B9==B9  X+ L   X  9 	 
 B+ L X+ L K  countDamageisAttackparams	type  STATE_ONHITENEMYapp.event.StateEventrequiresendEventEventManagertargetattacker isAttackclearStateHitcheckCanNotActioncurAttackIntervalatkSpdgetAttribValuegetGroupByUIdsceneContext					

self  =beAttackUnit  =attackerGroupUId  =group 7spd 3params     	9  9  X9 9  X+ X+ L 9  9   X+ X+ L idprioritya  b   ®  G®	29   X9   X4  = 9 8  X9 )  <9 82 3)  9   X2 /4  6 9 BH6
 9

 	 B
FRù3 6 9 	 B4  = )  ) M8
	9

  X
  X
 XX
 9
 B9	
" 9 9

<
Oì2  L L L idcurStackgetAttrInc	sort insert
table
pairs
statetempBufferValueshouldRefreshBuff			++++,,,///11	self  FattrName  FignoreBuff  Fvalue 2tmp -  k v  sort !
  i v tmpGetAttrInc  å  	,B¹	9 	  X96 ' B9 X 9' D 9 	 X96 ' B9 X 9' D 9 	 X96 ' B9 X 9' D )  L PIKEMANCAVALRYMANrestrainValuegetAttribValueCHARIOTapp.const.Const_JobrequirejobrestrainType
										



self  -atkG  -defG  -    !Ì	=  9    9 ' B X  9 ' B=  9  )   X)  =  K  
maxHpgetAttribValuehpself  hp       
Ö	9  L hpself   K   Ú	  9  9  BK  moralesetMoraleself  morale   $   
Þ	9  L moraleself   ±  S¦â	9    XK  9 6 9 B=   9 B9  X= 9 )   X)  = 6  99 6	 '	 B	9	
	5
 6 '	 B9
=
5 = =9 !==
B+ 9  X+ 6  99	 6
 ' B
9

5 5 = =B6  9	  6
 ' B
9

5   9 ' B=-  9==BK  ÀisfullmaxMorale  getAttribValue!BATTLEUI_HERO_MORALE_CHANGEDapp.event.BattleUIEvent    BATTLECONTROL_MORALEFULL!app.event.BattleControlEventparams
paramtarget  	type  STATE_ONADDMORALEapp.event.StateEventrequiresceneContextsendEventEventManagergetMaxMorale
floor	mathmoralemountObject		BattleUnitGroupForServer self  Tmorale  Tparam  TtmpMorate NmaxMorale Fisfull !% A   ö	6  9L maxAwakeMoraleConfig_GameDataself   )   
ú	9  L awakeMoraleself   é   Iþ	9    XK  9   9 B6 96 96 9
 B	 B)  B= K  
floorminmax	mathgetMaxAwakeMoraleawakeMoralemountObjectself  awakeMorale  curMorale maxAwakeMorale  U   
  9  9  BK  awakeMoralesetAwakeMoraleself  morale   ©   F]
  9  B  X+ L   9 B  X+ L 9  X+ L   9 B  9 B X+ L 6  9  B  X+ L 9 8  X9 8)   X+ L 6 '	  &B 9
  +   	 +
 B9  X 9D + L checkCanUsecreateapp.script.skill.SkillrequireskillCDgetGroupAwakeSkillConfig_GameDatagetMaxAwakeMoralegetAwakeMoraleisAlivecheckCanNotActioncheckCanNotSkill					



self  Gid #$lv  $sk    Fw
  9  B  XK  9 9  XK  6  9  B  XK  )  =   9 B  X	  9    B  9 B=	6
 '  &B 9    	 
 + B  9 )  B 9B9
  X9  X9 9<9  9+ BK  setStoryModeskillCDcduseSkillsetAwakeMoralecreateapp.script.skill.SkillrequiredirgetLeadergetAttackerDirgetMyTargetGroupcurAttackIntervalgetGroupAwakeSkillConfig_GameDatabattleEndedsceneContextcheckAwakeSkillþÿÿÿ



self  Gid 6lv  6myTargetGroup .dir script  © 	 &¶³
 9	 ' B	+
 
  X	6 8
  X6 89	  X+
 
  X
   
 X	 "  9    +      B
L countDamagedamageEffectByInteConfig_HeroSkill	integetAttribValueó¥·Øòû		
self  'attackerGroup  'beAttackUnit  'baseDamage  'isFixed  'skillId  'delay  'countDamageCompleteCallBack  'realHeal  'inte "need !damage  ° 	 '¹Ç
+	 
  X
	6
  8



  X
6
  8

9

	
  X
+	  9
' B
  	 X
 ")   X)ÿÿ  9    +      B
L countDamage	integetAttribValuedamageEffectByInteConfig_HeroSkilló¥·Øòû	

self  (attackerGroup  (beAttackUnit  (baseDamage  (isFixed  (skillId  (delay  (countDamageCompleteCallBack  (realDamage  (need &inte damage     
`Ü
  9  	 
  ,   B	L countDamageself  attackerGroup  beAttackUnit  damage  delay  countDamageCompleteCallBack   §! 	& `¨Üç
¤  X	+ 
  X	6	  ' B	8		9				  X	+   9	 B		 X	K  
  X	6	 9		9 5 ==	=
=====B	K    X	
  9	 B		 
  X	9	 	 X	K    X	+  9	' B	9

 9

' B
6 9!
	B	 X* !
	#+ 
  X+ 5 ==9====6  99  6  '! B9"5# 6  '! B9"=$=%B9)  X) =9)   X)  =6&  9'9B X+ 5( ='=9====6  99  6  '! B9)5* 6  '! B9)=$=%B
  X)    X99+9+ X	
  X	6  ' B89,	 X+ ='
  X)   X
9 9'- B)   X "9'5. ='=9====6  99  6  '! B9/50 6  '! B9/=$=%B XK  6  '1 B62  939        B	 )   X'4  &+ 
  X+ 95   96 95  B57 95 !=8=9=9=====)   X!6  99  6  '! B9:5; 6  ' ! B9:=$=%B6  99  6  '! B9<5= 6  ' ! B9<=$=%BX 6  99  6  '! B9>5? 6  ' ! B9>=$=%B6  99  6  '! B9@5A 6  ' ! B9@=$=%B6  99  6  '! B9B5C 6  ' ! B9B=$=%B9   9D9+99+ B)   X@ X> X<  9E B 9FB5G =H=I=9=9====6  99  6  '!! B9J5 K 6!  '#! B!9!J!=!$ =% B  9L 9HB 9L9IB  9M 9N 9H B 9M9N9I B  9O  B 9O B  9 '5 B  9 'P B#6  'Q B6 9R9S 'T &8:B6 9U9V "!B95 	  X)  X)  )  X)9  X  9W    !  B )   X+  XU6 9X)   B9Y 89  X   9W ! " #  B 9V  X	 Xç+ Xå9V )   X95 )   X  9Z B9  X*9[  X' 9L),B 9M9NB 9O),B5\ =8=9=9=====6  99   6!  '#! B!9!]!5"^ 6#  '%! B#9#]#=#$"=%"B  9_ B  X)    X BK  updateHeadHp  STATE_ONDIED  summonObjectsetToDie	listrandomdietotalUnit
floor	_POS	form	maxnapp.const.Const_Form
maxHpmodifyAwakeMoralemoralesetMoraleaddMoraleForMount  STATE_ONDAMAGEADDMORALEattackValuebeAttackValue  getMoraleIncAttackgetMoraleIncBeAttackedrecBattleData  STATE_ONAFTERHPCHANGE  STATE_ONAFTERBEHEALED  STATE_ONAFTERHEAL  STATE_ONAFTERBEATTACKED  STATE_ONAFTERATTACK
isCri
value  
setHphp+countDamageDamageCalculator!app.control.DamageCalculator  STATE_ONHITRESULTEND  healExtcanDodgeduId  STATE_ONHITRESULT  
isHitBattleRandomparams	type  STATE_ONHITRATEapp.event.StateEventsceneContextsendEventEventManagerisCastSkilldefenderUnitdefenderattackerhitRate  abs	mathdodgeValueattachGrouphitValuegetAttribValueisAlivegetRandomMemberAliverealDamage countDamageCompleteCallBack
delayskillIdisCastRestrainSkilldirectValuebeAttackUnitattackerGroup  countDamageQueueinsert
tablecheckCanNotBeAttackedisRealDamagedata.Config_HeroSkillrequire¸ µæÌ³æýÜ½¼ÿØ					    !!!!!"""""##$&&&'((())))))))++++++++++++++++,,,,,,------.....//0333333334444444444444444666666666666666666677;;;;;<<<<<===>>ACCCCCCCCDDDDDDDDDDDDDDDDFFHKKKMMMMMMMMMMMPQQQQQQSTTTVWWWWWXXXXXXXXXXXXYYYZZZZZZZZZZZZZZZZ[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]^^^^^^^^^^^^^^^^````````````````ccccccccfffffffggghhhiiiiiiiiiijjjjjjjjjjjjjjjjkkkkllllmmmmmmnnnnnnppppqqqqvvvvvvvvvwwwxxxxxxxxyyyyyyzzzzzzz{{{}}}~~~~~~   ¡¡¡££££¤self  ©attackerGroup  ©beAttackUnit  ©directValue  ©isCastRestrainSkill  ©skillId  ©delay  ©countDamageCompleteCallBack  ©realDamage  ©atkHitVal 7òdefDodVal íhitParam2 èhitRate âisSkill áparams ÖisHit !µparams ªheal /hitParams ívalue !ÌisCri  ÌtmpStrValue ËisSkill ÄbefHp Àparams ¯be_incM f9incM 6params 
,per 5formConst formTotalUnit |needToRemoveUnit vneedToBreak removeIndex params ; 6   =  K  moraleIncAttackself  morale   -   
9  L moraleIncAttackself   :   =  K  moraleIncBeAttackedself  morale   1   
9  L moraleIncBeAttackedself   Ï  _Á5  = =6  99 6 '
 B95		 6
 ' B
9

=

	=	B9  XK    X  9 )B  XK  + =   9  B6 ' B6 99 ' &8:B  9 '	 B	  9 '
 B#6 99	 "
!	
	B) 9	 		 )
 M	  XX9 89 X9 8+ =9 = Oï
  9 + B
  9 + BK  togetherupdateHeadHp	listtotalUnit
floor	math
maxHpgetAttribValue	_POS	form	maxn
tableapp.const.Const_Form
setHpisAlivegetSkillLv
isDieparams	type  STATE_REVIVEDTOHPapp.event.StateEventrequiresceneContextsendEventEventManagerhptarget 
isDie 								








self  `hp  `isOuer  `params \formConst &6formTotalUnit .per2 	%needToRemoveUnit   k  @   Ù9  9   X+ X+ L uIda  	b  	    h°·5+ =  6  99 6 ' B95 6 '	 B9=5	 = 
=B  9 +  + + B4  = 4  = 4  = 4  = 4  = 4  = 4  = 9 94  6  BH  X6 9
  BFR÷6 9 3 B)  ) M8	 9B  X8	 9+
  B89  X8+  =Oí)  = )  = ) 9  ) M
9 89   X9 8+ = OöK  	listtotalUnithpuserSelectedTargetGroupsetMyTargetGroupgetMyTargetGroup 	sortinsert
table
pairsgroupscanNotBeSelectedcanNotBeAttackedbeSneercanNotMovecanNotActioncanNotSkillbPuzzledremoveAllStateparams
group  	type  STATE_ONSETDIEDapp.event.StateEventrequiresceneContextsendEventEventManagerisAlive		

"""$"%%%%&&&&&&'''''))))***%--//0000011111222205self  igroups +>arrGroups =
 
 
k v    i   i 	 ½   ú6   9    9  B   9  B   9  -  9B -   + = K   ÀAIPausingpauseAIScheduleunscheduleScriptEntrygetSchedulergetInstanceDirectorccself  ¢	 	8Mî	  X9  
  X6 9 9B 9B 99  B+ = 2 #+ = 9  
  X6 9 9B 9B 99  B3 6 9 9B 9B 9  + B=  2  K  K  scheduleScriptFunc AIPausingunscheduleScriptEntrygetSchedulergetInstanceDirectorccpauseAISchedule 			











self  8sec  8tick '    06  99 B)  ) M	9 8  X9 8+  =O÷K  myTarget	list	maxn
tableself  maxLen 
 
 
i  G     9  B 9D getPositiongetLeaderself   _ 
  	  9  B 9  	 D moveTogetLeaderself  
x  
y  
dir  
 @    -      X-   - B K  À À			comToDo self  ¼
  §,+
    X+ 	  X+	   X)   9  + B3 9  9  B B2  K  setPositionleaderSprite stopMoving,,self  x  y  dir  moveSec  fadeInOrFadeOut  sec  comToDo  cameraFollow  needSetOriPixPosition  timeCallBackTick action_callback 
 ©   A¼  X)   X)   9  	 
 +  B  9 	 
 BK  	fademoveByAPathself  x  y  dir  fadeInOrFadeOut  sec   Z    ;Â  X BK  self  fadeInOrFadeOut  sec  completeCallBackFun        Æ	K  	self  value   Õ  	=ÁÐ(9   XK    X+ 9 
  X+ = 
  9 B
 9  + ,   B	 X	9	 	  X	9	 
	  X	9	 	 	=	 9	 )
 
	 X	)	  =	 +	  =	 +	  =	   9	 +  B	  9	 ) B	9	 
	  X	 X	)	  =	 L pauseAIScriptForSecsetMyTargetGroupuserCommandFaileduserLastClickPosmoveByAPathgetLeaderaPathOnlyMoveOneStepuserSelectedTargetGroupisAlive    !!!!$$$$$%%'self  >x  >y  >autoFindNearestWalkable  >completeChangeToDir  >completeFun  >onlyMoveOneStep  >needExcludeBattleGroupBlock  >boo % h   	$û  9  B 9  BK  randomMovegetLeaderself  
range  
interval  
 ï  [éþ 6  99B	  XK  96  99B,	  9
B
9

 9B 9B	  6 ' B+  )  ) M98 9B X29'	 &88
8:9
 9'	 &88
8:9 	9'	 &88
8:  X8 9  B8 96 ' B9 BX8 9   BOÇK  moveTo	IDLEapp.const.Const_ActiondoActionsetPositionyx	_POS	formapp.const.Const_FormrequiregetPositiondirgetLeader	list	maxn
table  self  \atOnce  \group  \list 	SmaxLen OtargetX NtargetY  NtargetDir  NleaderPosX  NleaderPosY  NleaderDir JformConst ?tmp >: : :i 8     
K  
self  path      ª=  9  = 6 99 6 99 B  BK  	maxn	listinsert
tabletotalUnitattachGroupself  sprite   *   
²9  L leaderSpriteself   «  (T·6  99 B4  )  ) M9 89  X6  9	 9
 8

BOô6  9 B	  X+  L +  6 9) 6  9	 B A8L random	mathinsertisAlive	list	maxn
table 	








self  )len $aliveArr #  i ret 
     	ÅK  self   k   ê-      X K  -   - 9 8  - 9B K   À
paramcallFuncbContext script  ÿ
 aã-  8 
  X-  8 9   X2 6 9-  8 9 B)  ) M	-  8 9 83  B2 O÷K  K  ÀÀ 	maxn
tablescript
allScripts cbContext act  len 
 
 
i script execute  ÷	  ZÚ6  ' B8  X2   X4  96  ' B893  ' B2  K  K  	idle actioncbContextdata.Config_SpriteDatarequireself  id  attrTable  cbContext allScripts doActionScript  y   õ9    X=  9  XK  =   9 + BK  updateHeadHp
partysrcPartyself  p   &    üK  self  forceRedraw     m9  6 99  B+  )  )	 M9  8
 X
 XOù
  X9  = 	 9B9K  dirgetLeadertotalUnit	maxn
table	list

self  who  attacker  defender  list maxLen index   i dieDir   !    K  self  atOnce   ½   "c  9  B 9 B  X9 
  X9   X9
  X9  9 ' B6  9	 
 B X+ L + L disForTileMapUtilatkDisgetAttribValueAPathNextTilegetTilePosition				self  #targetGroup  #checkNextTileToo  #myTp targetTp dis    X|­  9  B  XK  )  =   9 9  5 5 =B  9  B  X+  =   9 '	 + BK  9 6
 ' B9 X9 6
 ' B9 X  9 '	 + B6 9) ) B6 9'  B   9    B  9 B=)  =   9  B 9  ,	 +
 +  * B  9   )p)	 BK  addStatecountDamagecurAttackIntervaldirgetLeadergetAttackerDir	%02dformatstringrandom	mathCOUNSELLORARCHERapp.const.Const_JobrequirerestrainStatemodifyEachUnitAttribcastRetrainSkillTickeroffset 
order xdyFjobplayEffectAnicastRestrainTickgetMyTargetGroupÌÍ³ææÌÿ













self  YmyTargetGroup Usnd 2#dir   	  @Ë6  99 B)  ) M9 8<OüK  	list	maxn
tableself  attribName  value  maxLen 	  i  9    *ÑK  self  enemyGroup  forceFindOtherPos       	ÔK  self   1   
Ø-   + =  K   Àreturningself    3d×3    9 B6 96 9 	 B6 99	 9		9
 9

B A)
  X+ = 2  K    9	 B  X+ =   9
 9 99	 9		+
 9 9 + B  X+ = 2  K  dirmoveByAPathcheckBeSneerreturningyxoriPositionppGetDistanceccgetPosition 		self  4com 2curPosX /curPosY  /curDis  boo    .í  9  B  9 B95 +  ) )	 )	 M8
 X 
XOú6 9"6 9! 6	 9		#	6	 9		 B	"		 		6
 9

 B
"

 


 	 J cossinpi	math
  dirgetLeadergetPositionèself  /dis  /x +y  +dir 'tmpArr &tmp_dir %  i angle rotation y2 	x2  å 
  =  X  9  ' B  9B  9 B6  9 	 B X+ L + L disForTileMapUtilgetTilePositionatkDisgetAttribValueself  target  dis  eTp myTp  *   
9  L sceneContextself   Ó K) 9   ) M9  8 X9 <K  Oø6 99  6 99  B B6 99 6 99 B B)   X-  8
  X-  896 ' B9 X   9	    	 ,
 *  +  + B
  9
 B6 9 B)   X:9=   9 BK   ÀupdateidhasInitiativeSkillIdfindInitiativeSkilladdStateTYPE_PASSIVEapp.const.Const_Skillrequire	type	maxninsert
tableskillLvsskillsÝÛ									








skillConf self  LskId  Llv  L	 	 	i id +
tab len 
 Å 	  &T¬)ÿÿ=  6 99 B)  ) M9 8 X9 )ÿÿ<9 )ÿÿ<Oõ  9 B6 9 B)   X:9=    9 BK  updateidfindInitiativeSkillskillLvsskills	maxn
tablehasInitiativeSkillId


self  'skId  'len    i 
tab len 
 ³ 	  :¾6  99 B)  ) M9 8 X9 <Où  9 BK  updateskillLvsskills	maxn
tableself  skId  lv  len   i  K   ô-     9   - + B K   ÀÀsetCanNotMoveself skId  ¹ aÎÌ,9  )  X2 [  9  +	 B  9 + B X	 )  X6 9 B   9 B6  9	 
  B )    9	 B	9			)
  ) M
6  9
9 98989B  X9  98+  B  X8 XX
XX
O
å6
 
 9

99B
*  X* 3 5 =9
=9
==		== 2  K  K  callBack
delay  delaySetPosition getPixelPointgetGroupByTileyxterrainsceneContextisWalkabledirgetLeadergetPosByDirAndDisMapUtilgetTilePosition
floor	mathstopMovingsetCanNotMovejobµæÌ³æýçÌ³³æÌþ			




""""""##$$$$*+++++++++,,self  askId  adir  adis  areverse  acurTile Dtiles =resTile <resI ;dir 7  i pix !sec com  :    #ú BK  self  tar  id  cb  scale      )~þ9  9 :   9	 B	6
 
 9

 9	) B
9
)   X
9
)   X9
  X9
 X +  5 =
	BX +  5
 =
	BK    nextTile  yxdirgetOnePosByDisAndDisMapUtilgetLeaderterrainsceneContext					self  *tar  *id  *cb  *finishCb  *effect  *terrain 'maxY &maxX $unit !tarTile     -9  9 :   9	 B	6
 
 9

 9	) B
:
9)   X:
9)   X:
9  X:
9 X +  5 =
	BX +  5
 =
	BK    nextTile  yxdirgetRow3ColNTilesByDirMapUtilgetLeaderterrainsceneContext						self  .tar  .id  .cb  .finishCb  .effect  .terrain +maxY *maxX (unit %tarTile  -   
9  L allEquipAddAttrself   ,   
9  L allYuanAddAttrself   -   
 9  L treasureAddAttrself   0   
£9  L allArtiFactAddAttrself   C   ¦9 =  K  oriGuardingRadiusguardingRadiusself   /   
©9  L allAdvanceAddAttrself   *   
¬9  L awakeAddAttrself   0   
¯9  L allTheTitleAddAttrself   0   
²9  L noTypeSKillAddAttrself   D   µ9  )  X+ L + L evolveLvself  	 Ð   1¼5  5   X9   X8L X8L K  	rank          +1+1+2+1+2+3+1+2+3+4+1+2+3self  rank  useNum  str num  P   Ò=  9  = K  guardingRadiusoriGuardingRadiusself  value   Æ  .Ö  9  )B  XK  + = 9 :+ =  X
)   X  9   9 : BK  countDamage	listisAlivegetSkillLv self  cureValue       	ÞK  self       	àK  self   Ë  q â¤6  ' B6  9  B9 
  X9  9B+  =   9 , + B+  = +  =	 +  =
 +  = +  = +  = +  = +  = +  =
 +  = +  = +  = +  = +  = +  = + = +  =	 + = +  = +  = +  = +  = )  = +  = +  = +  = )  = +  = ) = ) = )  =  )  =! )  =" )  =# )  =$ )  =% )  =& )  =' )  =( ) =) ) =* ) =+ ) =, ) =- ) =. )  =/ )  =0 )  =1 )  =2 )  =3 )  =4 )  =5 +  =6 ) =7 ) =8 +  =9 +  =: )  =; )  =< )  == +  = +  => +  =? +  = )ÿÿ=@ + =A +  =B +  = )è=C + =D +  =E )  =F +  =G +  =H +  =I +  =J )ÿÿ=K )  =L )  =M ) =N + =O + =P +  =G +  =Q +  =R +  =S +  =T +  =U +  =V +  =W +  =X + =Y )  == )  =Z +  =[ +  =\ + =] +  =^ + =_ +  =` +  = +  =a +  =b +  =c +  =d )ÿÿ=e )ÿÿ=f )  =g +  =h +  =i +  =j +  =k +  =l +  =m +  =n +  =o )  =p K  skillPowerUpattachMountsrcFriendlyPartysunderAttakByGroupallArtiFactAddAttrnoTypeSKillAddAttrdelaySetPositiontotalAttribgrowAttribpvpMovingCountinitMoraleinitHppermenetAddAttrtreasureAddAttrallYuanAddAttrallEquipAddAttrstopMovingSchedulerattackHandledneedToShowAttrChangedshouldRefreshBuffbuffAnidebuffAnihealExtaPathOnlyMoveOneStepbeSneerbPuzzledbRevivedbUnrevalledcanNotBeAttackedcanNotSkillcanNotActioncanNotMovemountObjectsummonObjectsummonFactornpcStrenthnpcBatType
npcIdskillCDblinkScheduletempBufferValuecanNotBeSelectedcurAttackIntervalAPathNextTileinitedcastRestrainTicktilePositionreturninghasInitiativeSkillIdskillLvsskillscontrolTimeExtendrestrainSkTimeExtendstateTimeExtendmoraleIncBeAttackedmoraleIncAttackmoraleIncSpdrestrainLevelpureLvAttribmoralerestrainValuerestrainTypecriDmgToughRatedodgeValuecriValuehitValuetoughValue
dodgemoveSpdatkDisatkSpdcriDmgRate
toughcridefatkhp	inte
forcecmdexp	star	rankjobevolveLvoriPositionidqualitytotalUnit	form
maxHppauseAIScheduleAIPausingisAlivepriorAttackTargetsguardingRadiusoriGuardingRadiussrcParty
partyleaderSpritesceneContextfriendlyPartys	list_myTargetGroup
stateremoveAllStatecountDamageQueuedisposeAIPolicyremoveEventsEventManagerapp.control.EventManagerrequire$$%%&&''(())**++,,--..//00334455668899::;;<<>>??@@BBCCDDEEFFGGHHIIJJKKLLMMNNPPQQRRSSUUWWXXYYZZ[[\\]]^^__``aaeeffgghhiijjkkllmmnnppqqrrttuuvvxxyyzz{{||}}~~  ¡¡¢¢££¤self        ¤ÿ 6   ' B 6   ' B 6  ' B6 ' B)è=6 9	=3 =
3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3! = 3# ="3% =$3' =&3) =(3+ =*3- =,3/ =.31 =033 =235 =437 =639 =83; =:3= =<3? =>3A =@3C =B3E =D3G =F3I =H3K =J3M =L3O =N3Q =P3S =R3U =T3W =V3Y =X3[ =Z3] =\3_ =^3a =`3c =b3e =d3g =f3i =h3k =j3m =l3o =n3q =p3s =r3u =t3w =v3y =x3{ =z3} =|3 =~3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3¡ = 3£ =¢3¥ =¤3§ =¦3© =¨3« =ª3­ =¬3¯ =®3± =°3³ =²3µ =´3· =¶3¹ =¸3» =º3½ =¼3¿ =¾3Á =À3Ã =Â3Å =Ä3Ç =Æ3É =È3Ë =Ê3Í =Ì3Ï =Î3Ñ =Ð3Ó =Ò3Õ =Ô3× =Ö3Ù =Ø3Û =Ú3Ý =Ü3ß =Þ3á =à3ã =â3å =ä3ç =æ3é =è3ë =ê3í =ì3ï =î3ñ =ð3ó =ò3õ =ô3÷ =ö3ù =ø3û =ú3ý =ü3ÿ =þ' 3<'3<'3<'3<'3	<'
3<'3<'3<'3<2  L  dispose clearFilters addFilter setToAlive setGuardingRadius getQualityLv getIs15Potential !getAllAttribValueNoTypeSKill getTheTitleAddAttr getAwakeAddAttr getJobAdvanceAddAttr resetGuardingRadius getAllArtiFactAddAttr getTreasureAddAttr getAllYuanAddAttr getAllEquipAddAttr runnigUnitNoTarget flyingSkillNoTarget flyingSkill beBeatBack modifySkillLv removeSkill addSkill getParent checkTargetInMyRange getMyDirectionDisPos returnToOriPosition attackMyTargetGroup moveToEnemy modifyEachUnitAttrib castRestrainSkill "checkThisGroupInMyAttackRange together die updateHeadHp setParty playEffectAni updateStateIcon getRandomMemberAlive getLeader add playSound setToPartyPosition randomMove moveByAPath setOpacity 	fade moveByAPathAndFade moveToAndFade moveTo getPosition clearAllUnitFightingTarget pauseAIScriptForSec setToDie setToRevived getMoraleIncBeAttacked setMoraleIncBeAttacked getMoraleIncAttack setMoraleIncAttack countDamage countPureDamage countSkillDamage countSkillHeal useAwakeSkill checkAwakeSkill modifyAwakeMorale setAwakeMorale getAwakeMorale getMaxAwakeMorale setMorale getMorale modifyMorale 
getHp 
setHp getRestrainValue getBuffValue unitBeAttackHandle_force unitBeAttackHandle checkIsUnderAttacking removeAllState refreshBufferValue  checkBufferOrDebufferEffect removeState addState findInitiativeSkill timePassScheduleTick addMoraleForMount getAttackerDir checkNormalAttack initAwakeState 	init setMyTargetGroup getMyTargetGroup getAttackRange getAttribValue changeAIPolicy update setTilePosition getTilePosition stopMoving isMoving forceShootEnemy doAction setOriPixPosition setOriTilePosition setMaxMorale getMaxMorale getSkillLv setCanNotBeSelected checkCanNotBeSelected setCanNotBeAttacked checkCanNotBeAttacked checkBeSneer setBeSneer setCanNotMove checkCanNotMove setCanNotAction checkCanNotAction setCanNotSkill checkCanNotSkill setPuzzled checkPuzzled setRevived checkRevived setUnrevalled checkUnrevalled create getDir setDirLimit getTotalAttribValue getGrowAttribValue 	ctorpermenetAttribTabConfig_SkillUpgradeshouldCalculatedBuffAttrmaxMoraleBattleUnitGroupForServer
classapp.const.Const_Formdata.Config_HeroSkillapp.control.GameGlobalrequire                 ¢ 	 ª ¤ ² ¬ ¹ ³ ¼ º ½ (/*<1C>PEWRdYnfzo{ ¦¡³¨ºµÉ½ÒËÖÔÚØòÜó,!/-91<:N=SQZTq]trwuxÕÜ×àÞðâ ñ¤	¦3
64P:kTolrps¸Ë¹ÔÌØÖÜÚàÞôâøöüúþ	0E3YG_\g6l7n»Á¼ÄÂÏÆøÐýûþ)/*42C7KEtZzu|«Ê­ÐËÓÑÖÔë× í
*<,F>xL|z~¢ ¥£¨¦«©®¬¯±¯²´²µºµ¼Ñ¼ÒÕÒÖÝÖÞßÞàáàâ	â		skillConf formConst BattleUnitGroupForServer   