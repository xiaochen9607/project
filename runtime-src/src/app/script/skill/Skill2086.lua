LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2086.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  Z-   9 	 
    B  X	�9	 9
 6 ' B9BL  �STATE_ONAFTERBEATTACKEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2086 self  me  adder  id  lv  needRegStateEvent  logic 
 �  5s9  9 X�K  9   9' B9   9' B9!6 9! #B6 9! #B X�9  	 99
	 B9  	 9
9
	 
 


B9  	 99
  9	  9 BK  lvaddStateremoveStateidplayEffectAni
floor	math
value
maxHphpgetAttribValuedefenderme		




self  6params  6hp +maxHp &preHp $multiple1 multiple2      	&K  self   �    *6   ' 3 B 3 = 3 = 3 = 3
 =	 2  �L   dispose STATE_ONAFTERBEATTACKED create 	ctor Skill2086
class	#(&**Skill2086 
  