LJT@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill22191.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  'm	-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONSETDIEDSTATE_ONSECONDSTATE_ONAFTERBEATTACKEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill22191 self  (me  (adder  (id  (lv  (needRegStateEvent  (logic 
 �   .9 9  X�K  99  X�K  9   X�K    9 B+ = 9  9)�B9  9BK  setToDieplayEffectAnidoDamageskillUsedattackermedefenderself  params   �   #+9  9)�8  X�K  9  9)�89)   X�K  9   X�K    9 B+ = 9  9)�B9  9BK  setToDieplayEffectAnimedoDamageskillUsed	tick
state
adderself  $ �   %'9 9  X�K  9   X�K    9 B+ = 9  9)�BK  playEffectAnidoDamageskillUsedme
groupself  params   �  	 H/9  9 99 ) + + + B  9 ' B6  BX�
 99  +   +  9 BER�K  idcountSkillHealipairs
valuegetAttrInc
adderfindFriendGroupsceneContextmeself  targets value   _ v       	7K  self   �   " :6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 2  �L   dispose doDamage STATE_ONSETDIED STATE_ONSECOND STATE_ONAFTERBEATTACKED create 	ctor Skill22191
class	%-'5/87::Skill22191   