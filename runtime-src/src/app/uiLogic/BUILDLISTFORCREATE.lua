LJW@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\BUILDLISTFORCREATE.lua    	K  self        2 K    �-��*-   9 B=6 9 9B 9B6 9B 96	 9			)  )  6
 99 6
 99 B	 A 96	 9		)  )  B	 A 96	
 9		9				 		6

 9

9



 

B 96	 9		)  )  )  )� B	 A 9)	� B9 9	 )
��B)  =  X�9  X�) =X�9= 9B 9B 9B6  9	 6
 9

6 ' B9 6!  9 B A6
  9"9	6
 9
	
6
 996
 996
 996
 99 B
5# 6 9)  )  )  )2 B=$6 9)  )  )  )  B=%B9	 9&'
' B	 9(+
 B6
 	 9)9

 9
&
'' B
5+ 3* =,B2  �L  �callBack   widgetTouchExtentsetSwallowTouchesImage_55getChildByNameborderColorfillColor borderWidthcreateRecthandlerupgradeBuildapp.event.ManorProxyEventrequiremanorProxyGameGlobaladdEventEventManagercreateBuildListUIinitUIInfoinitBtn
indexnPitIndexaddChildsetOpacityc4fsetColorsetPositionpsetAnchorPointheight
widthActualDesignSizeUIManager	rectsetTextureRectnewSpritedisplaygetWinSizegetInstanceDirectorcc	viewnew��������
													









""""""""""""""""""""""""################"%%%%%%%%%&&&&&&&&&&&&))BUILDLISTFORCREATE self  �view  �param  �logic �winSize 	�spriteBg �rect � ;   ;  9  BK  
closeself  target  obj   :  E-   9 BK   �
closeself sender   �  -C3  9  9' B= 6  99 5 =5	 =
B2  �K  
param  Button_closecallBack  widgetTouchExtentUIManagerButton_3getChildByName	viewButton_close 	

self  btnClicked_close      	Y)K  )self   �  ;��$6  96  B B6  96  B B6  96  B B' '  &)
  X�'  &'  &)
  X�' 	 &	' 	 &	)	
 	 X	�'	 
 &
		 '
  '  ' &	L 秒分小时0tonumber
floor	math�8x
       #self  <sec  <nhour 4nsec ,ns $strTime #strTime_h  strTime_sec 	strTime_ss 	 7   �  9  BK  createBuildListself   p  )�-  9  9B9K   �ygetContentOffset_tableviewself table_view  cur_offset_x  7  �-  9 L  �cellNumself table_view   U  �-   9    D  �tableCellAtIndexself table_view  idx   .    �)� )�J table_view  idx   �	 -���=6 9 9B=  6 9  B9   6 9 B= ) = 9  9 8=	 ) =
 9   X�9  9B2 b�X_�9  9' B6 9 96 9
 9B9 9	B	9		B A= 9  96 9B9  9 9B	 9B A9  9B9  9' B9  96 9 B9  9!9 B9  9"3# 6 9$B9  9"3% 6 9&B9  9"3' 6 9(B9  9"3) 6 9*B9  9B9  9+B9,2  �K  K  xgetContentOffsetTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildTABLEVIEW_FILL_TOPDOWNsetVerticalFillOrderscrollViewsetNamesetDelegategetPositionYgetPositionXsetPosition"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewccImage_75_CopygetChildByName	viewreloadData_tableview	linecurBuildselected	ceil	mathcellNum	dumpgetCreateBuildListmanorProxyGameGlobalbuildList



!""%%%())%,,,/00,33367739999:::::==self  �maxNum wback_sp Zcur_offset_x Z  �  V��F 9 B6 9 9B 9)  )	  B  X�6 9 9B  )  )  )  9	  	 X
.�)	 )
 ) M	*�9   9 8
  X!�6	  9
' B  9  9 8B  9B9" 9'  &B 9 B 9  BO	� 9	' B	 9	 B	9	 	 	=	 L cellNodeaddChildBIGBUILDINFOsetName
widthgetContentSizeBuildListHandlui/farm/BigBuildInfo.luagetNodeFromCacheUIManager	linebuildListnewTableViewCellsetPositioncreate	NodeccdequeueCell		





!!!!&&&&)))))******+++++++,,,,,,----/////AAAACCCCDDDEself  Wtable_view  Widx  W_cell Snode Nindex @lastIndex ?x =y  =+ + +i )nodeS  � 
 "@�6   B6 9 99B:96  96 ' B9	6
 	 B+ B  X�6 9 9-  99BK   �
indexsend_upgradeBuildtonumberSILVERapp.const.Const_CostTyperequirecheckResourceEnoughneedMoneyidgetBuildUpdataInfoByIDmanorProxyGameGlobal	dumpself sender  #data  #price  � /���G 9 ' B 99B6 9) )� )H )	� B 9 ' B 99	'
 9	&		B 9
	 B 9 '	 B	 9B
 9B9  
 9 B6 9)
� )� )x )� B 
 9 ' B6	 9			 9		9B	:		9		 9
	 B
 9

 B
 9
 ' B
' 6 9998&96 9 X�6 99:
 9
 6 9 9!B3"  9 '# B6$  9% 5& ='5( >=)B6* 9B6* 9	B X� 9++ B 9,+ B6 9)� ) )
 )� B  9
 B6* 	 B6 9-9. X�6 9)� ) )
 )� B  9
 B2  �K  silverlocalPlayersetTouchEnabledsetBrighttonumber
param  Button_CreatecallBack  widgetTouchExtentUIManagerButton_Create plistTypeTextureResType	ccuiloadTextureguandiBUILD_MANSIONBuild_Tablebuilding
manorConfig_UIPathImage_IconneedMoneyidgetBuildUpdataInfoByIDmanorProxyGameGlobalText_BuildCostsetPositionX
widthgetContentSizegetPositionXText_BuildNumTipsetColorMaxBuildNum/hadBuildNumText_BuildNumc4fcc	namesetStringText_BuildNamegetChildByName							



0111122222344427777777788889999::::::::;;;;????????AAAAAAAABBBBGGself  �node  �buildInfo  �Text_BuildName �conColor �Text_BuildNum �Text_BuildNumTip �posx 	|Text_BuildCost lprice dImage_Icon Xpic QbtnClicked_Button_Create @Button_Create < �   �6   9+  6 ' B99BK  	nameBUILDLISTFORCREATEdata.Config_UIrequireremoveUIUIManagerself   K   �6   9  BK  removeEventsEventManagerself   �   #\ �6   ' B 6   ' B 6  ' B 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   dispose 
close BuildListHandl tableCellAtIndex createBuildList createBuildListUI handleTime initUIInfo initBtn upgradeBuild create 	ctorBUILDLISTFORCREATE
class app.utils.DisplayObjectUtilapp.utils.StringUtilrequire         
  6  @ ; O C � Y � � � � � � >� �@������BUILDLISTFORCREATE 
  