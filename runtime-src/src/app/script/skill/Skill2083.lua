LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2083.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  Z
-   9 	 
    B  X	�9	 9
 6 ' B9BL  �STATE_ONAFTERBEATTACKEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2083 self  me  adder  id  lv  needRegStateEvent  logic 
 �  9g  9  B  X�K  9 9  X.�99  X*�9 9' B9 9' B #)2  X�  9 ' B  9	 	 B X�K  9  9
9	 9
 



9 , + B9  99	 BK  playEffectAnilvidaddStateifPassiveIsSuc	rategetAttrInchp
maxHpgetAttribValuedefender
addermecheckPassiveCanUse�			



self  :params  :maxHp %curHp  per rate  | 	  )9   9  9 ' B  9 ' B AL 
note2
note1getAttrIncformat	descself  str      	-K  self   �    16   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 2  �L   dispose getDesc STATE_ONAFTERBEATTACKED create 	ctor Skill2083
class
&,)/-11Skill2083   