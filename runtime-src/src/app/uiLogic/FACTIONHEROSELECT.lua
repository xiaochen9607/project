LJV@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\FACTIONHEROSELECT.luaH   +  =  +  = +  = K  beforebutton	viewself   �   6     9  -  9 9B6 ' B99B K  �	nameFACTIONHEROSELECTdata.Config_UIrequiregetParent	viewremoveUIUIManagerlogic        K    �   %-   9   
   X �6    9  6 96 ' B95 -  9 =	B -  B X �6 
   9  ' B K  ��请先选择武将！addMessageFloatMessage	hero  heroSelectedapp.event.LoginProxyEventrequirelocalPlayerGameGlobalsendEventEventManagermyHerologic cb  �&|�#-   9 B=3 6  996	 9		6 99 6 99	 6 996 99	B	5
 6 9
)  )  )  )� B=
6 9
)  )  )  )  B=
B4  = 9'	 B	 9)
d B	 9'
 B	 9)
e B6 	 9
 5 3 =B6 6	 9		9		BH
�6 ' B6 9B89	 X�6 9 9 BF
R
�3! 6 
 99 9' B5" =B6 
 99 9'# B5$ =B
 9%B2  �L  �makeList  
close   insert
tablecallRollidtonumberdata.Config_Hero.luarequirelocalPlayerGameGlobal
pairscallBack   widgetTouchExtentButton_3setLocalZOrderImage_63getChildByName
herosborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRectUIManager 	viewnew����
		           !!!""FACTIONHEROSELECT self  }view  }param  }logic xcb vrect )Mrect1 G  _ v  ensure  o  ):-  9  9B9K   �ygetContentOffset_tableviewself table_view  cur_offset_x  � %@-  6 9-  9B= -  6 9-  9  B=-  9L  �	ceil	mathcellNum
heros	nums
tableheroNum
self table_view   T  G-   9    D  �tableCellAtIndexself table_view  idx   -    K)� )YJ table_view  idx   �  g�,(9    X�9   9B2 ^�X[�9  9' B6 9 96 9	 9	B9
 
 9	B9B A=  9   96 9B9   9 9B 9B A9   9B9   9' B9  99  B9   93 6 9B9   93 6 9B9   93 6 9B9   93 6 9B9   9B9   9B92  �K  K  xgetContentOffsetTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildscrollViewsetNamesetDelegategetPositionYgetPositionXsetPosition"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewccImage_61getChildByName	viewreloadData_tableview�^










!!!####$$$$$((self  gback_sp Vcur_offset_x V  �  B_l-   9   
   X !�-   9     X �-   9    9  -  9B    X�-   9    9  -  9B   9  -  9 B   9  ' B   9  + B -    9  ' B   9  + B -   - =  -   - = -   - = -   -  9
- -   8=	 K   �
�	����
herosmyHerobeforeCellsetVisiblegougetChildByNamenodeIndexcellAtIndex_tableviewbefore
			









self node i idx _cell index  �  ��U) 9 B  X� 9BX�6 9 9B 9 !)  ) ) ) Ml�9
   	8

 
 Xc�6
 
 9

'	 B
6
 ' B 9
 9   	8+ B 9
 B
 9
 		 )? B
 9
' B 9+ B
 9
' B 9+ B
 9
' B 9+ B
 9
	 B9 9   	8 X� 99 B 9' B 9+ B= 3 6  9
 9
' B5 =B
 9
' B 9+ B2
 �2	 �O� 9'	 
 &	
	B2  �L 	cellsetSwallowTouchescallBack  QualitywidgetTouchExtent beforeCellgoubeforemyHerosetNameImgArmTypeTxtNamesetVisibleImgNameBggetChildByNamesetPositionaddChildsetDataapp.uiLogic.CharHeadNode2require ui/common/CharHeadNode2.luagetNodeFromCacheUIManager
heroscellNumnewTableViewCellccremoveAllChildrendequeueCell
�				






"##########$$$$$$$$$%	''''''((self  �table_view  �idx  �_cell �index yposX xm m mi jnode ]cb K     	K  self   K   �6   9  BK  removeEventsEventManagerself   �   & �6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 2  �L   dispose layout tableCellAtIndex makeList create 	ctorFACTIONHEROSELECT
class+T,~U�����FACTIONHEROSELECT   