LJP@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\EQUIPRANKUP.luan   +  =  6 ' B9= K  
equipdata.Config_GameDatarequireequipConfig	viewself  	 Í   ")6     9  -  9 9B6 ' B99B 6     9  +  6 ' B9	9B   9 
 -  9-  9-  9B K  À	type	herocurNodecreateHeroToEquipYuanHEROATTRIBUIgetUILogicByName	nameEQUIPRANKUPdata.Config_UIrequiregetParent	viewremoveUIUIManagerlogic  $    -   B +  L  Àcb        K    ä %=	9 :	  X-  99 :=-  99 :=6 99-  989 :=-   9	BX6
  96 ' B9BK  À	czsbdata.Config_Language.luarequireaddMessageFloatMessage	initnummyCurItembaglocalPlayerGameGlobalrankCurExp	rank
equiparr	logic target  &param  & Ò%Z#-   9 B=3 3 =9 9' B=6  9	95	 3

 =
	B6  996	 9		6 99 6 99 6 996 99B	5
 6 9)  )  )  )¯ B=
6 9)  )  )  )  B=
 B3 6 	 9
 6 96 ' B9 B9=9 = 9"=!9#=#	 9$B2  L  À	init
equip	nodecurNode	hero	typeupgradeEquiptRefineLvapp.event.HeroProxyEventrequireheroProxyGameGlobaladdEventEventManager borderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRectcallBack   widgetTouchExtentUIManagerImage_1getChildByName
basic canClosed 	viewnewüÿÿÿ
  !!!""EQUIPRANKUP self  [view  [param  [logic Vcb Trect :upRank  ¼ p> -  + = -  9  X6 9-  9B-  +  =6 9 9- B)   X&-  996	 '
 B99 X-  9	  X-   9- ) B-   9- BX=-   9- B6  96 9BX1-  9)   X&-  996	 '
 B99 X-  9	  X-   9- ) B-   9- BX-   9- B6  96 9BX6  96 9BK   ÀÀ	slbz
maxLvConfig_LanguageaddMessageFloatMessageuseExpItemuseExpItemNoSendMsgtotalExpNumrankMaxdata.Config_GameDatarequire	rank
equipgetItemNumByIdlocalPlayerGameGlobalunscheduleGlobalschedulerretryScheduleIdisEnded 						 self itemId touch  q ±  c#-   -  9  =  -   ) = -   9   )
   X 	-   9   )   X -   )
 = X -   9   )   X 	-   9   )   X -   )2 = X -   9   )   X -   )d = 6  9    9  - B )    X?-  996 ' B99	 X"-  9   X-   9
- -  9 B-  -  9-  9  =X1-   9
-   B-  -  9  =X%-  9  X6 9-  9B-  +  =6  96 9BX-  9  X6 9-  9B-  +  =6  96 9BK     	slbz
maxLvConfig_LanguageaddMessageFloatMessageunscheduleGlobalschedulerretryScheduleIdtotalExpNumuseExpItemNoSendMsgrankMaxdata.Config_GameDatarequire	rank
equipgetItemNumByIdlocalPlayerGameGlobalexpFactortickExp			!!!!!!#self itemId restNum 3U ù  *	-   9     X -   9  
   X 6  9  -  9B -   +  = -   )  = -   6 9- *  B= K    ÀscheduleGlobaltickExpunscheduleGlobalschedulerretryScheduleIdisEndedµæÌ³¦þ	self callBack  Å:_3-  )  = -  + =3 3 6 9 *  B2  K   ÀÀperformWithDelayGlobalscheduler  isEndedtotalExpNumµæÌ³¦þ'12222233self itemId touch  callBack cb gsc       K   å EZ-  + = -  9  X6 9-  9B-  +  =6 9 9- B)   X&-  996	 '
 B99 X-  9	  X-   9- ) B-   9- BX-   9- B6  96 9BX6  96 9BK   ÀÀ	slbz
maxLvConfig_LanguageaddMessageFloatMessageuseExpItemuseExpItemNoSendMsgtotalExpNumrankMaxdata.Config_GameDatarequire	rank
equipgetItemNumByIdlocalPlayerGameGlobalunscheduleGlobalschedulerretryScheduleIdisEnded 						self itemId touch  F    ­6     9  -  9 9B6 99B K   À	nameEQUIPDECOMPOSEConfig_UIgetParent	view
addUIUIManagerself  ù 1â³+9  96 ' B 99  9' B5 9	 9
>B9  9' B 99	 9B9  9' B 99	 9B9  9' B 96  96 '
 B'	 9
	 9

&	
	8	B A9	 9)	  X19  9' B 99	 96 ' B9	 9 8' 9	 9&8#B9  9' B 99	 9' 6 '	 B9	 9 8' 9		 9		&	8&BX9  9' B 9)  B9  9' B 96 ' B9B) ) ) MI6 ' B 99	 	 9		'  &B	5
 >
6 998
  X6 9989   X)  >
+ B	 9!+
 B9 
 9'  &B
 9' B6	" 	 9	#	 5% 3$ =&5( 3' =&5* 3) =&+  )
 +  5, 3+ =&+ B	2 O·3- 6"  9#9  9'	. B5/ =&B  90 B2  K  getAttr  decompose          callBack   widgetTouchExtentUIManagersetTipEnablednumbaglocalPlayerGameGlobal  
maxLvdata.Config_Language/percent"data.Config_EquipmentRefineLvrankCurExpsetPercentloadingbarqualityequipLv_app.const.Const_colorDataconvertHexToRGBDisplayObjectUtilsetColor	namesetString	rankid
equip   	icongetChildByName	viewcreateapp.uiLogic.ICONrequirerankMaxequipConfigÈþÔ








334gghjjkkkkself  ãmaxLv àJ J Ji HiconLogic "%itemId  iconView1 goToDecompose  Ü  Ò³9  9  96 6 '
 B6	  B	8	9B" =9  96 ' B9  9 8' 9  9&8!6	 9
986	 9
989!=)   X_9  9' B9  9' B6 ' B 9* +	 +
 B 9'	 B 9+	  +
 B9  9	 B 99	 	 9		' B		 9		B			9
 
 9

' B

 9

B


B6 ' B 9*	 +
 + B	 9+
  + B	 9'
 B9 	 9
 B	 99
 
 9

' B

 9

B
 A9  9  9 =9  =  9 BK  getPosition	icongetPositionYgetPositionXtexiaogetChildByNamesetPositionaddChild	initsetNamecreateapp.sprite.SkillAniequipEffectFightEffectremoveChildByName	viewnumbaglocalPlayerGameGlobalquality	rank"data.Config_EquipmentRefineLv	datadata.Config_ItemrequiretonumberrankCurExp
equipúÈü				




self  itemId  num  rank  restExp  qeffect13 !Leffect94 ,  ý  åõÊ$9  99 989 989 9	  Xy9  9' B 96	 '
 B9' :9 9"' 6		 '
 B	9		'
 :9 9"&B9  9' B 96	 '
 B9' &B9  9' B 9:9 9 )	  X9 9   X9 9"B9  9' B 96	 '
 B9' &B9  9' B 9:9 9 )	  X9 9   X9 9"B9  9' B 9' B9  9' B 9' BX9 9	 Xy9  9' B 96	 '
 B9' :9 9"' 6		 '
 B	9		'
 :9 9"&B9  9' B 96	 '
 B9' &B9  9' B 9:9 9 )	  X9 9   X9 9"B9  9' B 96	 '
 B9' &B9  9' B 9:9 9 )	  X9 9   X9 9"B9  9' B 9' B9  9' B 9' BX9  9' B 96	 '
 B9' :9 9"' 6		 '
 B	9		'
 :9 9"' 6	 '
 B9' :9 9"&B9  9' B 96	 '
 B9' &B9  9' B 9:9 9 )	  X9 9   X9 9"B9  9' B 96	 '
 B9' &B9  9' B 9:9 9 )	  X9 9   X9 9"B9  9' B 96	 '
 B9B9  9' B 9:9 9 )	  X9 9   X9 9"B9 9)	  XJ9  9' B 96	 '
 B9B9  9' B 99  9' B 9BB9  9' B 9' B9  9' B 9' B9  9' B 9' B9  9' B 9' B9  9' B 9' BK  getPositionXsetPositionX
maxLvtoughValuehitValue
maxHpdodgeValuedef	att3
next3	att2
next2	att1
next1criValue
+atkdata.Config_LanguagerequiresetStringcurAttrigetChildByName	view	typequality
equip	rankequipConfigP										



         !!!!!!!!!"""""""""$self  ætmp 	Ý  	 
5ï9  = 
  X	  XK  6  9' B6 9 99 9	  BK  uId
equipsend_upgradeEquiptRefineLvheroProxyGameGlobalsound/strenSuccess.mp3playEffectSoundManagermyCurItemtotalExpNum self  itemId  totalUseNum      	øK  self   K   û6   9  BK  removeEventsEventManagerself   ù   9 6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 2  L   dispose layout useExpItem getAttr useExpItemNoSendMsg 	init create 	ctorEQUIPRANKUP
class     *  ² + É ³ î Ê ÷ ï ú ø ÿ û   EQUIPRANKUP   