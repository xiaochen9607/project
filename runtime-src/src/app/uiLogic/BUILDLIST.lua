LJN@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\BUILDLIST.lua    	K  self        0 K    �^�(-   9 B=6  996 96
 9

9


 
6 99 6 996 99B5	
 6
 9
	
)  )  )  )� B
=
	6
 9
	
)  )  )  )  B
=
	6
  9B
 A)  =  X�9  X�) =X�9= 9B 9B 9B9 9' B 9+ B6  99
 9' B5	 3
 =
	B2  �L  �callBack   widgetTouchExtentsetSwallowTouchesImage_bggetChildByNamecreateBuildListUIinitUIInfoinitBtn
indexnPitIndex
closehandlerborderColorfillColor borderWidth	nameBUILDTRAINc4fheight
widthActualDesignSize	rectcccreateRectUIManager	viewnew����
#########$$$$$$$$$$$$''BUILDLIST self  _view  _param  _logic Zrect ., :  ;-   9 BK   �
closeself sender   � 
 -93  9  9' B= 6  99 5 =5 =	B2  �K  
param  Button_closecallBack  widgetTouchExtentUIManagergetChildByName	viewButton_close 	

self  btnClicked_close  � 
  -gO6  9 9B9  9' B 99B9  9' B'	 6
 9998' &96 9 X�6
 9998 9 6	 9		9		BK  plistTypeTextureResType	ccuiloadTextureguandiBUILD_MANSIONBuild_Table	.pngidbuilding
manorConfig_UIPathImage_BuildIcon
levelsetStringText_BuildLvgetChildByName	viewgetMansionInfomanorProxyGameGlobal				self  .Maninfos (Text_BuildLv #Image_BuildIcon 	pic  Z   m6   9 BL formatTimeTextStringUtilself  sec  strTime  6   u  9  BK  createBuildListself   p  )�-  9  9B9K   �ygetContentOffset_tableviewself table_view  cur_offset_x  7  �-  9 L  �cellNumself table_view   U  �-   9    D  �tableCellAtIndexself table_view  idx   .    �)� )J table_view  idx   �	 ,��|=6 9 9B=  9   6 9 B= ) = 9  9 8= ) =	 9 )  X�) = 9
   X�9
  9B2 b�X_�9  9' B6 9 96 9
 9B9 9	B	9		B A=
 9
  96 9B9
  9 9B	 9B A9
  9B9
  9' B9
  96 9B9  9 9
 B9
  9!3" 6 9#B9
  9!3$ 6 9%B9
  9!3& 6 9'B9
  9!3( 6 9)B9
  9B9
  9*B9+2  �K  K  xgetContentOffsetTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildTABLEVIEW_FILL_TOPDOWNsetVerticalFillOrderscrollViewsetNamesetDelegategetPositionYgetPositionXsetPosition"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewccImage_SrollBggetChildByName	viewreloadData_tableview	linecurBuildselected	ceil	mathcellNumgetCreateBuildListmanorProxyGameGlobalbuildList



!""%%%())%,,,/00,33367739999:::::==self  �maxNum 	}back_sp !Zcur_offset_x Z      
�K  param   � l��I 9 B6 9 9B 9)  )	  B+   X�X�6 9 9B  )  )  )	  9
  
 XA�)
 ) ) M
=�9   9 8
  X4�6	  9
' B  9  9 8B  9B9" 9 B 9 	 B3 6	  9 9' B5 =4 9 8>=B 9' B 9+ BO
� 9
' B
 9
 B
9
 
 
=
 2  �L cellNodesetNamesetSwallowTouches
paramcallBack  Image_bggetChildByNamewidgetTouchExtent addChild
widthgetContentSizeBuildListHandlui/farm/buildInfo.luagetNodeFromCacheUIManager	linebuildListnewTableViewCellsetPositioncreate	NodeccdequeueCell	


   """"%%%%****-----......////////000022222:<<<<<<<<======<????????"DDDDFFFFGGGHHself  mtable_view  midx  m_cell inode dnodeFlag ^index 
TlastIndex Sx Qy  Q> > >i <nodeS /select tar  �   5�� 9 ' B 99B 9 ' B 99'	 9
&
B 9 ' B'	 6
 9998&96 9 X
�6 9	 9B6
 999	8		 9
 6 99BK  plistTypeTextureResType	ccuiloadTexture
levelguandigetMansionInfomanorProxyGameGlobalBUILD_MANSIONBuild_Tableidbuilding
manorConfig_UIPathImage_IconMaxBuildNum/hadBuildNumText_BuildNum	namesetStringText_BuildNamegetChildByName



self  6node  6buildInfo  6Text_BuildName 1Text_BuildNum )Image_Icon pic Maninfos 
 �   �6   99  9B6 ' B99BK  	nameBUILDLISTdata.Config_UIrequiregetParent	viewremoveUIUIManagerself   K   �6   9  BK  removeEventsEventManagerself   �   !O �6   ' B 6   ' B 6  ' B 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   dispose 
close BuildListHandl tableCellAtIndex createBuildList createBuildListUI handleTime initUIInfo initBtn create 	ctorBUILDLIST
class app.utils.DisplayObjectUtilapp.utils.StringUtilrequire         
  4  E 9 f O q m y u � | � )$.+00BUILDLIST 
  