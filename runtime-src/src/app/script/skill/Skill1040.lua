LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill1040.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      		K  self     Z-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_ONDIEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill1040 self  me  adder  id  lv  needRegStateEvent  logic 
   	 -   9     9  -  9 -  9-  9, 6 99B K   ÀmaxTimeskillTipsConfig_GameDatalvidaddStatemeself  ¥ 	 M
9   9B  9 ' 9   B  9 ' B3  99  +	  
 +  9   B	 99 B2  K  playEffectAniidcountSkillDamage delayTime
valuegetAttrIncgetMyTargetGroupme				

self   target value delayTime finish  À  	 %6$
9   9B  X6 ' B99L 9   9B9   9 B  X6 ' B99L X6 ' B99L K  notInRangesuccesscheckTargetInMyRangenoTargetskillTipsdata.Config_GameDatarequiregetMyTargetGroupme
self  &target  ¢   %09 
  X9 9  X9 9 XK  9  99 )¡(9 BK  lvaddStateattackermeidskillIdself  params       	8K  self   ¾    <6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 2  L   dispose STATE_ONDIED checkCanUse useSkill create 	ctor Skill1040
class	!.$50;8<<Skill1040   