LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2248.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  c
-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONSETDIEDSTATE_ONBEATTACKEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2248 self  me  adder  id  lv  needRegStateEvent  logic 
 �   Wt9 9  X�K  9  9B  X�K  9 9)�W8  X�K  9  9' B9 )   X9�  9 ' B  9	  B  X/�)  =)  =
9  99 	 9'
 B  X�) B9  9)5 9	 =	B9  9B9  99 )�9	 B9  99 )�W9	 B9  95 BK     addFilterlvaddStateremoveAllStateshoutSkillNameId  idplayEffectAni
maxHp
setHpcountValueifPassiveIsSuc	rategetAttrInc
valuehpgetAttribValue
statecheckRevivedmedefender		

self  Xparams  Xhp ?rate 	5 c   
)9 9  X�K  9  9BK  clearFiltersme
groupself  params       	/K  self   �    16   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 2  �L   dispose STATE_ONSETDIED STATE_ONBEATTACKED create 	ctor Skill2248
class
',)0/11Skill2248   