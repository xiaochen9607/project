LJM@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\FILELIST.lua�   	+  =  +  = ' = ' = K  0E:/work/dpProject/clientCode/trunk/dp01/resresPath0E:/work/dpProject/clientCode/trunk/dp01/srcsrcPathbutton	viewself  
 �  	 &6     9  -  9 9B6 ' B99B -     X�-  9     X�-  9  B K  ��callBack	nameFILELISTdata.Config_UIrequiregetParent	viewremoveUIUIManagerlogic param        K    �P�
-   9 B=3 9 9' B=6  995		 3
 =

	B6  9
 9' B5	 =
	B6  996	 9		6 99 6 99 6 996 99B	5
 6 9)  )  )  )� B=
6 9)  )  )  )  B=
 B 9B 9B2  �L  �direct	initborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRect  Button_ClosecallBack   widgetTouchExtentUIManagerImage_1getChildByName
basic 	viewnew����
	FILELIST self  Qview  Qparam  Qlogic Lcb Jrect B �   #-   9     9  -  9 9B A -     9  -  9 9B A K   �listDirectgetTextebxApxsetString
labelself  � 8K!3  9  9' B= 6  99 6 9	)� )	  B) )X,	 5
 =B
= 9  96 9)  *  B A9  9* * B9  9)�B9  9)� )*B9  99 B2  �K  addChildsetPositionsetMaxLengthsetScalepsetAnchorPointcallBack  	sizecccreateEditBoxWithLabelUIManagerebxApxText_LabelgetChildByName	view
label ��������������������						




self  9returnCb 7 �  =w1-  9   BX5� X3� X1�  '  &-  9 B6 6	  B		 X	�+	 X
�+	 B9	 X�- 	 BX�6
 96	
 9		 B	6

 9

- B
 A  X�)   X�6 96
 9

5 >> BER�K    ��    
filesTestCaseinsert
upper	findstringdirectory	mode
table	typeassertattributes/...dir










lfs finds fileName path  >8 8 8file 5f -attr )q  � ./6  4  =3  9 B 9 B  9 B2  �K  �	showresPathsrcPath 
filesTestCaselfs self  fileName  finds  �	  ��G) ) ) M�9   9' 	 &	B9   9' 	 &	BO�) 6 9 ) M��6 9 9B 9'		 B 9
)	 B 96	 9		8		B 9'	 
 &	
	B 9)	  *
  B)  X%� 99	  	 9		' &B		 9		B	9
  
 9

' &B

 9

B
9

 	
			9
  
 9

' &B

 9

B
 AX� 9)	� )
TB6 9 9B	 9'
	 B	 9
)
 B	 9'
 B	 9'
  &

B	 9)
  *  B	 9 9
B
 9B9 



 9B A9  	 9
 B9  	 9
 B6 	 9
 5 6   9 B=4 >=BOq  9 BK  makeList
paramcallBack  backTohandlerwidgetTouchExtentUIManageraddChild>getPositionY
widthgetContentSizegetPositionXgetChildByNamesetPositionsetAnchorPointsetNamesetStringsetFontSizesimhei.ttfsetFontNamecreate	Text	ccuiTestCase
navi1	naviremoveChildByName	view����$						





self  �  i � � �i �text �text1 K> � 
 Pf'  )  ) M� 6 98'	 &	O� 6 9 ) M�6 9+  <O�  9  B  9 BK  	showlistFiles/	naviTestCase						



	self   index   path   i   i  �   ,5w6  : B6  :B X�6  : B X�+ L X�+ L X�6  : B X�: :::  X�+ X�+ L X�: :  X�+ X�+ L K  
table	type											a  -b  - p  )�-  9  9B9K   �ygetContentOffset_tableviewself table_view  cur_offset_x  7  �-  9 L  �cellNumself table_view   U  �-   9    D  �tableCellAtIndexself table_view  idx   .    �)7 )fJ table_view  idx   � ) x�u86 96 9B=  3 6 96 9 B9   X�9  9B2  �K  X_�9	  9
' B6 9 96 9
 9B9 9	B	9		B A= 9  96 9B9  96 9B9  9 9B	 9B A9  9B9  9' B9	  99 B9  93 6 9 B9  93! 6 9"B9  93# 6 9$B9  93% 6 9&B9  9B9  9'B9(2  �K  xgetContentOffsetTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildscrollViewsetNamesetDelegategetPositionYgetPositionXsetPositionTABLEVIEW_FILL_TOPDOWNsetVerticalFillOrder"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewccImage_4getChildByName	viewreloadData_tableview	sort 
filesTestCase	nums
tablecellNum"""%%%'''%***,,,*...000.22223333388self  ycb qback_sp Zcur_offset_x Z  q   � -     9   - 6 9- 8:B K   ���
filesTestCaseloadFile           self file index  s   � -     9   - 6 9- 8:B K   ���
filesTestCasereLoadFile           self file index  @   � -     9   - B K   ��refresh      self file  �
 ( ���# 9 B  X� 9BX�6 9 9B 9 !6  9' B6	 9
8:6 	 9 9
' B
5 3 =B6 	 9 9
' B
5 3 =B6 	 9 9
' B
5 3 =B6 	 B X1�	 9'
 B	 9+
 B	 9'
 B	 9+
 B	 9'
 B	 9+
 B	 9'
 B	 9+
 B	 9'
 B	 9:
B	 9'
 B	 9'
 BXA�	 9'
 B	 9+
 B	 9'
 B	 9+
 B' 6	 9
8:  X	
�6  
 9!6	 9
8:'" B:
 9' B
 9 '#  &B
 9' B
 9'$ B
 9' B
 9%6 9&)  )� )  B A	 9'
 B2  �L addChildc3bsetColor普通文件   -E:/work/dpProject/clientCode/trunk/dp01/
splitStringUtil文件夹Text_1setStringText_1_CopysetTouchEnabledsetBright
table	type   Button_2   Button_1_CopycallBack   Button_1getChildByNamewidgetTouchExtent
filesTestCaseui/login/FileListNode.luagetNodeFromLuaUIManagercellNumnewTableViewCellccremoveAllChildrendequeueCell					



!!!!""self  �table_view  �idx  �_cell �index �node �file �adder h0 � 
  B�'  ) 6 9 ) M� 6 98'	 &	O�6 96 9:B  9  :' &B  9 BK  	showlistFilesinsert
table/	naviTestCaseself   file   path   i  �   d��#6  9+   X�6 6  9	 '
 B=+  6  BH?�6
 9
	
6
  B6  9 ' B:B


  X0�) 
 X-�) 6 9 ) M �6 98 X�6 98 X�6 96 9 86 9	6
  B B  X�)  X�+  X�O�  X�6  9+  <X�FR�  X	�6  B6  9' BX�6  9' BK  G此文件之前未被加载，请在相应界面加载后再重载重新加载成功addMessageFloatMessagerequireressrc.tostring	findstring
pairs/
splitStringUtil	naviTestCaseloadedpackage












!!!!!#self  efile  epath  ealready_files bisFind aB B Bkey ?var  ?pos 2q  2
! ! !i sign pos1 q1   �   I��  X�6  6  9 ' B=' 6  +  =) 6  9 ) M� 6  98'	 &	O�6 9  &'	 B6
  B 9' B 9B6  9 B6  B6 	 B X
�6   B=6 	 9'
 BX�6 	 9'
 BK  !文本错误 不是lua格式K文本读取成功 作为table保存在全局变量 TestCase.dataLoadsaddMessageFloatMessagefunction	typeloadstringTryRemoveUtf8BOM
close*a	readassertr	openiodataLoads/
splitStringUtil	naviTestCase							


self  Jfile  Jpath  J  i file 'data  str fun  �  
�6  96 9B	  X�  9 ' 6 9B6  96 9' B  9	 BK  	showE:insert
filesE:/listFiles	naviTestCase	nums
table self   �  8j�6  4  =-  9 BX,� X*� X(� '  &-  9	 B6 6
  B

	 X
�+
 X�+
 B9
 X�6	 96
  9

4 4 >>>BX�6	 96
  9

4 >>BER�) K  �insertdirectory	mode
table	typeassertattributes/...dir
filesTestCase







lfs self  9path  9/ / /file ,f $attr  a #     	�K  self   K   �6   9  BK  removeEventsEventManagerself   �  " &^ �6   ' B 6 ' B3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  2  �L   dispose layout listFiles 	init loadFile reLoadFile refresh tableCellAtIndex makeList backTo 	show listDirect direct create 	ctorlfsrequireFILELIST
class          
 . ! F / e G t f � u � � � � � � � +/-4055FILELIST #lfs    