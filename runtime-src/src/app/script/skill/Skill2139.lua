LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2139.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self     Z-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_ONAFTERATTACKapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2139 self  me  adder  id  lv  needRegStateEvent  logic 
    >w9  9 XK  9  XK  9  XK    9 ' B6 99"B)   X 9  9	 9
9) B6  BX	 9
	9  +   +  9 B
ERö9   9+  5	 9
 =
	B9 9)+4	  BK  shoutSkillNameId  playEffectAniidcountSkillDamageipairsdefenderfindFriendGroupsceneContext
value
floor	mathpergetAttrIncisCastSkill
isCriattackerme								self  ?params  ?per -value (enemys   _ v       	#K  self       &6   ' 3 B 3 = 3 = 3 = 3
 =	 2  L   dispose STATE_ONAFTERATTACK create 	ctor Skill2139
class	!$#&&Skill2139 
  