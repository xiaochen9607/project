LJV@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\ARENAWUSHUANGRANK.luaP   4  =  4  = ) = K  curStagerewardrankPlayerself    	 J
-   9 B=6 99=9= 9B 9B6 9 99BL  Àsend_getCompetRank	initinitEventcurStagecompetitionArenaProxyGameGlobal
stage	viewnew	ARENAWUSHUANGRANK self  view  params  logic  ô  *96   99 6 96  99 6  99 6	  9		9				6
  9

9



B5	 6 9)	  )
  )  ) B=
6 9)	  )
  )  )  B=BK  borderColorfillColor borderWidth	nameARENAWUSHUANGRANKc4fheight
widthActualDesignSize	rectcc	viewcreateRectUIManagerüÿÿÿ
self  +rect * ×   6   9  6 96 ' B96 	  9
 B AK  handlergetCompetRank$app.event.CompetitionProxyEventrequirecompetitionArenaProxyGameGlobaladdEventEventManagerself      *"
  X
 )   X9  9 <  9 BK  initTablecurStagerankPlayerself  object  rankTable      av)) ) ) MC'   &9  9'	 B 9'	  
 &	
	B< '   &8  9' B 96 9986		 9	
	9		B'   &8  9' B 9+ B6  9'  	 &	8 
 9' B5	 6
   9 B
=
	4
 >
=
	BO½  9 9 B  9 B  9 B6  99  9' B5 6   9	 B=BK    closeUIButton_ClosesetMyInfoinitBlackBack
paramcallBack  setSelectedStagehandlerwidgetTouchExtentUIManagersetVisibleImage_SelectplistTypeTextureResType	ccui
stagezhengbaConfig_UIPathloadTextureImage_StageNode_StagesgetChildByName	viewNode_Stage				


self  bD D Di B  
  E_;) ) ) M'   &8  9'	 B 9+	 B'   &8  9'	 B 9+	 BOç'   &8  9' B 9+ B'   &8  9' B 9+ B= 9 8  X6 9	 9
 BX  9 BK  initTablesend_getCompetRankcompetitionArenaProxyGameGlobalrankPlayercurStagesetTouchEnabledImage_StagesetVisibleImage_SelectgetChildByNameNode_Stage							self  Fid  F  i  Ý 
 >J  X6  99' 6 6  9989) 6  ) M6 89 X6 89	 X6 89=
 6 89XOí6  9 ' +	 B)  :	  X:X:' &6 9:8 9	 BL formatwushuangBuffConfig_Language%_
splitStringUtilstageBuffer
scoreneedScorestageIdteamIdConfig_CompetStagestageTeamIdcurSeasonConfig_CompetPeriod
stagecompetitionArenaProxyGameGlobal È				


self  ?stageId  ?stageBuff 8teamId 2  i buffTmp nBuff buffStr  ¯   /^d  X6  994  6 6  9989) 6  ) M6 89 XX6 89 XX6 89 X6 89 X6	 9

 6 8BOãL insert
tablestageIdteamId Config_CompetDayRankRewardsdayRankTeamIdcurSeasonConfig_CompetPeriod
stagecompetitionArenaProxyGameGlobal




self  0stage  0reward )teamId #  i        K          K          K    T  -   9    D  ÀcellSizeForTableself tableView  idx   T  -   9    D  ÀtableCellAtIndexself tableView  idx   Q  -   9   D  ÀnumberOfCellsInTableViewself tableView   Ñ  iy9    X`9  9' B6 9 9 9B A=  9   96 9	B9   9
6 9B 9B9   9	 9B9 !
 9B9 !B9   9B9  99  B9   93 6 9B9   93 6 9B9   93 6 9B9   93 6 9B9   93 6 9B9   93 6 9B9   9B2  K  reloadData!NUMBER_OF_CELLS_IN_TABLEVIEW TABLECELL_SIZE_AT_INDEX TABLECELL_SIZE_FOR_INDEX TABLECELL_TOUCHED SCROLLVIEW_SCRIPT_ZOOM SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildsetDelegateheight
widthsetPositiongetPositionTABLEVIEW_FILL_TOPDOWNsetVerticalFillOrder"SCROLLVIEW_DIRECTION_VERTICALsetDirectiongetContentSizecreateTableViewccImage_ContentgetChildByName	viewrankTableView					






self  jImgContent 	[x Cy  C V  (-  9 -  9J À
widthheightITEMSIZE self  tableView  idx   ×  2Z 9 B+    X 9' B X6 9 9B 6  9' B  9	' B 9
 B9 9 8 8  X
  9  9	 9
 8	
	
 8	
	
 BL setItemInfocurStagerankPlayeraddChildsetName*ui/worldWar/ArenaWushuangRankItem.luagetNodeFromLuaUIManagernewTableViewCellccRANKITEMgetChildByNamedequeueCell				self  3tableView  3idx  3cell /node . y   "¨9  9 8  X)  L X9  9 8 L K  curStagerankPlayerself  tableView   Ú    ã6     9  -  9 9B6 99+  5 -  9=	- 9
=
B K   ÀÀ	rank
stage  curStage	nameARENAWUSHUANGBUFFConfig_UIgetParent	view
addUIUIManagerself info  ¢  Otè   X-  9 9' B  X-  9 9' B  X-  9 9' B  X-  9 9' B  X,6 ' B 9	+  5 5 - 9
=
- 9=- 9=- 9=- 9==- 9=B9 9' B9 9- B-  9 99BK   ÀÀ  addChildsetPositionsetNameheroInfos
herosplayer  
defIdcombatPower
powerfactionfactionNamelv
level  	namecreate!app.uiLogic.ARENAENEMYINFOUIrequire
began
endedremoveChildByNameENEMYTIPgetChildByName	view
moved						self info TIPPOS event  PtipLogic ? ´@¼°_ 9 ' B
  X 9' B6  99' )	 '
 B 9
 9 '	 B
 9
B A 9' B 9 B 9 ' B 99B 9 ' B 99B 9 ' B 9)ÿ B 9 ' B 96 9	 		8	6	 9		9		B4    9 9	 B)  )	 M8
99 X
8
96  9 ' B XOð4  ) )	 )
 M# 9 '  B 9 '!  &B<8  X8 9"+ B6# '$ B 9%88+ BX8 9"+ BOÝ
 9 '  B
 9 '& B6	' 9	(		 9	)	9 9B	6
* 	 B

  X
 9
"+ B
X
; 9
"+ B
'
+ :		 X:
	X:	', &
: 9-B: 9-B! 9 '. B 9
 B6  9/ 9 '. B A 90 8 9-B B6  91 9 '2 B54 33 =5B3
6 6  91 9 '7 B58 =
559 =:5; =
55< =:, ) +  5= =
55> =:B
 9 '7 B 9?+ B2  K  ÀsetSwallowTouches  
ended    
began  
param  
ended  Image_NameTouch callBack   Image_IconwidgetTouchExtentsetPositionXfontStokeText_ValuegetPositionX%	nextgetStageBuffcompetitionArenaProxyGameGlobalNode_Buffcreateapp.uiLogic.ICONrequiresetVisibleNode_ItemNode_Award,
splitStringUtilrewardcurStagecheckRewardplistTypeTextureResType	ccuifenhangConfig_UIPathloadTexturesetOpacitybg
powerText_Power	namesetStringText_NameaddChildsetNamegetPositionNode_RankPossetPositioncenteruiNum3	rankcreateImageStringUIManagerremoveChildByName
POWERgetChildByName È								







""""""""#######$$$$$%%%%%''''()))**,,,,.........////////0000000011111111122222222552TVVVVVVVVWWWWXXXZ[[[\\\V]]]]]]]]__TIPPOS self  node  info  index  sprite ðreward :¶curStageReward ²  i strReward Node_Item 
$ $ $i "Node_Buff +nstageBuff gbuffValue 6offsetX $showTip %!    ¸6     9  -  9 9B6 99B K   À	nameARENAWUSHUANGBUFFConfig_UIgetParent	view
addUIUIManagerself  ¹ )µÉ+9   9' B 96 996 9986	 9
9B9   9' B 96 99B4    9 B)  ) M896	 9		9			 X
896	 	 9		 ' B		 XOî4  ) ) ) M$9	  	 9		' B		 9		'  &B	<	8	 	 X
8		 9		+ B	6	 ' B		 9		88+ B	X	8		 9		+ B	OÜ9   9' B 9' B6 9 9B6 	 B  X	 9+
 BX;	 9+
 B' :	  X:X:'	 &	:
 9B:		 9		B	!	 9	'  B		 9		 B	6	! 	 9	"	 9'  B A	 9	# 8 9B B	6	! 	 9	$	 9'% B5' 3& =(B	2  K  callBack   Image_IconwidgetTouchExtentsetPositionXfontStokeUIManagerText_ValuegetPositionX%	nextgetStageBuffNode_Buffcreateapp.uiLogic.ICONrequiresetVisibleNode_AwardNode_Mine,
splitStringUtilrewardcheckReward	ranksetStringText_MyRankplistTypeTextureResType	ccuicompetitionArenaProxyGameGlobal
stagezhengbaConfig_UIPathloadTextureImage_MyStagegetChildByName	view È	    """""""""########$$$$$$$$%%%%%%%%%&&&&&&&&))&++self  ¶Text_MyRank reward curStageReward   i strReward 	Node_Item 
}% % %i #Node_Buff -LstageBuff GbuffValue 6offsetX $ t   	¾6   9+  6 99BK  	nameARENAWUSHUANGRANKConfig_UIremoveUIUIManagerself  
 K   Â6   9  BK  removeEventsEventManagerself   Á  & ){ Æ6   ' B 5 5 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 2  L   dispose closeUI setMyInfo setItemInfo numberOfCellsInTableView tableCellAtIndex cellSizeForTable initTable checkReward getStageBuff setSelectedStage 	init getCompetRank initEvent initBlackBack create 	ctor x¾yù 
widthheightHARENAWUSHUANGRANK
class              ' " 9 ) H ; b J w d  y   ¦  ® ¨ ° <@>DBFFARENAWUSHUANGRANK &ITEMSIZE %TIPPOS $  