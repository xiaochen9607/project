LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill8961.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  Z
-   9 	 
    B  X	�9	 9
 6 ' B9BL  �STATE_ONAFTERATTACKapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill8961 self  me  adder  id  lv  needRegStateEvent  logic 
 �  Z�9 9  X�K  99  X�K  9  X�K  99  X�K  9  9B9 X�K  9 9 99 9B  X�K  9	)   X�K    9
 ' B6  9 B  X�K    9
 ' B9 9 99)	 +
 + + B6  BX	� 9
*  8  X�
 9
9 +   +  9 BE	R	�K  countSkillDamage
stateipairsfindFriendGroupdamage
isHitBattleRandom	rategetAttrInc
valuecheckGroupIsMyFriendsceneContextgetMyTargetGroupidskillIdisCastSkilldefendermeattacker��
				







self  [params  [target Crate ,damage  targets 
  _ v  value      	(K  self   �    *6   ' 3 B 3 = 3 = 3 = 3
 =	 2  �L   dispose STATE_ONAFTERATTACK create 	ctor Skill8961
class
%)(**Skill8961 
  