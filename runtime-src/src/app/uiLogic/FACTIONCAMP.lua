LJP@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\FACTIONCAMP.lua�   	+  =  +  = +  = +  = +  = +  = +  = ) = K  eachLineNum
btn1sdelayScheduleId
itemspaiqiancloseBtncommonBakLogic	view	self   �  *   X�-   9B  X�6  96 9 9B 9B6	 '
 B99+  5 BK  � batTypesubBatType 	nameREADYTOBATTLEdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagerButton_20closeItButton_1logic name        " K    r  (-   9 6 99BK  �factionCampfactionGameGlobalcreateUIlogic target  	obj  	 r  +-   9 6 99BK  �factionCampfactionGameGlobalcreateUIlogic target  	obj  	 �   26     9  -  9 9B6 ' B99+  5
 6 9	=B K  �str height�
width�dayingIntroConfig_GameData	nameSIGNINTROdata.Config_UIrequiregetParent	view
addUIUIManagerlogic  Z  9   X�-   9BK  �disposeexitTransitionStartlogic event   �	) �2-   9 B= 9B 9' B 9' B3 	 9'
 B6 
 9	 5 3
 =B
 9+ B
 96 99:B6 
 9	 5 =5 =B=6 
 9	 5 =5 =B=9
 96 99:B3 3	 6
 
 9

 6 96 '  B9! B
6
 
 9

 6 96 '  B9"	 B
6
 9


 9
#
B
3
$ 9 9'% B 9)�B6  9	9 9'% B5& =
B3'  9( B2  �L �registerScriptHandler   wenhao send_getArmyCampInfowithdrawnArmygetArmyCampInfoapp.event.FactionEventrequirefactionGameGlobaladdEventEventManager    Button_20  paiqian
param  Button_1  closeBtnfactionCampgZorderConfig_GameDatasetLocalZOrdersetSwallowTouchescallBack   widgetTouchExtentUIManagerImage_316 Button_20Button_1getChildByNamelayout	viewnew            """""%&&&&&&&&&'''''''''''/000011FACTIONCAMP self  �view  �param  �logic {btn1 sbtn2 ocallBack n_imageSwallow jgetArmyCampInfo 0:withdrawnArmy 9cbIntroduce onNodeEvent  �   :QI9  9 6 99 X�6 99 X�+ L 6 99 X�6 99 X�+ L 9 9 X�+ L X�9 9 X�9 9 X�+ L X
�9 9 X�  X�+ X�+ L + L + L lvbatPowerplayerUIdlocalPlayerGameGlobaluIda  ;b  ;uId1 9uId2 8 � 	 /C!=  9  9' B
  X�9  9' + B3 6 99   B  9 BK  makeList	sort
table removeChildByNameScrollViewBggetChildByName	viewarr!self  items  sort 	     	eK  self   o  ){-  9  9B9K   �ygetContentOffset_tableviewself table_view  cur_offset_x  7  �-  9 L  �cellNumself table_view   U  �-   9    D  �tableCellAtIndexself table_view  idx   .    �)� )>J table_view  idx   �	 )��g,6 96 99 9 #B=  9  	  X
�9  9'	 B 9
+ BX	�9  9'	 B 9
+ B9   X�9  9B2 ^�X[�9  9' B6 9 96 9	 9B9
 9B9B A= 9  96 9B9  9 9B 9B A9  9B9  9' B9  99 B9  93 6 9 B9  93! 6 9"B9  93# 6 9$B9  93% 6 9&B9  9B9  9'B9(2  �K  K  xgetContentOffsetTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildscrollViewsetNamesetDelegategetPositionYgetPositionXsetPosition"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewccImage_12reloadData_tableviewsetVisibleText_30getChildByName	vieweachLineNumfactionCampfactionGameGlobal	ceil	mathcellNum �<		!!!###%%%#''''(((((,,	self  �back_sp /Vcur_offset_x V  �	  &���6     9  ' B   9 ' B 9B9  9 ' B 9B9-  9 9'	 B 9B9-  9 9'	 B 9B9  9
 ' B-  9' B 9B 96 9-
 
 9

' B

 9

B
 A  A  9 )	� )
� B-  9 9	  B6 ' B 9	  5
" 5 -  9-  - "-  89=-  9-  - "-  89=6 99=-  9-  - "-  89=-  9-  - "-  89 =!=#
-  9-  - "-  89$=%
BK   �
���	�heroInfosheroInfoStringplayer  
defIdidcombatPowerbatPowerfactionNamefactionGameGloballv  	namearrcreate!app.uiLogic.ARENAENEMYINFOUIrequireaddChildsetPositiongetPositionpccconvertToWorldSpacegetParentborder
myTipsetName
bgRef	viewheight
widthgetContentSizeImage_1getChildByName%ui/worldWar/ArenaEnemyInfoUI.luagetNodeFromLuaUIManager						




































































self node i eachLineNum j tip �width �height widthBg 
uheightBg 
knodePos Q S   � -   9     9  ' B K   �
myTipremoveChildByName	view       self  S   � -   9     9  ' B K   �
myTipremoveChildByName	view       self  n   	�6  9 96   B AK  tonumbersend_withdrawnArmyfactionGameGlobaluId  
 � :���W 9 B  X� 9BX�6 9 9B 9 !9 )  ) M�9
  " 	8


  X
�2�6
 
 9
	
'
 B

 9
 	)  B3 6  9
 9
' B5 3 =5 =, )
 +  5 3 =B

 9
' B 9+ B
 9
' B 9' B 99  " 	89B
 9
' B 99  " 	89B
 9
' B 99  " 	89B9  " 	899  " 	89 
 9
'! B
 9
' B
 9
'" B 9#6$ 9%9& 9' B) B 9(* B
 9
' B 9) 9*B B3+ 6  9 5, =4 >=-, ) B 9+ B6. 9  " 	89/B60 919/ X!� 92+ B
 9
'3 B 92+ B
 9
' B 92+ B
 9
' B 9465  96'7 B AX � 92+ B
 9
'3 B 92+ B
 9
' B 92+ B
 9
' B 9465  96'8 B A 99
 B2
 �2	 �O2  �L addChild#F5EBD0#93D23DconvertHexToRGBDisplayObjectUtilsetColor	zlBgsetVisiblelocalPlayerGameGlobalplayerUIdtonumber
param   getLocalZOrdersetLocalZOrdersetScaleformat	pathheadIconConfig_UIPathloadTexture	backButton_1iduIdbatPowerText_2	nameText_1lvsetString	TextlvNodesetSwallowTouches     callBack   bordergetChildByNamewidgetTouchExtent setPosition"ui/palace/FactionCampNode.luagetNodeFromCacheUIManagerarreachLineNumcellNumnewTableViewCellccremoveAllChildrendequeueCell��̙�����	



             !!!!!!""""""####$$$$&&&&'''''''''''((((<<<<<<<<<<<ABBBBBBBBBBBBCCCCFFFFFFFFFFFFFGGGGHHHHHHHHIIIIIIIIKKKKKKKKKKKKKNNNNOOOOOOOOPPPPPPPPRRRRRRRRRRRRTTTTTT
VVself  �table_view  �idx  �_cell �i �eachLineNum �� � �j �node �showInfo �uId L�id �btn1 �border �headView }callBack1 bBtn1 V     	�K  self       
�+ L self       	�K  self   �  
 �  9  B6  9' B9   X�6 99 B6  9  B+  =	 K  	viewremoveEventsEventManagerunscheduleGlobalschedulerdelayScheduleId"ui/palace/FactionCampNode.luaremoveNodeFromCacheUIManagerclearNodesEventself   �   R �6   ' B 6 ' B3 =3 =3	 =3 =
3 =3 =3 =3 =3 =3 =2  �L  dispose closeIt canClosed layout tableCellAtIndex makeList clearNodesEvent createUI create 	ctorFACTIONCAMP
classdata.Config_UIrequire        A  d C f e � g � � � � � � � � � �   uiConfig FACTIONCAMP   