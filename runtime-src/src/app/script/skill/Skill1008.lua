LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill1008.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  @  )  =  *  = K  delayTime	tick����self   �  c-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONREMOVESTATE_ONSECONDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill1008 self  me  adder  id  lv  needRegStateEvent  logic 
 �   /R
9  9 99  +  + B)  ) M�8 9)	�B  9 '	 9
  B8	 99
  +   +  9 9 BO�9   9	9  9 9
 B9   99 + BK  setCanNotActionlvaddStatedelayTimeidcountSkillHeal
valuegetAttrIncplayEffectAnifindFriendGroupsceneContextme						
self  0arr 	'  k value 

     
$+ L self   �  
+V(9   =  9  )  X#�)  =  9 9 99 +  + B)  ) M�8	 9)
�B	  9 '
 9 B8
 99 +   +  9 9	 BO�K  delayTimeidcountSkillHeal
valuegetAttrIncplayEffectAnifindFriendGroupsceneContextme	tick��̙����					self  ,param  ,arr   k value 

 �   :9  9  X
�9 9 X�9  99 + BK  idsetCanNotActiontarget
addermeself  param       	AK  self   �   ! C6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 2  �L   dispose STATE_ONREMOVE STATE_ONSECOND checkCanUse useSkill create 	ctor Skill1008
class"&$8(>:BACCSkill1008   