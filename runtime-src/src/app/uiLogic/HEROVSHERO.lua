LJO@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\HEROVSHERO.lua7   +  =  +  = K  button	viewself   � #q�-   9 B=6  996 96
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
	B6 ' B 9
 9' B5	 6
  9B
=
	B=6  9 6	 9		6
 ' B
9

6  9B A6  9 6	 9		6
 ' B
9

6  9B A6  9 6	 6
 ' B
9
 
6  9!B A6 9 9"BL  �send_getDuelInfoUIRemovedREMOVEapp.event.UIManagerEventrefreshDuelmakeListgetDuelInfoapp.event.CampaignEventcampaignGameGlobaladdEventEventManagercallBack  closeIthandlerProjectNode_1getChildByNamecreateapp.uiLogic.COMMONBAKrequirecommonBakLogicborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRectUIManager	viewnew����
														




HEROVSHERO self  rview  rparam  rlogic mrect *C �   )6   9+  6 99B  X�9  X� 9B6   9+  6 99BK  HEROVSHEROremoveUIupdateUI	nameWORLDWARUIConfig_UIgetUILogicByNameUIManagerself  logic 	 �  	 )6     9  -  9 9B6 ' B99+  5 B K     	typevip	nameVIPANDPAYdata.Config_UIrequiregetParent	view
addUIUIManagerself  �  (6     9  -  9 9B6 ' B99+  5 3	 =
B K   �	fun1  idj	nameMESSAGEBOXdata.Config_UIrequiregetParent	view
addUIUIManagerself  �   16     9  6 ' B9-  + B    X�6   9    9  B K   send_refreshDuelcampaign	GOLDapp.const.Const_CostTyperequirecheckResourceEnoughGameGlobalcurCost  �  #/
6     9  -  9 9B6 ' B99+  5 - =	3
 =B K   ��	fun2 
param id
qdcz3	nameMESSAGEBOXdata.Config_UIrequiregetParent	view
addUIUIManager
self curCost  o  )O-  9  9B9K   �ygetContentOffset_tableviewself table_view  cur_offset_x  Q U6  9-  9 D  �totalNum	ceil	mathself table_view   T  Z-   9    D  �tableCellAtIndexself table_view  idx   -    ^)� )�J table_view  idx   �6��K)  6  996   X�6 6  99 89X�6 6  9989-  6  99!9  9' B 9 B9  9'	 B 9 B)   X�6
  99  9'	 B5 3 =BX�6
  99  9'	 B5 3 =B6 96  99B= 9 )  X
�9  9' B 9+ BX	�9  9' B 9+ B9   X�9  9B2  �K  XY�9  9' B6 9 96 9 9	B	9	 	 9
B
9
!
B A= 9  9"6 9#B9  9$	 9%B
 9&B A9  9'B9  9(') B9  9*9 B9  9+3, 6 9-B9  9+3. 6 9/B9  9+30 6 91B9  9+32 6 93B9  9B9  94B952  �K  �xgetContentOffsetTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildscrollViewsetNamesetDelegategetPositionYgetPositionXsetPosition"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewccbgreloadData_tableviewsetVisiblexiaduelInfo	nums
tabletotalNum   callBack   Button_28widgetTouchExtentUIManager	goldsetString
timesgetChildByName	viewcostGoldConfig_DuelRefreshMoneyduelRefreshTimescampaignGameGlobal									








       !!!!""""""""""$$$$$$$$$&&&''''(((*****,,,,,,,,,,,,,,,,,------//////////000011111222223336663999;;;9>>>@@@>BBBDDDBFFFFGGGGGKKMAX_REFRESH_TIMES self  �curCost �restRefreshTimes �back_sp [Tcur_offset_x T  �  W�h 9 B  X� 9BX�6 9 9B 6 99  B!6 9	9
 8  X�6  9' B  9 	 
 

B 9'	 B 9	 B 9)	 )
  B6 9	9
  8  X�6  9' B  9 	 
 
 
B 9'	 B 9	 B 9)	�)
  BL CELLNODE2setPositionaddChildCELLNODE1setNamesetNode ui/worldWar/HeroVsHeroNode1getNodeFromLuaUIManagerduelInfocampaignGameGlobaltotalNum	ceil	mathnewTableViewCellccremoveAllChildrendequeueCell								




self  Xtable_view  Xidx  X_cell Tindex Anode node   � 	  "�6   96 9 9B 9B6 99+  5	 =
BK  	info  	nameHEROVSHEROSELECTUIConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerself  info   �   !�6     9  6 996 ' B99+  5	 -  =
6 '	 B	 96
 9

9

B=B K  �allHero
heroslocalPlayergetArraySortByBatPowerapp.uiLogic.CommonHeroInfo	hero  	nameHEROATTRIBUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerhero  �   *� 6     9  6 9 9B 9B6 ' B99	+  5 -  9
=6 -	 -
 9

B=,	 )
 B 
K  � �callBackmakeListhandlerheroId  leftId	nameGETHEROSOULUIdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager                               info self  � F���h 9 ' B 9 ' B 9 ' B 9+ B 9 ' B 9+ B 9 ' B 9+ B 9 ' B 9+ B6 9	9
86 9 99	B	 9 '
 B	 9+
 B6 9896 9	8	9  X	��6	 	 9		 9 ' B' 9&6 99' B	6	 	 9		 9 ' B' 9&6 99' B	+	   X
5�  X
�	  X
�6
 
 9

 9 ' B5 6   9 B=4 >= B
 9
 ' B

 9

+ B
 9
 ' B

 9

+ B
3
!   X��	  X��6  9 9 ' B5" =
BX
��6
# 9
$
' 9'% &B
 9 ' B 9&
 B
 9'
)  )  B
 9(
)  )  B6# 9$' 9'% &B 9 ' B 9& B 9')  )  B 9()  )  B6# 9$') B 9 '* B 9& B 9')H )A B6# 9$'+ B 9 ', B 9& B 9')< )< B 9 ' B 9+ B+	  9 ' B 9+ B)  6 989-)  ) M�6. 89/ O� 9 ' B 906 9 916 9892B'3  &B  X�	  X�6  9 9 ' B 9 '4 B56 35 =B9
7)  
 X
m� 9
 ' B

 9

+ B
 9
 ' B

 9

+ B
6
# 9
$
' 9'% &B
 9 ' B 9&
 B
 9'
)  )  B
 9(
)  )  B+	 6# 9$' 9'% &B 9 ' B 9& B 9')  )  B 9()  )  B 9 '* B 9+ B 9 ', B 9+ B 9 ' B 9+ B 9 '8 B 90'9 B 9 '8 B 9:6; 9<BX
� 9
 '8 B

 9
0
6= 9>B
 9
 '8 B

 9
:
6; 9?B
 9
 ' B

 9
@
	 B
 9
 ' B

 9
A
+ B
 9
 'B B

 9
0
6 989CB
 9
 'B B

 9
0
6 989CB
  X
�  9
D   B
X
� 9
 'E B

 9

+ B
 9
 '8 B

 9

+ B
+
 2  �L
 X	�+	 2  �L	 2  �K  Image_239refreshPower	nameText_1setSwallowTouchessetTouchEnabled
green	djtzConfig_LanguageredConst_colorDatasetColorText_9challenged   
click/needSoulgetItemNumByIdsetString	soulConfig_HeroStar	starImage_72#common_vs.pngImage_71#common_huodongdown.pngsetAnchorPointsetPositionaddChild	.pngnewGraySpritedisplay   
paramcallBack  selectUIhandlerImage_42widgetTouchExtentpnglocalTypeTextureResType	ccuiheroHead/heroHead_	headaddLocalPicUIManagerisShow
npcIdConfig_HeroytzleftIdgetHeroByIdlocalPlayerduelInfocampaignGameGlobalImage_ArrowImage_CircleBgprocesssetVisiblequeProjectNode_2ProjectNode_1getChildByName								 !!!!""""""""""#&&&&&&&''''''''((((()))))*******++++++++,,,,,-----....////////00000111122222222333335555555567777777789999::::;;;;:===================>>>>???????????????CCCCDDDDDDDDEEEEEEEEFFFFFFFGGGGGGGGHHHHHIIIIIJKKKKKKKLLLLLLLLMMMMMNNNNNOOOOOOOOPPPPPPPPQQQQQQQQRRRRRRRRSSSSSSSSSSUUUUUUUUUVVVVVVVVVXXXXXXXXYYYYYYYY[[[[[[[[[[[\\\\\\\\\\\^^______aaaaaaaabbbbbbbbddddfffhhself  �node  �index  �node1 �node2 �info $�hero �rightNpcShow �leftShow �canTouch !�openHeroAttr (grayHead �grayHead yim71 cim72 RneedNum 3star /  i grayHead FUgrayHead ; �  f�� 9 ' B 9 ' B 9+ B 9 ' B 9+ B 9 ' B  X!�6 ' B 9*  + +	 B 9+  +	 B 9	' B 9
 B6  9B 99			9


B 9 ' B
  X� 9' B 9B6  9 '	 )
 B 9
	 B6  9B	 96
 9

99B
 A	 9	'
 BK  pccgetTotalAbilityOffsetuiNum3createImageStringUIManagergetCombatPowerremoveChildByNameFightValueyxsetPosition getTotalAbilityEffectOffsetMultiVersionUIHelperaddChildsetName	initcreateapp.sprite.SkillAnirequireFightEffectText_9setVisibleImage_239getChildByName�������� 				



self  gnode  ghero  gimgFight beffect46 posOffset heroPower sprite posOffset  �  .x�9 6 99  X�K  ) 6 99  B) M�9 	 9
B) )	 )
 M� 9'	  &B6 99  B!    9
   BO�O�K  setNodeCELLNODEgetChildByNamecellAtIndex_tableviewtotalNum	ceil	mathHEROATTRIBUIConfig_UI	name					self  /object  /params  /  i cell   j node index      	�K  self   v   
�6   9  B9  9BK  disposecommonBakLogicremoveEventsEventManagerself   �   !d �6   ' B 6 6 99893 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   dispose layout UIRemoved refreshPower setNode selectUI tableCellAtIndex makeList closeIt create 	ctorduelRefreshTimes
vipLvlocalPlayerGameGlobalConfig_VipHEROVSHERO
class               g  � h � � � � � HEROVSHERO MAX_REFRESH_TIMES   