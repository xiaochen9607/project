LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2158.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  (   +  =  K  targetself   Ê 	 0u
-   9 	 
    B  X$9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9BL  ÀSTATE_ONREMOVESTATE_TILECHANGEDSTATE_ONADDSTATE_ONPASSIVESTATE_INITapp.event.StateEventrequirestateEventRegisterssceneContextnew	Skill2158 self  1me  1adder  1id  1lv  1needRegStateEvent  1logic 
'   ! Ñ9 9   XK  99  XK    9 ' B9 9  X9 9 XK  ) 9  9B6  99 99	9	
9
+ )
 9 9 9B+ + +  B  XK  9  9B99 9	 99
 9   9 ' B 5 4 :9
>:9>==9 9=9 9=B= 9 	 99
 9  9 , + B9 99  8  XK  9 
 9' )MTB=9 
 9B9 
 9)5 9  = B9 
 9)BK  shoutSkillNameId  playEffectAnirefreshBufferValueatkgetAttribValue	_atk
stateaddStatefriendlyPartyssrcFriendlyPartys
partysrcParty	tile  
note1lvaddSummonGroupdirgetLeadergetAllGroupTilesyxterrainsceneContextgetAroundsNodeMapUtilgetTilePosition
npcIdgetAttrIncmetargetid			
self  params  summonedId qnpcNumber 
gtile ctarTilesList OmyDir 	Fstate * Å   7k09 9   XK  99  XK  9   XK  9 9 99 ) + + +	 B6  BX
 99 )MT9 B9	)	MT8	  X	9	
  	 X
9	 	 9		' )MTB	=	
 9	B	ERæK  refreshBufferValueatkgetAttribValue	_atk
statelv
adderaddStateipairsfindFriendGroupsceneContextmetargetid										


self  8params  8targets   _ v  state 	 ò 
  Qy?9    XK  9 9 99 9 B  XK  9 9  XK  9  9B9  9B6  9  B)  X!9 9)MT8  X&9  9	9
 )MT9	 B9 9)MT8  X9   X9
  9' )	MTB= 9BX9 9)MT8  X9  9)MTBK  removeStaterefreshBufferValueatkgetAttribValue	_atklv
adderaddState
statedisForTileMapUtilgetTilePositionsummonObjectcheckGroupIsMyFriendsceneContextmetarget				

self  Rparams  RmyTp :hisTp 6state  ¨   #OU
9  9 X9 9 XK  9  9 99  +  + + +	 B6  BX	9)	MT8	  X	
 9)MTBERõK  removeState
stateipairsfindFriendGroupsceneContextidtargetme
self  $params  $targets   _ 	v  	 (   b+  =  K  targetself   î   ! e6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 2  L   dispose STATE_ONREMOVE STATE_TILECHANGED STATE_ONADD STATE_ONPASSIVESTATE_INIT create 	ctor Skill2158
class
.=0S?_UdbeeSkill2158   