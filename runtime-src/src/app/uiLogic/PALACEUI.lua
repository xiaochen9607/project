LJM@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\PALACEUI.lua�   +  =  +  = +  = +  = +  = 4  = +  = K  factionIconcurNodeBtnapproveBtnviewBtncreateBtncommonBakLogic	viewself   �  6   9  9  	   X �-     9  B X �6   9    9  B -     9  B -     9  B K  �listen4Choices	initsend_getApplyscloseItfactionUIdfactionGameGlobal����logic  -    !-   B K  �checkFactionInfo  �  6'9 6 ' B99  X
�9 6 ' B99  X�-  BK  �CONNECTINGLOADINGdata.Config_UIrequire	namecheckFactionInfo object  param   �%k�-   9 B= 9B6  996 96
 9

9


 
6 99	 6 996 99	B5	 6
 9


)  )  )  )2 B
=
	6
 9


)  )  )  )  B
=
	B6 ' B 9
 9' B5	 6
  9B
=
	B=3   X�9 X� BX�3 6 	 9
 6 96 ' B9  B6 9	 9!B3" 6 	 9
 6 6 '# B9$ B2  �L �REMOVEapp.event.UIManagerEvent send_getFactionInfogetFactionInfoapp.event.FactionEventfactionGameGlobaladdEventEventManager fromPalace callBack  closeIthandlerProjectNode_1getChildByNamecreateapp.uiLogic.COMMONBAKrequirecommonBakLogicborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRectUIManagerlayout	viewnew����
PALACEUI self  lview  lparam  llogic grect -:checkFactionInfo (cb 	uiRemoved  �   
 06     9  6 9 9B 9B6 ' B99	B K  	nameFACTIONAFFAIRCHANGEFLAGdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager �   ,GN6     9  -   9B A )d   X�6  96 9BK  X
�)    X�6  96 9BK  6  9	-   9B A6 9
 9 BK  �send_changeFactionDescfaction!checkAndReplaceForbiddenWordGameGlobal	zsgs	zsgdConfig_LanguageaddMessageFloatMessagegetStringgetByteLenStringUtil								label num 	$facDescribe  � /��/23  6 99	  X�6  99  9' B5	 =
B9  9' B 96 99B9  9' B 96 99B9  9' B 96 99B9  9' B 96 99B9  9' B 96 99B9  9' B 96 ' B6 9989B6 9 99 ' 6 99B9  9' B  X�9  9' B6  96 99'  ) B 9!' B9  9" B 9#9  9'	$ B 9%B A6 99)  X5�9  9' B9  9' B 9&B6  9' 	 )
 )2 B 9(6	) 9	*	)  ) B	 A 9# 9	%B	 A9  9"	 B3+ 6 	 99
 
 9

', B
5- =
B2	�9  9', B 9.+ BK  setVisible  Button_44 pccsetAnchorPointcreateEditBoxWithLabelgetContentSizegetPositionNode_27setPositionaddChildsetNameuiNum3createImageStringremoveChildByNameiconString	iconhandleFactionIconmaintenCostfactionLvdata.Config_FactionLv.luarequire
zijinexploitgongxunfactionDescnotice	fundnumfactionMembersNumlvfactionNamesetString	namecallBack  Image_76getChildByName	viewwidgetTouchExtentUIManager
myJobfactionGameGlobal 											










,------------/////////2self  �changeFlag �sprite vYlabel /size1 'zhuti cb44  N    { 6   9    9  B K  send_leaveFactionfactionGameGlobal       �& ��c+     X�6 ' B99XG�  X�6 ' B99X?�  X�6 ' B99X7� 	 X�6 ' B9
9X/�  X�6 ' B99X'�  X�6 ' B99X�  X�6 ' B99X�  X�6 ' B99X�  X�6 ' B99X�  X�6 ' B99  X�6  9-  9 9B6 ' B99+  5 3	 =	BX"�   X�6  9-  9 9B6 ' B9!9+  5$ 6	 '" B	9	#	=	%BX
�6  9-  9 9B BK   �batType  factionShop!app/const/Const_ShopType.luaSHOPUIshangdian	fun1  idtuichubanghuiMESSAGEBOXgetParent	view
addUIUIManagertuichuFACTIONTRENDSdongtaiFACTIONMEMUIchengyuanTIANXINGtianxingFACTIONSCIENCE	kejiCOUNTRYWARMANORlingdiFACTIONCAMPdayingCOUNTRYWARINFOguozhanFACTIONAFFAIRMANAGE
neiwuFACTIONLVUPshengji	nameFACTIONAFFAIRHEROdata.Config_UIrequiredianmao						

self param  �conf � � 2���%-  9  9'   &B-  9  9'   &B 9+ B-  9
  X�-  9  9'   &B	   X@�-  9  9' B-   9  
 9' B 9	'	 B	 9
'
 B
 A6  9 9'	 B5 - =5 =B6  9 9'		 B5 - =5 =B6  9 9'	
 B5 - =5 =BX��	  X@�-  9  9' B-   9  
 9' B 9	' B	 9
' B
 A6  9 9'	 B5 - =5 =B6  9 9'	 B5 - =5 =B6  9 9'	 B5 - =5 =BXp�	  X@�-  9  9' B-   9  
 9'  B 9	'! B	 9
'" B
 A6  9 9'	  B5# - =5$ =B6  9 9'	! B5% - =5& =B6  9 9'	" B5' - =5( =BX.�-  9  9') B-   9  
 9'* B 9	'+ B	 A6  9 9'	* B5, - =5- =B6  9 9'	+ B5. - =5/ =B-  9
  X(�-  9  X$�-  9  9' -  9&B-  9  9' -  9&B-   90   9	1)K B	 9
1)L B
 91)M B A-  = K   ��getChildByTaganimationReverse  tianxing    shangdian  tianxingshangdianb4  lingdi    daying    guozhan  lingdidayingguozhanb3  
neiwu    shengji    	keji  
neiwushengji	kejib2  tuichu    dongtai  
param  chengyuancallBack  widgetTouchExtentUIManagertuichudongtaichengyuananimationb1lastItemsetTouchEnabledbsgetChildByName	view																		












         !!!!!!!!!""""""""""""""""""$$%self transto param  �node1 	�node2  node 9node B9node B9node @(node2 9node3 	 � ��bo3  3 ) ) ) M�6 	 99
 
 9

'  &B
5 =4 >=	BO�9  9'
 B 9' B 9+ B6 99	  X�9  9'
 B 9' B 9+ B9  9' B 9' B 9' B 9+ BX�9  9' B 9' B 9' B 9+ B9  9' B 9' B 9+ B6 99	  X�9  9' B 9' B 9' B 9+ B9  9' B 9' B 9+ BX�9  9' B 9' B 9' B 9+ B9  9' B 9' B 9+ B6 99	  X�9  9' B 9' B 9' B 9+ B9  9' B 9' B 9+ BX�9  9' B 9' B 9' B 9+ B6 99	  X�9  9' B 9' B 9' B 9+ B9  9' B 9' B 9+ BX�9  9' B 9' B 9' B 9+ B9  9' B 9' B 9+ B6 99	  X�9  9' B 9' B 9' B 9+ B9  9' B 9' B 9+ BX�9  9' B 9' B 9' B 9+ B2  �K  tianxingb4tianXingValids4manorSilverValidlingdib3salaryValids3shengjib2factionLvUpValids2chengyuanb1applyValidloginProxyGameGlobalsetVisible
tishis1
paramcallBack  bgetChildByName	viewwidgetTouchExtentUIManager  EFFFFGGGGGGGGGGGGGGGGFJJJJJJJJJJJJJKKKKKLLLLLLLLLLLLLMMMMMMMMMMMMMMMMMMOOOOOOOOOOOOOOOOORRRRRRRRRRRRRSSSSSTTTTTTTTTTTTTTTTTUUUUUUUUUUUUUUWWWWWWWWWWWWWWWWWZZZZZZZZZZZZZ[[[[[\\\\\\\\\\\\\\\\\]]]]]]]]]]]]]]_________________aaaaabbbbbbbbbbbbbbbbbcccccccccccccceeeeeeeeeeeeeeeeehhhhhhhhhhhhhiiiiijjjjjjjjjjjjjjjjjkkkkkkkkkkkkkkmmmmmmmmmmmmmmmmmooself  �transto �cb �  i  :   
�-     9   + B K  �setVisiblebg  �   '�-     9   + B -    9   + B -     X�-    9   + B -    9  + B K  ����setTouchEnabledsetVisibles1 s2 s3 node  � W�� 9 '	 B	 9B
 9B 9	B	6
 9


 9

*  ) * B
6 9 9*  ) ) B6 9 93 B6 9 93	 B 9
6 9 9
    B A6 9 9*  6 9	 B A6 9 9*  6 9	  B A 9
6 9 9  B A2  �K  pMoveToSequencerunAction  CallFunccreateScaleToccgetPositionXgetPositionYbggetChildByName��̙�������������self  Xnode  Xnode1  Xs1  Xs2  Xs3  Xbg Sposy1 Pposy2 Mposx2 Jg1 Bg2 :func1 4func2 .b1 b2  �   %�-     9   + B -    9   + B -     X�-    9   + B -    9   + B K  ����setVisibles1 s2 s3 bg  A   �-     9   + B K  �setTouchEnablednode  � W�� 9 '	 B	 9B
 9B 9	B	6
 9


 9

*  ) * B
6 9 9*  ) ) B6 9 93 B6 9 93	 B 9
6 9 9
    B A6 9 9*  6 9	 B A6 9 9*  6 9	  B A 9
6 9 9  B A2  �K  pMoveToSequencerunAction  CallFunccreateScaleToccgetPositionXgetPositionYbggetChildByName��̙�������������self  Xnode  Xnode1  Xs1  Xs2  Xs3  Xbg Sposy1 Pposy2 Mposx2 Jg1 Bg2 :func1 4func2 .b1 b2      	�K  self       	�K  self       	�K  self   �   �6   99 ' B6   99  9' B AK  Image_75getChildByNamescaleXToFullScreenpalace_huanggong_title	viewalignLeftUIManagerself   �   �6   99  9B6 ' B99BK  	namePALACEUIdata.Config_UIrequiregetParent	viewremoveUIUIManagerself   �   �9   9B6  9  B+  = K  	viewremoveEventsEventManagerdisposecommonBakLogicself   �    W �6   ' B 6 ' B3 =3 =3	 =3 =
3 =3 =3 =3 =3 =3 =3 =3 =2  �L  dispose closeIt layout updateMembers clearNodesEvent updateState animationReverse animation listen4Choices 	init create 	ctorPALACEUI
classdata.Config_UIrequire        .  a / � b � � � 0 11uiConfig PALACEUI   