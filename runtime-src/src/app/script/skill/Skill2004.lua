LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2004.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  c-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONBEATTACKEDSTATE_BATTLECONTROL_STARTapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2004 self  me  adder  id  lv  needRegStateEvent  logic 
 �  /r  9  ' B9  9' B "9  99 +	  
 +  9 , + B
9 9 99 +	  +
 B)  ) M�8
	
 9
	
9 9  9
 , + B
O�K  lvaddStatefindFriendGroupsceneContextidcountSkillDamage
maxHpgetAttribValuemepercentgetAttrInc								




self  0params  0percent +maxHp &damage $friends   i  �   &$9  9 X�K  9  9 X�K  9  X�9 9 X�K  9=K  countValue
valueidskillIddefenderattackermeself  params       	+K  self   �    06   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 2  �L   dispose STATE_ONBEATTACKED STATE_BATTLECONTROL_START create 	ctor Skill2004
class	")$-+//Skill2004   