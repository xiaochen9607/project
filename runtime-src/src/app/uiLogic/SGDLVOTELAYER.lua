LJR@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\SGDLVOTELAYER.lua�   +  =  )  = )  = )  = 4  = 4  = +  = +  = +  = 4  =	 4  =
 K  rightNodeListleftNodeListlastSelectUidlastSelectTypelastSelectIdpowerRanInforankInfoisVoteisSignUpendTime	view		

self   � W�-   9 B=9=6  9 6 96
 9

9


 
6 99	 6 996 99	B5	 6
 9


)  )  )  )� B
=
	6
 9


)  )  )  )  B
=
	6
  9B
 A6  9
 9' B4	  B6  9
 9' B5	 6
  9B
=
	B 9B6 9 9B 9BL  �layOutsend_voteListkuaFuProxyGameGlobaladdEvent  Button_closeImage_1getChildByNamewidgetTouchExtentcloseIthandlerborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRectUIManagercallBack	viewnew����









SGDLVOTELAYER self  Xview  Xparam  Xlogic Srect 0#     	#K  self   �   %  9  B  9 B  9 B  9 B  9 BK  initRewardupdateTimeinitRightUIinitLeftUIinitBtnself   �  &j,
) 6  6 BH�6 	 99
' B) 	 )
 M�9  9'  '	  &B6
 ' B 9 8+ BO� FR�K  createapp/uiLogic/ICON.luarequire_	icongetChildByName	view,reward
splitStringUtilConfig_SgdlVoteReward
pairs
self  'index %! ! !k v  tmpReward   i tmpNode 		 �  G�89 6 9:=6 9:=6 9:=: X�6  9:'	 + B6
  BH�6	 	 9		 ' + B	6
 9

9

:	<	
FR�6  BX�)  X�  X� X�6 
 9 ' + B6	 9		9		:
<
	ER�-   9BK   �initUIpowerRanInfoipairsrankInfo,
pairs;
splitStringUtil-1isVoteisSignUpendTimekuaFuProxyGameGlobalarr					self target  Hparam  Harr Finfo   k v  onePlayer 
  i v  powerInfo  �
 	 073  6  96 6 96 '	 B9 B6  96 6 96 '	 B9 B2  �K  votePlayervoteListapp.event.KuaFuProxyEventrequirekuaFuProxyGameGlobaladdEventEventManager self  voteListCb  �  )1O*  =  )  = )  = 4 5 >5 >5 >= 4 5 >5	 >5
 >5 >5 >5 >5 >5 >5 >	5 >
5 >5 >= K    asdfjflasd�  agasdasd�  asdfjflasd�  asdfjflasd�  agasdasd�  asdfjflasd�  asdfjflasd�  agasdasd�  asdfjflasd�  asdfjflasd�  agasdasd�  asdfjflasd�powerRanInfo  asdfjflasd�  agasdasd�  asdfjflasd�rankInfoisVoteisSignUpendTime�ʖ�self  * �  k�j-   9      X1�+   -  9	  X�-  9-  9 8 X�-  9 9-  9 B 9' B     X�  9 ' B 9+ B  9 '	 B 9+ B  9 '
 B 9+ B-    9  ' B   9  + B -    9  '	 B   9  + B -    9  '
 B   9  + B -    9  ' B   9  + B -   ) = -   - =  -   - = -   6 99- 8:= K   ���rankInfokuaFuProxyGameGloballastSelectUidlastSelectNodeImage_xuanzhongImage_weixuanzhongsetVisibleImage_xuanzhonglan	nodegetChildByNamecellAtIndex_tableviewleftNodeListlastSelectTypelastSelectId

self infoNode i tmpNode 0cell  �
 ��V6) ) ) M��6   9' B9  9'	 
 &	
	B 9'	 B9  9'	 
 &	
	B 9	 B 9	'	 B 9'	
 B 9	 B 9'	 B 9+	 B 	 X� 9'	 B 9+	 B 9'	 B 9+	 BX� 9'	 B 9+	 B 9'	 B 9+	 B6 998  X6� 9'	 B 9+	 B 9'	 B 9+	 B 9'	 B 96	 9		9		8		:		B 9'	 B 96	 9		9		8		:		B6   9 9	' B	5
 3 =
B9 <X"� 9'	 B 9+	 B 9'	 B 9+	 B 9'	 B 96	 :	/	B 9'	 B 96	 :	/	B2 �2 �OL2  �K  Config_LanguageleftNodeListcallBack   Image_touchwidgetTouchExtentText_piaoshuText_247_nameImage_weixuanzhongImage_xuanzhongrankInfokuaFuProxyGameGlobalImage_di2Image_di1setVisibleImage_xuanzhonglansetStringText_paimingsetNameaddChildinfoNoderemoveChildByNamenode_infogetChildByName	view"ui/kuafuzhan/SgdlVoteNode.luagetNodeFromCacheUIManager								








--...00000000111111112222222223333333334466self  �� � �i �infoNode � p  )�-  9  9B9K   �ygetContentOffset_tableviewself table_view  cur_offset_x  7  �-  9 L  �cellNumself table_view   U  �-   9    D  �tableCellAtIndexself table_view  idx   .    �). )�J table_view  idx   � " k}�'6 99 =  9  )	  X�)	 =  9   X�9  9B2 W�XT�9  9' B6	 9
 96	 9	 9B9
 9B9B A= 9  96	 9B9  9 9B 9B A9  9B9  9' B9  99 B9  93 6	 9B9  93 6	 9B9  93 6	 9B9  93  6	 9!B9  9B2  �K  K  TABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildscrollViewsetNamesetDelegategetPositionYgetPositionXsetPosition"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewccImage_digetChildByName	viewreloadData_tableviewpowerRanInfokuaFuProxyGameGlobalcellNum					!!!###!%%%%''self  kback_sp O �  d��-   9      X3�+   -  9	  X�-  9-  9 8 X�-  9 9-  9 B  X� 9' B     X�  9 ' B 9+ B  9 '	 B 9+ B  9 '
 B 9+ B-    9  ' B   9  + B -    9  '	 B   9  + B -    9  '
 B   9  + B -   ) = -   - =  -   - = -   6 99- 8:= K   ����powerRanInfokuaFuProxyGameGloballastSelectUidlastSelectNodeImage_xuanzhongImage_weixuanzhongsetVisibleImage_xuanzhonglan	nodegetChildByNamecellAtIndex_tableviewleftNodeListlastSelectTypelastSelectIdself node idx index tmpNode 2cell  � $���? 9 B  X� 9BX�6 9 9B 6  9' B9 ! 	 X� 9	'	
 B 9+	 B 9	'	 B 9+	 BX� 9	'	
 B 9+	 B 9	'	 B 9+	 B6 998  XP� 9	'	 B 9+	 B 9	'	 B 9+	 B 9	'	 B 9+	 B 9	'	 B 9	 B 9	'	 B 96	 9		9		8		:		B 9	'	 B 96	 	 9		6 998:B	 A6  9 9		' B	5
 3 =
B 9	'	 B 9+	 BX3� 9	'	 B 9+	 B 9	'	 B 9+	 B 9	'	 B 9+	 B 9	'	 B 96	 :	/	B 9	'	 B 96	 :	/	B 9	'	 B 96	 :	/	B 9 '	! B 9"	 B 9#)	  )
  B2  �L setPositionaddChild	nodesetNameConfig_LanguagesetSwallowTouchescallBack   Image_touchwidgetTouchExtentsetUnitsForMyriadStringUtilText_piaoshuText_247_namesetStringText_paimingImage_weixuanzhongImage_xuanzhonglanImage_xuanzhongpowerRanInfokuaFuProxyGameGlobalImage_di2setVisibleImage_di1getChildByNamecellNum"ui/kuafuzhan/SgdlVoteNode.luagetNodeFromLuaUIManagernewTableViewCellccremoveAllChildrendequeueCell			







00222222222444444445555555566666666777777777888888888999999999;;;;<<<<=====>>self  �table_view  �idx  �_cell �node �index � `    �6     9  6 9B K  hadVotedConfig_LanguageaddMessageFloatMessage o   �6   9    9  -  9B K    lastSelectUidsend_votePlayerkuaFuProxyGameGlobalself  �  0;�-   9      X�3  6  96 9 9B 9B6 '	 B9
9+  5 = BX �6    9  6 9 9B 9B6 '	 B9
9+  5 6 =B K   �go idvotePlayer	fun2 idconfirmVote	nameMESSAGEBOXdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager lastSelectUidself go  � *2�6  99	  X�9  9' B 9+ B6  99  9' B5
 3	 =B2  �K  6  99  9' B5 3 =B2  �K     callBack   widgetTouchExtentUIManagersetBrightButton_toupiaogetChildByName	viewisVotekuaFuProxyGameGlobalself  + �  9T�6   9  6 996  9B !B )    X�-  9  X�6 9-  9B-  +  =6	  9
-  9 9B6 ' B99B6  9  B-  9 9' B 9 BK   �setStringText_timegetChildByNameformatTimeSimpleStringUtil	nameSGDLINFOdata.Config_UIrequiregetParent	viewremoveUIUIManagerunscheduleGlobalschedulertimeTickergetServerTimeendTimekuaFuProxyGameGlobal
floor	math�					









self timeLeft -timeStr " �  �3  9   X�6 9 ) B=  B2  �K  scheduleGlobalschedulertimeTicker self  update  �   �9    X�6 99  B+  =  6  9  BK  removeEventsEventManagerunscheduleGlobalschedulertimeTickerself   �   �6   9+  6 ' B99B9   X�9 BK  callBack	nameSGDLVOTELAYERdata.Config_UIrequireremoveUIUIManagerself   �   !S �6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   closeIt dispose updateTime initBtn tableCellAtIndex initRightUI initLeftUI loadTestData addEvent initReward initUI layOut create 	ctorSGDLVOTELAYER
class     "  $ # + % 6 , N 7 U O � V � � � � 	� 
#)$++SGDLVOTELAYER   