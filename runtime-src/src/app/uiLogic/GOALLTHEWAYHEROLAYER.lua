LJY@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\GOALLTHEWAYHEROLAYER.lua�   +  =  +  = +  = +  = 4  = 4  = K  needReviveHeroListcurNodesnextStageIdcurTollgateIdbutton	viewself   �   6     9  -  9 9B6 ' B99B K  �	nameGOALLTHEWAYHEROLAYERdata.Config_UIrequiregetParent	viewremoveUIUIManagerlogic        K    � 		 .-  9   X�-  9 B6  9-  9 9B6 ' B99BK  �	nameGOALLTHEWAYHEROLAYERdata.Config_UIrequiregetParent	viewremoveUIUIManagercallBacklogic target  param   �]�-   9 B=  X�9=3 6  996	 9		6 99	 6 99
 6 99	6 99
B	5
 6 9)  )  )  )� B=
6 9)  )  )  )  B=
 B6  99		 9		' B	5
 3 =
B6  99		 9		' B	5
 =
B3 6 	 9
 6 96 ' B9 B	 9B2  �L  �	initresurrectionHero"app.event.ClearanceProxyEventrequireclearanceProxyGameGlobaladdEventEventManager   Button_1   Image_181getChildByNamewidgetTouchExtentborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRectUIManager callBack	viewnew����
	
























GOALLTHEWAYHEROLAYER self  ^view  ^param  ^logic Ycb Srect *)resurrectionHero  e   
(  9  B  9 B  9 BK  updateGoldcreateHeroListinitUIself   |    16     9  +  6 ' B99B K  	nameMESSAGEBOXdata.Config_UIrequireremoveUIUIManager h   46   9    9  -  B K  �send_resurrectionHeroclearanceProxyGameGlobalheroStr  � *j.  6  99 X�3 3 6 9 9B 9B6	  9
	 6
 ' B
9

9

+  5 ===BX�6  96 9B2  �K  2  �K  Treabox6Config_LanguageaddMessageFloatMessage	fun2	fun1param1 visibleCloseButtonidreviveHero	nameMESSAGEBOXdata.Config_UIrequire
addUIUIManagergetRunningScenegetInstanceDirectorcc  	goldlocalPlayerGameGlobal(								















heroNum  +heroStr  +cosumeGold )close callBack curScene  �  	 E>'   6 -  9BH�   X�6 9B  X�  ' 9& FR�- -  9   BK   ��,uIdtostringherosArray
pairs





self checkGold heroStr   k v   �  	 EJ'   6 -  9BH�   X�6  B  X�  '  & FR�- -  9   BK   ��,tostringneedReviveHeroList
pairs





self checkGold heroStr   k v   �	  /-)3  6  99  9' B5 3 =B6  99  9'	 B5 3
 =B2  �K     Button_2_CopycallBack   Button_2getChildByName	viewwidgetTouchExtentUIManager (())self  checkGold       k K         l K         m K    S  n-   9    D  �cellSizeForTableself tableView  idx   S  q-   9    D  �tableCellAtIndexself tableView  idx   P  t-   9   D  �numberOfCellsInTableViewself tableView   �	 * ~�W"4  6  6 99BH�6 96	 9		9		
 B X�6 9	 )
 6 9 9	 B AFR�=
 9
  = 9  9' B9   XO�6 9 9 9B A= 9  96 9B9  96 9B9  9 9B A9  9B9  99 B9  93 6 9B9  93 6 9 B9  93! 6 9"B9  93# 6 9$B9  93% 6 9&B9  93' 6 9(B9  9)B2  �K  reloadData!NUMBER_OF_CELLS_IN_TABLEVIEW TABLECELL_SIZE_AT_INDEX TABLECELL_SIZE_FOR_INDEX TABLECELL_TOUCHED SCROLLVIEW_SCRIPT_ZOOM SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildsetDelegategetPositionsetPositionTABLEVIEW_FILL_TOPDOWNsetVerticalFillOrder"SCROLLVIEW_DIRECTION_VERTICALsetDirectiongetContentSizecreateTableViewccheroTableViewImage_1083getChildByName	viewcurHerosCntherosArraygetHeroByUIdlocalPlayerinsertreviveHeroListindexof
tablediedHeroListclearanceProxyGameGlobal
pairs			




!!!!""self  herosArray }  k v  ImgTableContent X 3    z)� )J self  tableView  idx   N  }6  99  D curHerosCnt	ceil	math
self  tableView   �	  ���! 9 B  X� 9BX�6 9 9B ) ) ) M{�9 	  		8	  X	t�9	 9
8	
		  X	�9	 9
6 '	 B 9
B<
	9	 9
8	
		 9		B	X	�9	 9
8	
		 9		B	9	 9
8	
		 9		-  9"-  9 -  9B	  9	 9 98 + B	 9	9 98B	6	 	 9		9 98 9' B5 6   9 B=4   >=, * , 9 98B	6	 9		9 9B	 	 X

�6	 '	 B		 9		9 98+ B	9	 9
8	
		 9		' B		 9		+ B	O�L �setSwallowTouchessetMarkVisibleneedReviveHeroListindexof
table
paramcallBack  makeTouchFunhandlerQualitygetChildByNamewidgetTouchExtentUIManageraddChildfreshDisplayheight
widthsetPositionremoveFromParentretaincreateViewapp.uiLogic.CharHeadNode2requireuIdcurNodesherosArraynewTableViewCellccremoveAllChildrendequeueCell
��̙����				



	 NODESIZE self  �tableView  �idx  �cell �| | |i zheroData v � 
 G\�9  86 99 9B  X�6 ' B 99 98+ B6 9	9 6 99 9	B AX&�9   6
 99 X�6 ' B 99 98+ B6 99 9BX�6
  96 ' B99   + B  9 BK  updateGold	GOLDapp.const.Const_CostTypecheckResourceEnoughinsert	goldlocalPlayerGameGlobalremovecurNodessetMarkVisibleapp.uiLogic.CharHeadNode2requireuIdneedReviveHeroListindexof
tableherosArray(












self  Hpos  Hhero E �  	�9   9' B 99   ' 6 99&BK  	goldlocalPlayerGameGlobal/needReviveHeroListsetStringText_458getChildByName	view(self   �   C�6  ' B 9 	 
 , B
 9 BK  setNameVisiblesetDataapp.uiLogic.CharHeadNode2requireself  node  tmpHero  isRemove  CharHeadNode2  �   �6   99  9B6 ' B99BK  	nameGOALLTHEWAYHEROLAYERdata.Config_UIrequiregetParent	viewremoveUIUIManagerself   K   �6   9  BK  removeEventsEventManagerself   �   $G �6   ' B 6 9)d )� B3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   dispose closeIt freshDisplay updateGold makeTouchFun tableCellAtIndex numberOfCellsInTableView cellSizeForTable createHeroList initUI 	init create 	ctor	sizeccGOALLTHEWAYHEROLAYER
class',(V-yW|z}��������������GOALLTHEWAYHEROLAYER !NODESIZE   