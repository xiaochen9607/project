LJV@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\instance\InsLogic2.lua�  56  ' B 9B=9.  9. L  ��disposerunLogicsceneContextnew'app.script.instance.InsNormalLogicrequire_runLogic _dispose self  scene  tar  6   + =  )  = K  	tick
bUsedself   ]  (-   9 B=L �sceneContextnewInsLogic2 self  scene  logic  � 	 S ��#4 5 5  =5 =>5 5 =5 =>5	 5 =5
 =>5 5 =5 =>5 5 =5 =>5 5 =5 =>5G 5 5 =5 =>5 5 =5 =4 5 >5 >5 >5 >5 >5  >5! >="4 5# >5$ >5% >5& >5' >5( >5) >=*>5, 5+ =5- =4 5. >5/ >50 >="4 51 >52 >53 >=*>55 54 =56 =4 57 >58 >59 >5: >5; >="4 5< >5= >5> >5? >5@ >=*>5B 5A =5C =>5E 5D =5F =>5I 5H =5J =>5L 5K =5M =>5O 5N =5P =>  9Q )    B  9R BK  showStoryinitPosition   dir
party  	
   dir
party     dir
party  	     dir
party     dir
party    
  	  	      
   	   	          
partydir  �	�                  
partydir  ��setTilesWhenDied      	      	  
setTilesWhenAlive        	         	   
   pos 
partydir  ��   dir
party     dir
party     dir
party     dir
party     dir
party     dir
party  friendlyPartys  	tile dir
party  !!!!!!"""#self  �posArr &�ePosArr 
 �  -I)  ) ) M �-   9  5 -	 
 8	
	=	5	 =	BO �-     9  B K   �  startBattlefriendlyPartys  	tile dir
partycreateSingleGroupself pos   i  � /<3  4 5 >5 >5 >9  9  B2  �K  �showTalkBubblesceneContext uId����	talk 看我撒豆成兵之术！ uId����	talkH竟敢宣扬封建迷信，全军冲锋，攻破城池活捉神汉! uId����	talk>黄巾子民，坚守城池，黄天定会保佑我们！ pos self  addEnemies arr      pK   !   o3   K   useSkill  � G�j6   9  :  6  9)�>6   96 99B3 -  9 9	) B)  ) M�8
 9
 )�R) , *  +  + B
O�-  9 96  9B-  9  9
-  9 )p) ,	
 *  +  + B
-  + =-  9 9- * 6 ,	
 ) BK     useSkillcameraTo
bUseduIdgroupUseSkilladdStategetGroupByPartyIdsceneContext maxMoraleskillTipsConfig_GameDatasetMoraleskillLvsskills
zhuge��$����	





self zhangjiao skillId DeffectCb 8ar 2  i pl 
 � 	 8i3   4 5 >6  9-  96 ' B99+  5	 =
= BK   ��callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContext
addUIUIManager 	talk,萤火之光，也敢与皓月争辉！	name诸葛亮 self zhangjiao zhugeAppear arr  I   �6     9  ) ) -  B K  �	fade
zhugefadeCom  �  BxW29   9) ' )
 B9   9) )�B9   9) )�B9   9) )�B9   9) )�B= 9   9) )�B= 9   9) )�B= 9 9)�>9 9)�>9 7 3 9   9	9 )	 3

 B2  �K   cameraTo skillLvszhouyu
zhugecaocaogetGroupByPartyIdAndDefIdguardingRadiusmodifyGroupByPartyAttribsceneContext							






./////1/22self  Czhangjiao 5zhangliang /zhangbao )fadeCom  	 �  	8H�-   9     9  )��' 4 6 ' B9>B )  -  99-   9B!	  X�)  -  99-   9B!)  X�)  6	 9
 9  B6  9-  9 6 ' B95 = BK   �	star  BATTLECONTROL_INS_ENDED!app.event.BattleControlEventsendEventEventManager!checkBattleEndEffectByNewBienewBieProxyGameGlobalcheckAllPlayersAliveLeftplayersTotalGroupbattleInfo	IDLEapp.const.Const_ActionrequiredoActioncallGroupByPartyFunctionsceneContext











self starNum * � -���?9  
  X�9  9  X�6 9  X	�9  9  X�6 99  X�2 ��9  = 9   X�9   9	+ B  9
 B9 	 X�9  96 99B9 	 X�9  96 99B  9 + B	 X/�9   X,�9   9	+ B9   9) )�B9   9)��B9   9) B:4 5 >5 >5 >3 6  99	  6
 ' B
9

9

+  5 = =!B9   9) B  9" B	 X�)  9   9#)��'$ 4 6	 '% B	9	&	>	B9   9	+ B6'  9(9  6 '	) B9*5+ =,B2  �K  K  	star  BATTLECONTROL_INS_ENDED!app.event.BattleControlEventsendEventEventManager	IDLEapp.const.Const_ActiondoActioncallGroupByPartyFunctioncheckAllPlayersAliveLeftcallBack	list  	nameTALKBOXdata.Config_UIrequire
addUIUIManager  	talkJ曹将军所言极是，主公我们还是尽快向洛阳进发吧！	name关平 	talk>将军既有匡扶汉室之心，何不共讨逆贼呢？	name曹操 	talkk听闻近日董卓在洛阳挟持幼帝，为非作歹，河北袁绍聚十八家诸侯共讨董卓。	name曹操getGroupByPartyIdgetGroupByUIdgetGroupByPartyIdAndDefIdcheckAllEnemysAliveLeftcaocaomaxMoraleskillTipsConfig_GameDatasetMoralezhouyuextraStorysetStoryMode
bUsed	tickguidingnewBieProxystoryModeAPP_ENTER_BACKGROUNDGameGlobalbattlePausesceneContext .0000000000000033333444447999999999999;;;;;===========??self  �zhaoyun L!liubei me arr complete myGroups $starNum  2   �-    BK  �_dispose self   �   *T �,  4 5  >5 >5 >5 >5 >5 >5 >5 >5 >	5	 >
6
 ' 3 B3 =3 =3 =3 =3 =3 =3 =2  �L  dispose checkBattle extraStory showStory runLogic create 	ctor InsLogic2
class      	        	      
;U<�Wʋ����_runLogic )_dispose  )pos InsLogic2   