LJT@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill40771.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  d	-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONREMOVESTATE_ONADDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill40771 self  me  adder  id  lv  needRegStateEvent  logic 
 �    19  9 X�9 9 X�9   99 + B9   99 + B9   99 + B9   9)� BK  setOpacitysetRevivedsetCanNotBeAttackedsetCanNotBeSelectedidtargetmeself  !params  ! �   <M 
9  9 X7�9 9 X3�9   99 + B9   99 + B9   99 + B9   9)� B9   99 +  6	 9
9	  	 9		' B	  9
 ' B
"	
	B+  9	 ,
 + B
9   9)�BK  playEffectAni
valuegetAttrInc
maxHpgetAttribValue
floor	math
addercountSkillHealsetOpacitysetRevivedsetCanNotBeAttackedsetCanNotBeSelectedidtargetme
self  =params  =     	.K  self   �    16   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 2  �L   dispose STATE_ONREMOVE STATE_ONADD create 	ctor Skill40771
class	* /.00Skill40771   