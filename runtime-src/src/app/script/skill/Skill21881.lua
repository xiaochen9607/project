LJT@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill21881.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  Q   )  =  )  = 4  = K  effectlisttotalDamage	tickself   �  'm	-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONREMOVESTATE_ONSECONDSTATE_ONADDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill21881 self  (me  (adder  (id  (lv  (needRegStateEvent  (logic 
 �  ��9 9   X�K  99  X~�  9 B9 9   9 9 9)Z5 ,	
 )��B<9 9   9 9 9)Z5 ,	
 )��B<9 9   9 9 9)Z5	 ,	
 )��B<9 9   9 9 9)Z5
 ,	
 )��B<9 9   9 9 9)Z5 ,	
 )��B<9 9   9 9 9)Z5 ,	
 )��B<9 9   9 9 9)Z5 ,	
 )��B<6 9 BX�9  X�	 9)
 B9  X	�	 96
 9

)} )� ) B
 AER�K  c3bccsetColorsetScaleipairs x�y� x�y� x�y� x�y� x�y� x�y� x�y�playEffectAnisceneContexteffectlistremoveEffectmetargetid														













self  �params  �r  _ v   �  @�19   =  9  )  X8�)  =  9 9 99 +  + B  9 ' B  9 ' B6  BX �	 9
)�)8

 
 X�
"	
	 9
	'
 B
 99 +  	 +  9 B9 6 9)   9	'
 B!
B = ER�K  max	mathtotalDamageidcountSkillDamagehpgetAttribValue
stateipairsPerdamagegetAttrIncfindEnemyGroupsceneContextme	tick��̙����					

self  Atargets .damage *Per &# # #_  v   tdamage curHp  �  	 .D9  9 X�9 9 X�9  9)�8  X�9  9)�8 96 99 B A  9 BK  removeEffecttotalDamageabs	mathcountSkillValue
stateidtargetmeself  params   � 
  /M6  9 BX�9  X
�6  9	 B  X� 9BER�4  = K  checkObjIsNullGameGlobalremoveFromParenteffectlistipairsself    k v   &   V)  =  K  	tickself   �   " [6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 2  �L   dispose removeEffect STATE_ONREMOVE STATE_ONSECOND STATE_ONADD create 	ctor Skill21881
class/B1KDTMYV[[Skill21881   