LJN@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\proxy\NewBieProxy.luaú   (=)  =  )  = +  = + = +  = 6 9)  )  B= )  = +  =	 +  =
 + = 4  = 5 = 4  = ) 9  ) M9 )  <OüK  
order  talentGuideheroTrialGuidewushengGuidejunfuGuide
statecanMoveWhenNewBieGuidingneedCheckOnlyLvAfterBattle	mask'canNotClickScreenForSecSchedulerIdnewbieArrowRotationpccnewbieArrowPos%checkBattleEndEffectByNewBieTickguidingsceneContextmaxLvNewBiemaxNewBie		

self  )#  i  ^  $-   9 B 9BL  ÀinitEventnewNewBieProxy self  	proxy  ¡   "6   9    6 ' B96 	  9
 B AK  handleraddHeroapp.event.NewbieEventrequireaddEventEventManagerself   |   	#&6  ' B 9  BK  addHeroapp.script.NewBieScriptEtcrequireself  
object  
params  
 û  
+	6  99)   XK  9 6 998	  X6 ' B 9	BK  talentGuideapp.script.NewBieScriptEtcrequireTALENTnewbieSpecialIdConfig_GameData
ordermaxLvNewBienewBieProxyGameGlobal 	self   )   6	=  K  guiding	self  sw   $   
A9  L guidingself   h   
E X9  ) <X9  +  <K  canMoveWhenNewBieGuidingself  uId  sw        ]K   ¥   a-   9     9  B -   +  =  -   +  = -     X-  B K   ÀÀ'canNotClickScreenForSecSchedulerIdremoveFromParent	maskself cb  à WyO6   99 B  X9  9B+  = 9 
  X6 99 B+  = )   X  X B2 83 6  9	9
 6 96
 9

9


 
6 99 6 996 99B5	 6
 9

)  )  )  )  B
=
	6
 9

)  )  )  )  B
=
	+
   +  )'B	= 3 6 9  B= 2  K  K  performWithDelayGlobal borderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectccsceneContextcreateRectUIManager unscheduleGlobalscheduler'canNotClickScreenForSecSchedulerIdremoveFromParent	maskcheckObjIsNullGameGlobalüÿÿÿ



self  Wsec  Wcb  WmaskCb  7com / Ù   $/k-   9   9    X 6  9    9  B    X6  9    9  B   X K  -     9  B -   9     9  - B X -     9  B K   ÀÀbattleResult%stopCheckBattleEndEffectByNewBiecheckMsgQueueIsEmptycheckMsgSendinggameSocketGameGlobalbattleResultRequestedsceneContext							self star    %j3  9   X6 9 ) B= 2  K  scheduleGlobalscheduler%checkBattleEndEffectByNewBieTick self  star  timeOut     
9  
  X6 99  B+  =  K  unscheduleGlobalscheduler%checkBattleEndEffectByNewBieTickself   Ö  *6  ' B9 99 8 X9 8  X	9   X9 )   X+ L + L maxLvNewBie
ordermaxNewBieapp.script.NewBieScriptrequire self  script  Þ 
 	=o  9  B  XK  9   X)  = 9   X)  = 6 ' B9	  XK  6 ' B9:+ 9 	 X+ ) 9 ) M989	 	 X9	 8	+ XOõ8
  X X  9 BK  8BK  onlyCheckLv
orderapp.script.NewBieScriptskipNewBiedata.Config_SysrequiremaxLvNewBiemaxNewBiegetGuiding 							


self  >script #nextId !hasFound    i 
 ã 	 [¸#  9  B  XK  9   X)  = 9   X)  = 6 ' B9	  XK  6 ' B)  9 )   X6 99  B6	 9
9 X9  8BK  X) 9 ) M989  X	9 8
  X9 8XOñ8
  X6 9 B6	 9
9 X8BK  6	 9 96 99BK  
JUNFUnewbieSpecialIdConfig_GameDataonlyCheckSpecialnewBieProxy
order
levellocalPlayerGameGlobal	modf	mathapp.script.NewbieForLvskipNewBieLvdata.Config_SysrequiremaxLvNewBiemaxNewBiegetGuiding


""""""""#self  \newbieLv AlvIndex @maxLv 	
_  
  i tmpLv _   ¾  5Ý9  
  X6 9  B  X4  =  ) 9  ) M9  )  <Oü9  8	  X+ L + L 
state	next
order 

self  id    i     9ê  9  B  XK  9 )   XK    9  B  X6 ' B9 88 BK  
stateapp.script.NewBieScriptEtcrequire!checkSpecialGuideIsCompletedmaxLvNewBiegetGuidingself  id  newbieScriptEtc  2   =  K  maxNewBieself  arr  id      0	=    X BX)   X  X  9 BK  onlyCheckLvmaxLvNewBie	self  arr  id  cb  bCheck   V   	!9  ) <
  X  BK  
orderself  
arr  
id  
cb  
 «  
5| :  X :
  X:  X6  9:' B6  BH6	 9			 9		 B	FRø:
  X:  X6  9:' B6  BH6	 9			 9			 B	FRøK  addOneHeroByStr;acqResourcelocalPlayerGameGlobal
pairs,
splitStringUtilself  6arr  6results 4arr1 	 	 	k v  arr 	 	 	k v   \   +®=  
  X  BK  maxNewBieself  arr  id  scriptCallBack   ^   +µ=  
  X  BK  maxLvNewBieself  arr  id  scriptCallBack   H    %¼
  X  BK  self  arr  scriptCallBack   b   	-Â9  ) <
  X  BK  
orderself  
arr  
id  
scriptCallBack  
 £   )JÉ6  ' B 96 96 9B6 99 '	 B '
 9 '
  & 9 B 9B6 9 9 6	   9 B	4
 >
BK  handlersendMsggameSocketGameGlobalfinishaddStringmaxLvNewBie,_
orderconcat
tableMODULE_PLAYER_modifyNewbieMODULE_PLAYERmsgTypecreateapp.control.Msgrequireself  *id  *msg spStr str  å   .]Ò
  X+ 6  ' B 96 96 9B6 99 '	 B9
 '  '	 
 &
	 9
 B	 9B6 9	 9
 6   9 B4 >>>BK  !MODULE_PLAYER_modifyNewbieLvhandlersendMsggameSocketGameGlobalfinishaddString,maxNewBie_
orderconcat
tableMODULE_PLAYER_modifyNewbieMODULE_PLAYERmsgTypecreateapp.control.Msgrequire														
self  /id  /cb  /bCheck  /msg !spStr str     1`Þ	6  ' B 96 96 9B6  99 B) <6	 9
 ' B9 ' 9 '	 
 &
	 9
 B	 9B6 9	 9
 6   9 B4 >>BK  &MODULE_PLAYER_modifyNewbieSpecialhandlersendMsggameSocketGameGlobalfinishaddStringmaxLvNewBie,maxNewBie_concat
table
order
cloneTableUtilMODULE_PLAYER_modifyNewbieMODULE_PLAYERmsgTypecreateapp.control.Msgrequire	self  2id  2cb  2msg 'tmpTable "str ids  ¯   /é6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt MODULE_PLAYER_addNewbieItemMODULE_PLAYERmsgTypecreateapp.control.Msgrequireself  id  msg  É Xªð6  ' B 96 96	 9		B6  ' B9 X	6  ' B9 X9	 + =
6 99 '	 B ' 9	 '
  &
 9 B
 9 B
 9 B4 G	 ?	  	 )
 	 ) M
6 8B X 98BX 98BO
ñ 9
B
6
 9


 9

 6   9 B4 >>B
K  handlersendMsggameSocketGameGlobalfinishstring	typeaddIntaddStringmaxLvNewBie,_
orderconcat
tablebattleResultRequestedsceneContextMODULE_INSTANCE_instBattleMODULE_INSTANCEapp.const.Const_MsgType)MODULE_PLAYER_modifyNewbieAndCallFunMODULE_PLAYERmsgTypecreateapp.control.MsgrequireÀ				



self  YscriptCallBack  Yid  Yty  Ycmd  Ymsg Nstr :ids 4arg %n $  i  ï W¤6  ' B 96 96 9B6  ' B9 X	6  ' B9 X9	 + =
6 99 ' B9 ' 9 '	 
 &
	 9
 B	 9
 B	 9
 B4 G ?   )	 
 ) M	6 8B X 98BX 98BO	ñ 9	B	6	 9			 9		 6   9 B4 >B	K  *MODULE_PLAYER_specialNewbieAndCallFunhandlersendMsggameSocketGameGlobalfinishstring	typeaddIntaddStringmaxLvNewBie,maxNewBie_
orderconcat
tablebattleResultRequestedsceneContextMODULE_INSTANCE_instBattleMODULE_INSTANCEapp.const.Const_MsgType)MODULE_PLAYER_modifyNewbieAndCallFunMODULE_PLAYERmsgTypecreateapp.control.MsgrequireÀ				



self  XscriptCallBack  Xty  Xcmd  Xmsg Mstr 9ids 3arg $n #  i  ½ _¼¬6  ' B 96 96	 9		B6  ' B9 X	6  ' B9 X9	 + =
6  99	 B) <6 9	 '
 B9 '	 9
 '  & 9	 B	 9	 B	 9	 B	4	 G
 ?
  
	 ) 
 ) M6 8	B X 98	BX 98	BOñ 9B6 9 9 6   9 B4 >>BK  0MODULE_PLAYER_modifySpecialNewbieAndCallFunhandlersendMsggameSocketGameGlobalfinishstring	typeaddIntaddStringmaxLvNewBie,maxNewBie_concat
table
order
cloneTableUtilbattleResultRequestedsceneContextMODULE_INSTANCE_instBattleMODULE_INSTANCEapp.const.Const_MsgType)MODULE_PLAYER_modifyNewbieAndCallFunMODULE_PLAYERmsgTypecreateapp.control.MsgrequireÀ						



self  `scriptCallBack  `id  `ty  `cmd  `msg UtmpTable Astr :ids 4arg %n $  i  î XªÌ6  ' B 96 96	 9		B6  ' B9 X	6  ' B9 X9	 + =
6 99 '	 B9 ' 	 '
  &
 9 B
 9 B
 9 B4 G	 ?	  	 )
 	 ) M
6 8B X 98BX 98BO
ñ 9
B
6
 9


 9

 6   9 B4 >>B
K  +MODULE_PLAYER_modifyLvNewbieAndCallFunhandlersendMsggameSocketGameGlobalfinishstring	typeaddIntaddString,maxNewBie_
orderconcat
tablebattleResultRequestedsceneContextMODULE_INSTANCE_instBattleMODULE_INSTANCEapp.const.Const_MsgType)MODULE_PLAYER_modifyNewbieAndCallFunMODULE_PLAYERmsgTypecreateapp.control.MsgrequireÀ				



self  YscriptCallBack  Yid  Yty  Ycmd  Ymsg Nstr :ids 4arg %n $  i  Ö	  B E æ6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 3' =& 3) =( 3+ =* 3- =, 3/ =. 31 =0 33 =2 35 =4 37 =6 39 =8 3; =: 3= =< 3? => 3A =@ 2  L   "send_modifyLvNewbieAndCallFun 'send_modifySpecialNewbieAndCallFun !send_specialNewbieAndCallFun  send_modifyNewbieAndCallFun send_addNewbieItem send_modifyNewbieSpecial send_modifyNewbieLv send_modifyNewbie 0MODULE_PLAYER_modifySpecialNewbieAndCallFun *MODULE_PLAYER_specialNewbieAndCallFun +MODULE_PLAYER_modifyLvNewbieAndCallFun )MODULE_PLAYER_modifyNewbieAndCallFun  MODULE_PLAYER_addNewbieItem &MODULE_PLAYER_modifyNewbieSpecial !MODULE_PLAYER_modifyNewbieLv MODULE_PLAYER_modifyNewbie onlyCheckSpecial !checkSpecialGuideIsCompleted onlyCheckLv 
check newBieIsFinished %stopCheckBattleEndEffectByNewBie !checkBattleEndEffectByNewBie canNotClickScreenForSec  setCanMoveWhenNewBieGuiding getGuiding setGuiding checkForHeroLvGuide addHero initEvent create 	ctorNewBieProxy
class        $ " ( & 4 + ? 6 C A K E h O ~ j     ¬  Û ¸ è Ý ê -3.:5@<GBPI\Rg^nip©É¬åÌææNewBieProxy B  