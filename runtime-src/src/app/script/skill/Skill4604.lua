LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill4604.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  )   )  =  K  sNumberself   �  Z-   9 	 
    B  X	�9	 9
 6 ' B9BL  �STATE_ONREMOVEapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill4604 self  me  adder  id  lv  needRegStateEvent  logic 
 �  @9   99  9 9 , )	'B9  9 99  +  + B6  BX�	 99
  *  9 BER�K  ipairsfindEnemyGroupsceneContextlvidaddStateme��self  enemys 	 	 	k v   T   9  6 9 B =  K  abs	mathsNumberself  	number  	 �   4h!	9  9  X/�99  X+�99   X'�9  9 99  +  + + +	 B6 9  9 '	 B9
 " #B)   X�K  6  BX� 9	9  +   +  9 B	ER�K  countSkillHealipairssNumberpergetAttrInc
floor	mathfindFriendGroupsceneContexttargetid
adderme	self  5params  5targets value   k v   4   ,  9  D checkPassiveCanUseself       	1K  self   �   ! 36   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 2  �L   dispose checkCanUse STATE_ONREMOVE addNumber useSkill create 	ctor Skill4604
class	*!.,2133Skill4604   