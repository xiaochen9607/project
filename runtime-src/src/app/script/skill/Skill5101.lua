LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill5101.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   Ò  c-   9 	 
    B  X9	 9
 6 ' B9B9	 9
 6 ' B9BL  ÀSTATE_ONBEATTACKEDSTATE_ONABNORMALSTATEapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill5101 self  me  adder  id  lv  needRegStateEvent  logic 
 Ì   &<9 9  X!9 9  X6  99B  X9 X  9 ' 9 B9  9	9 +   +	  9

 B9  99
 BK  playEffectAniidcountSkillHeal
addhpgetAttrIncabnormalState	typeisControlStateGameGlobal
addermetargetself  'params  'hp    	 69  9 XK  9	  X9)   X  9 ' 9  B9   99  +   +	  9
 B9   99 BK  playEffectAniidcountSkillHeal
addhpgetAttrInccountValue
valuedefenderme self  !params  !hp      	(K  self   º    +6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 2  L   dispose STATE_ONBEATTACKED STATE_ONABNORMALSTATE create 	ctor Skill5101
class	&)(++Skill5101   