LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill4626.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  c
-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONDIEDSTATE_ONAFTERATTACKapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill4626 self  me  adder  id  lv  needRegStateEvent  logic 
 �   ;S
9 9  X�K  99  X�K  9  X�K  9)   X�K    9 ' B6  9 B  X�K  9 9	9 +  
  9 '
 9 9B+	  9
 B9  9+  5 9 =B9 99 BK  shoutSkillNameId  playEffectAniiddamagecountSkillDamage
isHitBattleRandom	rategetAttrInc
valueisCastSkilldefendermeattacker					
self  <params  <rate $ �   %6   X�K  9 9  X�K  99  X�K  9  X�K  99  X�K  9  99 +  	  9 '
 B+  9	 ,
 + B
K  
valuegetAttrInccountSkillHealidskillIddefendermeattackerself  &params  &     	*K  self   �    ,6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 2  �L   dispose STATE_ONDIED STATE_ONAFTERATTACK create 	ctor Skill4626
class
' +*,,Skill4626   