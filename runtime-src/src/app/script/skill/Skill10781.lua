LJT@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill10781.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  5   + =  )  = K  	tick	bSetself    
 9-   9 	 
    B  X-9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9	BL  ÀSTATE_ONATTACKSTATE_ONBEATTACKEDSTATE_ONSECONDSTATE_ONADDSTATE_ONSETTARGETapp.event.StateEventrequirestateEventRegisterssceneContextnew
Skill10781 self  :me  :adder  :id  :lv  :needRegStateEvent  :logic 
0 Ó  "
+ =  9  = 9 )  X)  = + =  9  9B9  X9  99 BK  setMyTargetGroup
addergetMyTargetGroupme	tick	bSetµæÌ³æý
self   ³   &%9 9   X99  XK  9  99  + B9  99 BK  
addersetMyTargetGroupsetBeSneermetargetidself  params      $-
9 9  XK  99  X	9  X9 = + = )  = K  	tick
adder	bSetattackermetarget
self  params   â   .99 9  XK  99  XK  9  XK  9 9)8  X9 9)8 99BK  useSkill
stateisCastSkillmeattacker
adderdefenderself  params   â   .B9 9  XK  99  XK  9  XK  9 9)8  X9 9)8 99 BK  useSkill
stateisCastSkill
adderattackermedefenderself  params   F   L9   99 + BK  idsetBeSneermeself      $ Q6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 2  L   dispose STATE_ONATTACK STATE_ONBEATTACKED STATE_ONSETTARGET STATE_ONADD STATE_ONSECOND create 	ctor Skill10781
class
#+%7-@9IBPLQQSkill10781   