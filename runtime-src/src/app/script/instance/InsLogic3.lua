LJV@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\instance\InsLogic3.lua�  56  ' B 9B=9.  9. L  ��disposerunLogicsceneContextnew'app.script.instance.InsNormalLogicrequire_runLogic _dispose self  scene  tar  )   + =  K  gateDieself   ]  (-   9 B=L �sceneContextnewInsLogic3 self  scene  logic  �	 	 4 p�4 5 5  =5 =>5 5 =5 =>5	 5 =5
 =>5 5 =5 =>5 5 =5 =>5 5 =5 =>4 5 5 =5 =4 5 >=>5 5 =5 =4 5 >5 >5 >5  >5! >5" >5# >=4 5$ >5% >5& >5' >5( >5) >5* >=+>5- 5, =5. =>  9/ )    B90  91)��B 92) + B  93 BK  showStorysetCanNotBeSelectedgetGroupByUIdsceneContextinitPosition   dir
party  
setTilesWhenDied  	  

  
  	        	   

   
   	            pos 
partydir  ��setTilesWhenAlive  
    
partydir  
   dir
party     dir
party     dir
party     dir
party     dir
party  friendlyPartys  	tile dir
party  self  qposArr &KePosArr 7huaxiong 	 �   ?a19   9)��B)  =9   9) )�B4 5 9=6 9  9  9B=5	 >=
>5 9=6 9  9  9B=5 >=
>5 9=6 9  9  9B=5 >=
>9   9 6 
  9 B AK  startBattleshowTalkBubble    	talkP此战不易，我等需齐心协力，迅速攻下箭塔再伺机攻城。    	talkh华雄这家伙果然厉害，竟然坚清壁野，还在城外设置箭塔，妄图固守此地。scriptParam   scriptcameraTohandler 	talkP吾乃董太师帐下万人敌华雄，十八路诸侯孰堪与我一战？uIdgetGroupByPartyIdAndDefIdguardingRadiusgetGroupByUIdsceneContext													











self  @huaxiong :caozhi 2arr (
 �    O-   9     9  + B -   9     9  )��B ) = K    guardingRadiusgetGroupByUIdsetStoryModesceneContextself huaxiong  �  -N
3   6  9)	 ) B-  999) ) )	 )
   + B
K    �yxmoveToAndFadegetPixelPointMapUtil 												
self guanyu com pix  � I{G9 6 ' B99  X@�6  9-  6 6 '	 B9B-   9	) 5 5
 =5 =B3  9)  B9)�> 9)�B4 5 9 = 6 -  9-	  9		9		B=5 >=>6  9-  96	 ' B	9		9	 	+
  5 ==B2 �K   �callBack	list  TALKBOX
addUIscriptParam   scriptcameraTosceneContexthandler headId�	talk;华雄休得猖狂，某关云长特来取尔首级！setMoraleskillLvssetOpacity friendlyPartys  	tile dir
party  createSingleGroupREMOVEapp.event.UIManagerEventUIManagerremoveEventEventManagerBATTLEINCIDENTANIdata.Config_UIrequire	nameself object  Jparam  Jguanyu +startMove *arr  �  	,<m
-   9     9  )��' 4 6 ' B9>B )  -  99-   9B!	  X�)  -  99-   9B!)  X�)  6	 9
 9  BK   �!checkBattleEndEffectByNewBienewBieProxyGameGlobalcheckAllPlayersAliveLeftplayersTotalGroupbattleInfo	IDLEapp.const.Const_ActionrequiredoActioncallGroupByPartyFunctionsceneContext						
self starNum  �	 '��?O9    X>�9  9)��B9 X6�+ =  9  9)��B 9) + B9  9+ B3 6  9  6	 6
 '
 B9	 B6	  96 9 9B 9B96
 '	 B99+  4	 6

 ' B
9

>
	B  9 5 B  X�9  9+ B3 4 5 >6	  99 6
 '	 B99+  5	 =	=	B2  �K  9  9 ) B  9! B	  X�)  9  9")��'# 4 6	
 '$ B	9	%	>	B9  9+ B9  9& B2  �K  battleResult	IDLEapp.const.Const_ActiondoActioncallGroupByPartyFunctioncheckAllPlayersAliveLeftgetGroupByPartyIdcallBack	list  TALKBOX headId�	name关平	talk俺爹真帅……   ������������checkGroupsAreDeadpocheng app.const.Const_IncidentAni	nameBATTLEINCIDENTANIdata.Config_UIuiLayergetRunningScenegetInstanceDirectorcc
addUIREMOVEapp.event.UIManagerEventrequireUIManageraddEventEventManager setStoryModesetCanNotBeSelectedisAlivegetGroupByUIdsceneContextgateDie $&&&&&&&&&&&'''''''''''''''''''''''''******,,,,,8::;==============AACCCCCDDDDDGIIIIIIIIIIIIKKKKKLLLLLOOself  �huaxiong /uiRemoved $talkCom 0arr myGroups starNum  2   �-    BK  �_dispose self   �   7 �,  6  ' 3 B3 =3 =3 =3
 =	3 =3 =2  �L  dispose checkBattle showStory runLogic create 	ctor InsLogic3
class	0>1�?����_runLogic _dispose  InsLogic3   