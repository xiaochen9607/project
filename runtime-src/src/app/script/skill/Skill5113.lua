LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill5113.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self     Z-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_ONHITENEMYapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill5113 self  me  adder  id  lv  needRegStateEvent  logic 
    S9  9 XK  9  9 XK  9  9  XK  + =9  9 99  +  + B) ) )  ) M8		 9		' B	8

 9

'	 B
#	
		 X
	  Oð8  XK    9
 ' 9	  B  X)  8 99	  +
   +  9 B9   9)	< B89   X9   99	 BK  playEffectAnimodifyMoraleidcountSkillHeal
addhpgetAttrInc
maxHphpgetAttribValuefindFriendGroupsceneContextisAttacksummonObjecttargetattackerme											

self  Tparams  Ttargets :k 9per 8  i p addhp      	-K  self       /6   ' 3 B 3 = 3 = 3 = 3
 =	 2  L   dispose STATE_ONHITENEMY create 	ctor Skill5113
class	*.-//Skill5113 
  