LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2168.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self     'l	-   9 	 
    B  X9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9BL  ÀSTATE_ONBEATTACKEDSTATE_ONABNORMALSTATESTATE_ONUNREVALLEDDAMAGEapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2168 self  (me  (adder  (id  (lv  (needRegStateEvent  (logic 
 ú 	 
 29  9 XK    9 ' B  9  B  X
+ =9   9)Ø5 9 =	BK  shoutSkillNameId  idplayEffectAniisHurtifPassiveIsSucPergetAttrIncattackermeself  params  rate 
 Ê 	  #; 	9  9 X6  99B  X9 X  9 ' B  9  B  X
+ =9   9	)Ø5 9
 =BK  shoutSkillNameId  idplayEffectAniifPassiveIsSucPergetAttrIncabnormalState	typeisControlStateGameGlobal
adderme	self  $params  $rate    	 8+
9  9 XK  9	  X9)   X99)û8  XK    9 ' B  9  B  X9=K  ifPassiveIsSucPergetAttrInc
statedefendercountValue
valueattackerme 
self  !params  !rate      	7K  self   Þ    :6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 2  L   dispose STATE_ONBEATTACKED STATE_ONABNORMALSTATE STATE_ONUNREVALLEDDAMAGE create 	ctor Skill2168
class	) 5+87::Skill2168   