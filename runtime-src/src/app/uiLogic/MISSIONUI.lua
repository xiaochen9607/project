LJN@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\MISSIONUI.lua°   '+  =  +  = +  = +  = +  = +  = +  = +  = +  = +  =	 + =
 +  = + = )  = 4  = K  curJifenRewardGetcurJifenenteringtickercanTouch	pos2	pos1
curIddelayScheduleId	btn2	btn1
itemscurNodeBtncommonBakLogic	view		

self    {    ,6     9  +  6 ' B99B K  	nameMISSIONUIdata.Config_UIrequireremoveUIUIManager $    /-   B K  ÀcloseIt       7K   ÿ 
 ?x?  X(9   X%9 :  X!9 : X6  99 :' + B-  4  =6  BH-  9+	 <	FRú-  9 :=-   9B-   9	B-   9
- 9B-   9B-   9-  9BK  À 
type1updateItemstip	BOTHrefreshSortisShowDailyrefreshJifencurJifen
pairscurJifenRewardGet,
splitStringUtil-1
param									



logic MISSIONTYPE target  @obj  @tmp   k v   u   Z-   9   -  9+ < -     9  B K  ÀrefreshJifennewJifenGetcurJifenRewardGetlogic    	D_r-   9   	   X -   9  
  X -   + = K  -   9  4  6  9- 8 ' + B 6 9 9- 8 , + B-  -  9 =-  9	 X6 9 9	- 9
:B6 9 9- 9
:B-  9  X6 9-  9BK    ÀunscheduleGlobalschedulerretryScheduleIdsetPlayerExp
paramsetPlayerLvacqResourcelocalPlayerGameGlobal_
splitStringUtil	tickexpGet
type1 					



logic tmp param i 6res 5 L   -   B -  + =  K     canTouchgetMissionInfo logic  é7ÒØ^A9 :	  XÌ9 :	  X-  9 :	=-   9B-   9B-   9B6 9 9B4  9 : X(6	  9
9 :' B ) 6 9 B) M6 9	 96
 ' B
9

8B6 '	 B	 98
6 996 99BOèX6	  9
9 :' B -  6 9 B=3 -  6 9 * B=6  9-  9 B X-  9  9!'" B 9!'# B 9$+ B3% -  6 9' * B=&-  9  9(B-  9  9)B6* 9+ 9,*	 6
* 9
-
 B
 A6* 9.	 9,
 B-  9 
 9/ B* -	  9	0			  X	* 6	 '1 B		 9	,	 + + B		 9
2	+  + B
-
  9
3

 9
4
	 B
	 9
5	-  93 9!'6 B 9(B-  93 9!'6 B 9)BB
2 2  K  À	ÀImage_47setPositionaddChild	view	initapp.sprite.SkillAni
type1runActionSequencepcreateMoveToccgetPositionYgetPositionXperformWithDelayGlobalticker setVisibleButton_1	nodegetChildByNamecurCellcheckObjIsNullscheduleGlobalschedulerretryScheduleId 	tick,techItemsfactioncurTalentInfotalentProxycreateOneHeroByStrapp.proxy.vo.Hero	HEROapp.const.Const_ItemTyperequireacqResourcelocalPlayer	nums
table;
splitStringUtil!send_getPlayerSomeInfoChangeloginProxyGameGlobalisShowDailytiprefreshJifencurJifen
paramµæÌ³æýÿÈÚØ
%'''''''))))))))**************/222222233333444445555555555566666677777789999:<<<<<<<<<=====>>>>>>???????????????????????AAlogic getMissionInfo target  Óparam  Ótmp ±  i hero  callBack delayTime Xx Ly GactionSeq <sq 6aniNum /effect ! Q    ¨6   9    9  B K  send_getAchieveInfomissionGameGlobal ô   ±6     9  -  9 9B6 ' B99+  5
 6 9	=B K  Àstr heightú
widthÔmissionIntroConfig_GameData	nameSIGNINTROdata.Config_UIrequiregetParent	view
addUIUIManagerlogic  ¬F Ô-   9 B= 9B- 9=
  X9 X- 9=6 9	 9
'	 B 9B	 9
'
 B	 9B A=6 9	 9
'	 B 9B	 9
'
 B	 9B A= 99B3 3 6  99	6
 9

6 99 6 99 6 996 99B
5 6 9)  )  )  ) B=6 9)  )  )  )  B= B9	 9
'
 B
 9B
 9B6 
 9  5! ="B3# 6	 	 9	 	 9
'$ B5% ="B	6	& 	 9	'	 6( 9)6* '+ B9,6-  9B A	9		 9	
	' B		 9	.	+ B	 9	/9B	3	0 3
1 32 6&  9' 6( 936* '4 B95	 B6&  9' 6( 936* '4 B96 B6&  9' 6( 936* '4 B97	 B6&  9' 6( 936* '4 B98 B6&  9' 6( 936* '4 B99	 B6&  9' 6( 936* '4 B9: B6&  9' 6( 936* '4 B9;
 B3< 6&  9' 6( 9=6* '> B9? B6( 93 9@B6( 93 9AB 9B9B3C 6  9 9 9
'D B5E ="B2  L ÀÀ  wenhao updateBtnStatesend_getAchieveInfosend_getMissionInfochangeLvapp.event.LocalPlayerEventlocalPlayer getActiveRewardacqMeanMissionRewardgetMeanMissionInfoacqAchieveRewardgetAchieveInfoacqMissionRewardgetMissionInfoapp.event.MissionEventmission   updateItemssetBrighthandlergetPlayerSomeInfoChange"app/event/LoginProxyEvent.luarequireloginProxyGameGlobaladdEventEventManager  Image_16 callBack  widgetTouchExtentisShowDailytip
closeborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcreateRectUIManager  refreshSortButton_2	pos2getPositionYgetPositionXButton_1getChildByNamepcc	pos1ACHIEVEisAchieveMISSION
type1layout	viewnewüÿÿÿ


















:>MISSIONUI MISSIONTYPE self  ¡view  ¡param  ¡logic closeIt 8äcb ãrect *¹bt ´doNothing ¦getMissionInfo 'getActiveReward ~acqMissionReward }needSend U(cbIntroduce  Ð 	  H·	  X-   9 6 9B 96 96 9B9  9	 B 9
' BX9  9' BK  ÀremoveChildByNamebeginBoxsetNameaddChild	viewCenterYCenterXUIManagersetPosition	bxbhConfig_LanguagecreateUI
begin	REWARDBOX self  !type  !items  !node 
 Ð   (ù 6   9    9  6 -  - 89B A -  6 -  - 89B= K  ÀÀ ÀnewJifenGetconditiontonumbersend_getActiveRewardmissionGameGlobal                    jifenReward i self   3Á@4  )ÿÿ) ) 6   ) M6  896	 9		9			 X XOõ	 X6   ! X!    ) M6 9
 6  8BOù9  9'	 B 9
9 B9  9' B 99 B)  ) M×9 6	 89B	8	  X	@9 
 9'  &B
 9+ B9 
 9'  &B  X¹6 '
 B
 9* + + B 9	+  + B	9	 	 9		 B	 9	* B	 9	'  &B	 9	9  9'  &B 9B)9 B	X9 
 9'  &B
 9) B6 8
9

B9	 	 XR6 '
 B
 9* +  + B 9	+  + B	9	 	 9		'  &B		 9		 B	 9	)ÿÿB	6	 9			 9		6 9  9) )´ B6 9  9) )hB A	6
 9
!

 9

	 B
 9"
 B 9)\ )P B 9'# B6$  9%9  9'  &B5' 3& =(BX)6$ 
 9%9  9'  &B5+ 6)   9* B=(5, =-5. 6)   9* B=(5/ 890>=-, ) +  51 6)   9* B=(52 =-B
2 O)2  K    
ended  acqItems  
begin  
param  
ended  showBaoXianghandlercallBack   widgetTouchExtentUIManagericonAni4runActionRepeatForeverRotateToSequenceccsetLocalZOrdergetPositionXsetPositionsetNamesetScaleaddChild	initcreateapp.sprite.SkillAnirequirebaoxiangshansetVisibleButton_bxconditiontonumbercurJifenRewardGetsetPercentLoadingBar_1curJifensetStringText_jifenjindugetChildByName	viewinsert
table
levellocalPlayerGameGlobalrewardDemandLevelConfig_Livenessþÿÿÿæÿä              !###########%%%%%%%---------.....///////////000011111111111111111112222223333444445555888888888888888:::::::::::::::::::::::::::::::::::::::::=@@self  jifenReward startId rewardNum   i 
  i Ø Ø Øi Õeffect83 %"effect >Hrotation '!action  ß  7W6  996 9999 X-  9	= 9
  9' B9
  9' B 99 B 9+ BX9
  9' B9
  9' B 99 B 99 B 9+ BK  À	pos2setVisible	pos1setPositionButton_2Button_1getChildByName	viewACHIEVE
type1lvdailyQuestopenLvsnewBieConfig_GameData
levellocalPlayerGameGlobal				



MISSIONTYPE self  8bt1 bt1  ® 
  .?
4  6   9  ' + B 4  6   9 ' +	 B :: X6 :896 :89  X+ X+ L X::  X+ X+ L K  sortIndexConfig_Mission_
splitStringUtil
a  /b  /m -n 	$ ® 
  .?º
4  6   9  ' + B 4  6   9 ' +	 B :: X6 :896 :89  X+ X+ L X::  X+ X+ L K  sortIndexConfig_Achieve_
splitStringUtil
a  /b  /m -n 	$ ÷ 
  (9Ô
4  6   9  ' + B 4  6   9 ' +	 B :: X	::  X+ X+ L X::  X+ X+ L K  _
splitStringUtil
a  )b  )m 'n 	 Ü $óÐU  X	 XM6  99
  XF6  99 XA4  = 6  96  99' B= ) 6	 9
9 B) M(6  99	 8		'
 + B6 '	 B:89 X6 :896  99 X+   X6	 99
 6	 9
9 B 9 8BOØ6	 99 3 B) X4  =  X	 XX6  99
  XQ6  99 XL6  96  99' B= 4  = ) 6	 9
9 B) M36  99	 8		'
 + B6 '	 B:8  X6 	 9'
 :&

B6 '	 B:89 X6 :896  99 X6	 99	 6
	 9


9 B

 
9 8BOÍ6	 99 3 B) X4  =  X	 XA6  99 X96  99
  X46  96  99' B=  4  =! ) 6	 9
9  B) M6  99	  8		'
 + B6 '	" B:89 X6	 99	! 6
	 9


9! B

 
9  8BOä6	 99! 3# BX4  =! ) K   data.Config_MeanMissionmmi	mmi1meanMissionInfo Config_Achieve
id = addMessageFloatMessagedata.Config_Achievemimi1achieveInfo 	sortinsert
levellocalPlayerneedPlayerLvConfig_Mission	typedata.Config_Missionrequire_	nums
table,
splitStringUtilai1aimissionInfomissionGameGlobalþÿÿÿ		










         !!"""""""########$$$$$$$%%%%%%%'''''''''''''''''((((((((((("+++5+6688;;;;<<<<<<<<<<=========>>???????@@@@@@@@AAAAAAAABBBBBBBBBBB?EEEOEOQQSUself  ôflag  ô ) ) )i 'tmp need a  "4 4 4i 2tmp *a 1 "  i tmp a   ÿ  
 }å) 6   96 '	 B9B  9B	 9B 6	 	 9		9	      )  )x ) B	K  	viewmoveFontAniUIManagergetPositionYgetPositionXcapp.const.Const_colorDatarequireconvertHexToRGBDisplayObjectUtilself   node   str   fontSize color hero_progress_bar positionX positionY expName    ¢«î6  99	  X9  9' B 9' B 9+ BX9  9' B 9' B 9+ B6  99	  X9  9'	 B 9'
 B 9+ BX9  9'	 B 9'
 B 9+ B9  9' B 9+ B6  996 ' B9999 X9  9' B 9' B 9+ B9  9' B 9+ BX	9  9' B 9+ B6  996 ' B9999 X9  9'	 B 9+ B9  9'	 B 9'
 B 9+ BX	9  9'	 B 9+ BK  lvdailyQuestopenLvsnewBiedata.Config_GameData.luarequire
levellocalPlayertishi3tishi2Button_2achievementsetVisibletishi1Button_1getChildByName	viewmissionloginProxyGameGlobal													self  £ °  >c-   9     9  ' B -  9  9' B- - 9 X-  9 9+ B-  9 9+ BX- 	  X-  9 9+ B-  9 9+ BX- 	 X-  9 9+ B-  9 9+ BK   ÀÀ  	btn2setBright	btn1ACHIEVEButton_2Button_1getChildByName	view						






self type MISSIONTYPE btn1 8btn2 2   @M£-  + =   X-  9 9+ B-  9 9+ B-  ) =-   9BX&  X-  9 9+ B-  9 9+ B-  ) =-   9BX-  9 9+ B-  9 9+ B-   9BK   ÀButton_2makeList
type1	btn2setBright	btn1Button_1canTouch			




self name  A  'i=3  9   X9  9' B9  9' B3 = 6  9		 5

 =
5 =
B= 6  9		 5
 =
5 =
B B2  K  À  Button_2  	btn2
param  Button_1callBack  widgetTouchExtentUIManager	btn1 Button_2Button_1getChildByName	view	btn3 456666666667888888888<<==MISSIONTYPE self  (type  (update &btn1 btn2 endedCallBack  Û   *Ë9    9 B9  9' B
  X9  9' + B  9 BK  makeListremoveChildByNameScrollViewBggetChildByName	viewclearNodesEvent
itemsself  type  arr  p  )æ-  9  9B9K    ygetContentOffset_tableviewself table_view  cur_offset_x  à 7Qì)  -  9 	  X-  9
  X-6 9-  9B -  9>X#-  9 	 X-  9
  X6 9-  9B -  9>X-  9 	 X-  9
  X	6 9-  9B -  9>L   mmimicellNum	nums
tableai
type1						


self table_view  8nums 6 U  -   9    D   tableCellAtIndexself table_view  idx   .    ) ) J table_view  idx   	 #§Õ;-   9      X 2 -   9     X-   9    9  B 2 xX u-   9     9  ' B   9  ' B -  6 9 96 9		  9
 B9 
  9
 B9B A=-  9 96 9B-  9 96 9B-  9 9  9 B  9 BB-  9 9B-  9 9' B-  9  9-  9B-  9 93 6 9B-  9 93 6 9B-  9 93 6 9B-  9 93 6 9 B-  9 9B-  9 9!B9"K  K  K   ÀxgetContentOffsetTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildscrollViewsetNamesetDelegategetPositionYgetPositionXsetPositionTABLEVIEW_FILL_TOPDOWNsetVerticalFillOrder"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewccImage_143Image_144getChildByNamereloadData_tableview	view2¾


















***----///-1111333155555666666;self back_sp kcur_offset_x k  Ã  ÓC4  =  3 9   X6 9 *  BX9   X B2  K  _tableviewperformWithDelayGlobalschedulernotFirstOpen cellNumµæÌ³¦þ=>>>??????@@@AACCself  cb  Ø  Unù-   9     X K  -   -  9' B 9B 9B= -  - :8  9    X ;-  - :8  9     X -  - :8  9    X -  - :8  9  	  X -     9  B 6 	 '
 B   9  - - :895 - - :89=B X -     9  B 6 	 '
 B   9  - - :89B K   À
id  conditionswitchToapp.utils.SwitchScenerequirecloseIt	type-1
scenegetParentButton_1getChildByNamecurCellcanTouch



self node typeTable tmp  ü  _x%-   9     X K  -    9  ' B   9  + B -   -  9' B 9B 9B= -    9  ' B   9  B -   - - :89= -   + =	 6 
   9  ' B -   9  	   X -   + =  6  9    9  - :B X -   9  	  X -   + =  6  9    9  - :B X -   9  	  X 
-   + =  6  9    9  - :B K   À
send_acqMeanMissionRewardsend_acqAchieveRewardsend_acqMissionRewardmissionGameGlobal
type1sound/task.mp3playEffectSoundManagerexpGetacqPlayerExpexpgetWorldPositiongetParentcurCellsetTouchEnabledButton_1getChildByNamecanTouch        !!!!"""#######%self node typeTable tmp  þ X·¥ 9 B+    XE 9' B  9' B 9' B 9' B 9+ B 9' B 9' B 9'	 B 9
' B 9' B 9
' B 9' B 9
' B) ) ) M 9	'  &B		 9		+ B	OõX6  9' B 6 9 9B  9' B 9 B, )  +  9	 		  X	9 6	 ' B		 ' X	9	 		 X	9 6	 ' B		 ' X		9	 		 X	9 6	 ' B		 '  	 		 X
9
!  
 X
6
" 
 9
#
6 6 '$ B9%5) 6& 9'9(=(9* =*= +B
+
 =
! 4
  6,  9-8	'. + B
  9'/ B 90'1  '2 &63 9495B 9' B 9'6 B 90:
8963 9495B4  6,  9-:
897'8 B ) )  4  :
8979 X6: 9; B 9 	  X$:
89<)   X 9' ) &B 9+ B6 '= B 9> 9' ) &B5? :
89<>+ B)  9 	  X4:
89@)   X. 9'  &B 9+ B6 '= B 9> 9'  &B5A :
89@>+ B 9'  &B 9' B 90'B ) B   :
8979 X1  ) M- 9'  &B 9+ B9 	  X6 '= B 9> 9'  &B! 8+ BX6 '= B 9> 9'  &B8+ BOÓ ) ) M 9'  &B 9+ BOõ:
89C9 X:
	 X 9' B 9+ B 9'	 B 9
:
89(B 9' B 9
:
89DB:
	 X< 9' B 9E'F ) B 9' B 9G'H ) B 9' B 9
6,  9I:
B'J 6,  9I:
B&B 9' B 96 'K B:B6  9L 9' B5N 3M =OBXX:
	  XU 9' B 9
6 'K B:B 9' B 96 'K B:B6 'P B 9>* + + B 9Q+  + B 9' B 9' B 9 B 9R6 9S)C )! B A 9' B 9E'T ) B 9' B 9G'U ) B6  9L 9' B5W 3V =OB2  L    common_anniu4up.pngcommon_anniu4down.pngpsetPosition	initapp.sprite.SkillAnicallBack   widgetTouchExtentdata.Config_Language/setUnitsForMyriadcommon_anniu3up.pngloadTextureNormalcommon_anniu3down.pngloadTexturePressed	desc
scenemission_jifen.png  ¾êactiveValue  ½êcreateapp.uiLogic.ICONacqPlayerExp	nums
table-1,acqItemsImage_15plistTypeTextureResType	ccui	.pngmission_loadTextureleixing_
splitStringUtil
logic	view  	nameMISSIONUIConfig_UIINITCOMPLETEapp.event.UIManagerEventsendEventEventManagernotFirstOpenzhuxiandata.Config_MeanMissionmmizhixiandata.Config_Achievemirichangdata.Config_Missionrequireai
type1addChildsetNamenewTableViewCellccui/mission/MissionItem.luagetNodeFromCacheUIManager	icon
State	DescsetString	NamesetTitleTextsetVisibleeffectremoveChildByNameButton_1	nodegetChildByNamedequeueCell ê								







    !!"""#$$$$%'((((()))))))))))))))))**,--------//////////////0000111111111111134444444445678888899999<<<<<<<<<==========>>>>>>>>>>>>>>>>>>?@BBBBBBBBBCCCCCCCCCCDDDDDDDDDDDDDDDDDDEEEEEEEEEEEEEEEFGGJJJJJKKKKLLLLLLLLLLMMMNNNNNNNNNNNNNNNNNPPPPPPPPPPPPPPKTTTTUUUUUUUUUUTWWWWWWWWXXXXXXXX[[[[[[[[[[\\\\\\\\\\]]]^^^^^^^^^_________```````````````````aaaaaaaaaaabbbbbbbbppbqrrrssssssssssstttttttttttuuuuuuuuuvvvvvwwwwxxxxxxxxyyyyyyyyzzzzzzzzz{{{{{{{{{||||||||¡¡|¤¤self  ¸table_view  ¸idx  ¸_cell ´node ³:  i 
type !×typeTable  ×flag Öleixing Õindex ·tmp acq (östartPos 
ìendPos ëcurItemsPos êp. . .i ,iconLogic  iconLogic    i 
effect 6   +¾9  	  X6 9 9 BX9  	 X6 9 9 BX	9  	 X6 9 9 BK  send_acqMeanMissionRewardsend_acqAchieveRewardsend_acqMissionRewardmissionGameGlobal
type1self  id       	ÇK  self   ¡   É6   99  9B6 ' B99BK  	nameMISSIONUIdata.Config_UIrequiregetParent	viewremoveUIUIManagerself      )Í9    XK  6 99  B)  ) MOÿK  	maxn
tablecurNodeBtnself  len 	  i   Ç   .6Ô9    X6 99  B9   X6 99 B9   X6 99 B6 9 9B6  9	  B  9
 B+  = +  = 6  9B 9BK  showTexCacheInfogetResourceManager
items	viewclearNodesEventremoveEventsEventManager!send_getPlayerSomeInfoChangeloginProxyGameGlobalretryScheduleIddelayScheduleIdunscheduleGlobalschedulerticker		

self  / Á  ) 4£ æ6   ' B 6 ' B6  ' B6  ' B 9B5 3	 =3
 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3  =3" =!3$ =#3& =%3( ='2  L  dispose clearNodesEvent closeIt layout getReward tableCellAtIndex makeList updateItems updateBtnState tip moveAndFade refreshSort isShowDaily refreshJifen showBaoXiang  	ctor MMISSIONACHIEVEMISSION	BOTHcreatesrc.app.sprite.Shadersapp.uiLogic.REWARDBOXMISSIONUI
classdata.Config_UIrequire                  ¶  À · Á dmenÉÒËÓ¼Æ¾ÈÇËÉÓÍåÔææuiConfig 1MISSIONUI .REWARDBOX +shader %MISSIONTYPE $  