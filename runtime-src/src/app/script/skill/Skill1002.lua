LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill1002.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      		K  self     Z-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_ONAFTERATTACKapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill1002 self  me  adder  id  lv  needRegStateEvent  logic 
      K   ì  &T9   99  9 9 , 6	 9		9		B9   9B  9 '	 9   B) 3
  99  +	  
 +  9   B	 99 BK  playEffectAnicountSkillDamage 
valuegetAttrIncgetMyTargetGroupmaxTimeskillTipsConfig_GameDatalvidaddStateme	









self  'target value delayTime finish     1Q%9  9  XK  9  9 XK  9
  X#99  X9 9' B)  )   X9   9' B X  9	 '
 B 9"9   99  +  	 +
 BK  countSkillHeal
valuepergetAttrInc
maxHphpgetAttribValuedefenderidskillIdattacker
adderme	


self  2params  2defHp heal  À  	 %68
9   9B  X6 ' B99L 9   9B9   9 B  X6 ' B99L X6 ' B99L K  notInRangesuccesscheckTargetInMyRangenoTargetskillTipsdata.Config_GameDatarequiregetMyTargetGroupme
self  &target      	EK  self   Å    I6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 2  L   dispose checkCanUse STATE_ONAFTERATTACK useSkill create 	ctor Skill1002
class	#6%B8GEIISkill1002   