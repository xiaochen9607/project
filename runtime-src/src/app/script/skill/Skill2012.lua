LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2012.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  c-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONPASSIVESTATE_INITSTATE_ONAFTERBEATTACKEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2012 self  me  adder  id  lv  needRegStateEvent  logic 
 �  #9 9   X�99  X	�9  99 9   9 BK  lvaddStatemetargetidself  params   �  <�9  9 X�K  9   9' B9   9' B9!6 9! #B6 9! #B X�9   X�9	 9  
 9
 5 9 =B9  
 99	  B9  
 99  9	  9 BK  lvaddStateremoveState  shoutSkillNameIdplayEffectAniideffectId
floor	math
value
maxHphpgetAttribValuedefenderme		



self  =params  =hp 2maxHp -preHp +multiple1 %multiple2 effectId      	.K  self   �    26   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 2  �L   dispose STATE_ONAFTERBEATTACKED STATE_ONPASSIVESTATE_INIT create 	ctor Skill2012
class	+0.22Skill2012   