LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill1027.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self     Z-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_ONBEATTACKEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill1027 self  me  adder  id  lv  needRegStateEvent  logic 
   
 1g9   9B  XK  )   9 ' 9  B  9 ' 9  B9   99  9	 9
 B 99  +	  
 +  9  B 9	)B9   99  +	  
 + 9  BK  playEffectAnicountSkillDamagelvidaddStatevalueEnemyvalueSelfgetAttrIncgetMyTargetGroupme									



self  2target -delayTime )valueSelf $valueEnemy  À  	 %6%
9   9B  X6 ' B99L 9   9B9   9 B  X6 ' B99L X6 ' B99L K  notInRangesuccesscheckTargetInMyRangenoTargetskillTipsdata.Config_GameDatarequiregetMyTargetGroupme
self  &target  ¼  ,1	9  9 X9  9 XK  9   9' B9 )   X =K  
valuehpgetAttribValueattackerdefenderme	self  params  hp      	=K  self   Ä    ?6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 2  L   dispose STATE_ONBEATTACKED checkCanUse useSkill create 	ctor Skill1027
class
!/%:1>=??Skill1027   