LJZ@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\ACTIVITYLIMITTREASURE.lua�   +  =  +  = + = ) = )  = )  = 4  = )  = K  nextCosumeotherInfoleftTimesendTimecurPeriodscanTouchbutton	viewself   �   6     9  -  9 9B6 ' B99B K  �	nameACTIVITYLIMITTREASUREdata.Config_UIrequiregetParent	viewremoveUIUIManagerlogic  '     -   B +  L  �close  �	+��-   9 B=3  9' B6 ' B 9	 5
	 =

B=6  99	6
 9

6 99 6 99 6 996 99B
5 6 9)  )  )  )� B=6 9)  )  )  )  B=B3 =6 	 9
 ' B6 	 9 9
' B
5 =
B6 	 9
 6 9 6 '! B9"6#  9$B A6 	 9
 6 9 6 '! B9%6#  9&B A6 	 9
 6 9 6 '! B9'6#  9(B A6 9 	 9)B6 9 	 9*B2  �L  �send_getTreasureRecordssend_getTreasureInfogetGodancTreasureupdateOtherInfogetTreasureRecords	inithandlergetTreasureInfo!app.event.ActivityProxyEventActivityProxyGameGlobaladdEventEventManager  Button_1widgetTouchExtentImage_1scaleXToFullScreenByName canClosedborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRectUIManagercallBack  createapp.uiLogic.COMMONBAKrequirecommonBakLogicProjectNode_2getChildByName 	viewnew����
		ACTIVITYLIMITTREASURE self  �view  �param  �logic �close �commonBak ~rect 3K �  
 7-9 := := := := :=   9 B  9 B  9 B  9	 BK  updateGoldTimesupdaeTimeinitTurnTableinitRewardgotNuminsNumleftTimesendTimecurPeriodsarr			


self  target  param  arr  �  D_<6   9  -  96  9B !B )    X&�-  9  X�6 9-  9B-  +  =-  9  X�6 9-  9B-  +  =6	  9
6 9 9B6 ' B99B6  9  B-  9 9' B 9 BK   �setString"Text_multiple3_Copy_Copy_CopygetChildByNameformatTimeSimpleStringUtil	nameACTIVITYLIMITTREASUREdata.Config_UIrequiregetParent	view
logicremoveUIUIManagertickerunscheduleGlobalschedulertimeTickergetServerTimeGameGlobalendTime
floor	math�			self timeLeft 9timeStr . �  ;3  9   X�6 9 ) B=  B2  �K  scheduleGlobalschedulertimeTicker self  update  p   Y-   + =  -     9  B -     9  B K   �initTurnTableinitRewardcanTouchself  �   Ly_-   9   - :8  :  4  6 - BH
�)  X�  X�6 9	 
 BFR�-   9,  B-  - :=-  - :=-  - :=6 9	 9
6 - :B A6  96 9 9B 9B6 99+  5 = -	 :		=	6	 =	-	 =	BK   ���callBackgoldNum
indexmultip  	nameACTIVITYLIMITITEMLAYERConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagertonumbersetGoldlocalPlayerGameGlobalgotNuminsNumleftTimesupdateOtherInfoinsert
table
pairsrewardList				



self arr cb multip Fadd E  k 
v  
 � 6zR&9 3 3 : 6 9
 96 9 9)  B A9	 	 9		'	 B		 9	
	6 9 96 9 9* )hB6 9 9* B 6 9 9 B A A	2  �K  CallFuncDelayTimeRotateToSequencerunActionNode_yuanpangetChildByName	viewRotateBycreateEaseExponentialOutcc  arrZ���̙����           !!!!!!!""""""#$$$$$$  &&self  7target  7param  7arr 5cb 4com 3index 2angleZ /action # �  $ ~�y9   9' B 9B4  9 6 85 6 9=	6
 9)� )� )z B=>5 9 =	6  96 :B=>5 6 9=	6
 9)� )� )z B=>6  96
 9)�)	P B B 9)��)
 B9   9' B 9 B9 6 9 89 X�9   9' B 96 9 6	 9	!	9
 6 9 89B A9   9' B 9"+ BX�9   9' B 96 9#B9   9' B 9"+ BK  todayTreasureOutsetVisibletodayCanTreasureformatstringsetString.Text_multiple3_Copy_Copy_Copy_0_Copy_CopyuseCount
conIdConfig_TurntablegotNumaddChildsetPosition	sizerichTextUIManagerlimitTreasureEveryGold2 	textfontSizeConst_colorDataconvertHexToRGBDisplayObjectUtilinsNum 	textfontSize
colorc3bcc	textlimitTreasureEveryGold1Config_Language 	textfontSize
indexotherInforemoveAllChildrenNode_19getChildByName	view					








self  ta 
uplayerInfo rnode -E B   �-     9   B 1   K  �removeFromParentnode  � $���6     9  -  9B   X 	�6  9  -  9B -   +  = 2 p�4   -  9- 8)  ) ) ) M� 5 8=6	 
 9
6 :B=<  5 6 98=6 9)
� )� )z B=< O�6  96 9)|)	P B  B 96 9)	
 )
@B A-  9 9' B 9 B 9' - &B3  96 9
 96 9  9)
 6 9)  )��B A6 9! 9 B A A-  . - 6" 9#-  9B X�0  2  �K  K   ��	nums
tableCallFuncMoveBycreateSequencerunAction 	nodesetNameaddChildImage_16getChildByNamepsetPosition	sizerichTextUIManagerc3bcclimitTreasureConfig_Language 	textfontSize
colorConst_colorDataconvertHexToRGBDisplayObjectUtil	text 	textfontSizeotherInfotickerunscheduleGlobalscheduler	viewcheckObjIsNullGameGlobal				
	self index ta oplayerInfo knum j  i node &@com ' � #���_4    X�9 : X�4    X�4   	  X� 	  X�2 ��X�6  BH�6
 
 9

	 ' + B
4 :
>:
>:
>:
>6 99  BFR�  X*�6  BH$�6
 
 9

	 ' + B
4 :
>:
>:
>:
>+ 6 9 BH�:: X�+ FR� X�6 99 )  BFR�) 3	 6 9
9	 B)  XS�9 	 9'
 B	 9B) 6 9
9
 B)	 MC�4  9 8
)  ) ) ) M�5 8=6  96 :B=<5 6 98=6 9)� )� )z B=<O�6  96 9)|)P B B
 96 9)
  B A9  9' B 9 BO�X�9    X�9 	 9'
 B	 9B6! 9"	 *
 B=   B2  �K  K  scheduleGlobalschedulertickeraddChildpsetPosition	sizerichTextUIManagerc3bcclimitTreasureConfig_Language 	textfontSize
colorConst_colorDataconvertHexToRGBDisplayObjectUtil	text 	textfontSizeremoveAllChildrenImage_16getChildByName	view	nums otherInfoinsert
table;
splitStringUtil
pairs-1arr P�����	  !!!!!!%EFFFFFFFGGGGGGGGHHHHHHHIJJKLLLLMNNNNNNNNNNNNOPPPPPPPPPPPPPLRRRRRRRRRRSSSTTTTTTTTUUUUUUUUUHVXXXYYYYYYYYZZZZZZ[[__self  �target  �param  �add  �arr �  k v  otherPlayerInfo playerInfo 	' ' 'k $v  $otherPlayerInfo playerInfo 	isIn   key value  index pupdate oD D Di Bta AplayerInfo ?num >  j node &posY  �    k��4  =  ) = 6 6 BH�99  X�9= 6  99		'

 + B) ) )	 M�6  98
' + B6 99   BO�FR�) ) ) M>�9  8:6 6 9BH	�:
!)   X�:
!)   X�9  9' B 9'  &B 9'  ' &6 99BF	R	�9  9'	 B 9'	 
 &	
	B 96	 9		6 9 B	 AO�K  limitTreasureMultipleConfig_LanguageformatstringsetStringText_multipleplistTypeTextureResType	ccui	.pngactivity_baoloadTextureImage_GoldNode_yuanpangetChildByName	viewlimitMultipConfig_GameDatainsert
table_;reward
splitStringUtilidcurPeriodsstageIdConfig_Turntable
pairs
conIdrewardList				






	self  l! ! !k v  rewardCon   i tmpReward ? ? ?i =multip :" " "k v   }    �6     9  +  6 ' B99B K  	nameMESSAGEBOXdata.Config_UIrequireremoveUIUIManager X    �6   9    9  B K  send_getTreasureInfoActivityProxyGameGlobal �   �6     9  6 9 9B 9B6 ' B99	+  5
 3 =B K  callBack  	typepay	nameVIPANDPAYdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager � 	 ;R�-   9     X �2 5�-   9  )    X '�-   9  -   X �3  6  96 9 9B 9	B6
 ' B99+  5 = 3 =B2  �K  X �6    9  6 9B 2  �K  -   + =  6  9    9  B K  K   ��send_ancTreasureActivityProxyGameGloballimitTreasureGameOverConfig_LanguageaddMessageFloatMessage	fun2 	fun1 idrechargeNotEnough	nameMESSAGEBOXdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager gotNumleftTimescanTouch	



















self totalNum close  �
  7R�"6  9 899  9' B 9' B 99 B) 9 )   X
�9  9' B 9	+ BX	�9  9' B 9	+ B6
  99  9'	 B5 3 =B2  �K  callBack   widgetTouchExtentUIManagersetBrightleftTimessetStringText_12_CopyButton_2getChildByName	viewuseCount
conIdConfig_Turntable									!!	""self  8totalNum 3index %     	�K  self   �   $�9    X�6 99  B+  =  9   X�6 99 B+  = 6  9  B9  9BK  disposecommonBakLogicremoveEventsEventManagertickerunscheduleGlobalschedulertimeTicker					



self   �   !d �6   ' B 6 ' B 9B3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   dispose layout initTurnTable initReward updateOtherInfo updateGoldTimes getGod updaeTime 	init  	ctorcreatesrc.app.sprite.ShadersrequireACTIVITYLIMITTREASURE
class           ,  : - Q ; x R � y � � � )+*7,88ACTIVITYLIMITTREASURE shader   