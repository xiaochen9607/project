LJZ@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\ACTIVITYCONSUMEREWARD.lua_   	+  =  +  = + = +  = K  selectNodecanTouchbutton	viewself  
 �   6     9  -  9 9B6 ' B99B K  �	nameACTIVITYCONSUMEREWARDdata.Config_UIrequiregetParent	viewremoveUIUIManagerlogic  � 
 ?j
6   9-  9 9B6 99+  5 9	:		=		9	:		=	
B9-  9 9' B 9+ B-  9 9' B 9+ B-  9 9' B 9+ B6 9-  9-  9B-   9BK  �updateTipsselectIdrewardGotListinsert
tableImage_tishiImage_hadGotsetVisibleButton_1getChildByNameselectNodestageId
heros
items  arr	nameACQUIREITEMSSIMPLEConfig_UIgetParent	view
addUIUIManager				
logic target  @param  @stageId *button $ '    &-   B +  L  �close  �
1��$-   9 B=3  9' B6  9	 '
 6 9	9
' B 9)	  B 9 9	B		 	B6 9 9*	 B6 9	 9*
 6 9)2 )  B A
 96 9 9  B A6 
 996 96 996 996 996 99B5 6 9)  )  )  )� B=6 9)  )  )  )  B= B3	 3
! =
 6
 
 9
"
 9'# B5$ =%B
6
& 
 9
'
 6( 9)6* '+ B9,	 B
6
& 
 9
'
 6( 9)6* '+ B9-6.  9/B A
6
( 9
)

 9
0
B
2  �L  �send_getCostGoldInfo	inithandlergetCostGoldInforewardCostGold!app.event.ActivityProxyEventrequireActivityProxyGameGlobaladdEventEventManagercallBack  Button_1widgetTouchExtent canClosed borderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcreateRect
SpawnrunActionpMoveBycreateFadeInccgetPositionXsetPositionXsetOpacitypnglocalTypeTextureResType	ccui)heroBodyBig/heroBodyBig_huodongmeinvaddLocalPicUIManagerImage_540getChildByName 	viewnewd��������
				






            !!!!!!!!!!!!!!!"""""##ACTIVITYCONSUMEREWARD self  �view  �param  �logic �close �bg �action1 naction2 crect 4/acqCb . �  
 ?0	+ 6  9 BH�9 : X�6 99	 :
B X�+ FR�9  9' B 9	 BK  setVisibleImage_tishigetChildByName	viewrewardGotListindexof
tablemyConsumeNumallRewardList
pairs	self  isShow   k v   ;    ^: :  X�+ X�+ L a  	b  	 �  |�:+9 := 4  = : X�6  9:' +	 B= := := 6  96	 6	
 9		:9B	 A ' +	 B6  9:'	 +
 B4  = 6  BH	�6
 99 6  9
 ' + B AF	R	�4  = 6  9:	'
 + B6 	 BH
�6
 99 6  9 ' + B AF
R
�4  = )  )	 M�) 
 X�6
 99 6  98
' + B AO�6
 99	 3
 B	  9 B	  9 B	  9 B	  9 BK  updateTimeupdateMyRewardListupdateRankingRewardTableinitButton 	sortotherPlayerListallRewardList|insert
pairsrankingRewardList:;	_bufconcat
tableuncompressmyRankingmyConsumeNum,
splitStringUtil-1rewardGotListendTimearr   !!!!!!!!!!!$$$&$'''((()))***+self  }target  }param  }arr {rewardConf  [rewardObjList T  k v  rewardList 8  k v    i  �  8Sp6   9  -  96  9B !B )    X�-  9  X�6 9-  9B-  +  =6  9	6
 9 9B6 ' B99B6  9  B-  9 9' B 9 BK   �setStringText_timegetChildByNameformatTimeSimpleStringUtil	nameACTIVITYCONSUMEREWARDdata.Config_UIrequiregetParent	view
logicremoveUIUIManagerunscheduleGlobalschedulertimeTickergetServerTimeGameGlobalendTime
floor	math�					









self timeLeft -timeStr " � GXf9   9' B 9' B 99 B9 	  X�9   9' B 9' B 96 9	BX�9   9' B 9' B 99 B9   9'
 B 9' B 99 B3 9   X�6 9 ) B=  B2  �K  scheduleGlobalschedulertimeTicker Text_time_Copy_Copy_0Node_rewardnotInRankingConfig_LanguageText_paimingmyRankingmyConsumeNumsetStringText_jifenNode_paihanggetChildByName	view 													self  Hupdate ; p  )�-  9  9B9K   �xgetContentOffset_tableviewself table_view  cur_offset_x  D  �-  9  L  �otherPlayerListself table_view   U  �-   9    D  �tableCellAtIndexself table_view  idx   .    �)Z )lJ table_view  idx   � ! m�� 9    X�9   9B2 d�Xa�9  9' B 9' B6 9 96 9		 9
B9
 9
B9B A=  9   96 9B9   9 9B 9B A9   9B9   9' B9  9' B 99  B9   93 6 9B9   93 6 9B9   93 6 9B9   93 6 9B9   9B9   9B9 2  �K  K  xgetContentOffsetTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildscrollViewsetNamesetDelegategetPositionYgetPositionXsetPosition"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewccImage_297Node_paihanggetChildByName	viewreloadData_tableview



  self  mback_sp Xcur_offset_x X  �  &���* 9 B  X� 9BX�6 9 9B 6  9' B9  !9 8	 9	'

 B	 9:
B	 9	'
 B	 9:
B	 9	'
 B	 9:
B:6 99 X�	 9	'

 B	 96
 9

B	 9	'
 B	 96
 9

B	 9	'
 B	 96
 9

B6 9	 BH
�:: X�:: X�6  9:' + B7 F
R
� 	 X�	 9	'
 B	 9+
 B	 9	'
 B	 9+
 BX�	 9	'
 B	 9+
 B	 9	'
 B	 9+
 B) 6  )	 M �6  9' B 9 B 9  9	'! 
 &B 9"B A6# '$ B 9% 6 8
+ BO�	 9
 B	 9 )
@)- BL createsrc/app/uiLogic/ICON.luarequiregetPositionProjectNode_setPositionaddChildui/common/Icon.luagetNodeFromCacheImage_1setVisibleImage_1_CopyrewardList,
splitStringUtilrankingRewardList
pairs
greenConst_colorDatasetColor	namelocalPlayerGameGlobalText_goldText_namesetStringText_numgetChildByNameotherPlayerList0ui/activity/ActivityConsumeRewardDetail.luagetNodeFromLuaUIManagernewTableViewCellccremoveAllChildrendequeueCell 

!!!!!"""""####$$$$$$$$$$$$%%%%%%%%%%!''''((((()self  �table_view  �idx  �_cell �node �index �indexObj �<  k v  :! ! !i tmpNode logic   r  )�-  9  9B9K   �xgetContentOffset_mytableviewself table_view  cur_offset_x  B  �-  9  L  �allRewardListself table_view   V  �-   9    D  �tableCellAtIndex1self table_view  idx   .    �)n )lJ table_view  idx   � i{� 9    X�9   9B2 `�X]�9  9' B 9' B6 9 96 9		 9
B9
 9
B9B A=  9   96 9B9   9 9B 9B B9   9B9   9' B9  9' B 99  B9   93 6 9B9   93 6 9B9   93 6 9B9   93 6 9B9   9B2  �K  K  TABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildscrollViewsetNamesetDelegategetPositionYgetPositionXsetPosition"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewccImage_224Node_rewardgetChildByName	viewreloadData_mytableview(  self  iback_sp T �   #�6   9    9  -  :B -  - = -  -  := K  � ��selectIdselectNodesend_rewardCostGoldActivityProxyGameGlobalindexObj self node  � + ���+ 9 B  X� 9BX�6 9 9B 6  9' B9  !9 84  6	 
 9
:' + B)	 
 ) M	�6  9' B 9 B 9 9'  &B 9B A6 ' B 9 8+ BO	� 9	' B		 9		6 96 9:B A	 9	' B		 9		+ B	 9	' B		 9		+ B	 9	'  B		 9		+ B	:	9
! 	
 X	9� 9	' B		 9	"	6 9#)  )� )  B A	6	$ 9	%	9& :B	 	 X
� 9	'  B		 9		+ B	 9	' B		 9		+ B	X	)� 9	' B		 9		+ B	6	 	 9	'	 9' B5) 3( =*B	X	� 9	' B		 9	"	6 9#)� )  )  B A	 9	' B		 9		+ B	 9	 B	 9	)@)2 B	2  �L callBack   widgetTouchExtentrewardGotListindexof
tablec3bsetColormyConsumeNumImage_hadGotsetBrightButton_1setVisibleImage_tishigoldCosumeAtConfig_LanguageformatstringsetStringText_tishicreatesrc/app/uiLogic/ICON.luarequiregetPositionProjectNode_getChildByNamesetPositionaddChildui/common/Icon.luagetNodeFromCache,
splitStringUtilallRewardList0ui/activity/ActivityAllServerKillDetail.luagetNodeFromLuaUIManagernewTableViewCellccremoveAllChildrendequeueCell		
""#%%%%%%%%%%%%%&&&&&&&&(((()))))**self  �table_view  �idx  �_cell �node �index �indexObj �rewardList �rewardStrList �     i tmpNode logic   �   7L�9   9' B 9+ B9   9' B 9+ B9   9' B 9+ B9   9' B 9+ B9   9 B 9+ B9   9 B 9+ BK  Button_RewardsetBrightsetTouchEnabledButton_11getChildByName	viewself  8senderName  8 �  "(�	-   9   	   X �K  -   9    9  ' B   9  + B -   9    9  ' B   9  + B -   ) =  -     9  ' B K   �Button_11updateButtonNode_paihangsetVisibleNode_rewardgetChildByName	viewlayerType	self  �  "(�-   9   	   X �K  -   9    9  ' B   9  + B -   9    9  ' B   9  + B -   ) =  -     9  ' B K   �Button_RewardupdateButtonNode_paihangsetVisibleNode_rewardgetChildByName	viewlayerTypeself  �  CK�  9  B9  9' B 9+ B9  9' B 9+ B9  9' B 9+ B9  9' B 9+ B) =	 6
  99  9' B5 3 =B6
  99  9' B5 3 =B2  �K     Button_RewardcallBack   widgetTouchExtentUIManagerlayerTypesetBrightsetTouchEnabledButton_11Node_paihangsetVisibleNode_rewardgetChildByName	viewupdateTipsself  D     	�K  self   �   �9    X�6 99  B+  =  6  9  BK  removeEventsEventManagerunscheduleGlobalschedulertimeTickerself   �   %l �6   ' B 6 ' B 9B3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   dispose layout initButton updateButton tableCellAtIndex1 updateMyRewardList tableCellAtIndex updateRankingRewardTable updateTime 	init updateTips  	ctorcreatesrc.app.sprite.ShadersrequireACTIVITYCONSUMEREWARD
class         	  /  9 0 e : � f � � � � � � � !>#A@HBIIACTIVITYCONSUMEREWARD "shader   