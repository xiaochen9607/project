LJL@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\SHOPUI1.luaÃ   !)+  =  +  = +  = +  = +  = +  = +  = +  = )  = +  =	 )  =
 )5u= )6u= )Ju= +  = +  = K  recommendcurBiIdbraveIdjjBiIdbuBiIdbatTypecurBuyItemPoscurDayRefreshTimesrecDataoffbought
items	costButton_1curNodesBuyBtn	view		

self  " ;   -     9   B K  ÀupdateShopInfologic  ° 	5P!
-  9 -  9 :6 99 >-  9 -  9 :6 99 >- 9	  X
-  9	  X6 9 9BX- 9	 X
-  9	 X6 9 9BX-   9BK  À ÀupdateShopInfo!send_getPlayerSomeInfoChangeloginProxyselectTypebatTypebuyFixedNumcampaignGameGlobalselectedItemInfo
logic self target  6arr  6 Àoº%-   9 B=6  996 96
 9

9


 
6 99 6 996 99B5	
 6
 9
	
)  )  )  )¯ B
=
	6
 9
	
)  )  )  )  B
=
	B 9B3 3 6 	 9
 6 96 ' B9 B6 	 9
 6 96 ' B9 B
  X9=9	 X9=X9=6 9	 99
BX
) =9=6 9	 99
B6 9	 9B2  L ÀcheckRubbishExistlocalPlayersend_getFixedShopInfobraveIdjjBiIdcurBiIdbatTypebuyFixedShopItemgetFixedShopInfoapp.event.ShopEventrequire	shopGameGlobaladdEventEventManager  showAnimationborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRectUIManager	viewnewüÿÿÿ
  !!!!!!#####$$SHOPUI1 self  pview  pparam  plogic krect *AgetShopInfo =getShopInfo1 < X   	?+ =    9 B  9 BK  initTipcreateUItishiOkself  
 Î  
*2D9  	  X#6 99 X9   X9  9' B 9' B 9	+ BX9  9' B 9' B 9	+ B9  	 X K  setVisible
tishibutton2getChildByName	viewtishiOkarenaItemLimitValidloginProxyGameGlobalbatTypeself  + :   `-     9   B K   ÀupdateShopInfoself  	 "ôT9   99 9 !B 9' B 9' B 9B 96	 9

 9B A  A9 9B 96	 9
 9	B	 A  A96  9+  6	 ' B	9		9		B 9'	 B	 9B	 96
	 9


 9B A
  A9 
 9B
 96	 9
 9B A  A9)	 6
 
 9

4 4 9 >6	 9
  B>6	 9
  B ? >	 9 )  B
6
	 9


 9

3 B
6	 9 96	 9 96	 9 9* * B A6	 9 9* B
 B 9'  B 9! B2  K  runActionsoldoutFadeInScaleToEaseBackIn
Spawn createCallFunc	viewselectedItemflyFlyItemsButton_Bag	nameHOMEUIdata.Config_UIrequiregetUIByNameUIManageryxgetPositionpccconvertToWorldSpacegetParent	Icon	nodegetChildByNameselectedPoscellNumcellAtIndex_tableviewdÀçÌ³³æÌþµæÌ³¦ÿ													
self  node icon posX wposY jhomeui 
`btn \disX NdisY AflyTime @refresh "action 
 o  )y-  9  9B9K   ÀygetContentOffset_tableviewself table_view  cur_offset_x  6  -  9 L  ÀcellNumself table_view   U  -   9    D  ÀtableCellAtIndexself table_view  idx   .    )] )eJ table_view  idx   
 - ¹f-6   99  9' B5 6   9	 B=B9
  =	 9   X9  9B9 
  X9  X
9  96 9)  9 B+ B2 lXi9  9' B6 9 96 9	 9B9
 9B9B A= 9  96 9B9  9 9B 9B A9  9B9  9'  B9  9!9 B9  9"3# 6 9$B9  9"3% 6 9&B9  9"3' 6 9(B9  9"3) 6 9*B9  9B9  9+B9,9 
  X9  X
9  96 9)  9	 B+ B2  K  K  xgetContentOffsetTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildscrollViewsetNamesetDelegategetPositionYgetPositionXsetPosition"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewImage_138pccsetContentOffsetchangeTypeoffsetreloadData_tableviewselectTablecellNumcallBack  closeIthandlerButton_8getChildByName	viewwidgetTouchExtentUIManager




   """$$$"&&&&'''''(((((())))))))))--self  back_sp 1dcur_offset_x T    &X 9 B  X 9BX6 9 9B 9 !6  9' B 9	'	
 B 9	 B  9 	 9
 8

 BL selectTablesetNodeaddChild	nodesetNameui/shop/ShopItem1.luagetNodeFromLuaUIManagercellNumnewTableViewCellccremoveAllChildrendequeueCell					



self  'table_view  'idx  '_cell #index node  Í %`
¥¤-  :89 9, 9	  X6 ' B9896 ' B989	6 ' B989
6 ' B989	X9	 X6
 :)	 X9	 X6
 :)	 999+ 9)  X+  9' B 99B  X 9' B 96  96 ' B9B A9 	 X+ = X 9' B 96  96 ' B9B A 9' B  X6  9' B 9' B 9  9'! B 9"B A 9# B6 '$ B 9% 9' B4 9>9>>+ B 9'& B 9' B 9'& B 9(6 ') B9*B 9' B 9 B9	  X06 ' B989	 X6 ' B989	 X 9+ 	 X9,  X6- 9. 9/9B6- 9. 909B 9' B 9 '1  '2  '3 &B 9' B 96  96 ' B'4 	 &8B A 9' B 95B 9' B 96B97  9'8 B 999B 9'8 B 9: B 9'8 B 96  96 ' B9B A'; 	 X'< X	 X'= X	 X'> '; 	 X'< X	 X'= X	 X'>  9' B 9? 6@ 9A9BB 9'C B 96D 9E:"B A:	 X 9'F B 9G+ B 9'H B 9G+ BX 9'F B 9G+ B 9'H B 9G+ B 9'F B 96
 9I &B)   X 9'J B 9? 6@ 9A9BB 9'K B 9G+ B 9'K B 9 B6  9L 9'& B5O 6M   9N B=P4 >=QB  X	 9'& B 9R+ BX 9'& B 9R+ B4    XH
  XF6S 989		 X,  9T 9B6- 9. 909B6U  BH6U 6- 9.9VBH9 W9!W ! X 9 X9!X ! X 9 Y  X 	6 Z 9 [ " 5#\ =]#=^#9$Y=$Y#B FRêFRâ 	 X	 9'_ B 9G+ BX 9'_ B 9G+ BK  Àtuijiannum	hero  insert
tableneedNum	rankjob
heros
pairsgetPolicyInfoConfig_ItemsetTouchEnabled
paramcallBack  buyItemhandlerwidgetTouchExtentprice1
type1yj	downsetVisibleoriprice
floor	math
priceplistTypeTextureResType	ccuiloadTexturecommon_shabi.pngcommon_jingjibi.pngcommon_yuanbao.pngcommon_jinbi.pngsetPositionXleftInfocondition1
widthgetContentSizegetPositionXequipLv_)/(getItemNumByIdgetItemComposeNumlocalPlayerGameGlobalselectTypebatTypegmdata.Config_LanguagesetTitleTextsetBrightButton_1createapp.uiLogic.ICONaddChildgetPositionpossetPositionsetNameui/common/Icon.luagetNodeFromCacheUIManager	IconequipNumValidtishiOkchangeTypeequipNumInvalidapp.const.Const_colorDataconvertHexToRGBDisplayObjectUtilsetColorrightInfosetStringconditiongetChildByNamecanBoughtcostType2costTypeitemNumConfig_Language
type2	typequality	nameitemIddata.Config_ItemrequireitemTypecostNum2costNum
÷ÑðúáõüÈ 						





   !!"$$$$$$$$$$$$$$$''''''((((())))**********++++-----------------........///////////00000000222222222222222222233333344444455555566666666666666999999999999999999:::::::::::::::::<<<<<<<<========>>>>>>>>>>>>>>>@AABBCCDDEEFHIIJJKKLLMMNPPPPPPPPPPPQQQQQQQQQQQQQRRRSSSSSSSSTTTTTTTTTVVVVVVVVWWWWWWWWXXXXXXXXXXXZZZ[[[[[[[[[[[\\\\\\\\]]]]]]]]mmmmmmmmmmmmmmmmmnnoooooooooqqqqqqqqsttttvvvvvvwwwwxxxxxxyyyyzzzzzz{{{{{{{{|||}}}}}}}}}zzyyShopItem self  node  item  pos  find  conf price price1 name quality  type1  type2  num *ácostType àcostType1 ßgray Þicon >id ]num  curNum posX 1iconPath  ìiconPath1 àheroTmpTable Ktmp (num1 "  _ v    m n        ³ K    é
  .¯6   9' B9  9B9= = 6  9	9
  9B6 99+  5 =9	 =	3	 =	BK  callBack 	typebatType	item  	nameBUYITEMConfig_UIgetParent	view
addUIUIManagerselectedItemInfoygetContentOffset_tableviewoffsetsound/button.mp3playEffectSoundManagerself   item    ×  %Z¶4  6  6 ' B A H) )	 )
 M'  &8 X6 9 5 9=9 =	'
  &8=BXOéFRãL needNumnum	rankpolicy  jobinsert
tableequ"data.Config_HeroEquPolicy.luarequire
pairsÐ
self  &itemId  &tmp $  _ v    i  ã HÁÂj9  	  X89  9' B 96 9B9  9' B 96 9	 9
9 B A9  9' B 9' ) B9  9' B 96 9B9  9' B 96 9	9BXA9  9' B 96 9B9  9' B 96 9	 9
9 B A9  9' B 9' ) B9  9' B 96 9B9  9' B 96 9	9B9  9' B 9' ) B' 9  	 X' 9  9' B 9 6 99B4  = ) 6 9 9! ) M¦-  6 9 9!8:8  X6"  9#'	$ 6
% 6 9 9!8:B
'& &		BX-  6 9 9!8:89'6 9 9!8-  6	 9	 	9	!	8		:		8	9)=(6 9 9!8-  6	 9	 	9	!	8		:		8	9+=*6 9 9!8-  6	 9	 	9	!	8		:		8	9-=,6 9 9!8-  6	 9	 	9	!	8		:		8	9/=.6 9 9!8'1 =06 9 9!8'1 =26 9 9!8) =36 9 9!89( X6 9 9!89(6 9 9!8: X6 9 9!8) =36 9 9!86 94:=06 9 9!89* X6 9 9!89*6 9 9!8: X6 9 9!8) =36 9 9!86 94:=0-  6 9 9!8:895 X&-  6 9 9!8:8956 9	95 X6 9 9!8) =36 9 9!866 976
 9
4
:

-  6 9 9!8:895B=06 9 9!89. X 6 9 9!89.6 9	9 X6 9 9!8) =36 9 9!866 976
 9
4
:

6 9 9!89.B=06 9 9!89, X 6 9 9!89,6 9	9 X6 9 9!8) =36 9 9!866 976
 9
4
:

6 9 9!89,B=06 9 9!893	 X:6 9 9!89( X6 9 9!866 976
 9
8
:

6 9 9!89(6 9 9!8:!B=06 9 9!89* X6 9 9!866 976
 9
8
:

6 9 9!89*6 9 9!8:!B=06 9 9!8: X6 9 9!866 976
 9
8
:

6 9 9!8:B=26 9 9!8: X6 9 9!866 976
 9
8
:

6 9 9!8:B=29 8  X9 4  <69 9:9	 8		6
 9
 
9
!
8

BOZ~) 69 9;9 B) M39  9'	< 
 &	
	B 9=+	 B9  9'	< 
 &	
	B 9'	> B 96	 9	?	9
  8	
	8		B6@  9A9	 	 9		'<  &B	5
D 6B   9C B=E
4 >=F
BOÍ9G   X) =G   9C 9G BK  ÀselectType
paramcallBack  	cbBthandlerwidgetTouchExtentUIManagerfixedShop	infosetVisiblebutton	numsinsert
tablefixedShopValidformatstring
levelfixedShopInvalidcanBoughtleftInforightInfobraveMaxbraveLimitsportsRankpvpLimitallBuyTimestotalBoughtdayBuyTimesdayBoughtlabelType7 çæ°æ®ï¼è¯·æ£æ¥Config_ShopDropIteméç½®ï¼tostringæ æ³æ¾å°æè½idä¸º throwErrorLoggerfixedItems	shop	typeplistTypeTextureResType	ccuishopnamecommon_junxiepu.png&common_jingjichangsghangcheng.pngzijin1tu_CopytotalSb	ljhdcommon_shabi.pngbraveIdzsbpvpRankzijin1zijin_Copy	zgpmzijin1_Copy_0common_jingjibi.pngloadTexturezijin1tujjBiIdgetItemNumByIdlocalPlayerGameGlobalzijin1zijinzlbConfig_LanguagesetStringzijin1getChildByName	viewbatTypeþÿÿÿ										













               """"""""$$$$$$$$$$$$$&&&&&&&&&&&&&(((((((((((((*************++++++,,,,,,------///////////////////0000001111111144444444444444444445555556666666699999999999999999999999::::::;;;;;;;;;;;;;;;;;;;>>>>>>>>>>>>>>>>>??????@@@@@@@@@@@@@@@@CCCCCCCCCCCCCCCCCDDDDDDEEEEEEEEEEEEEEEEGGGGGGGIIIIIIIJJJJJJJJJJJJJJJJJJJJJJMMMMMMMNNNNNNNNNNNNNNNNNNNNNNRRRRRRRSSSSSSSSSSSSSSSSVVVVVVVWWWWWWWWWWWWWWWWYYYYZZZ\\\\\\\\\```````aaaaaaaaaaabbbbbbbbbbbbbbbbbbbcccccccccccccccccccc`fffggiiiijShopItem self  img ~§ § §i ¥label  4 4 4i 2    ¼9  9  X	9  9   X+ X+ L X: :  X+ X+ L K  canBoughta  b     5A®9   9' 9 &B 9+ B9   9'  &B 9+ B9  X+ = X+ = 9 8= = 9   X4  = 9  )   X6 9	9 3
 B  9 BK  makeList 	sort
table	typeselectTablechangeTypesetBrightselectTypebuttongetChildByName	view	


self  6i  6 Ó  
 Æ6   99  9' B' 6 99'	 BK  pnglocalTypeTextureResType	ccui)heroBodyBig/heroBodyBig_huodongmeinvmangetChildByName	viewaddLocalPicUIManagerself   \   É6   99 ' BK  shopTitleImg	viewalignLeftUIManagerself   Ó  	 Ì9    X6 99  B+  =  6  9+  6 ' B99BK  	nameSHOPUI1data.Config_UIrequireremoveUIUIManagerunscheduleGlobalscheduler_scheduleself   ³  
 'Ó6  9 9B6  9  B9   X6 99 B9   X6 99 B+  = +  = +  =	 K  	view_scheduleTimeunscheduleGlobalscheduler_scheduleremoveEventsEventManager!send_getPlayerSomeInfoChangeloginProxyGameGlobal		

self    Õ  & . ã6   ' B 6  ' B6  ' B6 ' B3 =3	 =3 =
3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3! = 3# ="3% =$2  L  dispose closeIt layout showAnimation 	cbBt createUI getPolicyInfo buyItem setNode tableCellAtIndex makeList playBoughtAnimation initTip updateShopInfo create 	ctorSHOPUI1
classdata.Config_ShopDropItemapp.const.Const_ShopTypedata.Config_UIrequire              >  C ? S D e T  f ¢  -¤ 4/A6¬BÅ®ÈÆËÉÒÌâÓããuiConfig +ShopType (ShopItem %SHOPUI1 "  