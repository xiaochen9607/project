LJP@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\ARENAMAINUI.lua�   !+  =  +  = 4  = +  = +  = +  = +  = +  = +  = +  =	 +  =
 ) = K  buyTimesCostclearCDButtonrefleshButtoninstructionButtonpurchaseButtonrankButtonshopButtonsetDefSquadButtonscheduleIddefHeros
nodes	view		

self   �  	 36     9  -  9 9B6 ' B99+  5 B K     	typevip	nameVIPANDPAYdata.Config_UIrequiregetParent	view
addUIUIManagerlogic  �  	86     9  6 ' B9-  96  99 "+ B    X�6   9    9  B K    send_buyArenaTimesarenaInfo_timesPurchasedcampaignbuyTimesCost	GOLDapp.const.Const_CostTyperequirecheckResourceEnoughGameGloballogic  �    O6     9  6 ' B96  99+ B    X�6   9    9  B K  send_resetArenaCoolTimearenaClearCdCostcampaign	GOLDapp.const.Const_CostTyperequirecheckResourceEnoughGameGlobal �3��A6  ' B  X�6  9-  9 9B6  ' B99+  5	 B 
 X�6 9 9B 9B6  9 6  '	 B99+  5	 6
  ' B
9

=
	B  X
�6  9-  9B99B  X\�6 99)   X�6 9 9B 9B6  9 6  '	 B99+  5	 B2 z�6 996 6 9989  X�6 996   X�2 h�6  9-  9 9B6  ' B99+  5! 3	" =	#B2  �K  3$ 6  9-  9 9B6  '	 B99+  5	% =&	-
  9
'
6 99 "

=
(	B ) X�6  9-  9 9B6  ' B9*9B + X�6 9 9,B - X � . X�-   9/B)   X�30 6  9-  9	 9B6  '
 B99+	  5
1 =&
6 992=(
BK  K  K  ��arenaClearCdCost id: getLeftTimeclearCDButtoninstructionButtonsend_refreshArenaPlayerrefleshButtonARENABATTLEREPORTUIzhanbaoButton
parambuyTimesCost	fun2 id< 	fun1  idjbuyArenaTimes
vipLvlocalPlayerConfig_ViparenaInfo_timesPurchased id9MESSAGEBOXarenaInfo_timesLeftcampaignGameGlobalpurchaseButtonRANKUIrankButtonbatType  pvpShop!app/const/Const_ShopType.luaSHOPUI1getRunningScenegetInstanceDirectorccshopButton batTypesubBatType	nameREADYTOBATTLEgetParent	view
addUIUIManagersetDefSquadButtondata.Config_UIrequire																	%&&&&&&&&&&&&&&&&&&&&&&&&&))**************--.....11556666777<=====================Alogic view name  �conf �curScene curScene -sure 5cd 8sure  K  e-   9 BK  �fillEnemiesInfologic target  obj   �  #j-  9  9' B 96 99BK  �arenaInfo_timesLeftcampaignGameGlobalsetStringtimesLeftgetChildByName	viewlogic target  obj       nK  target  obj   L  q-   9 BK  �fillDefSquadInfologic target  obj   � 	 7t9 6 ' B99  X�-  9
  X�-  9' B 96 9	 9
-  9B AK  ��getHerosCombatPowerlocalPlayerGameGlobalsetStringcombatPowergetChildByNamedefHerosREADYTOBATTLEdata.Config_UIrequire	namelogic view target  obj   �   {-     9   B -     9  B -     9  B K  �fillEnemiesInfofillContentfillDefSquadInfologic  �   �6     9  -  9 9B6 ' B99+  5
 6 9	=B K  �str height�
width�pvpIntroConfig_GameData	nameSIGNINTROdata.Config_UIrequiregetParent	view
addUIUIManagerlogic  �]���-   9 B=6  996 96
 9

9


 
6 99 6 996 99B5	
 6
 9
	
)  )  )  )2 B
=
	6
 9
	
)  )  )  )  B
=
	B6 ' B 9
 9' B5	 6
  9B
=
	B=3 6  9 9	' B	5
 =
5 =
, )
 * B	=6  9 9	' B	5
 =
5 =
, )
 * B	=6  9 9	'  B	5
! =
5" =
, )
 * B	= 6  9 9	'# B	5
$ =
5% =
, )
 * B	=#6  9 9	'& B	5
' =
5( =
, )
 * B	=&6  9 9	') B	5
* =
5+ =
, )
 * B	=)6  9 9	', B	5
- =
5. =
, )
 * B	=,6  9 9	'/ B		 9		'0 B	5
1 =
52 =
, )
 * B	=/9/ 93B 9'	4 B 95'	6 6
7 9
8
9
9
B9/ 93B 9'	4 B 9:)	�B 9;B3< 3= 3> 3	? 3
@ 3A 6B  9C 6D 9E6 'F B9G B6B  9C 6D 9E6 'F B9H B6B  9C 6D 9E6 'F B9I B6B  9C 6D 9E6 'F B9J	 B6B  9C 6 6 'K B9L
 B6B  9C 6D 9E6 'F B9M B6B  9C 6D 9N6 'O B9P6  9QB A 9'R B 9S'T B 9'U B 9S'T B 9'V B 9S'T B 9'W B 9S'T B 9QB6D 9E 9XB 9YB3Z 6  99 9'[ B5\ =B2  �L  �  wenhao layoutsend_getArenaInfotimesLefttotalTimescombatPowersetStringmyRankupdateTipgetPlayerSomeInfoChangeapp.event.LoginProxyEventloginProxygetArenaInfoREMOVEapp.event.UIManagerEventmodifyArenaDefSetupresetArenaCoolTimebuyArenaTimesrefreshArenaPlayerapp.event.CampaignEventcampaignGameGlobaladdEventEventManager      fillDefSquadInfosetLocalZOrderplistTypeTextureResType	ccuiworldWar_chongzhi.pngloadTexture	IcongetParent  clearCDButton  ButtonclearCDButton  instructionButton  instructionButton  refleshButton  refleshButton  purchaseButton  purchaseButton  rankButton  rankButton  shopButton  shopButton  setDefSquadButton  setDefSquadButton
param  zhanbaoButton  widgetTouchExtentzhanbaoButton callBack  closeIthandlerProjectNode_1getChildByNamecreateapp.uiLogic.COMMONBAKrequirecommonBakLogicborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRectUIManager	viewnew����
����̙��GHHHHHHHHHHHHHHHHIIIIIIIIIIIIIIIIJJJJJJJJJJJJJJJJKKKKKKKKKKKKKKKKLLLLLLLLLLLLLLLLMMMMMMMMMMMMMMMMNNNNNNNNNNNNNNNNOOOOOOOOOOOOOOOOOOOOPPPPPPPPPPPPPPPQQQQQQQQQQQQRRRV\_binooooooooooooppppppppppppqqqqqqqqqqqqrrrrrrrrrrrrsssssssssssttttttttttttuuuuuuuuuuuuuuuvvvvvvvvwwwwwwwwxxxxxxxxyyyyyyyyzzz{{{{{|||�������������ARENAMAINUI self  �view  �param  �logic �rect *�endedCallBack �refreshArenaPlayer ��buyArenaTimes �resetArenaCoolTime �modifyArenaDefSetup �removed �init �cbIntroduce � �  
AI�6  99	  X�9  9' B 9' B 9+ BX�9  9' B 9' B 9+ B6  99	  X�9  9'	 B 9' B 9+ BX�9  9'	 B 9' B 9+ BK  shopButtonarenaItemLimitValidsetVisible
tishizhanbaoButtongetChildByName	viewmyBattleValidloginProxyGameGlobal														self  B � 
  >S�9   9'  &B6  9' B 9	 9B A9   9 B 9	'
  &B 9' B 9' B 9' B 9' B 9' B 9' B 9' B 9+ BL setVisiblefightButtoncombatPower	namesetString	rankuusetNameaddChildgetPositionsetPosition#ui/worldWar/ArenaEnemyUnit.luagetNodeFromCacheUIManagerugetChildByName	view								
self  ?i  ?u 7uu 2 �  ?m�6  996  9 9 B= 9  9' B 9'	 B 9
+ B4  ) 6 99 B) M�9 8  X�6 9
  9 8BO�6 ' B 9  )	 )
 B= 6 ' B 9 BK  disableTouchcreate app.uiLogic.ENEMYINBATSETUPrequireenemyInBatSetupinsert	maxn
tablesetVisible	bossenemyInBatSetupNodegetChildByName	viewgetHerosByUIdslocalPlayerdefHerosarenaInfo_defSquadcampaignGameGlobal����								self  @defSquad <node 0team 	'  i  A    �6   9  9  L  timesRefleshcampaignGameGlobal     �) L cd   �  @��-   )    X 	�-  9      X�6  9  - 9 B -    9  B .   -   )    X �0   -   )    X 
�-    9  6  9-  B A X �-    9  + B -    9  + B -    9  + B -    9  + B -    9  - B A K  � �������setVisibleformatTimeStringUtilsetStringgetLeftTimeunscheduleGlobalschedulerscheduleId 										cd self cdNode cdTitle clearCDButton refleshButton price getRefleshPrice  � $���:9   9' B 96 99B9   9' B 96 9 9	9
 B A9   9' B 96 ' B9B9   9' B 96 99B6 99)   X
�9   9' B 9+ BX	�9   9' B 9+ B3 9   9' B 9 B A  9 B3 9   9' B9   9' B9   9'	 B9  	 9'
 B9  
 9' B3	 )
  
 X
7� 9
+ B
 9
+ B
 9
+ B
 9
+ B
 9
+ B
 9
6  9 B A
9
  
 9

' B

 9

  B A
6
 9
 

 9
!
B

 9
"
B

 9
#
	 *  + B
=
 X
� 9
+ B
 9
+ B
 9
+ B
 9
+ B
9
  
 9

' B

 9

 B A
2  �K  scheduleScriptFuncgetSchedulergetInstanceDirectorccscheduleIdformatTimeStringUtil clearCDButtoncdcdTitlerefleshButton getLeftTime
price setVisiblepurchaseButtonarenaInfo_timesLefttimesLeftarenaFightTimesdata.Config_GameDatarequiretotalTimesdefHerosgetHerosCombatPowerlocalPlayercombatPowerarenaInfo_rankcampaignGameGlobalsetStringmyRankgetChildByName	view����)***++++,,,,----....////0000000011111111111222222222222222244445555666677778888888888::self  �getRefleshPrice K~cd qgetClearCDPrice prefleshButton kcdTitle fcdNode aprice \clearCDButton Wtick V �  	)�6  96 ' B96  9B 6 99!!B)   X�)  L arenaInfo_latestActionTimecampaigngetServerTimeGameGlobalarenaCoolTimedata.Config_GameDatarequire
floor	math�self  leftTime  Q    �6     9  ' B K  sound/open.mp3playEffectSoundManager �  	
)�-      .   -   	  X �6     9  6 6 ' B95 - 9 9B=	- 9=B K  � �	name  getName	viewINITCOMPLETEapp.event.UIManagerEventrequireUIManagersendEventEventManagercomCount self  � W��)  ) ) ) MP�  9  	 B	 9B9 	 9'
  &

B	 9B 9	 B	 9	+ B	 9	)  B	3		 3

 6 9 96 9 9B6 9 9	 B6 9 9* B6 9 96 9 9* 5 ==B A6 9 9
 B A 9 BO�2  �K  runActionyx  MoveToEaseBackOutFadeInCallFuncDelayTimecreateSequencecc  setOpacitysetCascadeOpacityEnabledsetPositionYgetPositionugetChildByName	viewstopAllActionscreateEnemyNode���̙������̙��������self  XcomCount VQ Q Qi Otar Kx >y  >playSnd 1com 0action , �    �6     9  6 ' B96  99+ B    X�6   9    9  B K  send_resetArenaCoolTimearenaClearCdCostcampaign	GOLDapp.const.Const_CostTyperequirecheckResourceEnoughGameGlobal �!z��$6  ' B  Xs�+ ) ) ) M�6 998
  X�6 998  X�+ X�O� X�6 9 9B 9	B6
  9 6  '
 B99+	  5
 B2 I�-   9B)   X�3 6
  9-  9
 9B6	  ' B	9		9		+
  5 =6 99=B2  �K  6 99)   X
�6  96  '	 B:5B2  �K  6 9- =6  9' B6
  9-  9	 9B6  '
 B99+	  5
  BK  K   �� batTypesubBatType READYTOBATTLEsound/dekaron.mp3playEffectSoundManagerarenaInfo_opponentSeqdata.Config_LanguageaddMessageFloatMessagearenaInfo_timesLeft
paramarenaClearCdCost	fun2 id:getParent	view getLeftTime id7	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorccarenaInfo_defSquadcampaignGameGlobalfightButtondata.Config_UIrequire����    !!!!!""""""""""""""""$self seq name  zconf vhas r  i curScene cd Dsure  � 9c�-  9  9' B 9)d B-  9  9' - &B 9B  9  B  X�6 9	9
- 86 ' B 9 5	 =	9
=
	B 9+ B  X� 9+ BK   ��
endedsetVisibleheroInfosplayer  create!app.uiLogic.ARENAENEMYINFOUIrequirearenaInfo_opponentscampaignGameGlobal
begansetPositiongetPositionuusetLocalZOrderenemyInfoTipgetChildByName	view��											



self seq name  :tip 3x $y  $opponent  � >���d9   9'  &B  X�  9  B  9' B 96 9989B 9'	 B 96 9989	B 9'
 B 96 9989
B 9' B' 6 9989' &6  9 B X�'  9' B  XK�6 9 9B	 9'
 B	 9+
 B	 9)
  )  B6 9	 9B6 9'
 B 9	*  B	 9	 B	6	 9	 		 9		 B		  9	' B	 9	 B	 9	!)  B	 9	 B	 9	 9"B A	 9	#+ B	 9	$ 9%BB	 9'	 B 9&	 6
 9
'
9
(
B 9)+	 B3* 3+ 
 9', B
 9-+ B6. 
 9/ 9', B 9'0 B51 =253 =4, )
 *  B	 9	5B		 9		'6 B		 9	&	'7 6 9'9(B	 9	5B		 9		'6 B		 9	$	)�B	6	. 	 9	/	 9' B58 =259 =45: =25; =4, 5< =25= =4B	
2  �L   
ended    
began    
ended  worldWar_tiaozhan.png	IcongetParent
param  fightButtoncallBack  ButtonwidgetTouchExtentUIManagersetVisiblefightButton  setTouchSwallowEnabledplistTypeTextureResTypeloadTexturegetLocalZOrdersetLocalZOrdersetCascadeOpacityEnabledgetPositionsetAlphaThresholdClippingNodeaddChildsetScale#common_q1.pngnewSpritedisplay	NodeccsetPositionignoreContentAdaptWithSizeheadViewsetNamecreateImageView	ccuiheadClipingImgheroHead2_-1.pngcheckPngExistInPlist	.png
defIdheroHead2_bordercombatPower	namearenaInfo_opponentscampaignGameGlobalsetString	rankcreateUnituugetChildByName	view����̙��



    !!!!!!""""#######%%%%%%%%%%%''''L\^^^^^^^^___________________``````````````aaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbccself  �seq  �u �border /�headImgPath �headClipingImg �headView FstencilNode 4stencil 0endedCallBack @LtouchTip Kfb 0showHeroInfos . �   �6   9+  6 ' B99BK  	nameARENAMAINUIdata.Config_UIrequireremoveUIUIManagerself   X   �6   99 ' BK  Image_27	viewalignLeftUIManagerself   �   $�6  9 9B9   X�6 99 B+  = 9  9B9	  9B6
  9  BK  removeEventsEventManagerenemyInBatSetupdisposecommonBakLogic	viewunscheduleGlobalschedulerscheduleId!send_getPlayerSomeInfoChangeloginProxyGameGlobalself   �   I �6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   dispose layout closeIt createEnemyNode fillEnemiesInfo getLeftTime fillContent fillDefSquadInfo createUnit updateTip create 	ctorARENAMAINUI
class     �  � � � � � � � � � � � ��������ARENAMAINUI   