LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill5109.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  7   + =  )  = K  	tickisUsedself   � 	 0u-   9 	 
    B  X$�9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONSECONDSTATE_ONABNORMALSTATESTATE_ONATTACKSTATE_ONPASSIVESTATE_INITapp.event.StateEventrequirestateEventRegisterssceneContextnew
Skill5109 self  1me  1adder  1id  1lv  1needRegStateEvent  1logic 
' �  "=9  9  X�K  )   X�)  9   9 B9   9B  X�K  9  X�K   9	  X�+ X�+ BK  setVisiblegetLeadersetOpacityisAliveme self  #opacity  #leader  �   !<#9  9 X�9 9 X�+ = 9   99 + B9   99 + B)�   9  B9   99 BK  playEffectAnisetGroupOpacitysetCanNotBeAttackedsetCanNotBeSelectedisUsedidtargetmeself  "params  "opacity 	 �  
 )59 9  X�K  9 X�K  96 ' B99 X�K  9  99	 BK  idremoveStateBESNEERONABNORMALSTATE_TYPEapp.event.StateEventrequire	typeabnormalStateme
adderself  params   m   <9  9 X�K  9   99 BK  idremoveStateattackermeself  params   �   A9    X�K  + =  9  99 + B9  99 + B  9 )� BK  setGroupOpacitysetCanNotBeAttackedidsetCanNotBeSelectedmeisUsedself   ~  I9   =  9  9  X�K  9  99 BK  idremoveStateme	time	tick�self  param   ,   P  9  BK  
abateself   �   % T6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 2  �L   dispose STATE_ONSECOND 
abate STATE_ONATTACK STATE_ONABNORMALSTATE STATE_ONPASSIVESTATE_INIT setGroupOpacity create 	ctor Skill5109
class
!3#:5?<GAMIRPSSSkill5109   