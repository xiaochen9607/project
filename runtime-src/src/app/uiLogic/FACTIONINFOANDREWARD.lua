LJY@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\FACTIONINFOANDREWARD.lua7   +  =  +  = K  button	viewself   �   6   9    9  B 6    9  -  9 9B6 ' B9	9
B K  �	nameFACTIONINFOANDREWARDdata.Config_UIrequiregetParent	viewremoveUIUIManager!send_getPlayerSomeInfoChangeloginProxyGameGloballogic  $    -   B +  L  �cb  ;    " : :  X�+ X�+ L         a  	b  	 � @V-  9 -  98)  >-  9 -  98)  >-  9 -  98)  >6 9-  9 3 B6  9-  9 9B6	 9
9+  5 '	 9
:

' 9:&		=	B6 99  X�6  9' B-   9BK  �makeList7FACTIONINFOANDREWARD getReward exploit变nil了！throwErrorLoggerexploitfactionGameGlobal
items isShow,3_30020_
param	2_1_	nameACQUIREITEMSSIMPLEConfig_UIgetParent	view
addUIUIManager 	sort
tablecurSelectcellTable					logic target  Aarr  A �  5X+	6   9-  9 9B6 99+  5
 '	 9
:

'	 9:&		=	B6 94  =) -  9 ) M�-  98)  >-  98)  >-  98)  >O�-   9BK  �makeListcellTablemanorCityRewardfactionGameGlobal
items isShow,3_30020_
param	2_1_	nameACQUIREITEMSSIMPLEConfig_UIgetParent	view
addUIUIManager	logic target  6arr  6   i  ;    @ : :  X�+ X�+ L         a  	b  	 �   D6   9  9     	   X �K  6   9    9  B K  $send_oneKeyAcqFactionManorMoneymanorCityRewardfactionGameGlobal  �   	 M6     9  6 9 9B 9B6 99B K  	nameABANDONCITYConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManager �  S�Z-   4  =  4   6 6 99:B  XB�6 99    X�K  6   BH6�4  6 	 9
 ' B 4  6 
 9:'	 B 6 
 BH �4  6  9 '
 + B 6 99: X�:6 9-  9 4 :>:>:>:>:>BFR�FR�-   9BK  �makeListinsert
tableiconStringDefault_,|
splitStringUtil
pairsallRewardfactionGameGlobaltonumbercellTable����				
		logic tmp O9 9 9_ 6v  6tmp1 5tmp2 -
# # #_  v   tmp3 flag  �  
  �6     9  -  9 9B6 ' B99+  5 - =	B K  ��str height�
width�	nameSIGNINTROdata.Config_UIrequiregetParent	view
addUIUIManagerlogic intro  �F��-   9 B=3 9 9' B=6  995	 =		B3 =
6  996	 9		6 99 6 99 6 996 99B	5
 6 9)  )  )  )� B=
6 9)  )  )  )  B=
B9=+  =3 3 6 
 9 6 96 ' B9  B6 
 9 6 96 ' B9! B+  9		" X	s�6	# 9$	6	 	 9	%	'& B	=	9		 9	'	B	4	  =	(6	 9		9	)			 	 X		�6	 9		9	)	=	(6	* 9	+	9(3, B	 9	'- B		 9	.	'/ 60 9192B	3	3 6
 
 9

9 9'! B54 =		B
3
5 6 996 X�6 996 X�9 9'7 B 98+ B9 9'7 B 99+ BX�6  99 9'7 B5: =
	B9 9'7 B 99+ B9 9'7 B 98+ B 9;BX	;�3	< 6
 
 9

 6 96 ' B9=	 B
9

 9

'! B

 9
>
+ B
9

 9

'7 B

 9
>
+ B
6
# 9?
6
 
 9
%
'@ B
=
9

 9
'
B
 9
'- B

 9
.
'A 60 9192B
6
 9


 9
B
B
3	C 6
 
 9

9 9'D B5E =		B
2  �L  �  wenhao send_getAllCityManorRewardpalace_techanyilan.png$ui/palace/CountryRewardNode.luaspecIntrosetVisiblegetAllCityManorReward makeList  setBrightsetTouchEnabledabandon
myJob    plistTypeTextureResType	ccuipalace_lingdixiangqing.pngloadTexture	name 	sort
tablemanorCityRewardcellTableretain#ui/palace/CountryManorNode.luagetNodeFromLuamanorDetailIntroConfig_GameData	infooneKeyAcqFactionManorMoneyacqFactionManorMoneyapp.event.FactionEventrequirefactionGameGlobaladdEventEventManager  	node	typeborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRect canClosedcallBack  widgetTouchExtentUIManagerButton_1getChildByName
basic 	viewnew����
 						






#-............////////////011122333333555566777777888899999<<<<<<<<<<<CDDDDDDDDDDDHIIIIIIIIIIJJJJJJJJJKKKKKKKKKKMMMMMMMMMMMNNNNNNNNNOOOOOOOOOQQQQmnnnnnnnnnnnnooooooooopppppppppqqrrrrrrttttuuuuuuuuuuuvvvvv{|||||||||||~~FACTIONINFOANDREWARD self  �view  �param  �logic �cb �rect 8�getReward �oneKeyAcqFactionManorMoney �intro �oneKeyAcqFactionManorMoney ,Iabandon =cb1 ?:cbIntroduce ; p  )�-  9  9B9K   �ygetContentOffset_tableviewself table_view  cur_offset_x  �  �-  6 9-  9B= 6 9-  9  D  �	ceil	mathcellTable	nums
tablecellNumself table_view   U  �-   9    D  �tableCellAtIndexself table_view  idx   �  5�-  9  X�)� -  9B9J X�)� -  9B9J K   ��
widthgetContentSize	info	typeself back_sp table_view  idx   �
 *���56  96 99 B B)   X
�9  9' B 9+ BX	�9  9' B 9+ B9	   X�9	  9
B2 ��X��9  9' B6 9 96 9	 9B9
 9B9B A=	 9	  96 9B9	  9)  )  B9	  9)  )  B9	  9B9	  9' B9  9' B 99	 B9  9' B 9+ B9  9' B 9+ B9  9' B 9+ B9  9' B 9+ B9	  93  6 9!B9	  93" 6 9#B9	  93$ 6 9%B9	  93& 6 9'B9	  9
B9	  9(B9)2 �2  �K  K  xgetContentOffsetTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandlersetSwallowTouches
rect2setTouchEnabled
rect1addChildscrollViewsetNamesetDelegatesetPositionsetAnchorPoint"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewccImage_5reloadData_tableviewsetVisible
xinxigetChildByName	viewcellTable	nums
table	ceil	math




!!!$$$&&&$(((...(000011111155self  �back_sp -~cur_offset_x ~  �   �-   - =  6  9    9  -  9- 8:B K   �	�cellTablesend_acqFactionManorMoneyfactionGameGlobalcurSelectself i  � D���Q 9 B  X� 9BX�6 9 9B 6 99  B!)  9 	 X߀   ) Mր9

 8
	


  X
Ѐ9
 
  X
�2 Q�9
 
 9

B
6 ' B9
 8	:8
 9
' B 9' 99' &6 99B
 9
' B 99B
 9
' B 96  96 ' B'	 9&8B A
 9
' B 99
 8	:B
 9
' B 99
 8	:B
 9
'  B 99
 8	:6! 9"&B 9#
 B
 9$
B
 9%
'& B
 9
' B9
 8	:)   XX�6 '' B 9(* + + B 9)+  + B
 9#
 B 9*'& B 9+6 9,)\ )T B A6 9- 9('. 6 99B 9# B 9+)T )F B 9/6 90 9(6 91 9(6 92 9(* * B6 92 9(* ) B A A A33 64  95 56 =7B 98+ BX� 98+ B 99+ B2	 �O*X��   ) Mx�9

 8
	


  X
s�9
 
  X
�2  �L 9
 
 9

B
6 ' B6: 9
 8	:B8
 9
' B 99B
 9
' B 96  96 ' B'	 9&8B A6 '; B 9(
 9
'< B4 9
 8	:>9
 8	:>9
 8	:>+ B 9=) + B9
 8	:> X�9
 8	: X�6? 9@ 9A
 'B 9
 8	:B7< X
�
 9
'B B  X� 9C+ B 9#
 B
 9$
BO�2  �L L setVisible	flaghandleFactionIconfactionGameGlobal-1showName	iconapp.uiLogic.ICONtonumbersetSwallowTouchessetTouchEnabledcallBack  widgetTouchExtentUIManager ScaleToSequenceRepeatForeverrunActioncommon_lingqu.pngImageViewpsetPositionsetName	initcreateapp.sprite.SkillAnieffectremoveChildByNamesetPositionXaddChildTIMEHOURConfig_Language	timegongxunyinliangapp.const.Const_colorDataconvertHexToRGBDisplayObjectUtilsetColorsetString	nameplistTypeTextureResType	ccui	.pngcityTypepalace_loadTexture	citygetChildByNamedata.Config_Cityrequire
clone	nodecellTable	info	typecellNum	ceil	mathnewTableViewCellccremoveAllChildrendequeueCell����̙��������̙������
	


         !!!!!""""####$$$$$$$$&&&&&&&&&''''((((()))))))))))))))))))))))))))-......./////1111333345777777778888999::<<<<=========>>>>>>>>??????????????????@@@@@@@@@@@@@@@@@@@@@@@@AAAAABBBBBBBBBBCCCCCCCCCCCCEEEEFFGGGGJJJJKKKKKL7PPself  �table_view  �idx  �_cell �index �m �
� � �i �node �pos �toGet [feffect Nim 0acqReward %y y yi wnode jpos 	anodeLogic 2/flag      	�K  self   �   �9    X�9   9B+  =  6  9  BK  removeEventsEventManagerrelease	nodeself   �   : �6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 2  �L   dispose layout tableCellAtIndex makeList create 	ctorFACTIONINFOANDREWARD
class     �  � � � FACTIONINFOANDREWARD   