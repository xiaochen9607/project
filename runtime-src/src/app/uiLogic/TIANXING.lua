LJM@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\TIANXING.lua7   +  =  +  = K  button	viewself       
6     9  6 9 9B 9B' B K  TIANXINGRANKgetRunningScenegetInstanceDirectorcc
addUIUIManager     6     9  6 9 9B 9B6 ' B99	+  5 6
 9=B K  str height¬
widthĀtianxingIntroConfig_GameData	nameSIGNINTROdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager ų  ģ°3)  ) ) M -  9  9'  &B  X-  9  9'  &B 9+ BO é)  ) ) M -  9'  &B 9' BO ō6  9  9 	 )    X A-     9 
 )  B 6  9  9  )    X 6    9  -  9  9' B5 6 -  -  9B=4 6 99>=B -     9  + B X -     9  B -   9     9  ' B   9  + B -   9     9  ' B   9  + B X y6  9  9  	   X 96    9  -  9  9' B5 6 -  -  9B=4 6 99	>=B +   ) ) ) M6  96 998'	 +
 B: X  XOš   X)  -   9
  B-   9BX ;6  9  9  )    X -     9  + B 6    9  -  9  9' B5 6 -  -  9B=4 6 99>=B X -   9     9  ' B   9  + B -   9     9  ' B   9  + B -     9  B K  ĄĄ  	init_starReward
splitStringUtil  curStarProcessText_138initNext
paramcallBack  showJifenhandlerImage_457widgetTouchExtentUIManagernextIdinitStarIconcurStarIDfactionGameGlobaleffect45removeChildByNamexsetVisible	icongetChildByName	view





  !#####$$$$$(((((()))))************************----------..........////3logic view   i   i rewardId p   i tmp 
 Į 
  -I6   96 9 9B 9B6 99+  5
 9		:		=	9		:		=	B6 9 9BK  send_getStarMissionfactionGameGlobal
heros
items  
param	nameACQUIREITEMSSIMPLEConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagertarget  arr   Z  Q   X-   9BK  ĄdisposeexitTransitionStartlogic event   § M§R-   9 B=3 6  9
 9' B5	 =	B3	 6  99		 9		'
 B	5
 =
B 9'	 B 9'	 6
 9

9

B3 3 6 
 9 6 96 ' B9 B6 
 9 6 96 ' B9 B6 9
 9B3  9	 B	2  L  ĄregisterScriptHandler send_getStarMissionacqStarMissionRewardgetStarMissionapp.event.FactionEventrequirefactionGameGlobaladdEventEventManager  localTypeTextureResType	ccui&heroBodyBig/heroBodyBig_10000.pngloadTexturebg  Button_57 callBack  paiminggetChildByNamewidgetTouchExtentUIManager 	viewnew
AEFFFFFFFFFFFFGGGGGGGGGGGGHHHHHOPPPPQQTIANXING self  Nview  Nparam  Nlogic Ipaiming GcbIntroduce <cb1 %cb3 $onNodeEvent  ę   -UZ6  986  96 89' B)  ) M	6 9
 '	 8) B O÷6
  96 9	 9B	 9B6 '
 B99+	  5
 =
BK  str height¬
widthĀ	nameSIGNINTROdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager
param	gsubstring,
scoreConfig_FactionStar
splitStringUtiltianXingInfoConfig_Languageself  .id  .str *jifen "
 
 
i  ä  
(Ig
6   9  9  6   9B !  6  9)    X4 >   X5 :B-   9 B)    X	- 9  X6 9	- 9BK  Ą ĄunscheduleGlobalschedulersetString   formatTimeStringUtilgetServerTimenextTimefactionGameGlobalŠ
timeTxt self restTime 
time3  õ !  Üb%9   9' B9   9' B 9' B9   9' B 9' B9   9' B 96 9B3	  XD9
   X6
 9 ) B=
  B9   9' B 96 6 99896 9&B6 96 9986  96 6	 9		9		8	9'	 +
 B)  ) M6
 9

 ' 8	B

 Oų9   9'	 B 96	 9		B9   9' B 9+ B9   9' B 9+ B9   9' B 9+ B9   9' B 9+ B9   9'  B 9+ B9   9' B 9+ B2  K  getprocessText_66_Copy_0missionsetVisibleText_66
hdwkq
param	gsubstring,
score
splitStringUtiltianXingInfojl	namenextIdfactionGameGlobalConfig_FactionStarscheduleGlobalscheduler 	hdjsConfig_LanguagejieshusetString
info1timeleftgetChildByName	view         !!!!!!!!!"""""""""#########$$$$$$$$$%%self  ”flag  ”timeTxt sche ~str $"tmp 	 	 	i    i”)  ) M9   9'	 
 &	
	B 9'	 B  X9   9'	 
 &	
	B 9'	 BOē ) ) M6 9' '	 
 '	 &B9  	 9'
  &

B	 9

 B	 9'
 B	 9*
 )- BOć)   X'6 ' B 9* + + B 9' B 9+  + B 9* * B9   9'  &B 9
 B 9* )- BK  setScale	initeffect45createapp.sprite.SkillAnirequiresetPositionsetNameaddChild	.pngpalace_xing#newGraySpritedisplayremoveChildByName	grayxgetChildByName	viewēĢ³³ęģ’				




self  jpos  j  i   i im effect45 !   8©6   9  9  6   9B !  6  9)    X4 >   X5 :B-   9 BK  ĄsetString   formatTimeStringUtilgetServerTimestarEndTimefactionGameGlobalŠtimeTxt restTime 
time3  µ   ē6     9  ' B 6  9    9  -  9B K   ĄcurRewardIdsend_acqStarMissionRewardfactionGameGlobalsound/open1.mp3playEffectSoundManagerself  é B²Łn9   9' B 9+ B9   9' B 9+ B9   9' B 9+ B9   9' B 9+ B9   9' B 9+ B 9+ B 9	'
 B9   9' B3 9   X6 9 ) B=  B6 ' B6 9986 96 9986  96	 6
 9

9

8	
	9		'
 + B)  )	 M6 9 ' 8
B Oų4  ) 6	 ' B			 )
 M6 ' B896 99 X6  9! 6 ' B8BOķ6 99"	  X9  
 9'# B
 9+ B9  
 9'# B
 9$6 9%BXš)’’=& +  )	 )
 ) M	6  96 99'8'( + B:	  X	 X)  =& X	: X=& X	O	č+	  9
& 	
 X
)
	 =
&  9
	'
 B
9
& 	
  X
6
 
 9

:9)' B
	
  9
+ B
 9
*+ B
)
 =
& X
`9
& 	
 X
6
 
 9

:9)' B
	
  9
+ B
9
  
 9

'+ B

 9

+ B
X
G6
 
 9

9& 89)' B
	
 6
 
 9

6 99'9& 8'( + B
:

	
 X
, 9
+ B
6
 ', B

 9
-
* + + B

 9.
'
 B
 9/
+  + B 90
 B
 91
)F * B32 63  94 55 =6B 9*+ BX
 9
+ B
9
& 
 X
N)
 	 ) M
J9   9'7  &B  X
6 '8 B 9- 8	+ BX+63  99': B  9;* B 9.'7  &B9   90 B 919   9'<  &B 9=B A6 '8 B 9- 8	+ B9   9'7  &B 9+ BO
¶9  
 9' B
 9$6 99>'? 9& 8
  X9& 89@  X:9@&B9  
 9' B
 9$9AB2  K  	descneedScore/starFactionScoregetPosition	nodesetScaleui/common/Icon.luagetNodeFromCacheapp.uiLogic.ICON	iconcallBack  widgetTouchExtentUIManager setPositionaddChild	initsetNamecreateapp.sprite.SkillAnijieshu_CopysetTouchEnabledacqItems_starRewardcurRewardId	hdwcsetStringjieshucurStarProcessinsert
tablestarId"data.Config_FactionStarReward
param	gsubstring,
scoreConfig_FactionStar
splitStringUtiltianXingInfoConfig_LanguagecurStarIDfactionGameGlobal data.Config_FactionStar.luarequirescheduleGlobalscheduler timelefteffect82removeChildByNamesetBrightgetprocessText_66_Copy_0missionsetVisibleText_66getChildByName	view ž’’’äņµęĢ³¦’				"""""#########$$$$$$$$$$$&&'(((())))))))))*****++,.../0(344455777788899999999::::;;;;<<<===>>>>>>>>????@@@@@@@@@@BBBBBBBBBCCCCCCCCCCCCCCDDDDEEEEEEEEEFFFFGGGGGHHHHIIIIIMNNNNNNNOOOOOQQQQTTTUUUUVVVVVVVWWXXXXXXXXXXZZZZZZ[[[[\\\\\\]]]]]^^^^^^^^^^^^^_________aaaaaaaaaaaUiiiiiiiiiiiiiiiiiiiiiiiijjjjjjjjjnnself  ³button *timeTxt ųsche ÷conf åstr ßtmp Ó	 	 	i conf1 	Ę  i get /ķ  i tmp 
reward Šeffect82 \cb K K Kj Inode B     	K  self      9    X6  99  B6  9  BK  removeEventsEventManagerunscheduleGlobalschedulerself   ģ   6 6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 2  L   dispose layout 	init initStarIcon initNext showJifen create 	ctorTIANXING
class     Y  a Z  b    TIANXING   