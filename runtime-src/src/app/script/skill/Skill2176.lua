LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2176.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self     'l
	-   9 	 
    B  X9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9BL  ÀSTATE_ONBEHEALEDSTATE_ONBEATTACKEDSTATE_ONABNORMALSTATEapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2176 self  (me  (adder  (id  (lv  (needRegStateEvent  (logic 
   
 +9 9  XK  96 ' B99 XK  9  XK  + =9  99	BK  stateIdremoveStateabnormalStateREVIVEDONABNORMALSTATE_TYPEapp.event.StateEventrequire	typemetargetself  params   ¹	  &+9  9 XK  99 XK  9   9' B9 )   XK  9   XK    9 ' B  9	  B  XK  + = ) 9   9
B6  99	  9		9		9
9+ )
 9  9 9B+ + +  B	  9 '
 B9  
 9B99	  9		)
8	
	)
  ) M
>8  X:+ = 9  9 99  9 )  5 4 89>89>==9  9=9  9=B+ =  99  )U9 , *  , + B 	 X
 99  )9	, *  , + B 9 )Ó5" 9! =#BO
Â9
  
 9
$
)  B
+
 =
% K  isEnabled
setHpshoutSkillNameId  idplayEffectAniaddStatefriendlyPartyssrcFriendlyPartys
partysrcParty	tile  lvaddSummonGroup	bRet
statedirgetLeader
npcIdgetAllGroupTilesyxterrainsceneContextgetAroundsNodeMapUtilgetTilePositionifPassiveIsSucPergetAttrInc
_bRun
valuehpgetAttribValuesummonObjectdefendermeÀü




                         !!""""""""""##$$$$$$$$$$&&&&&&&)))))**+self  params  hp rate ynpcNumber 
otile ktarTilesList WnpcId SmyDir Nstate J? ? ?i =group  Õ   +J	9  9 XK  9   XK  )  =9   9)  B9   9B9   9+ BK  updateHeadHpsetToDie
setHp
valueisEnableddefenderme	self  params       	UK  self   Ö    X6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 2  L   dispose STATE_ONBEHEALED STATE_ONBEATTACKED STATE_ONABNORMALSTATE create 	ctor Skill2176
class
HSJVUXXSkill2176   