LJT@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill21931.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  H   +  =  +  = K  srcFriendlyPartyssrcPartyIdself   �  d-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONADDSTATE_ONATTACKapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill21931 self  me  adder  id  lv  needRegStateEvent  logic 
 �  W�9 9  XR�99  XN�9
 XK�9  99 + 9 B9 99 8
  X<�9  9+  B9 9	= 4  =
 ) 9 9 ) M�9
 9 98<O�9 9 9 9 99 B)  ) M�
  9 8 BO�9 =  9 9 9 B  9 9  B  9 9 9 9BX�* = K  curDurationremoveFriendlyPartysinsertFriendlyPartysfindFriendGroupsceneContext
partyfriendlyPartyssrcFriendlyPartyssrcPartysrcPartyIdsetMyTargetGroupbPuzzled
addersetPuzzledisCastSkillidmetarget�����	


self  Xparams  X(  i resultPartyId 	"frGroup   i  � 
 B4+ ) 9  ) M�9 8 X�+ X�O� X
�6 99 6 99	 B  BK  	maxninsert
tablefriendlyPartys		









self  group  id  has   i  �   >B
+ 9   X�K  ) 9  ) M�9 8 X�6 99
  BX�O�K  remove
tablefriendlyPartys
self  group  id  has   i 
 �   (WO9  99   99 + 9 B9 
  X�9  9 =9  9 =9  9 9	9  B)  ) M�	  9
 8
 BO�9   9+  BK  setMyTargetGroupremoveFriendlyPartysfindFriendGroupsceneContextsrcFriendlyPartysfriendlyPartyssrcPartyId
adderidsetPuzzled
partyme					self  )resultPartyId &frGroup   i  �     a6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 2  �L   dispose removeFriendlyPartys insertFriendlyPartys STATE_ONADD create 	ctor Skill21931
class	3@4LB_OaaSkill21931   