LJX@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\HEROSELECTZHUANJING.lua&   +  =  K  	viewself   �  0H6  99-  9989=6  96	 9
6 96 6
 6 6 989B8

9

B A A-  6  99-  998=-  9 9B-   9BK  �initUIupdate	nameteamIdConfig_SoldierMasteryLvtonumberConfig_SoldierMasterytostringSoldierChoiseSuccessConfig_LanguageformatstringaddMessageFloatMessagechoiseIdbingZhongIduId	hero
heroslocalPlayerGameGloballogic target  1param  1 �  Ca9 6 99-  998:=6 99-  998) =6 99-  9986 9	B=6 9 9
:B-  6 99-  998=6  96 9B6 99-  998 9+ B-   9BK  �initUIupdateHeroZhuanJingswitchSuccessConfig_LanguageaddMessageFloatMessagesetGoldgetServerTimechangeZhuanJingTimefreeZhuanJingbingZhongIduId	hero
heroslocalPlayerGameGlobalarr



logic target  Dparam  Darr B �!k�%-   9 B=9=9=6  9	 9'
 B5
 6	  9	B	=	B6  9 6 96
 9

9


 
6 99 6 996 99B5	 6
 9

)  )  )  )� B
=
	6
 9

)  )  )  )  B
=
	6
  9	B
 A6  9
 9' B4	  B3 6  9	 6
 9

6 ' B9 B6  9	 6
 9

6 ' B93 B 9 B2  �L  �initUI soldierSwitchsoldierChoiseapp.event.HeroProxyEventrequireheroProxyGameGlobaladdEventEventManager Image_1borderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRect  closeIthandler
closegetChildByNamewidgetTouchExtentUIManagercallBack	hero	viewnew����
																				















"###$$HEROSELECTZHUANJING self  lview  lparam  llogic grect @'acqCb 
 �  
  BD6     9  6 9 9B 9B6 99+  5
 -  '	 -	 &	8=- 99=- - 8=B K   ��  �lvheroIdid	heroskillId  
skill	nameZHUANJINGTIPSConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerbingZhongObj num self skillLvTab  � {�.-  9  9'  &B )  X� +  6 6 BH	
�9
6 9 B X�9
	 X�9
F	R	�4 6 89	>6 89	>-  9 	 9'

  &

B	 96
 6 '  &8 B8

9

B' 6 6	 '  &8 B	8	9'	 &	6 9
 9 6 99B-	  9	 		 9		'  &B		 9
	' B

 9

B
	 9
	' B

 9

 B
 9
)# )# B
6
 
 9

 9' B5 3 =B
2  �K   �callBack   Image_3003_CopywidgetTouchExtentUIManagersetPositionaddChildremoveAllChildrenchild_CopyplistTypeTextureResTypecreateImageView	ccui	.pngicons_skill	name
skillConfig_HeroSkillsetStringText_jinengskillLvlvidtonumberteamIdConfig_SoldierMasteryLv
pairsskill_boxgetChildByName	view&b									
self bingZhongObj  |i  |j  |skillBox 	snum rlv1Id m  k 
v  
skillLvTab Rpath  2im 	)node ! c    }6     9  6 9B K  canNotSwitchConfig_LanguageaddMessageFloatMessage �   �6   9    9  6 -  99B A K   �uId	herotonumbersend_soldierSwitchheroProxyGameGlobalself  �  	#Jg�) �6  -  99B  X�6 6  -  99B89 -  996 8 9 X
�6  9	6
 96 9B AK  6 99-  X�6  9	6 9BK  6  96 9 9B 9B6 ' B99+  5 6 9=- = 6! ="BK   ��callBackclickBtnCb	costresType  	GOLDConst_CostType	nameCOSTCONFIRMUIdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagerTreabox6	goldlocalPlayerGameGlobalZhuanJingOpenConfig_LanguageformatstringaddMessageFloatMessageneedHeroQualityConfig_SoldierMastery	rankteamIdConfig_SoldierMasteryLvbingZhongId	herotonumber 						





self cosume bingZhongType I �  	2Y�) �6  -  99B  X�6 6  -  99B89 -  996 8 9 X
�6  9	6
 96 9B AK  6 9 96  -  99B6  - - 8B AK   ���uIdsend_soldierChoiseheroProxyGameGlobalZhuanJingOpenConfig_LanguageformatstringaddMessageFloatMessageneedHeroQualityConfig_SoldierMastery	rankteamIdConfig_SoldierMasteryLvbingZhongId	herotonumber 














self bingZhongIdTab i bingZhongType 1 � >��,{6   96 9 989' B3 ) 6 9	 B) MV�86
 6	  B	8	9	 	 9		'  &B		 9		' 9' &6 99B	9	 	 9		'  &B		 9		' 9' &6 99B	9	 	 9		'  &B		 9		9B	9	 	 9		'  &B		 9		9B		  X	�)	 )
 ) M	�    BO	�X	
�)	 )
 ) M	�    BO	�O�6 9 9B	 X�9  9' B 9+ B9  9' B 9+ B9  9'  B 9+ BX��)� 9  9' B 9+ B9  9' B6   9!6" 9#B A6   9!9	 9	$	B  X�  X�9 )  =%9 9%	 X�	 9'
& B	 9)
  B	 9'
' B	 9)
  B)  X�	 9'
& B	 9)
� B	 9'
' B	 9)
� B)� 6( 9 989)6 9*
 6+  B A X	�2  �K  	 9
',  &B

 9
-
+ B
 9
',  &B

 9
.
6/ 90B
 9
',  &B

 9
1
+ B
 9
', 	 &B

 9
-
+ B
 9
', 	 &B

 9
.
6/ 92B
6
3 
 9
4
 9',  &B56 35 =7B
3
8 7
9 6
3 
 9
4
 9', 	 &B5; 3: =7B
9
 
 9

' B

 9

+ B
9
 
 9

'  B

 9

+ B
2 �) ) ) M�63 	 949
 
 9

', &B
5= 3< =7B2 �O�2  �K        clickBtnCb callBack   widgetTouchExtentUIManager	opensetTouchEnabledhadOpenConfig_LanguagesetTitleTextsetBrightButton_tostringindexofteamIdConfig_SoldierMasteryLvText_902_2Text_902_1freeZhuanJingchangeZhuanJingTimegetLoginTimeGameGlobaljustTimeIsBeforeTodayButton_4Button_3setVisibleNode_4bingZhongId	nameText_bingzhong	descsetStringText_miaoshuImage_bingzhong_CopyplistTypeTextureResType	ccui	.png	iconheroui_bingzhongloadTextureImage_bingzhonggetChildByName	viewtonumberConfig_SoldierMastery	maxn
table _soldierMasteryIdid	heroConfig_Hero
splitStringUtil                  !!!!!!!!!!!!!!!!!"""""""""""###########$$%%%%&&&&&%'))))*****)//////00000000011111111122222222224555555555666668888888999999::::;;;====>>>>>>>>????????@@BBBBBBBBCCCCCCCCDGGGGGHHHHHHHIIIIJKKKKKKKKKKLLLLLLLLLLLMMMMMMMMMMNNNNNNNNNNOOOOOOOOOOOQQQQQQQQQQSSQWUYYYYYYYYYYggYhhhhhhhhhiiiiiiiiiillllmmmmmmmmmmmxxmxl{{self  �bingZhongIdTab �initSkill �W W Wi UbingZhongId TbingZhongObj O=  j 
  j cosume *�node �loginTimeBeforeToday �changeTimeBeforeToday �bingZhongType 3nindex ganotherIndex bf  i  K   �6   9  BK  removeEventsEventManagerself   �   �9  
  X�9  B6  9+  6 ' B99BK  	nameHEROSELECTZHUANJINGdata.Config_UIrequireremoveUIUIManagercallBackself   �   & �6   ' B 3 = 3 = 3 = 3	 = 3 =
 2  �L   closeIt dispose initUI create 	ctorHEROSELECTZHUANJING
class+�,������HEROSELECTZHUANJING   