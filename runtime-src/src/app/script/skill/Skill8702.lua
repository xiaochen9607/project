LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill8702.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self     Z-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_ONATTACKapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill8702 self  me  adder  id  lv  needRegStateEvent  logic 
     #-   9     9  B   X -   9   9  )û8     X -   9     9  B K  ÀsetToDie
statecheckUnrevalleddefenderparams  Ó  Fu  9  B  X2 ?9 96 ' B9 X599  X19
 X.9	
 X+99  X'9
 9' B9
 9' B#  9 ) B X  9 	  9 )
 B A  X 3 9
 99	 +
   +  9 )   B	2  K  K  idcountSkillDamage ifPassiveIsSucgetParams
maxHphpgetAttribValuedefenderisCastSkillisCastRestrainSkill
adderattackerPIKEMANapp.const.Const_JobrequirejobmecheckPassiveCanUse






self  Fparams  Fhp ""maxHp value finish      	/K  self       36   ' 3 B 3 = 3 = 3 = 3
 =	 2  L   dispose STATE_ONATTACK create 	ctor Skill8702
class
-1/33Skill8702 
  