LJO@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\NIANSHOUUI.lua�   )1+  =  )�= )�= )�= +  = + = )  = )  = )  = )  =	 )  =
 +  = +  = +  = +  = 5 = 5 = )  = )  = +  = K  firstRewardthrowNum
qishu     curBianPaoNum  ������bianpaoIdstickIddmgRewardDatanianshouRewardalreadyGotRewardtotalDmgremainTimecurNianShouIdsummonIdtouchBeganTimeIdchixuTouchnianshouSp
tmpHp
maxHp
curHp	view		self  * �   &6     9  -  9 9B6 ' B99B K  �	nameNIANSHOUUIdata.Config_UIrequiregetParent	viewremoveUIUIManagerlogic       + K    �V�-   9 B= 9' B6  9 B3 9 9'	 B=6  99	5

 3	 =
B6  9 9	' B	5
 =
B6  99	6
 9

6 99 6 99 6 996 99B
5 6 9)  )  )  )� B=6 9)  )  )  )  B= B	 9B2  �L  �	initborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRect  fanhui_btncallBack   widgetTouchExtent
basic scaleToFullScreenUIManagerbggetChildByName	viewnew����

NIANSHOUUI self  Wview  Wparam  Wlogic Rbg Mcb Grect B �  -G[
-   -  9  =  -   9   )    X �6  9  -  9B -   +  = -     9  -  9B 6    9  -  9 B -  9'	 B 9
6 96 9  B AK     nssysjConfig_LanguageformatstringsetString	timegetChildByNameformatTimeSimpleStringUtilcurNianShouIdinitNianShoutickIdunscheduleGlobalschedulerremainTime														
self time_node timeStr  �  
 (A�	6     9  -  9' B ) -  9 ) M�6 : B6 -  98B X�-  9-  986 :	 B <X�O�-   9BK    updateBianPaocurBianPaoNumtonumberbianpaoIds_firstReward
splitStringUtil	self arr !  i  �6��>`-  : = -  : =-  : =-  6 : B=-  : =-  6  9: '	 B=-  :	 =
:
   X$�:
  X!�6  9:
 '	 B  X� X�)  ) M�6  98	'
 B6 9	 96
 :B
6 :B+ BO�3 -  9   X �-  9' B 96 -  9 89B-  9' B 96  96 6	 -
  9
 
8	
	9		8	B A-  9  X �-  9' B 96 -  989B-  9' B 96  96 6	 -
  9

8	
	9		8	B A-  9)   X=�-  9  X9�-  9+ B-  9+ B-  9+ B-  9+ B-  6 9 ) B=6  9 -  9B-  9'! B 96" 9#6$ 9%	 B A-  9 	  XN�-  9+ BXH�-  9	  X�-  9   X�-  9+ B-  9+ B-  9+ B-  9+ BX+�-  9  X�-  9  X�-   9&-  9BX�-  9	  X�-  9 	  X�-  9+ B-  9+ B-  9+ B-  9+ B-   9'B-   9(B-   9)B-  : =*3+ -  9*  X�-  9* X�6,  9-6. 9/ 90B 91B62 939+  5	4 -
  9
*
=
*	=5	BK   �����callBack  NIANSHOUGETBIANPAOConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManager firstRewardinitSummoninitRewardinitBianPaoinitNianShounssysjConfig_Languageformatstring	timeformatTimeSimplescheduleGlobalschedulertickIdsetVisiblenianshou_name
levelConst_colorDataconvertHexToRGBDisplayObjectUtilsetColor	nameConfig_NianshousetStringspecial_namegetChildByName updateItemNumlocalPlayerGameGlobal_
qishu,
splitStringUtilalreadyGotRewardtotalDmgtonumber
curHpremainTimecurNianShouIdsummonId����'))))*************+++++++++++++++++++..../////////////0000000000000000000333333333444445555566666777778888888999999::::::::::::::;;;;<<<<<=>>>>>>>>?????@@@@@AAAAABBBBBBCCCCCCCCDDDDDDDEEEEEEEEFFFFFGGGGGHHHHHIIIIILLLLMMMMNNNNPPP[]]]]]]]]^^^^^^^^^^^^^^^^^^^^^`self time_node special_node nianshou_node finish_node param  �bianpaoNums )  i bianpao tick �timeStr rgetBianpaoCB p �
  -s4l9   9' B9   9' B9   9' B9   9' B 9+ B 9+ B 9+ B 9+ B3 6 9	 9
	 B2  �K  send_getNianMonsterInfoActivityProxyGameGlobal setVisiblenianshou_nodefinish_nodespecial_nodetime_nodegetChildByName	viewjkkkkkkllself  .time_node (special_node #finish_node nianshou_node cb  �	 )��� 6  89= 9  9' B 9+ B
  X� X� 9+ B 9' B 9	9B 9
6 
 96 98B A 9' B 9	6	 	 9		6 9 B A	'
 6  96 9 B A&		B 9'	 B	 99
 9 #


 
B	 9'
 B9   X	�9 
 9B+  = -  
 99+ + B= 9 
 9+  + B9 
 96 9 9 B 9!BB A9 
 9"* B9 
 9#6 9* * B A6$ 9%9	&"	9	 	 9	'	 B	 9	(9 B	K  �addChildsetHuecolourpi	mathsetAnchorPointsetScalegetPositionYgetPositionXpccsetPosition	init
modelcreateremoveFromParentnianshouSp
imagesetPercenthp_bar/
curHptostringsetUnitsForMyriadStringUtilhp_num
levelConst_colorDataconvertHexToRGBDisplayObjectUtilsetColorsetString	namesetVisiblenianshou_nodegetChildByName	viewinitHp
maxHpConfig_Nianshou����̙���������



 SkillAni self  �nianshouID  �curNianShouData �nianshou_node �name vhp_num dhp_bar Mimage Bhue 8
 � P��: 	  XL�6  9 9: +  + B6  9 9-  B) - 9 ) M�-  - 98 X�- 9<X�O�-  9B- : =- 9 9	'
 B 9-  9B A:	  X�6  96 9	 9B	 9B6 99+	  5
 =
B-  9BK   �  	init
items titleTextureartText_jishajiangli.pngtitleScale͙��̙��isShow	nameACQUIREITEMSSIMPLEConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagercheckCanClaimsetVisiblereward_tishigetChildByName	viewtotalDmgupdateBianPaocurBianPaoNumbianpaoIdsgetItemNumByIdacqResourcelocalPlayerGameGlobalid self arr  Qnum >  i 
tip  rewards  �	 &�"3  6 9 9    B2  �K   �send_expelNianMonsterActivityProxyGameGlobal  !!!!!!!!""self id  num  throwCB 
 U   	�-     9   B   9  -  B K  �removeChildgetParentimg  � 0���#-     9   )�+ + B   9 +  + B  9 6 9-  9B- 	 9B A A- 9 9  )c B-  9	B-  9
- B6  96 9- B' ) B-  9B- 9 9 )�B 9+ B 9)  B 9  B 9' B3 )  * 6 9	 9 6
 9


 9
 
6 9 9  5 =B6 9 9  B A
6 9 9 6 9 9 5 =B A6 9 9 6 9 9  5 =B6 9 9  B A6 9 9  B A
 9  B6! 6
" 9
#
B'	$ 6
! - B
&
6	 	 9	%	'& B		 9
'	* B
6
( ') B

 9
 
	  B
6  9*- 9'+ - &) 6,  9-6. 9/B  )  )d * )  	 )2 )�B2  �K     � ��equipLv_2Const_colorDataconvertHexToRGBDisplayObjectUtil+moveFontAniapp.uiLogic.ICONrequiresetScaleui/common/Icon.luagetNodeFromCache_1_SILVERConst_ItemTypetostringrunActionCallFuncFadeOut y yFadeInx yMoveBy
SpawnSequence damageNumsetNamesetOpacitysetCascadeOpacityEnabledgetPositionuiNum2abs	mathcreateImageStringUIManagerupdateNianShouremoveFromParentaddChild	viewgetPositionYgetPositionXpccsetPosition	initcreated���� �����̙�����										



    !!!!!!!!"""""""""""""""""""""""""##SkillAni target self dmg num explode �img -�posX �posY  �action_callback |xx {time zaction A9itemStr ,icon 'iconLogic  �"t�+3  6 9 9*  6 9)
  )��B A6 9 9 *	 B6 9 9	 B6 9	 9
  B2  �L    �SequenceCallFuncEaseInpcreateMoveBycc �̙������̙�����$&&&&&&&&&&&'''''''(((((()))))))**SkillAni self target  #dmg  #num  #createExplode !fall ease explode 	seq  � i��-  9 8 )   X�6  96 9B+ L 6 -  98 896 -  98 89-  9	)   X�+ L -  -  9	!=	6
 9 9B'   ' &	   X� 9 )	 BX�	  X� 9 )	 BX�	  X� 9 )	 B6 9)��)d B6 9)��)	F B	 96
 9

B
 A-  9	 9
 )c B	 9-
    B
 A+ L  ��runActionaddChild	viewpccsetPositionrandom	mathloadTexture	.pngnianshou_biancreateImageView	ccui
tmpHprestrainExp	databianpaoIdsConfig_ItembpslbzConfig_LanguageaddMessageFloatMessagecurBianPaoNum��		self bianPaoAction param  jdmg Unum ObianpaoSp >bianpaoTexture :xOffset yOffset  �  /S�-   + =  -  - B   X�-  9  X�6 9-  9B-  +  =K  -  -  9 =-  9- -  9- 8 <-   9B-  6 9- * B=K       �performWithDelayGlobalupdateBianPaocurBianPaoNumthrowNumunscheduleGlobalschedulertouchBeganTimeIdchixuTouch��̙����




self throwBianPao param throw re ) � 
+�3   -  6 9  *  B=2  �K      �performWithDelayGlobalschedulertouchBeganTimeId ��̙����self throwBianPao param throw 	 �	?�-  )  = -  -  9=-  98 )   X�2 �-  + =3 -  6 9 *  B=2  �K  K   ��performWithDelayGlobalschedulertouchBeganTimeId chixuTouchcurBianPaoNum
curHp
tmpHpthrowNum��̙����self throwBianPao param  chixu 	 �  
 A�)  ) ) M �-  9  9'  &B 9' B 9+	 BO �K   �setEnabledbianpao_btnbianpaogetChildByName	viewself   i bianpao bianpao_btn  �  
 A�)  ) ) M �-  9  9'  &B 9' B 9+	 BO �K   �setEnabledbianpao_btnbianpaogetChildByName	viewself   i bianpao bianpao_btn  � 	5��-  9   X�6 9-  9 B-  +  = -  9
 X�-   B X
�-  ) =-  9-  98  < -  9)   X�- B- -  98 -  9B-  6 9- * B=K   �����performWithDelayGlobalenableBianpaoIdbianpaoIdscurBianPaoNumthrowNumchixuTouchunscheduleGlobalschedulertouchBeganTimeId����			






self throwBianPao disableBianpao send_ThrowMsg enableBianpao param  6re  �2����3  3 3 3 3 3 3 ) )	 )
 M��9  9'	  &B 9'
 B 9'  ' &) B 9'  ' &) B 9'  ' &) B6  9 5 =4 >=5 =4 >=, *  5 =4 >=B
 9+ B9 )    X�9 	 X� 9+ B 9' B 96 9 889B 9' B 96  9 6! 6 9 889"8B A6# 9$ 9%9 8B9& < 9'' B 96( 9)6* 9+6,  9-6.  B A A A 9'/ B 96( 9)6* 906,  9-6 9 8891B A AOh2  �K  �	data	bpshdmgtostringsetUnitsForMyriadStringUtil	bpyyConfig_Languageformatstringown_numcurBianPaoNumgetItemNumByIdlocalPlayerGameGlobalqualityConst_colorDataconvertHexToRGBDisplayObjectUtilsetColorbianpaoIdsConfig_ItemsetString	namecurNianShouIdremainTimesetEnabled    
paramcallBack  widgetTouchExtentUIManagerloadTextureNormalloadTexturePressed	.pngnianshou_bianloadTextureDisabledbianpao_btnbianpaogetChildByName	view       ����̙������%Ss��������������������������������������������������������������������������������������������������������������������������������������������������������������ȵ��SkillAni self  �send_ThrowMsg �bianPaoAction �throwBianPao �began �enableBianpao �disableBianpao �ended �� � �i �bianpao �bianpao_btn �num b* �  4�   X�-  =  -  9 9' B 9-   9B AK   �checkCanClaimsetVisiblereward_tishigetChildByName	viewalreadyGotRewardself newAlreadyGotReward  tip  �    7�6     9  6 9 9B 9B6 99+  5
 -  9	=-  9=-  9=-  9=- =B K   ��callBackalreadyGotRewardnianshouRewarddmgRewarddmgRewardDatacurDmg  totalDmg	nameNIANSHOUREWARDLISTConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerself refreshRewardTip  �
  8��4  =  6 6 BH�96 9	 B X�6 99  	 BFR�4  = 6 6	 BH�96 9	 B X�6 99 	 BFR�3
 3 9  9' B B6  9 5 =B2  �K  callBack  widgetTouchExtentUIManagerreward_btngetChildByName	view  Config_NianshounianshouRewardinsert
table
qishutonumberactivityIdConfig_NianshouDmgReward
pairsdmgRewardData				





		self  9  k v    k v  refreshRewardTip rewardClick reward_btn  � �	: 	  X�-   9 B6 9 96 : B AK    tonumbersetGoldlocalPlayerGameGlobal	init	self arr   � 	 5�3   6 -  986  96 9 9B 9B6	 9
9+  5 = =BK   �summonNianshoucb  	nameNIANSHOUSUMMONConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagersummonIdConfig_Nianshou 
self cb summonNianshou  �	 	 @�3  9  9' B 9' B6  9 5 =B2  �K  callBack  widgetTouchExtentUIManagersummon_btnspecial_nodegetChildByName	view self  summon special_node summon_btn 	 �   !@�) ) ) M�9   9' 	 &	B 9'	 B 96	 9		6 96	  9
6 9 8B A A	 AO�K  curBianPaoNumtostringsetUnitsForMyriadStringUtil	bpyyConfig_LanguageformatstringsetStringown_numbianpaogetChildByName	viewself  "  i bianpao  �  7g�9  !=  9  )   X�)  =  9  9' B 9' B 96 	 96
 9  B
 A'	 6	 	 9		6 9
 B A	&	B 9' B 99  9	
 #	 B9  9* )	 BK  
blinknianshouSpsetPercenthp_bar
maxHp/tostringsetUnitsForMyriadStringUtilsetStringhp_numnianshou_nodegetChildByName	view
curHp���̙����							





self  8dmg  8nianshou_node )hp_num %hp_bar  �   3��4  ) 9   ) M�6 9 B9  89 X�6 9 9	  8		9		BO�)  ) M�8+ ) 9	 		 )
 M�6  B6 9 8B X�+ X�O� X�L O�+ L alreadyGotRewardidinsert
tableneedTotalDamagetotalDmgtonumberdmgRewardData	





self  4tmpCanClaimIds 2  i   i tmpId canClaim   j  �   $�9    X�6 99  B+  =  9   X�6 99 B+  = 9   X�6 99 B+  = K  enableBianpaoIdtouchBeganTimeIdunscheduleGlobalschedulertickId


self   �   U �6   ' B 6 ' B3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   dispose checkCanClaim updateNianShou updateBianPao initSummon initReward initBianPao initNianShou 	init create 	ctorapp.sprite.SkillAnirequireNIANSHOUUI
class        2  � 4 � � �� ������������NIANSHOUUI SkillAni   