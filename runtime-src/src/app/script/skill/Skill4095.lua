LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill4095.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  Z
-   9 	 
    B  X	�9	 9
 6 ' B9BL  �STATE_ONSETDIEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill4095 self  me  adder  id  lv  needRegStateEvent  logic 
 �  ?r9 9  X:�9 9 99 9B9  X0�9 9	  X,�9 9 99 +  + B  9 '	 B6
  BX� 9	9 +    9 ' B+  9 B	  9	  B	 	 X
	� 9	9 * 9 6 99B	ER�K  
dizzyskillEffectConfig_GameDatalvaddStateifPassiveIsSuciddamagecountSkillDamageipairs	rategetAttrIncfindEnemyGroup
npcIduIdgetSummonerBySummonObjUIdsceneContextmesummonObject
group�N��self  @params  @targets $rate    _ v       	!K  self   �    %6   ' 3 B 3 = 3 = 3 = 3
 =	 2  �L   dispose STATE_ONSETDIED create 	ctor Skill4095
class
"!$$Skill4095 
  