LJV@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\instance\InsLogic7.lua�  D6  ' B 9B=9.  9. 9. L  ���startBattledisposerunLogicsceneContextnew'app.script.instance.InsNormalLogicrequire_runLogic _dispose _startBattle self  scene  tar      	K  self   ]  (-   9 B=L �sceneContextnewInsLogic7 self  scene  logic  P   A 9  +  )��BK  countPureDamagetarget  params   O   c-   9     9  + B K   setStoryModesceneContextself  � 	 !D]-     9   B 4  5 - 9=> 3 - 9 9+ B6  9- 96 '	 B9
9+  5 = =BK      callBack	list  TALKBOXdata.Config_UIrequire
addUIUIManagersetStoryModesceneContext  	talk;我已救出貂蝉姑娘，全军协力讨伐逆贼！	namesetToDie						diaochan first self arr2 com2  �  5Z6     9  ) ) B 3 -   99 9 ) ) )	  )
  + B
K      yxmoveToAndFade getPixelPointMapUtildiaochan first self pix com  �  -W-     9   ' ) B 3  - 9  X�- 6 9  ) B=K  ��  performWithDelayGlobalscheduler	tick 1_1_50dropItemShowdiaochan first self cb  � 5qM'-   9 B-  9:-  9 9+ B-  9 9)��B4 5 9=6 -  9-	  9		9		B=	5
 >=>3 6  9-	  9		6
 ' B
9

9

+  5 ==B2  �K   �callBack	list  TALKBOXdata.Config_UIrequire
addUIUIManager scriptParam   scriptcameraTohandler headId�	talk/多谢将军搭救，奴家感激不尽。	namegetGroupByUIdsetStoryModesceneContextplayersgetExtraReward$&&&&&&&&&&&&&&&''self obj  6target  6first .diaochan "arr diaochanGo2  � b ��k4 5 5  =5 =5 =>5 5 =5	 =5
 =>5 5 =5 =5 =>5 5 =5 =5 =>5 5 =5 =5 =>5 5 =5 =5 =>4 5 5 =5 =4 5 >=4 5  >=!>5# 5" =5$ =>5& 5% =5' =>5) 5( =5* =>5, 5+ =5- =>5/ 5. =50 =4 51 >=4 52 >=!>54 53 =55 =>57 56 =58 =>5: 59 =5; =>	5= 5< =5> =>
5@ 5? =5A =>5C 5B =5D =>5F 5E =5G =>5I 5H =5J =>  9K )    B9M  9N)��B=L 4 5O >5P >5Q >5R >5S >5T >5U >3V )  ) M�8	:		8
:

  9W 9M  9X) B4 4 >	>
>)
 +  )�� , )��BO�3Y   9W 9	M 	 9	X	) B	4
 5Z >
5[ >
5\ >
, )  , )��B9M  9N)	��B) =]9M  9N)	��B) =]9M  9N)	��B) =]9M  9N)	��B) =]9M  9N)	��B) =]6^  9_9	M 9	`	)
 ) )  B  9a B2  �K  showStoryterrainsetWalkableMapUtilguardingRadius  
  	   getGroupByPartyIdaddTrap               getGroupByUIdsceneContextlrinitPosition   dir
party  	   dir
party     dir
party     dir
party     dir
party  
   dir
party  
   dir
party     dir
party  	  	  	    
partydir  

   dir
party  
   dir
party  	   dir
party     dir
party  setTilesWhenDied  	setTilesWhenAlive  	    
partydir  
  ������������������������������������   
partydir  
  ������������������������������������   
partydir  
  ������������������������������������   
partydir  
  ������������������������������������   
partydir  
  ������������������������������������   
partydir  priorAttackTargets
  ������������������������������������friendlyPartys  	tile 
partydir    !!""##$$%%&&',----..//1111111111111111111-\^^^^^^^^^^^^^^^^^^^^aaaaaaabbbbbbbcccccccdddddddeeeeeeeiiiiiiiiijjjkkself  �posArr 2�ePosArr e~traps ccountDamage b  i x y diaochanGo E �   Dl�9   9)��B9   9)��B9 :4 5 9=9=6 9  9	  9		B=5	 >=
>5 9=6 9  9	  9		B=5 >=
>5 9=6 99=6 9  9	  9		B=5 >=
>9   9 6	   9 B	 AK  startBattleshowTalkBubble   localPlayerGameGlobal headId����	talkJ不好，有人被困于火中，我们得施法将其救出才是。uId    headId�	talkD啊！起火了。救命啊，布将军快来救救奴家……uId����scriptParam   scriptcameraTohandlerheadId	name 	talkq哈哈哈哈，董太师早已带着皇帝移都长安，你们便陪着这洛阳城一起葬身火海吧！uId����playersgetGroupByUIdsceneContext													















self  Eliru ?diaochan :first 8arr .
 Z  �-    B6  :  BK  �NewBieScriptEtc_startBattle self  	 �  Mi�9  9 X,�9  9+ B9  9)��' 4 6 '	 B9>B) 9	 9
  9 B!	  X�) 9	 9
  9 B!)  X�) 6 9 9 BK    9 B	 X�)  9  9)��' 4 6 '
 B9>B9  9+ B9  9 BK  battleResult!checkBattleEndEffectByNewBienewBieProxyGameGlobalcheckAllPlayersAliveLeftplayersTotalGroupbattleInfo	IDLEapp.const.Const_ActionrequiredoActioncallGroupByPartyFunctionsetStoryModesceneContextisAlivelr 
self  NstarNum starNum     �9    X�6 99  B+  =  -    BK  �unscheduleGlobalscheduler	tick_dispose self   �   H �,  6  ' 3 B3 =3 =3 =3
 =	3 =3 =3 =2  �L  dispose checkBattle startBattle showStory runLogic create 	ctor InsLogic7
class�����в����_runLogic _dispose  _startBattle  InsLogic7   