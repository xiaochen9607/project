LJ[@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\ARENAWUSHUANGBATTLELOG.luag   	4  =  )  = )  = 4  = K  battleLogfailTimeswinTimesrankPlayerself  
 �  H-   9 B= 9B 9B6 9 9BL  �send_getCompetReportInfocompetitionArenaProxyGameGlobal	initinitEvent	viewnewARENAWUSHUANGBATTLELOG self  view  params  logic  �  *96   99 6 96  99 6  99 6	  9		9				6
  9

9



B5	 6 9)	  )
  )  )� B=
6 9)	  )
  )  )  B=BK  borderColorfillColor borderWidth	nameARENAWUSHUANGBATTLELOGc4fheight
widthActualDesignSize	rectcc	viewcreateRectUIManager����
self  +rect * �   6   9  6 96 ' B96 	  9
 B AK  handlergetCompetReportInfo$app.event.CompetitionProxyEventrequirecompetitionArenaProxyGameGlobaladdEventEventManagerself   �   !G:=  :=   9 B)  ) M
�6 99	 )
   9 8B AO�9 
  X�9  )   X�  9 BK  initTableparseBattleLogInfobattleLoginsert
tablesetMyInfofailTimeswinTimes								


self  "object  "param  "  i 	 � 
  -  9  B  9 B6  99  9' B5	 6   9	 B=
BK  callBack  closeUIhandlerButton_29getChildByName	viewwidgetTouchExtentUIManagersetMyInfoinitBlackBackself        @ K         A K         B K    S  C-   9    D  �cellSizeForTableself tableView  idx   S  F-   9    D  �tableCellAtIndexself tableView  idx   P  I-   9   D  �numberOfCellsInTableViewself tableView   �  i�59    X`�9  9' B6 9 9 9B A=  9   96 9	B9   9
6 9B 9B9   9	 9B9 !
 9B9 !B9   9B9  99  B9   93 6 9B9   93 6 9B9   93 6 9B9   93 6 9B9   93 6 9B9   93 6 9B9   9B2  �K  reloadData!NUMBER_OF_CELLS_IN_TABLEVIEW TABLECELL_SIZE_AT_INDEX TABLECELL_SIZE_FOR_INDEX TABLECELL_TOUCHED SCROLLVIEW_SCRIPT_ZOOM SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildsetDelegateheight
widthsetPositiongetPositionTABLEVIEW_FILL_TOPDOWNsetVerticalFillOrder"SCROLLVIEW_DIRECTION_VERTICALsetDirectiongetContentSizecreateTableViewccImage_ContentgetChildByName	viewrankTableView				




self  jImgContent 	[x Cy  C U  (P-  9 -  9J �
widthheightITEMSIZE self  tableView  idx   �  -UT 9 B+    X� 9' B X�6 9 9B 6  9' B  9	' B 9
 B9  8  X�  9  9	 
 8	
	BL setItemInfobattleLogaddChildsetName/ui/worldWar/ArenaWushuangBattleLogItem.luagetNodeFromLuaUIManagernewTableViewCellccBATTLELOGITEMgetChildByNamedequeueCell				self  .tableView  .idx  .cell *node ) 7   e9   L battleLogself  tableView   t   |6   9    9  -  9B K  �idsend_competBackReportcompetitionArenaProxyGameGlobalinfo  �	 '��i 9 ' B 96 99986 99	B 9 '
 B 9+ B 9 ' B 9+ B9	  X� 9 '
 B 9+ B 9 ' B 9+ BX#�9)   X� 9 '
 B 96 996 99	BX�9)   X� 9 '
 B 96 996 99	B 9 ' B 96 99B A 9 ' B 96 999&B 9 ' B 99B 9 ' B 96  96	 	 9		B			6
 9 B
 A A3! 6"  9#	 9 '
$ B5% =&B2  �K  callBack  Button_ReplaywidgetTouchExtentUIManager 	timetonumbergetServerTimeGameGlobalgetTimeGapStringUtilText_Time	nameText_Name
levelenLevelcommonConfig_LanguageText_Name_Copyabs	mathsetStringdownArrowwinArrowrankChangeText_ChangesetVisibleText_ArrowplistTypeTextureResType	ccui
isWin	bWinzhengbaConfig_UIPathloadTextureImage_ResultgetChildByName �				












self  �node  �info  �replay � �  
 '�9   9' B 96 99 99 B A9   9' B 96 99	 99	 B AK  failTimesText_FailformatwinTimeswushuangConfig_LanguagesetStringText_WingetChildByName	viewself    �   9�6   9 ' + B5 :=:=:=:=:=:=	:=
:=L isChallenger	timemyRankrankChange
isWin
level	nameid  ,
splitStringUtil		

self  str  tmp battleLog  y   	�6   9+  6 99BK  	nameARENAWUSHUANGBATTLELOGConfig_UIremoveUIUIManagerself  
 K   �6   9  BK  removeEventsEventManagerself   �  ! $I �6   ' B 5 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 2  �L   dispose closeUI parseBattleLogInfo setMyInfo setItemInfo numberOfCellsInTableView tableCellAtIndex cellSizeForTable initTable 	init getCompetReportInfo initEvent initBlackBack create 	ctor 
width�height4ARENAWUSHUANGBATTLELOG
class+3-N5RPcTge�i����������ARENAWUSHUANGBATTLELOG !ITEMSIZE    