LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2051.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  '   4  =  K  
trapsself     Z-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_ONATTACKapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2051 self  me  adder  id  lv  needRegStateEvent  logic 
 [   
2-     9   - 9)P- 9B K  À  lvmeaddStategroup self  ¼ 4/3   9-  9+  -  
 9' B +	  -
  9

+   B	2  K   Àid
valuegetAttrInc
addercountSkillDamage self target  group  finish  6  8-  9 +  < K   À
trapsself id   Ç +  9  B  X2 99  Xy9 9 Xu  9 ' B  9  B  X2 m9  9B  X2 g 9B6	  9
9 999	9
+ ) +  + + B

  X 	  X2 Q6	  9	 B :9:96 9
 BH9 9 9 B  X
9: X9: X)< =FRì9 9
 99 B3	 3
 9 9 9 4 4 >>>)
 +  ) 	 +  )< 
 +  + B9 6  B) <9  9+  5 9 =B2  K  K  K  K  K  shoutSkillNameId  idplayEffectAnitostringaddTrap  findEnemyGroupdurationtilePosgetTrap
traps
pairsshufflePointsyxterrainsceneContextgetAroundsNodeMapUtilgetTilePositiongetMyTargetGroupifPassiveIsSuc	rategetAttrIncme
adderattackercheckPassiveCanUse 				


"%&&&&&&&&&&&&&&&&&&&&''''''))))))))++
self  params  rate qtar ftilePos `nodes Rx Dy B  k v  trapInfo groups $triggered #removed "trapId  '   B+  =  K  
trapsself       E6   ' 3 B 3 = 3 = 3 = 3
 =	 2  L   dispose STATE_ONATTACK create 	ctor Skill2051
class
@DBEESkill2051 
  