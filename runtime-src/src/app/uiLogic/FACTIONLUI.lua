LJO@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\FACTIONLUI.lua\   	+  =  +  = ) = )  = K  applyNumcurPagebutton	viewself  
 �   6     9  -  9 9B6 ' B99B K  �	nameFACTIONLUIdata.Config_UIrequiregetParent	viewremoveUIUIManagerlogic  � 5K9 :	  X0�-  -  9 =-  9) >-  9 9' B 96 ' B9	B-  9 9'
 B 9' 6 99B-  9 9'
 B 9' 6 99BK  �common_anniu4down.pngloadTexturePressedplistTypeTextureResType	ccuicommon_anniu4up.pngloadTextureNormalButton_1yishenqingdata.Config_LanguagerequiresetString
applygetChildByNameidxNodeidxapplyNum
paramlogic target  6arr  6 � 5K"9 :	  X0�-  -  9 =-  9)  >-  9 9' B 96 ' B9	B-  9 9'
 B 9' 6 99B-  9 9'
 B 9' 6 99BK  �common_anniudown.pngloadTexturePressedplistTypeTextureResType	ccuicommon_anniuup.pngloadTextureNormalButton_1shenqingjiarudata.Config_LanguagerequiresetString
applygetChildByNameidxNodeidxapplyNum
paramlogic target  6arr  6 �%l�	(-   9 B=6  9' B=9 9B3 6  996		 9	
	6 99 6 99 6 996 99B	5
 6	 9)  )  )  )� B=
6	 9)  )  )  )  B=
B4  =6 99=3 3 6 
 9 6 96 ' B9 B6 
 9 6 96 ' B9 B
 9B
 9B6 
 9 9 9!'" B5# =$B2  �L  �callBack  Button_1getChildByNamewidgetTouchExtentmakeList1sortArrcancelApplyJoinapplyJoinFactionapp.event.FactionEventrequireaddEventEventManager  totalFactionfactionGameGlobalarrborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRect retainui/palace/FactionLNode.luagetNodeFromLuaUIManager	node	viewnew����
!""""""""""""############$$$%%%&&&&&&&&&&&''FACTIONLUI self  mview  mparam  mlogic hcb \rect )3apply ,cancel + �    +4<
: : X	�: :  X�+ X�+ L X�: : X�: : X	�: :  X�+ X�+ L X�: : X�: :  X�+ X�+ L K  
a  ,b  , � 8R24  =  ) 6 99 B) M)�4  6  99	 8		'
 B 6 99  4	 6
 :B
>
	:
>
	6
 :B
>
	6
 :B
>
	6
 :B
 ?
  B6 :B	 X�9	 =	 O�6 9
9  3 BK   	sortapplyNumtonumberinsert|
splitStringUtilarr	nums
tabletmp����



self  9	* * *i (aa ' o  )X-  9  9B9K   �ygetContentOffset_tableviewself table_view  cur_offset_x  /   ^-  L �factionNum table_view   T  c-   9    D  �tableCellAtIndexself table_view  idx   -    g)> )wJ table_view  idx   � $n�H(6  99 B= 9   X�9  9B2 `�X]�9  9' B6	 9
 96	 9
 9B9  9	B	9				B A= 9  96	 9B9  9 9B	 9BB9  9B9  9' B9  99 B9  93 6	 9B9  93 6	 9B9  93 6	 9B9  93  6	 9!B9  9B9  9"B9#2  �K  K  xgetContentOffsetTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildscrollViewsetNamesetDelegategetPositionYgetPositionXsetPosition"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewcc
bgRefgetChildByName	viewreloadData_tableviewtotalNumtmp	nums
table4�T																			





!!!####$$$$$((self  nfactionNum iback_sp Xcur_offset_x X  � 	  <q 9 B  X� 9BX�6 9 9B 9   X�L   9   BL makeList	nodenewTableViewCellccremoveAllChildrendequeueCell	self  table_view  idx  _cell  �  e{�6   ' B 6 -  :B8  9  -  :  X �-   :     X 	�6    9  6  ' B9B K  -  9  )   X �-   :  	  X �-  -  =	 -  - =
 6  9    9  -  :B -    9  ' B   9  6  ' B9B X 
�-   :  	  X �6    9  6 9B -   :  	   X �-  -  =	 -  - =
 6  9    9  -  :B -    9  ' B   9  6  ' B9B K  � ��yishenqingsend_cancelApplyJoinmaxApplyTipConfig_LanguageshenqingjiarusetString
applygetChildByNamesend_applyJoinFactionfactionGameGlobalidxNodeidxapplyNumbangpaiyimandata.Config_LanguageaddMessageFloatMessageperNumtonumberdata.Config_FactionLv.luarequire 			






tmp self factionNode  � 3��C9   9B9 !=  4  9 9 8 9'	 B 9:	B 9'	 B 9:	B6	 6
 :	B89	 9'
 B	 9:
'  &

B:	  X"�	 9'
 B	 96
 ' B
9

B	 9'
 B	 9'
 6 99B	 9'
 B	 9'
 6 99BX$�:	 X!�	 9'
 B	 96
 ' B
9

B	 9'
 B	 9'
 6 99B	 9'
 B	 9'
 6 99B3 6 99 )	  	 X�6! 
 9" 9' B5# =$BX�6% 9&'
' ' &

B 9	' B		 9	(	 B	 9	' B		 9		6 ' B9B	 9	)): ) B	9 6	! 	 9	*	 '+ ) B		 9
,	'- B
 9
(	 B
	 9
)	 9'. B 9/B A
9
 

	
 X
	� 9
'0 B

 9
1
+ B
X
� 9
'2 B

 9
1
+ B
 9
( B
 9
))  )  B
2  �K  
liangsetVisibleangetPosition	rankabilitysetNameuiNum6createImageStringsetPositionaddChild#newGraySpritedisplaycallBack  widgetTouchExtentUIManagerfactionUIdfactionGameGlobal common_anniudown.pngcommon_anniuup.pngshenqingjiarucommon_anniu4down.pngloadTexturePressedplistTypeTextureResType	ccuicommon_anniu4up.pngloadTextureNormalButton_1yishenqingdata.Config_Languagerequire
apply/zhanliperNumtonumberConfig_FactionLvlvsetString	namegetChildByNametmptotalNumcurNum
clone	node 											


())))))***********,,,,,,--------.........../////23333333444466667777777777<<<<=========????????AAAABBBBBCCself  �cell  �idx  �node �factionNode �tmp �max �cb Uiim totalAbility 9sprite 2     	�K  self   �   �6   9  B9   X�9  9B+  = K  release	noderemoveEventsEventManagerself   �   # �6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 2  �L   dispose layout makeList tableCellAtIndex makeList1 sortArr create 	ctorFACTIONLUI
class1	G2pH~q�������FACTIONLUI   