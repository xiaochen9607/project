LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill7023.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  -   )  =  K  healedValueself     Z-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_ONAFTERBEHEALEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill7023 self  me  adder  id  lv  needRegStateEvent  logic 
    +m9 9  X&9 9  X"99  =   9 ' B9  9' B"  9 '	 B9  X9 $6
 99 #B= 9 	 9"
BK  modifyMorale
floor	mathmoraleValue
maxHpgetAttribValuepergetAttrInc
valuehealedValueme
adderdefender	




self  ,params  ,per value moraleValue surplus multiple  -   $)  =  K  healedValueself       '6   ' 3 B 3 = 3 = 3 = 3
 =	 2  L   dispose STATE_ONAFTERBEHEALED create 	ctor Skill7023
class	!&$''Skill7023 
  