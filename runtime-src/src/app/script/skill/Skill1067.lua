LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill1067.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  8   ) =  )  = K  hpvalue	tickself   �  c-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONREMOVESTATE_ONSECONDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill1067 self  me  adder  id  lv  needRegStateEvent  logic 
 �   8Z9  9 99  +  + B9   99  9 9 B6  BX�	 99
  9 9 B	  9 9
   B  X�	 99
  )�)9 6 9	9
B	 99
 BER�9   9+  5 9 =BK  shoutSkillNameId  playEffectAni
chaosskillEffectConfig_GameDataifSkillIsSucipairslvidaddStatefindEnemyGroupsceneContextme







self  9enemys 	0
  _ v   �  
 8%9  9  X�99  X�99   X�6 9  9 ' B9 "B9   9	9  +   +	  9
 BK  countSkillHealhpvaluePergetAttrInc
floor	mathtargetid
addermeself   params   value 	 �  	'I,9  9  X"�9 )  X�)  =   9 ' 9 9  B9   99 +   +	  9
 B9 99 8  X� 9 B9  = K  addValue
stateidcountSkillDamagedamagegetAttrInc	tick
adderme��̙����self  (params  (damage state  S   ;9  6 9 B =  K  abs	mathhpvalueself  	value  	 4   ?  9  D checkPassiveCanUseself   &   D)  =  K  	tickself   �   # H6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 2  �L   dispose checkCanUse addValue STATE_ONSECOND STATE_ONREMOVE useSkill create 	ctor Skill1067
class#*%9,=;A?FDHHSkill1067   