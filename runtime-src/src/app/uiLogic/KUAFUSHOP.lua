LJN@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\KUAFUSHOP.luai   +  =  +  = 4  = ) = +  = K  selectTypetab	typebutton	viewself   {    6     9  +  6 ' B99B K  	nameKUAFUSHOPdata.Config_UIrequireremoveUIUIManager       K    1   -     9   B K  Ą	initlogic  ø 
 0F!6   96 9 9B 9B6 99+  5
 9		:		=	9		:		=	B-  9-  9:6 99 >-  9-  9:6 99 >-   9BK  Ą	initselectedKuaFuNum	shopGameGlobalselectedItemInfo
heros
items  
param	nameACQUIREITEMSSIMPLEConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerlogic target  1arr  1 
0é'-   9 B=9=3 9 9' B=6  9	95	 3

 =
	B6  9	
 9' B5	 =	B6  996	 9		6 99 6 99 6 996 99B	5
 6 9)  )  )  )Æ B=
6 9)  )  )  )  B=
 B6  9 9	' B	'
 6 99' B  X9   X9 = 3! 3" 6# 
 9$ 6% 9&6' '( B9) B6# 
 9$ 6% 9&6' '( B9* B
 9+B9, X6% 9&
 9-) BX6% 9.
 9/B6% 9&
 9-) B2  L  ĄcheckRubbishExistlocalPlayersend_getFixedShopInfo
kuafuvipExtraAddbuyFixedShopItemgetFixedShopInfoapp.event.ShopEventrequire	shopGameGlobaladdEventEventManager  tabpnglocalTypeTextureResType	ccui)heroBodyBig/heroBodyBig_huodongmeinvmanaddLocalPicborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRect  Button_8callBack   widgetTouchExtentUIManagerImage_35getChildByName
basic 	type
types	viewnewü’’’
						







       """""######&&KUAFUSHOP self  view  param  logic cb rect BHgetShopInfo 3getShopInfo1 2 ø  
 $E4	4  =  6 99)   X6  96 6 9989' B)  ) M6  98	'
	 + B9  ::	<	OōK  _,equipExtraBuyTimesConfig_Vip
splitStringUtil
vipLvlocalPlayerGameGlobalextraAdd	self  %str   i tmp  ^   
>  9  B  9 B  9 BK  initTipcreateUIresourceself       	C	K  	self   Ø   M9   9' B 96 9 9)~uB AK  getItemNumByIdlocalPlayerGameGlobalsetStringText_1getChildByName	view













self    ŗZ54  =  ) 6 99 ) Mņ-  6 998:8  X6  9' 6	 6 998:B	'
 &
BXŁ-  6 998:89	)  9
 6 998:8  X9
 6 998:86 998-  6	 9		9		8		:		8	9 =6 998-  6	 9		9		8		:		8	9=6 998' =6 998' =6 998) =6 9989  X6 99896 998: X6 998) =6 9986 9:=6 9989  X6 99896 998: X6 998) =6 9986 9:=6 9989	 X:6 9989  X6 9986 96
 9

:

6 99896 998:!B=6 9989  X6 9986 96
 9

:

6 99896 998:!B=9  8  X9  4  <6 99	  8		6
 9

9

8

BO9   X) =   9 9 BK  Ą	cbBttabinsert
tablefixedShopValidformatstringfixedShopInvalid1Config_LanguagecanBoughtleftInforightInfoallBuyTimestotalBoughtdayBuyTimesdayBoughtextraAddlabelType7 ēę°ę®ļ¼čÆ·ę£ę„Config_ShopDropIteméē½®ļ¼tostringę ę³ę¾å°ęč½idäøŗ throwErrorLoggerfixedItems	shopGameGlobal	typež’’’									






"""""""######################&&&&''')))))))))1112244445ShopItem self  	ó ó ói ńlabel  Ńextra Š    9  9  X	9  9   X+ X+ L X: :  X+ X+ L K  canBoughta  b   ’ 	 ".9   X+ = X+ = 9 8= =  9   X4  = 9  )   X6 99 3 B  9 B  9 BK  makeListresource 	sort
table	typeselectTablechangeTypetab		self  #i  # p  )ŗ-  9  9B9K   ĄygetContentOffset_tableviewself table_view  cur_offset_x  7  Ą-  9 L  ĄcellNumself table_view   U  Å-   9    D  ĄtableCellAtIndexself table_view  idx   .    É)] )eJ table_view  idx   	 & ŖØ,9  =  9   X9  9B9 
  X9  X
9  96 9)  9 B+ B2 lXi9	  9
' B6 9 96 9	 9B9
 9B9B A= 9  96 9B9  9 9B 9B A9  9B9  9' B9	  99 B9  93 6 9B9  93 6 9B9  93  6 9!B9  93" 6 9#B9  9B9  9$B9%9 
  X9  X
9  96 9)  9	 B+ B2  K  K  xgetContentOffsetTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildscrollViewsetNamesetDelegategetPositionYgetPositionXsetPosition"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewImage_138getChildByName	viewpccsetContentOffsetchangeTypeoffsetreloadData_tableviewselectTablecellNum					!!!###!%%%%&&&&&''''''((((((((((,,self  back_sp "dcur_offset_x T    &XÕ 9 B  X 9BX6 9 9B 9 !6  9' B 9	'	
 B 9	 B  9 	 9
 8

 BL selectTablesetNodeaddChild	nodesetNameui/shop/ShopTowerItem.luagetNodeFromLuaUIManagercellNumnewTableViewCellccremoveAllChildrendequeueCell					



self  'table_view  'idx  '_cell #index node   @»óåm-  :89 9, 9	  X6 ' B9896 ' B989	6 ' B989
6 ' B989	X9	 X6
 :)	 X9	 X6
 :)	 999+ 9)  X+  9' B 99B  X 9' B 96  96 ' B9B AX 9' B 96  96 ' B9B A 9' B  X6  9' B 9' B 9 9' B 9 B A 9! B6 '" B 9# 9' B4 9>9>>+ B 9'$ B 9% B 9'$ B 9&6 '' B9(B 9' B 9 B 9' B 96  96 ' B') 	 &8B A 9' B 9*B 9' B 9+B9, )~u'-  9' B 9. 6/ 9091B 9'2 B 963 94 B A)   X 9' B 95+ B 9'2 B 95+ B 9'$ B 9&6
 :B 9'6 B 95+ B6  97 9'$ B5: 68   99 B=;4 >>6< >>>==B  X	 9'$ B 9>+ BX 9'$ B 9>+ B 9'? B 95+ BK  ĄtuijiansetTouchEnabled
paramidcallBack  buyItemhandlerwidgetTouchExtent
type1setVisible
floor	math
priceplistTypeTextureResType	ccuiloadTexturekuafuzhan_huangjin.png
widthgetContentSizegetPositionXequipLv_gmdata.Config_LanguagesetTitleTextsetBrightButton_1createapp.uiLogic.ICONaddChildgetPositionpossetPositionsetNameui/common/Icon.luagetNodeFromCacheUIManager	IconequipNumValidequipNumInvalidapp.const.Const_colorDataconvertHexToRGBDisplayObjectUtilsetColorrightInfosetStringconditiongetChildByNamecanBoughtcostType2costTypeitemNumConfig_Language
type2	typequality	nameitemIddata.Config_ItemrequireitemTypecostNum2costNum
						





!!!!!!!!!!!!!!!$$$$$$%%%%%&&&&''''''''''((((*****************++++++++,,,,,,,,,,,--------..................11111111111111111458888888888899999999999:::;;;;;;;;<<<<<<<<=========@@@@@@@@PPPPPPPPPPPPPPPPPPPPPPQQRRRRRRRRRTTTTTTTTVVVVVVVVmShopItem self  ¼node  ¼item  ¼pos  ¼find  ¼conf øprice ·price1 ¶name µquality  µtype1  µtype2  µnum *costType costType1 gray icon 9posX anid1 miconPath l   >mÓ)9  9B9=  = 	  X6  9'	 
 + B  XK  X  X6 9 9	)	~uB X6
  96	 9			 9		6 89B	 AK  6 9)  =6  99	 	 9		B	6
 9

9

+  5 =BK  	item 	typeBUYITEMConfig_UIgetParent	view
addUIUIManagerselectedKuaFuNum	shop	nameConfig_Itemformat	xxbzConfig_LanguageaddMessageFloatMessagegetItemNumByIdlocalPlayer	goldcheckResourceEnoughGameGlobalselectedItemInfoygetContentOffset_tableviewoffsetž’’’	        """"""""""""#&&&&'''''''''''''')self  ?item  ?cost  ?cost1  ?price  ?price1  ? ×  %Zż4  6  6 ' B A H) )	 )
 M'  &8 X6 9 5 9=9 =	'
  &8=BXOéFRćL needNumnum	rankpolicy  jobinsert
tableequ"data.Config_HeroEquPolicy.luarequire
pairsŠ
self  &itemId  &tmp $  _ v    i  1   -     9   B K   Ą	initself  	 "ō9   99 9 !B 9' B 9' B 9B 96	 9
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
Spawn createCallFunc	viewselectedItemflyFlyItemsButton_Bag	nameHOMEUIdata.Config_UIrequiregetUIByNameUIManageryxgetPositionpccconvertToWorldSpacegetParent	Icon	nodegetChildByNameselectedPoscellNumcellAtIndex_tableviewdĄēĢ³³ęĢžµęĢ³¦’													
self  node icon posX wposY jhomeui 
`btn \disX NdisY AflyTime @refresh "action 
     	K  self   K   6   9  BK  removeEventsEventManagerself     % +y £6   ' B 6 ' B6 ' B3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3$ =# 2  L   dispose layout playBoughtAnimation getPolicyInfo buyItem setNode tableCellAtIndex makeList 	cbBt createUI resource initTip 	init vipExtraAdd create 	ctordata.Config_ShopDropItemdata.Config_UIrequireKUAFUSHOP
class         
  3  = 4 B > L C Y M  Z §  Ō Ø ć Õ Rå |S}¢££KUAFUSHOP (uiConfig %ShopItem "  