LJV@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\instance\InsLogic9.lua�  D6  ' B 9B=9.  9. 9. L  ���startBattledisposerunLogicsceneContextnew'app.script.instance.InsNormalLogicrequire_runLogic _dispose _startBattle self  scene  tar      	K  self   ]  (-   9 B=L �sceneContextnewInsLogic9 self  scene  logic  � 	 @ ��4 5 5  =5 =5 =>5 5 =5	 =5
 =>5 5 =5 =5 =>5 5 =5 =5 =>5 5 =5 =5 =>5 5 =5 =5 =>5: 5 5 =5 =4 5 >=4 5  >=!>5# 5" =5$ =>5& 5% =5' =>5) 5( =5* =>5, 5+ =5- =>5/ 5. =50 =>52 51 =53 =>55 54 =56 =>58 57 =59 =>	5< 5; =5= =>  9> )    B  9? BK  showStoryinitPosition   dir
party       dir
party     dir
party     dir
party     dir
party     dir
party     dir
party  	   dir
party     dir
party  	setTilesWhenDied  setTilesWhenAlive      
partydir  
  ������������������������   
partydir    ������������������������   
partydir    ������������������������   
partydir    ������������������������   
partydir    ������������������������   
partydir  priorAttackTargets  ������������������������friendlyPartys  	tile 
partydir  self  �posArr 2OePosArr E
 �	   _�49   9)��B9   9)��B4 5 9 :9=6 99=6 9  9  9	B=
5 9   9)	 B>=>5 9=6 9  9  9	B=
5 >=>5 9=6 9  9  9	B=
5 >=>5 9 :9=6 99=6 9  9  9	B=
5 9   9)	 B>=>9   9 6 
  9 B AK  startBattleshowTalkBubble    headId����	talkh那女子上次在洛阳城不是搭救过吗？……罢了罢了，还是再搭救她一次吧！    headId�	talk�布将军，你们别拦着我，我要见布将军。啊！你们想做什么？救命啊，布将军快来救救奴家！uId����    headId�	talk>吾儿奉先何在？速速替为父杀了这些逆贼。uId����scriptParam   scriptcameraTohandler	namelocalPlayerGameGlobal headId����	talkh董卓老贼，你祸乱朝政，罪不容赦！今日我定要将你剿灭，重振朝廷声威。uIdplayersgetGroupByUIdsceneContext

self  `dongzhuo Zdiaochan Ustory K
 Y  F-    B6  :  BK  �NewBieScriptEtc_startBattle self  	 O   L-   9     9  + B K   �setStoryModesceneContextself  �  2J6   9) ) B3 9  999) )	 )
 )  + B
2  �K  yxmoveToAndFade	lvbu getPixelPointMapUtilself  pix moveFinished  �  	0@r-   9     9  )��' 4 6 ' B9>B )  -  99-   9B!	  X�)  -  99-   9B!)  X�)  6	 :-  B-  9  9
  BK   �battleResultNewBieScriptEtccheckAllPlayersAliveLeftplayersTotalGroupbattleInfo	IDLEapp.const.Const_ActionrequiredoActioncallGroupByPartyFunctionsceneContext











self starNum " � 5��S<9   9)��B9   9)��B9   9)��B9   XX�9  XU�6 9 9)  B+ = 9   9+ B  9 B 9	'
 ) B  9 )
 5 5	 =	5	 =	5	 =	B= 9  9)  B4 5 9=6 9  9	  9		B=5 >=>5 9 9=6 9  9	  9		B=5 9 >=>6  99  6	  '! B	9	"	9		+
  5# =$6   9% B=&B9  X)�9   9+ B4 5' 9=>5( >5) 9=>5* >5, 6 9+9=>3- 6  99	  6
  '! B
9
"
9

+  5. =$=&B2  �K    9/ B	  X�)  9   90)��'	1 4
 6  '2 B93>
B9   9+ B9   94 B2  �K  battleResult	IDLEapp.const.Const_ActiondoActioncallGroupByPartyFunctioncheckAllPlayersAliveLeft    headId����	talkn……董卓既已剿灭，此地也不宜久留，我还是先走一步，免得被他们恶心坏了。localPlayer headId�	name吕布	talkn貂蝉，你便是我心中最美的云彩，无论谁欺负了你，我都会把他的狗头砍下来！ headId�	talkb布将军，你为了奴家竟然杀了董卓国贼，这片心意实在令奴家感动…… headId�	name吕布	talk貂蝉，你没事吧！ headId�	talk#我的肉山酒池…………callBacklvbuAppears	list  TALKBOXdata.Config_UIrequire
addUIUIManager    headId�	talk_董卓狗贼，竟敢这般对待我家貂蝉，今日我吕布便要取下你的狗头。
alignscriptParam   scriptcameraTohandler headId�	talk\承蒙将军多次搭救，这是奴家的一点心意，还望将军切莫推辞……
align	namesetOpacitypriorAttackTargets  ����������������friendlyPartys  	tile 
partydir  createSingleGroup	lvbu5_4002_1dropItemShowgetExtraRewardsetStoryModecanNotClickScreenForSecnewBieProxyGameGlobalisAliveniufuDeadgetGroupByUIdsceneContext 					











-..............//1111146666666666668888899999<<self  �niufu �diaochan �dongzhuo �lvbuStory IlastStory -victory starNum  2   �-    BK  �_dispose self   �   J �,  6  ' 3 B3 =3 =3 =3
 =	3 =3 =3 =3 =2  �L  dispose checkBattle lvbuAppears startBattle showStory runLogic create 	ctor InsLogic9
class3E4IFQJ�S����_runLogic _dispose  _startBattle  InsLogic9   