LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2041.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self     Z-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_ONBEATTACKEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2041 self  me  adder  id  lv  needRegStateEvent  logic 
 Ê  Z9  9 X9  9 X9 XK  99  X	99 X99)  XK    9 B  XK    9 ' B  9  B  X'9  9	 9
9  ) B 	 XK  )  ) M
  9 B
  9 ' 9  8B8		 9		9  +   + 9 B	8		 9		9 B	Oè9   9+  5 9 =BK  shoutSkillNameId  playEffectAniidcountSkillDamage
valuerefreshBufferValuefindEnemyGroupsceneContextifPassiveIsSuc	rategetAttrInccheckPassiveCanUsejobisCastSkillattackerdefenderme 					self  [params  [rate %6targets    k damage 	     
3+ L self       	8K  self   °    <6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 2  L   dispose checkCanUse STATE_ONBEATTACKED create 	ctor Skill2041
class	153:8<<Skill2041   