LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill7305.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self     Z
-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_ONABNORMALSTATEapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill7305 self  me  adder  id  lv  needRegStateEvent  logic 
    ?c9 6 ' B99 XK  99  XK  9  XK  9  X9	  X9 9
9	8  X9 9
9	89  X9  XK  9  9' B  9 ' B9  99 +	  6
 9

"B
+  9 BK  id
floor	mathcountSkillHealpergetAttrInchpgetAttribValue
statestateId
adderabnormalStatemetargetCANNOTACTIONONABNORMALSTATE_TYPEapp.event.StateEventrequire	type





self  @params  @adder ,hp per      	"K  self       $6   ' 3 B 3 = 3 = 3 = 3
 =	 2  L   dispose STATE_ONABNORMALSTATE create 	ctor Skill7305
class
 #"$$Skill7305 
  