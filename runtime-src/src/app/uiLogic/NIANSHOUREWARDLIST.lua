LJW@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\NIANSHOUREWARDLIST.lua�   +  =  )  = ) = )  = +  = +  = +  = 4  = +  = + =	 +  =
 K  callBackcanClaimalreadyGotRewardclaimBtnstableViewnianshouRewarddmgRewardcurDmgcurTabitemId	view		

self   �  
 -   9      X�-   9   -  9B 6    9  -  9 9B6 ' B99	B K  �	nameNIANSHOUREWARDLISTdata.Config_UIrequiregetParent	viewremoveUIUIManageralreadyGotRewardcallBacklogic        K    �Y�-   9 B=9=3  9' B=6  995	
 3
	 =
	B6  9
 9' B5	 =	B6  996	 9		6 99 6 99 6 996 99B	5
 6 9)  )  )  )� B=
6 9)  )  )  )  B=
 B9=9=9=9= 9B 9B2  �L  �makelist	initalreadyGotRewardnianshouRewarddmgRewardcurDmgborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRect  
close   widgetTouchExtentUIManagerImage_16getChildByName
basic callBack	viewnew����
NIANSHOUREWARDLIST self  Zview  Zparam  Zlogic Ucb Qrect A � :c2	   X�-  ) = -  + =-   9- + B-   9- + B-  9+ B-   9BX�-  ) = -  + =-   9- + B-   9- + B-  9+ B-   9BK   ����makelistsetVisibledisableOrEnableBiaoqiancanClaimcurTab			


self Button_1 Button_2 Button_3 param  ; � 	(BI: 	  X$�-  6  9: ' B= - ) B6  96 9 9B 9	B6
 ' B99+  5 : =B-   9BK     makelist
items isShow	nameACQUIREITEMSSIMPLEdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager,
splitStringUtilalreadyGotRewardself tabClicked result  ) � 	 +D-   9     X �6    9  6 9B 2 	�3  6 9 9)��  BK  K   ��!send_receiveNianDamageRewardActivityProxyGameGlobal nswklqConfig_LanguageaddMessageFloatMessagecanClaimself tabClicked cb  �  P�.09   9' B9   9' B9   9' B3 3 6  9	 5
	 =

5 =
B6  9	 5
 =

5 =
B6  9	 5
 =

B  9 	 +
 B  9 	 +
 B 9+	 B 9+	 B9   9'	 B 96	 9		6 96  99 B A	 A2  �K  curDmgsetUnitsForMyriadStringUtildqnsshConfig_LanguageformatstringsetStringText_11setSwallowTouchesdisableOrEnableBiaoqian      
param  callBack  widgetTouchExtentUIManager  Button_3Button_2Button_1getChildByName	view$&&&&&&&&&'''''''''(((((((*****+++++,,,,----//////////////////00self  QButton_1 KButton_2 FButton_3 AtabClicked @oneKeyClaim ? _   	` 9  B 9 BK  setBrightsetEnabledself  
btn  
sw  
 �  
 ?ce6  9 B6  9B X
� 9+ B 9+ BK  X� 9+ B 9+ B9   X!�9  )   X�) 9  ) M�6  9	B6  9
 8

B X�	 9+
 B	 9+
 B	 96
 9
	
BO�K  shrwdylqConfig_LanguagesetTitleTextidalreadyGotRewardsetBrightsetEnabledneedTotalDamagecurDmgtonumber								





self  @btn  @reward  @'  i  >  �-  9  L  �dmgRewardself table_view   V  �-   9    D  �tableCellAtIndex1self table_view  idx   .    �)� )fJ table_view  idx   C  �-  9  L  �nianshouRewardself table_view   V  �-   9    D  �tableCellAtIndex2self table_view  idx   � =�6   9-  9 89' B6 9 B  )fJ  �	ceil	math,killAwardsnianshouReward
splitStringUtil
��self table_view  idx  arr height  � %�y59    X�9   9B+  =  9  9' B 9B 9B6 9 9	6 9
9
9B A=  9   96 9B9   96 9B9   96 9 9
B
 9B A A9   9B9  99  B9 	  X �9   93 6	 9		B9   93 6	 9		B9   93 6	 9		B9   9B  9  
  9! B AX�9   93" 6	 9		B9   93# 6	 9		B9   93$ 6	 9		B9   9B2  �K     checkCanClaimshowOrHideCanClaimTishireloadDataTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW registerScriptHandlercurTabaddChildsetDelegategetPositionYgetPositionXpsetPositionTABLEVIEW_FILL_TOPDOWNsetVerticalFillOrder"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
width	sizecreateTableViewccgetContentSizegetPositionscrollareagetChildByName	viewremoveFromParenttableView










    !!!!!!!$$$&&&$)))+++)---111-333355self  �bg qposX nposY  nsize k � 	;T�: 	  X2�-   9 + B-   9+ B-   96 9B- 6  9: ' B=6	  9
6 9 9B 9B6 ' B99+  5 : =B-  9BX�-   9 + BK  �  makelist
items isShow	nameACQUIREITEMSSIMPLEdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager,
splitStringUtilalreadyGotRewardshrwdylqConfig_LanguagesetTitleTextsetBrightsetEnabled					claim_btn self result  < �	 'I�-  9 8 6 -  9B6  B X	� 9+ B 9+ BX�6  96 9B2 
�3	 6
 9 9   B2  �K  K   �!send_receiveNianDamageRewardActivityProxyGameGlobal dmgnotreachConfig_LanguageaddMessageFloatMessagesetBrightsetEnabledcurDmgtonumberclaimBtnsself id  'dmg  'claim_btn #cb 	 � ,���; 9 B  X� 9BX�6 9 9B 3 6  9' B7	 6	  9
' B 9+ B6  96	 
 9
' B5	 =	4
 9  89>
9  89>
=
	B9 9  896	 	 9
'
 B<  9 6	 
 9
' B9	 
 8	
	B6 9 B6 9 	 8	9B X�9  X�+ = 9   X�9  )   X�) 9  ) M�9	 
 8	
	9		9
 8

	
 X	�+	 =	 X�O�6	  96 9)
3)B B A 96	 B6	  9
' B 96 9 6
! 9
"
6#  9$9  89B A A6#  9%9 	 8	9&'	' B)  ) M�6
	 
 9


'( 	 &B
6) '* B 9+
 8	+ BO�2  �L createapp.uiLogic.ICONrequire
icon_,itemReward
splitsetUnitsForMyriadStringUtiltodaynsdmgConfig_LanguageformatstringsetStringText_1addChildpsetPositionalreadyGotRewardcanClaimcurDmgtonumberupdateClaimBtnclaimBtns
paramneedTotalDamageiddmgRewardcallBack  widgetTouchExtentsetSwallowTouchesclaim_btngetChildByName	node&ui/activity/NianShouDmgReward.luagetNodeFromCacheUIManager newTableViewCellccremoveAllChildrendequeueCell      !!!!!!!!!"""""""""""""""""""""""###########$$$$$$$$$$$&&&&&&&&&&&&&&''(((((((()))))********++,)2222222223333444444444444444444444555555555666677777778888888886::self  �table_view  �idx  �_cell �claimBtnClicked �X  i rewardData 7  i icon 	iconLogic 	  �  (���  9 B  X� 9BX�6 9 9B 6  9' B7  9	6 B6
  99  89' B )  X �6 9 B 6  9'	 B 96	 	 9		' B		 9		B	9		
 B6  96	 9		)36 9 B B	 A6  9'	 B	 99
  8

9

B	 96
 
 9

6 9  898B
 A)  )	 M7�6
  98
'  B6! '" B 9#+  :+ B6  9'$ B 9%B6  9'$ B 9&B 9 
 6 9
B !B 9'* B6  9	 BO�L setScalegetPositionYgetPositionXNode_17createapp.uiLogic.ICONrequire|
levelConst_colorDataconvertHexToRGBDisplayObjectUtilsetColor	namesetStringnianshou_namepsetPosition
widthgetContentSizesetContentSizeImage_23getChildByName	ceil	math,killAwardsnianshouReward
splitStringUtiladdChild	node(ui/activity/NianShouQuZhuReward.luagetNodeFromCacheUIManagernewTableViewCellccremoveAllChildrendequeueCell
��(�����̙��








self  �table_view  �idx  �_cell �arr �height wname 'P8 8 8i 6rwdStr 0iconLogic 	'icon  'startPosX startPosY  �   3��4  ) 9   ) M�6 9 B9  89 X�6 9 9	  8		9		BO�)  ) M�8+ ) 9	 		 )
 M�6  B6 9 8B X�+ X�O� X�L O�+ L alreadyGotRewardidinsert
tableneedTotalDamagecurDmgtonumberdmgReward	





self  4tmpCanClaimIds 2  i   i tmpId canClaim   j  �   >�9   9' B 9' B 9 B9   9' B 9' B 9 BK  tishi1Button_1setVisibletishi1_CopyButton_3getChildByName	viewself  sw  Button_3 Button_1 	     	�K  self   �   L �6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   dispose showOrHideCanClaimTishi checkCanClaim tableCellAtIndex2 tableCellAtIndex1 makelist updateClaimBtn disableOrEnableBiaoqian 	init create 	ctorNIANSHOUREWARDLIST
class     ,  ^ . c ` w e � y � � � $+&/-11NIANSHOUREWARDLIST   