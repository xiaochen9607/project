LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill7026.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  *   + =  K  effectedself     Z-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_ONSECONDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill7026 self  me  adder  id  lv  needRegStateEvent  logic 
 è  *T9    X&  9 B  XK  9  9B9  9' B9  9B9  9B X X+ =  9  99 9		 	 			9

 BK  lvidaddStategetMaxMoralegetMorale
maxHpgetAttribValue
getHpmecheckPassiveCanUseeffected				

self  +hp maxHp morale maxMorale      	%K  self       (6   ' 3 B 3 = 3 = 3 = 3
 =	 2  L   dispose STATE_ONSECOND create 	ctor Skill7026
class	"'%((Skill7026 
  