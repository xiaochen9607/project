LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill7100.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self     Z-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_ONATTACKapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill7100 self  me  adder  id  lv  needRegStateEvent  logic 
 ±  
$<
  9  B  XK  99  X9 9 X9
 X  9 ' B  9  B  X9  9 '	 B "=K  per
valueifPassiveIsSuc	rategetAttrIncisCastSkillme
adderattackercheckPassiveCanUse
self  %params  %rate      	!K  self       #6   ' 3 B 3 = 3 = 3 = 3
 =	 2  L   dispose STATE_ONATTACK create 	ctor Skill7100
class	"!##Skill7100 
  