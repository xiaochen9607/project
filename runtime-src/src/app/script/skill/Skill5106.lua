LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill5106.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  (   +  =  K  targetself   �  c-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONPASSIVESTATE_INITSTATE_ONATTACKapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill5106 self  me  adder  id  lv  needRegStateEvent  logic 
 �   79  9 X�K    9 B9   X�9 9 X�K  9  X�K    9 ' B6	 9
9 "B=K  
floor	math
valuepergetAttrIncisCastSkilldefendertargetfindTargetGroupattackermeself  !params  !per  t   9 9   X�9 9 X�  9 BK  findTargetGrouptargetmeidself  params   �  .M$9    X�K  9 9 99 B)  ) M�89*  8  X�89  X�8=  9   99	 *
  9 B9  99	  B9   9	9	
 BX�O�K  idplayEffectAnisetMyTargetGrouplvaddStateisAlive
statefindEnemyGroupsceneContextmetarget�	self  /targets $     k  (   2+  =  K  targetself   �    66   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 2  �L   dispose findTargetGroup STATE_ONPASSIVESTATE_INIT STATE_ONATTACK create 	ctor Skill5106
class	"0$4266Skill5106   