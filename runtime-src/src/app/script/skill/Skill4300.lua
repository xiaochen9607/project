LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill4300.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  c
-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONBEHEALEDSTATE_ONBEATTACKEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill4300 self  me  adder  id  lv  needRegStateEvent  logic 
 �  -K
9  9 X�K  9  99  8
  X�K  9   9' B9   9' B#  9 ' +	  9
  B X�9   9	9  9  9	
 ,
 + BK  lvaddStatepergetAttrInchp
maxHpgetAttribValueid
statedefenderme
self  .params  .maxHp hp  �  
(F 9  9 X�K  9   9' B9   9' B#  9 ' +	  9
  B X�9  99  8
  X�9   9	9  BK  removeStateid
statepergetAttrInchp
maxHpgetAttribValuedefendermeself  )params  )maxHp hp      	.K  self   �    06   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 2  �L   dispose STATE_ONBEHEALED STATE_ONBEATTACKED create 	ctor Skill4300
class
+ /.00Skill4300   