LJN@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\EQUIPLVUP.luan   +  =  6 ' B9= K  
equipdata.Config_GameDatarequireequipConfig	viewself  	 �   #6     9  -  9 9B6 ' B99B 6     9  +  6 ' B9	9B   9 
 B K  �setHeroInfoHEROATTRIBUIgetUILogicByName	nameEQUIPLVUPdata.Config_UIrequiregetParent	viewremoveUIUIManagerlogic  $    -   B +  L  �cb        K    �&\�-   9 B=3 3 =9 9' B=6  9	95	 3

 =
	B6  996	 9		6 99 6 99 6 996 99B	5
 6 9)  )  )  )� B=
6 9)  )  )  )  B=
 B9=9=9=9=6  9	 6
 9

6  '! B9"6#  9$B A 9%B2  �L  �	init
lvlUphandlerupgradeEquipmentLvapp.event.HeroProxyEventrequireheroProxyGameGlobaladdEventEventManager	nodecurNode	hero	type
equipborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRectcallBack   widgetTouchExtentUIManagerImage_1getChildByName
basic canClosed 	viewnew����
EQUIPLVUP self  ]view  ]param  ]logic Xcb Vrect : � /��)-9 :	  X�6 9 99 :B9 :9 :9 9!9 9 :=9  9' B 9	B9  9
'	 B9  9
'	 B6 ' B 9*	 +
 + B	 9'
 B	 9+
  + B9 	 9
 B	 99
 
 9

' B

 9

B


9  9' B 9BB6 '	 B	 9*
 + + B
 9+  + B
 9' B9 
 9 B
 99  9' B 9	B A6 9
 9' ) B6	 9			 9		 ' ' B		 9
	6 9)* )� )* B A
6
 9


 9

!' ' B

 9
6 9)* )� )* B A6 '  B9 9!	  X�'" X�9 9!	 X�'# X�'$ 89% 99 9&89 9!8:"6 9 9 ''  &' ' B 96 9)* )� )* B A6(  9)	 B6(  9)
 B6(  9) B	 9	-  ::B
 9
-  ::B 9-  ::B 9	 B 9
 B 9 B 9*+ B  9+  ) B  9 BX�6,  9-6 '  B9.BK  �	czsbaddMessageFloatMessagerunWordAnisetCascadeOpacityEnabledfontStokeUIManager+ qualityequipConfighpdefatk	typedata.Config_Language.luac3bccsetColor24simhei.ttf	TextartText_dengjijia.pngImageView	ccuigetPositionYgetPositionXtexiaosetPositionaddChild	initsetNamecreateapp.sprite.SkillAnirequireequipEffectFightEffectremoveChildByNamegetPosition	icongetChildByName	viewlv
equipsetSilverlocalPlayerGameGlobalarr����Ȁ��									



      !!!!!!""""""####$$$$%%%%''''((((())))++++++++-tishengPos self  �target  �arr  �successTimes �level �pos �effect13 �effect94 ,�img  �txt1 �txt2 qtypeStr Wattri1 
Mtxt3 B y   d6     9  -  B    X �-     9  B K  �removeFromParentcheckObjIsNullGameGlobalnode  �f�W 9 *  B 9) B 9-  8:B6 9 9* ) B6 9 9* B6 9 96 9
 9 B	 B6 9	 9)	 -
  8

:

B6 9
	 9*
 B6 9
 9 6 9 96 9 9* B B A9	 	 9		 B	6	 9			 9		3 B	 9
6 9 9 6 9 9* B 	 B A
2  �K  �runAction CallFuncaddChild	viewDelayTimeSequenceFadeOutMoveToEaseBackIn
SpawnFadeIncreateScaleToccsetPositionsetOpacitysetScale�����̙������̙����͙���̙�						

















tishengPos self  gnode  gtype  gaction1 Qaction2 Kaction3 ?action4 	6action5 0action6 cf  � JX}-  9 96 99  X�6  96 9BK   	 X�6  9
6 ' B9-  9+ B  X*�6  9' B6 9 9-  9 9) BX�6  9
6 ' B9-  9+ B  X�6  9' B6 9 9-  9 9) BK   �sound/repairAll.mp3uIdsend_upgradeEquipmentLvheroProxysound/repair.mp3playEffectSoundManager	costSILVERapp.const.Const_CostTyperequirecheckResourceEnoughonetimedengjibugouConfig_LanguageaddMessageFloatMessage
levellocalPlayerGameGloballv
equip	












self type1  K � 5��l"6  999 9"6 ' B 99  9	'
 B5 9 9>B9  9	' B 9'  &B9  9	' B 9'  &B9  9	' B 99 9B9  9	' B 99 9 B  9 B9  9	' B 9 '	 
 &
B9  9	' B 9 '	 &	B9  9	' B 9 B6 ' B9 9 89  X�6 ' B9 989= 9 6 ' B999 989 98"= 9  9	'  B 99 B9  9	'  B 9!6" 
 9#6 '$ B6  99%9  X�'& X�'' 8B A9  9	'( B 99 9(B9  9	'( B 9!6" 
 9#6 '$ B') 9 9&8B A3* 6+  9,9	 	 9			'- B	5
. =/
50 =1
B6+  9,9	 	 9			'2 B	5
3 =/
54 =1
B2  �K    fivetimes  FiveTimesButton
param  onetimecallBack  OneTimeButtonwidgetTouchExtentUIManager equipLv_	nameequipNumInvalidequipNumValidsilverapp.const.Const_colorDataconvertHexToRGBDisplayObjectUtilsetColoronetimequality	typelvUpFactordata.Config_GameData!data.Config_EquipmentUpgrade	costnextAdd
attri+curAddgetAttrnextLvlv
curLvtotalLv/setStringtotalLv1id
equip   	icongetChildByName	viewcreateapp.uiLogic.ICONrequirelvMaxRateequipConfig
levellocalPlayerGameGlobal											








             !!!!!!!!!!!!!""self  �totalLv �typeStr =�attri1  �attri2  �cb � �  Cn�9  99 989 989  99 989 98:9 9" 6 ' B9 9	  X�' X�9 9	 X�'	 X�'
 89  99 989 98:9 9"9  99 989 98:9 9 "   J lvhpdefatkdata.Config_Language.luarequire	rankquality	type
equip	BaseequipConfigself  Dbase .typeStr attri1 attri2      	�K  self   K   �6   9  BK  removeEventsEventManagerself   �  
<V �6   ' B 4 4 6 9*  * B>6 9*  * B ? >4 6 9* * B ? >4 6 9* * B ? >4 6 9* *	 B ? >3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 2  �L   dispose layout getAttr 	init runWordAni 
lvlUp create 	ctorpccEQUIPLVUP
class��������������ۃ������������������ׂ�����᫁��������̉�������ي�������Ӂ(V)kW�l��������EQUIPLVUP 9tishengPos '  