LJT@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill21761.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self     'm
	-   9 	 
    B  X9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9BL  ĄSTATE_ONBEATTACKEDSTATE_ONADDSTATE_ONBECKONSDIEapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill21761 self  (me  (adder  (id  (lv  (needRegStateEvent  (logic 
 Y   9  9 XK  + =K  
isDiesummonObjectmeself  	params  	 µ   1	9 9   X9 9 XK  9  9B  X9  X 9)’BK  setHuegetLeadertargetmeid	self  params  leader 
 ¾  "š%$9  9 XK  9   9' B9 )   XK    9 ' B  9  B  XK  ) 9   9B6	  9
9	  9		9		9
9+ )
 9  9 9B+ + +  B	  9 '
 B9  
 9B99	 9		)
8	
	)
  ) M
88  X49  9 99  9 )  5 4 89>89>==9  9=9  9=B 99 9 9 , *  , + B 	 X
 99  )9	, *  , + B 9)Ó5  BO
Č9
  
 9
!
B
K  setToDie shoutSkillNameIdplayEffectAniidaddStatefriendlyPartyssrcFriendlyPartys
partysrcParty	tile  lvaddSummonGroup
state
adderdirgetLeader
npcIdgetAllGroupTilesyxterrainsceneContextgetAroundsNodeMapUtilgetTilePositionifPassiveIsSucPergetAttrInc
valuehpgetAttribValuedefendermeĄü	     ####$self  params  hp xrate 
nnpcNumber ftile btarTilesList NnpcId JmyDir Estate A9 9 9i 7group      	KK  self   Š     N6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 2  L   dispose STATE_ONBEATTACKED STATE_ONADD STATE_ONBECKONSDIE create 	ctor Skill21761
class
#I%LKNNSkill21761   