LJT@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill22101.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  &   )  =  K  	tickself   � 	 0v
-   9 	 
    B  X$�9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONSETDIEDSTATE_ONSECONDSTATE_ONBECKONSDIESTATE_ONADDapp.event.StateEventrequirestateEventRegisterssceneContextnew	Skill22101 self  1me  1adder  1id  1lv  1needRegStateEvent  1logic 
' �   &9 9   X�99  X�9  99  + B9  99  + BK  setCanNotBeAttackedsetCanNotBeSelectedmetargetidself  params   Y   9  9 X�K  + =K  
isDiesummonObjectmeself  	params  	 �  5`#9   =  9  )  X-�  9 ' B9 9 99 +  + + +	 B6  BX�
 99 +   +  9 B
 9	)�B9
)	VV8	  X�
 99 )VV9 BER�)  =  K  lvaddState
stateplayEffectAniidcountSkillHealipairsfindFriendGroupsceneContextme
valuegetAttrInc	tick��̙����						self  6value )targets 
  _ v   �  1f39 9  X�K  9 9  X�K  9 9 99 9 B  X�K  9 9 99 +  + + +	 B)  6  BX�9	 	 X	� ER� X�K  9  9BK  setToDieipairsfindFriendGroupcheckGroupIsMyFriendsceneContextmesummonObject
group self  2params  2targets number   _ v   �   B9   99 + B9   99 + B)  = K  	ticksetCanNotBeAttackedidsetCanNotBeSelectedmeself   �   " H6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 2  �L   dispose STATE_ONSETDIED STATE_ONSECOND STATE_ONBECKONSDIE STATE_ONADD create 	ctor Skill22101
class	!1#@3FBHHSkill22101   