LJQ@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\ZHANSHANRANK.lua�   +  =  +  = ) = 4  = )��= 4  = +  = K  lastRewardrewardmyRankrankInfostabbutton	viewself   �   6     9  -  9 9B6 ' B99B K  �	nameZHANSHANRANKdata.Config_UIrequiregetParent	viewremoveUIUIManagerlogic        K    � ?e9 :)�� X�-  BK  - 4  =- 9 :=- 9 :=- 9)   X�- )  =) 9  ) M�6 9- 95	 9
 8

=
	9
  8

=
	9
 8

=
		BO�-  9
B-  9B-  9BK  ��buttonEventmyInfos	init
score	nameuId  insert
tablemyScoremyRankrankInfos
param					


cb logic target  @arr  @   i  �!]�%-   9 B=3 9 9' B=6  995		 3
 =

	B6  9
 9' B5	 =
	B6  996	 9		6 99 6 99 6 996 99B	5
 6 9)  )  )  )� B=
6 9)  )  )  )  B=
 B3 6 	 9
 6 96 ' B9 B6 9	 99
 B2  �L  �tabsend_rankingranking!app.event.ZhanShanProxyEventrequirezhanShanProxyGameGlobaladdEventEventManager borderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRect  Button_1callBack   widgetTouchExtentUIManagerImage_1getChildByName
basic 	viewnew����
								









 !!!!!!!!!!!!""""""$$ZHANSHANRANK self  ^view  ^param  ^logic Ycb Wrect Branking  �   >Y29   9' B 99 B9   9' B 99 B)  9 )   X�) 6  ) M�6 899  X�9 6 89	 X�6
  96	 8		9		'
 + B:X�O�9   9' B 9 BK  _reward
splitStringUtilmaxRankminRankConfig_CrossKingRankingmyScore
scoremyRanksetString	rankgetChildByName	viewself  ?num +  i  �   A6     9  6 9 9B 9B6 99+  5
 -  9	=	B K   �  myRank	nameZHANSHANREWARDConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerself  �	  @3  6  99  9' B5 =B2  �K  callBack  Button_32getChildByName	viewwidgetTouchExtentUIManager self  cb  7  V-  9 L  �cellNumLself table_view   U  Z-   9    D  �tableCellAtIndexLself table_view  idx   -    ^): )lJ table_view  idx   �  ]oF9  =  9   X�9  9B2 Q�XN�9  9' B6 9 9	6 9
	 9B9
 9B9B A= 9  96 9B9  96 9B9  9)  )  B9  9B9  9' B 99 B9  93 6 9B9  93 6 9B9  93 6 9B9  9B2  �K  K  TABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW registerScriptHandleraddChildscrollViewsetNamesetDelegatesetPositionTABLEVIEW_FILL_TOPDOWNsetVerticalFillOrder"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewccImage_1625getChildByName	viewreloadData_tableviewrankInfoscellNumL						





self  ]back_sp I �  	 $�6     9  6 9 9B 9B6 99+  5 -  9	- 89
=
B K   �� 
typeszhanshanuIdrankInfos	nameOTHERPLAYERINFOConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerself index  � 4��d: 9 B  X� 9BX�6 9 9B  6  9' B 9'		 B 9
9	 8		9		B 9'	 B 9
9	 8		9		B)��) 6  )	 M�6 8
9 X	�6 8
9 X�6 8
9X�O�6 	 9
 ' + B:
 9' B
 9
 B
 9' B
 96  9 ' ) B A+  			  X	� 9	' B		 9		+ B	 9	' B		 9		+ B	 9	' B		 X	� 9	' B		 9		+ B	 9	' B		 9		+ B	 9	' B		 6	 9			 9	 	B		 9
!	 9'	 B 9"B 9'	 B 9#BB
6
 
 9
$
9 89B
	 9%	 9'	 B 9&B A	 9'	 9'	 B 9(B A	 9)	 9'	 B 9*B A'+ ) 
 ) M� ' &O�	 9
	 B 9	 B9,  X�	 9)	6- 9.B 9'	 B 9)6- 9.B3/ 6  90 51 =2B 93+ B 9 B2  �L setSwallowTouchescallBack  widgetTouchExtent 
greenConst_colorDatamyRankgetColorsetColorgetFontNamesetFontNamegetFontSizesetFontSizegetStringWidthgetPositionYgetPositionXsetPositioncreate	Text	ccuiImage_26setVisibleImage_25uiNum6createImageStringaddChildrankNumText_Score_Copy_
splitStringUtilrewardmaxRankminRankConfig_CrossKingRanking
scoreText_Score	namerankInfossetStringText_NamegetChildByName,ui/zhanshanweiwang/ZhanShanRankNode.luagetNodeFromLuaUIManagernewTableViewCellccremoveAllChildrendequeueCell										









"""""##################$$$$$$$%%%%%%%%%%&&&&&&&&&&''''''''''())))***),,,,----///00000111111111566666667777888899self  �table_view  �idx  �_cell �index �node �reward �  i wangzhebi �widget �underline 3kstringLen Rstr 3  i heroTouch      	�K  self   K   �6   9  BK  removeEventsEventManagerself   �   % �6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 2  �L   dispose layout tableCellAtIndexL 	init buttonEvent myInfos create 	ctorZHANSHANRANK
class
1?2E@cF�d������ZHANSHANRANK   