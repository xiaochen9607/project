LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill4105.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self     Z-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_BATTLECONTROL_STARTapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill4105 self  me  adder  id  lv  needRegStateEvent  logic 
    # 9  99 9 X9  99 9  X+ X+ L X9 9  X+ X+ L K  kyposa  b   ä  9Y4
-   -  9  =  -   9  - 8    9  B -   9   	  X (6  - B X 9-  9+	  -
  
 9

' B
+  -  9B 9	-  9*	 -
  9


6 99, + BERã-   9  9    9  + B K   ÀÀÀsetStoryModesceneContext
dizzyskillEffectConfig_GameDatalvaddStateiddamagegetAttrIncmecountSkillDamageipairssetToDietargettargetNum¶
self i enemys   _ v   þ	 &  º-)¦) 9   9B6  99  9999	+
 ) 9  9 9B+ + +  B  X2 4  6	  BX	6
 9 5 =	=
BE	R	÷6
 9 3	 B9   9B99  9	 99
  +  + B:  X2  K  :
 9B6	 9		: 9B A	 4
  =
 )
  =
 9
  9


 9

+ B
)
,)  ) M@6  989 B9 9  9 99  9 )  5 4 899>899>==9  9= 9  9!="B<6 9#6 99 8 9B A 	 B#
9 8 9$9	9	  , 3% + + B2 OÀ2  K  K   moveToAndFadepGetDistancefriendlyPartyssrcFriendlyPartys
partysrcParty	tile  lvaddSummonGroupgetDirByPixPossetStoryModetargetNumtargetgetPositionpccfindEnemyGroupdirgetLeader 	sortposk  insert
tableipairsgetAllGroupTilesyxterrainsceneContextgetAroundsNodeMapUtilgetTilePositionme				






		         *** *--self   summonedId npcNumber tile tarTilesList posList 
 
 
k v  myDir ienemys aenemypos 	Xpos Qspeed FA A Ai >tdir 7t *     	DK  self        H6   ' 3 B 3 = 3 = 3 = 3
 =	 2  L   dispose STATE_BATTLECONTROL_START create 	ctor Skill4105
class	AEDGGSkill4105 
  