LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill4605.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  Z
-   9 	 
    B  X	�9	 9
 6 ' B9BL  �STATE_ONCRIRESULTapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill4605 self  me  adder  id  lv  needRegStateEvent  logic 
 R   $-     9   - 9B K  	� �idplayEffectAnitmpTarget self  � E�9  99 8  X	�9   99  9 9 , *	  B)
 9  9 99  +  + B* +  )  ) M%�	 		 X	�:X	
�6	 	 9		)  B	8	  X	�:  X	�	  9
	9  +    9
 ' 9   B+  9  3 B
	2	 �O�2  �K   damagegetAttrInccountSkillDamagerandomBattleRandomfindEnemyGroupsceneContextlvaddStateid
stateme��I��̙������̙����			

self  Fnumber 5enemys -delayTime ,target +& & &i $tmpTarget  � 	 	 #4,9 9  X�K  99  X�K  9  X�K  99  X�K  9  X�K  9  9  9 ' B  X�)  BK  
valuegetAttrIncmodifyMorale
isCriidskillIddefendermeattackerself  $params  $ 4   5  9  D checkPassiveCanUseself       	:K  self   �    <6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 2  �L   dispose checkCanUse STATE_ONCRIRESULT useSkill create 	ctor Skill4605
class
*3,75;:<<Skill4605   