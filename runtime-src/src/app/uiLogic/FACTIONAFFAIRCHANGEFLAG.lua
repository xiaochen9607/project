LJ\@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\FACTIONAFFAIRCHANGEFLAG.lua7   +  =  +  = K  button	viewself   �   6     9  -  9 9B6 ' B99B K  �	nameFACTIONAFFAIRCHANGEFLAGdata.Config_UIrequiregetParent	viewremoveUIUIManagerlogic  �   6     9  6 9 9B 9B6 ' B99	+  5
 -  =B K  �	fun2 id	cggb	nameMESSAGEBOXdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagercb  �  
 \c	-   9   ' -  9' -  9' -  9' 6 99&  6 99  X �6 	   9 
 6 9B K  6  9  9  6 99' 6 99&  X �6    9  6 ' B96 ' B6 -  9 B89+ B    X�6    9  -  9) B   X �6  9    9  -  9 ' -  9' -  9' -	  9		&	6 -  9 B A K  �send_modifyFactionEnsigncheckHasForbiddenWordneedMoneytonumberdata.Config_FactionEnsign	GOLDapp.const.Const_CostTyperequirecheckResourceEnoughiconStringDefaultjtqzwgbConfig_LanguageaddMessageFloatMessageiconStringfactionUIdfactionGameGlobalwordcolor	wordflagcolor_	flag	logic  �   '6     9  -  9 9B6 ' B99+  5
 6 9	=B K  �str height�
width�flagIntroConfig_GameData	nameSIGNINTROdata.Config_UIrequiregetParent	view
addUIUIManagerlogic  �+�%-   9 B=3 6  996	 9		6 99 6 99	 6 996 99	B	5
 6 9
)  )  )  )� B=
6 9
)  )  )  )  B=
B6  9 9	' B	5
 =
B3 	 9'
 B	 96
 9

9

B6 	 9
 6 96 ' B9 B	 9B	 9B	 9 B	 9!B6 9	 9"9
'# 6 99$B3% 6 
 9 9'& B5' =B3( 6	 	 9		9 9') B5* =B	2  �L  �  wenhao   queding iconString
junqihandleFactionIconselectTxtselectTxtColorselectFlagColorselectFlagmodifyFactionEnsignapp.event.FactionEventrequireaddEventEventManagerfactionNamefactionGameGlobalsetString	name callBack  guanbigetChildByNamewidgetTouchExtentborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRectUIManager 	viewnew����
										"###########$$FACTIONAFFAIRCHANGEFLAG self  �view  �param  �logic {cb yrect )Pcbsuc EcbSub -cbIntroduce  �  `t6
-   9 ' - 9&B 9 ' B 9+ B- = 6 996 99'	 6 99
& X�- 9 9 ' B 9)  BX�- 9 9 ' B 96 ' B6 - 9B89B6 9 9- 9' - 9'	 - 9'		 -
 9

'	 - 9&B-   9 '   &B 9 ' B 9+ BK  � �wordcolor	wordflagcolor
junqihandleFactionIconneedMoneytonumberdata.Config_FactionEnsignrequiresetStringxiaohao	viewfactionUId_iconStringDefaulticonStringfactionGameGlobalsetVisiblexuanzhong	flagqgetChildByName															
style self param  a �  [}-6  96 99' B:=  6 996 99' 6 99& X
�9	  9
' B 9)  BX�9	  9
' B 96 ' B6 9  B89B9	  9
' B 9
' 9  &B 9
' B 9+ B3 ) ) ) M�6 	 9 9

'  &B
5 =4 >=BO�2  �K  
paramcallBack  widgetTouchExtentUIManager setVisiblexuanzhongq
styleneedMoneytonumberdata.Config_FactionEnsignrequiresetStringxiaohaogetChildByName	viewfactionUIdiconStringDefault_iconStringfactionGameGlobal
splitStringUtil	flagself  \style 7%cb   i  �  6KI-   9 ' - 9&B 9 ' B 9+ B- = 6 9 9- 9'	 - 9
' - 9'	 -
 9

' - 9&B-   9 '   &B 9 ' B 9+ BK  � �wordcolor	word_	flag
junqi	viewhandleFactionIconfactionGameGlobalsetVisiblexuanzhongflagcolorpgetChildByNamestyle1 self param  7 �  4WE6  96 99' B:=  9  9'	 B 9'
 9  &B 9' B 9+ B3 ) )	 ) M�6 	 9 9
'
  &B
5 =4 >=BO�2  �K  
paramcallBack  widgetTouchExtentUIManager setVisiblexuanzhongpstylecolorgetChildByName	view_iconStringfactionGameGlobal
splitStringUtilflagcolor	




self  5style1 %cb   i  �  6KW-   9 ' - 9&B 9 ' B 9+ B- = 6 9 9- 9'	 - 9
' - 9'	 -
 9

' - 9&B-   9 '   &B 9 ' B 9+ BK  � �	wordflagcolor_	flag
junqi	viewhandleFactionIconfactionGameGlobalsetVisiblexuanzhongwordcolorpgetChildByNamestyle2 self param  7 �  4WS6  96 99' B:=  9  9'  B 9'	 9  &B 9'
 B 9+ B3 ) )	 ) M�6 	 9 9
'	  &B
5 =4 >=BO�2  �K  
paramcallBack  widgetTouchExtentUIManager setVisiblexuanzhongpgetChildByName	view_iconStringfactionGameGlobal
splitStringUtilwordcolor	




self  5style2 %cb   i  �    &e-   -  9 9' B 9B=  6  9    9  -  9' -  9	'
 -  9'
 -	  9	 	'

 -  9&B K   �wordcolorflagcolor_	flag
junqihandleFactionIconfactionGameGlobalgetStringtxtwordgetChildByName	view	wordself  � Hxa6  96 99' B:=  9  9'	 B 9
B9  9'	 B 99  B3 6  9B6  99 	 9'
	 B )	 
 5 =B 96 9)
  *  B A 99 
 9'	 B
 9B A9  9 B2  �K  addChildgetPositionsetPositionpccsetAnchorPointcallBack  createEditBoxWithLabelUIManagerfactionFlagLenthMultiVersionUIHelper setStringgetContentSizetxtwordgetChildByName	view_iconStringfactionGameGlobal
splitStringUtil	word����				













self  Isize1 6cb 
,factionFlagLenth (zhuti      	rK  self   J   u6   9  BK  removeEventsEventManagerself   �   0 z6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 2  �L   dispose layout selectTxt selectTxtColor selectFlagColor selectFlag create 	ctorFACTIONAFFAIRCHANGEFLAG
class,D-RE`SqatryuzzFACTIONAFFAIRCHANGEFLAG   