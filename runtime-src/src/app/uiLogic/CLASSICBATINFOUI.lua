LJU@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\CLASSICBATINFOUI.lua�   	+  =  +  = +  = +  = +  = +  = +  = 4  = K  touchNodesdelayScheduleIdenemyInBatSetupnodeSelectedpointSelectedcommonBakLogic
nodes	view	self   �   5f
6   9  9  -  98  9  )    X
�-  9' B 9+ BX	�-  9' B 9+ B6  99-  9896 '	 B-  989
-  9' B 9 BK  ��setStringtimesInfo
timesdata.Config_ClassicBattlerequiresetVisiblebuygetChildByNametimesLeftidclassicBatStatecampaignGameGlobal									
logic view timesLeft .timesLeft totalTimes 
 �   7)-     9   ' B   9  ' - 9' &6 99B -    9 	 B -    9 
 B -  B K  ���fillPointInfocreatePointsUIplistTypeTextureResType	ccui	.pngidworldWar_classBatNameloadTexture	namegetChildByNameview logic updateTimesLeft  � 
 [�/   X+�6 99-  989)   X�6  96 :5BK  6 9-  9
=	6  9-  9B6 ' B99+  5 -	  9		=	-	  9	
	=	B  X+�6 99-  989)   X�6  96 :5BK  6 -  9
896  96 ' B9 B X�K  6 9 9-  9-  9
BK  ��send_classicMopupARMYFOODapp.const.Const_CostTypecheckResourceEnoughconsumeFoodConfig_ClassicPointButton_Mop
insIdchapterId batType	nameREADYTOBATTLEdata.Config_UIrequiregetParent
addUIUIManagerpointSelectedselectedClassicInfoIdConfig_LanguageaddMessageFloatMessagetimesLeftidclassicBatStatecampaignGameGlobal	goOn																					logic view name  \timesLeft 
$timesLeft -$consumeFood  �    S6     9  6 ' B9-  + B    X�6   9    9  - 9B K  �  idsend_buyClassicTimescampaign	GOLDapp.const.Const_CostTyperequirecheckResourceEnoughGameGlobalcost logic  �  	 ^6     9  -  9 9B6 ' B99+  5 B K     	typevip	nameVIPANDPAYdata.Config_UIrequiregetParent	view
addUIUIManagerlogic  � X�M6   6 998  9  6 99  X )�6   6 998  9  6 99 6 98  X�6 96 9 83	 6
  9-  9	 9B6 '
 B99+	  5
 =
=
B2 #�6  9  9  6     X �6    9  6 9B 2  �K  6 
   9  -  9 9B6 ' B99+  5 3 =B 2  �K  K  �	fun1  idj
kgmcsConfig_LanguageaddMessageFloatMessage
param	fun2 id<	nameMESSAGEBOXdata.Config_UIrequiregetParent	view
addUIUIManager buyClassicBattleTimeCostConfig_GameDataclassicBatBuyTimescampaignbuyClassicBattleTimes
vipLvlocalPlayerGameGlobalConfig_Vip
logic totalBuyTimes "curBuyTime cost sure  �5��Z-   9 B=9=6 96 99 B9 =)  X�9=X�)  X�9=6 9	9
  X�6 9	9
=6  996	 9		6 996 996 996 99B	5
 6 9)  )  )  )2 B=
6 9)  )  )  )  B=
B6 ' B 9 9	' B	5
 6  9B=
B=3  3! 3" 	 B	6	# 	 9	$	 6 9	6 '% B9& B	6	# 	 9	$	 6 9	6 '% B9' B	6	 	 9	)	 9'* B5+ =5, =-, )
 B	=	(6	 	 9	)	 9'. B 9'/ B50 =51 =-, )
 B	=	(3	2 6
 
 9
)
 9'3 B54 =	B

 B
2  �L  �  buy   Button_Mop  Button_MopNode_Mop
param  	goOn  	goOnwidgetTouchExtent	btn1classicMopupbuyClassicTimesapp.event.CampaignEventaddEventEventManager   callBack  closeIthandlerProjectNode_1getChildByNamecreateapp.uiLogic.COMMONBAKrequirecommonBakLogicborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRectUIManagerselectedClassicInfoIdcampaignpointSelected
levellocalPlayerGameGlobal
floor	mathid	viewnew����
					!:;;<<<<<<<<<<<<============>>>>>>>>>>>>>>>???????????????????VWWWWWWWWWWXXYYCLASSICBATINFOUI self  �view  �param  �logic �tmp �rect H_updateTimesLeft McbFresh LendedCallBack Kbuy = �   +�-   9      X�6  9  -  9 B -   6 ' B 9- - ) B= K   �	��create app.uiLogic.ENEMYINBATSETUPrequireenemyInBatSetupunscheduleGlobalschedulerdelayScheduleIdself node enemyTable  � ,��iC6  ' B9 89' +  ) ) ) M�+ )	 
 ) M	�8 X�+ O	� X	
�	 6
  ' B
'  &8

' &	O�9  9'	 B 9
 B6  ' B9 89  9' B 9
9B4  6  ' B6 	 BH
�99 X�6 9 4 9>9>9>BF
R
�)  )	 M�9  9' 
 &B 9+ B6  ' B 99  9' 
 &B8
+ BO�  ) )	 M�9  9' 
 &B 9+ BO�4  6 99
B)	 )
 ) M	
�6 9  9 8BO	�6	 9		9		9
 8	
	 	 X
*�6	 9			 9	 	B	 	 X
#�9	 	 9		'! B		 9		+ B	9	 	 9		'" B		 9		+ B	9	 	 9		'! B		 9		'# B		 9	
	9$  X�)  B	X	�9	 	 9		'! B		 9		+ B	9	 	 9		'" B		 9		+ B	9	 	 9		'% B	3
& 9% 
  X�9%  9'B9(   X�6) 9*9( B6) 9+
 * B=( X�
 B2  �K  scheduleGlobalunscheduleGlobalschedulerdelayScheduleIddispose enemyInBatSetupconsumeFoodText_Food	goOnNode_MopisPrivilegelocalPlayerpassedClassicPointIdcampaignGameGlobalnpc	numscreateapp.uiLogic.ICONsetVisible	itemminNumitemIditemTypeinsert
tabledropId
pairsdata.Config_Drop	descpointSelecteddata.Config_ClassicPointsetString	rulegetChildByName	view data.Config_Languagecountryiddata.Config_ClassicBattlerequire
��̙����"####$$$$%%%%%%%%%$))))))))))))))*********+++++++++,,,,,,,,,,,,,,,,,........./////////3333378889999;;;;;;;<<<<<<<>>CCself  �country �ruleStr �empy �  i flag   j pointInfo  �dropItems 
�configdrop �  _ v    i tmp    i enemyTable tnum p  i 	node Rcallback  � 	 @�
  9  B) 6 9 BH	�96 99 X� 9= FR�9	  9
6 9 )  B+ BK  pccsetContentOffset_tableviewpointIdpointSelected
levellocalPlayerGameGlobalneedPlayerLvpoints
pairsmakeList�����											
self   index   k 	v  	 D   � 9  9   X�+ X�+ L pointId        a  	b  	 �  D�
6  ' B4  6  BH�9		 X	�6	 9		  B	FR�6 9 3 B2  �L  	sortinsert
tablebattleId
pairsdata.Config_ClassicPointrequire		self  id  data ret   _ v   � 	  0�9    X�K  6 99  B)  ) M�9  8 9BO�+  =  K   removeAllNodeEventListeners	maxn
tabletouchNodesself  num 	  i  �   �6   99  9B6 ' B99BK  	nameCLASSICBATINFOUIdata.Config_UIrequiregetParent	viewremoveUIUIManagerself   h   �6   99 ' ' BK  Image_1176Image_43	viewalignLeftUIManagerself  	 �   &�9    X�6 99  B  9 B+  = 6  9  6 9B9	  9
B9  9
B+  = K  
nodesenemyInBatSetupdisposecommonBakLogicinstanceProxyGameGlobalremoveEventsEventManager	viewclearNodesunscheduleGlobalschedulerdelayScheduleIdself   p  )�-  9  9B9K   �ygetContentOffset_tableviewself table_view  cur_offset_x  K  �6  9-  9D  �points	nums
tableself table_view   U  �-   9    D  �tableCellAtIndexself table_view  idx   .    �)} )} J table_view  idx   � # j��(9    X�9   9B2 a�X^�4  =   9 9 B= 9  9' B6	 9
 96	 9	 9B9
 9B9B A=  9   96	 9B9   96	 9)  )  B A9   9B9   9' B 99  B9   93 6	 9B9   93 6	 9B9   93 6	 9B9   93 6	 9 B9   9B9   9!B9"2  �K  K  xgetContentOffsetTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildscrollViewsetNamesetDelegatepsetPosition$SCROLLVIEW_DIRECTION_HORIZONTALsetDirectionheight
widthgetContentSize	sizecreateTableViewccImage_1159getChildByName	viewidgetPointsByIdpoints
nodesreloadData_tableview																	





!!!####$$$$$((self  jback_sp Rcur_offset_x R  �   6<�6     9  -  9B    X�K  6     9  -  9 9' B A    X�K  6     9  -  9 9' B 9' B A    X�K  -   9    9  ' B   9  ' B   9  + B K    setVisibleshinningBorder	headgetChildByNamenodeSelectedcheckObjIsNullGameGlobal













self  � 
 O�6   ' B 9  -  -  9- 89=3  B-  - =-  9+ B-   9	B+ 2  �L  ����fillPointInfosetVisiblenodeSelected pointIdpointspointSelectedINSTANCEINFOUIdata.Config_UIrequireself idx node shinningBorder uiConfig tryFun  � 5���V 9 B  X� 9BX�6 9 9B ,  + 6 	 9'
 B,	 6
 9
	
B
) 
 X�)
 '
 
 ' &'  ' &	9 896 99 X2�6 9'  &B 6 9' 	 &B  9' B 9+ B 9' B 9+ B 9' B 9+ B 9' B 99 89B+ X,�6 9 9 6 99B 6 9 9	 6 99B  9' B 9+ B 9' B 9+ B 9' B 9+ B 9 * * B 9 * * B 9'! B 9" B 9'! B 9" B 9#'$ B 9#'% B 9&) )��B 9&)  )  B6' '( B 9* + + B 9#') B 9*+  + B 9'! B 9" B 9&6 9+)  )��B A 9+ B 9#', B9- 9 89. X�=/  9+ B30  X�6  91 9'! B 9'% B52 =3B 9'! B 9'% B 94+ B 9" B2  �L setSwallowTouchescallBack  widgetTouchExtent nodeSelectedpointIdpointSelected	nodep	initshinningBorderapp.sprite.SkillAnirequiresetPositionheroheadbg1setNameaddChild	headsetAnchorPointplistTypeTextureResTypecreateImageView	ccuisetString
limitlimit1setVisible	icongetChildByName#newGraySpritedisplay
levellocalPlayerGameGlobalneedPlayerLvpointsworldWar_nd	.pngworldWar_l	ceil	math#ui/worldWar/ClassicBatIcon.luagetNodeFromLuaUIManagernewTableViewCellccremoveAllChildrendequeueCell��������̙��ԛ
        !!!!!!!!""""""""$$$$$%%%%%&&&&&&&&''''''''(((())))*****+++++,,,,,,,,,----.....////////000000001111222233333345555OPPQQQQQQQQQQQQQQRRRRRRRRRRRRTTTTUUself  �table_view  �idx  �_cell �heroImage �heroImageBg  �flag �node �bk1 �bk2  �num �shinningBorder �Otouch -" �   J �6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   tableCellAtIndex makeList dispose layout closeIt clearNodes getPointsById createPointsUI fillPointInfo create 	ctorCLASSICBATINFOUI
class     g  � i � � � � � � � � � � � � � effCLASSICBATINFOUI   