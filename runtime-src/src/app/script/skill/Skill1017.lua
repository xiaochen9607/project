LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill1017.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  Z
-   9 	 
    B  X	�9	 9
 6 ' B9BL  �STATE_ONDIEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill1017 self  me  adder  id  lv  needRegStateEvent  logic 
 �  	$J
9   9B+    9 ' 9   B 9   99  9 9 ,	
 *  B 99 B*  99  +  	 +
  9  BK  countSkillDamageplayEffectAnilvidaddState
valuegetAttrIncgetMyTargetGroupme��I��̙����									
self  %target  damage delayTime 
 �   %9 
  X�9 9  X�9 9 X�K  9  96 99BK  maxMoralbattleConfig_GameDatasetMoraleattackermeidskillIdself  params   �  	 %6&
9   9B  X�6 ' B99L 9   9B9   9 B  X�6 ' B99L X�6 ' B99L K  notInRangesuccesscheckTargetInMyRangenoTargetskillTipsdata.Config_GameDatarequiregetMyTargetGroupme
self  &target  K   29   99 + BK  idsetCanNotActionmeself   �    66   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 2  �L   dispose checkCanUse STATE_ONDIED useSkill create 	ctor Skill1017
class
$0&4266Skill1017   