LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill4301.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  c-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONSETDIEDSTATE_ONATTACKapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill4301 self  me  adder  id  lv  needRegStateEvent  logic 
 �   #9  9 X�9  9  X	�99  9 ' B" =K  getAttrInc
value
adderattackermeself  params   �   )[	9  9 X�K    9 ' B  9  B  X�9  9 99  +  + B6  BX� 9	9  +    9 '	 B+  9
 B	ER�K  iddamagecountSkillDamageipairsfindEnemyGroupsceneContextifPassiveIsSuc	rategetAttrInc
groupme	self  *params  *rate 
 enemys   _ v       	'K  self   �    +6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 2  �L   dispose STATE_ONSETDIED STATE_ONATTACK create 	ctor Skill4301
class	%)'++Skill4301   