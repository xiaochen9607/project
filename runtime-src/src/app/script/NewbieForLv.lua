LJO@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\NewbieForLv.lua�   
 6     9  +  6 ' B99B 6  9    9  + B 6  9    9 	 B K  onlyCheckLvsetGuidingnewBieProxyGameGlobal	nameQUBLICHOUSEUIdata.Config_UIrequireremoveUIUIManager �  :\3   6  9+  6 ' B99B9 9'	 B 9'
 B 9B 96 9
 9B A  A 9B6  9+  5	 9
>
	9
>
	>	6
 9

*  *  B
>
	5
 = 
5 =
>
	BK         返回
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentButton_ChangeProjectNode_1getChildByName	view	nameQUBLICHOUSEUIdata.Config_UIrequiregetUILogicByNameUIManager ����									











com 9logic 
/btn 	&pos size  y   #6     9  +  6 99B -   B K    	nameACQUIREITEMSConfig_UIremoveUIUIManagerstep7  � 7l6     9  +  6 99B   9 ' B 9' B 9B 9	6
 9	 9B A  A99 9B3 6  	 9+
  5 >>>6
 9*  *  B>5 =5 =>BK  �       点击确定
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParentButton_Confirm	NodegetChildByName	nameACQUIREITEMSConfig_UIgetUIByNameUIManager����step7 acqUI 	/btn 'pos x y size complete  �  	 (*	4  5  > 5 > 5 > 5 > 6  96 996	 '
 B99+  5 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�	name曹植	talkn不妨事，我们在战斗中缴获了不少兵书，曹仁将军使用之后便可快速获得经验。 headId�	name韩遂	talkP话虽如此，但在下初来乍到，经验不足，恐怕会拖后腿。 headId�	name曹植	talk8有了韩将军相助，我军必能击退吕布。 headId�N	name香香	talkG哇哦，竟然是西凉羌王韩遂，恭喜主公再获良将！	step6 arr 
 � 	 ,59 6 ' B99  X
�6  96 B6 9-  ) BK    performWithDelayGlobalschedulerNewbieForLvremoveEventsEventManagerACQUIREITEMSdata.Config_UIrequire	namestep5 objectg  param   � 	
 =6   96 6 6 ' B9-  B6 9 9	  BK   �MODULE_HERO_goldOneRecruitheroProxyGameGlobalADDapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManagershown arr   � 	-43   3 6 9 9)'B6 9 9 *  ) ) B2  �K  �"send_modifyLvNewbieAndCallFuncanNotClickScreenForSecnewBieProxyGameGlobal  ͙����рstep5 shown complete  �  9[G6     9  +  6 ' B99B   9  ' B   9  ' B   9	 B 9
6 9  9 B A  A99  9 B6   9+  5	 >	>	>	6
 9

*  *  B
>
	5
 -  =
5 =
>
	BK  �       
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentbutton_goldOneRecruitlashenyougetChildByName	nameQUBLICHOUSEUIdata.Config_UIrequiregetUIByNameUIManager����step4 btn 'pos x y size  �  
$P6     9  +  6 ' B99B   9 B6 9 9	*  -  BK    canNotClickScreenForSecnewBieProxyGameGlobaljingying	nameQUBLICHOUSEUIdata.Config_UIrequiregetUILogicByNameUIManager����step3 logic  � 5bO3   6  9+  6 ' B99B 9' B 9	B 9
6 9	 9B A  A99 9B6  9+	  5
 >
>
>
6 9*  )  B>
5 = 5 =>
BK  �       
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentjingyinggetChildByName	nameQUBLICHOUSEUIdata.Config_UIrequiregetUIByNameUIManager ����	
step3 touchFun 4btn &pos x y size  � 	
 d6   96 9996 ' B99	, -  BK   	nameQUBLICHOUSEUIdata.Config_UIrequireuiLayersceneContextnewBieProxyGameGlobal
addUIUIManagerstep2 param   �:~]6   9+  6 ' B' - &89B.  -   9' B 9B 9	6
 9	 9B A  A99 9B3 6  	 9+
  5 >>>6
 9*  *  B>5 =5 =>BK  � ��       
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParentbutton_jiuguangetChildByName	nameHOMESTYLEdata.Config_UIrequiregetUIByNameUIManager����	view homeStyle step2 scene  ;btn 'pos x y size touchFun  L   k6     9  -  + B K  �returnHomeGameGlobalstep1  �  	 $s4  5  > 5 > 6  96 996 ' B9	9
+  5 = -  =BK  	�callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkt小白脸言之有理，千军易得，良将难求，主公不妨回城看看能否再招募到一些猛将！ headId�	name曹植	talkA听闻那董卓手下兵多将广，此战难以取胜啊。step0 arr  �  ?�
y6   9    9  + B 6   9  9  6  9+  6 ' B'	   &89
B3 3 3 3 3 3 3 3	 3
 6  9 96 :9B
  X�6  9 9+ B6  9 9*  BX�6  9 9* 
 B2  �K  send_modifyNewbieLvitemIdConfig_RecruitgetHeroById         	nameHOMESTYLEdata.Config_UIrequiregetUIByNameUIManagerhomeStyleIdlocalPlayersetGuidingnewBieProxyGameGlobal�̙���Ԁ͙����р)<DR`gqrrrrrrrrssttttttuuuuuuuwwwwwwwyyhomeStyle 
6view )step7 (step6 'step5 &step4 %step3 $step2 #step1 "step0 !stepExt  hero  �  �6  9 9  B6 *  8BK  NewbieForLv MODULE_PLAYER_addNewbieItemnewBieProxyGameGlobal�̙���Ԁarr   � 	 �3   6 9 9  *  ) ) ) BK  "send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal ����̙Ӏcom  w  	�	3   6 9 9*    BK  send_modifyNewbieLvnewBieProxyGameGlobal ����̙Ӏ	step1  �  
&�6  9 9  -  B- BK  � � MODULE_HERO_upHeroLvUseItemheroProxyGameGlobalfirstLotteryUID func arr   � @�6  9 96 :9B93 6  9 9 *  ) )	 
 6	 '
 B9) B	2  �K  EXPITEM1!app.const.Const_speItemDefIdrequire"send_modifyLvNewbieAndCallFunnewBieProxy uIditemIdConfig_RecruitgetHeroByIdlocalPlayerGameGlobal�̙���Ԁfunc  firstLotteryUID 
complete  m   	�
3   6 ' B 9  BK  lejinGuideapp.script.NewBieScriptEtcrequire 							
cb  y  	�3   6 9 9*    BK  send_modifyNewbieLvnewBieProxyGameGlobal �̙���ԀstepExt  �  #�6   96 B6 9 9+ B6 *  8BK  setGuidingnewBieProxyGameGlobalNewbieForLvremoveEventsEventManager����̙�objectg  param   � 	
  �6   96 6 96 ' B9-  B6 9 9	  BK   �#MODULE_HERO_heroUpdatePositionheroProxyvalidInstBattle!app.event.InstanceProxyEventrequireinstanceProxyGameGlobalNewbieForLvaddEventEventManagershown arr   �  2F�3   3 6  9+  6 ' B99B 9B6	 9
 9 *  ) )
 6		 9		9		:		6
	 9

9

:

6	 99:6	 99:6	 99:6	 99:B2  �K  insBatSetuplocalPlayer"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobalbattleArrayAjust	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManager  ͙�����shown 1complete 0 �   2T�3   6  9+  6 ' B99B9 9B 9	6
 9	 9B A  A99 9B6  9+	  5
 >
>
>
6
 9)  )  B>
5 = 5 =>
BK         点击出征
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnBattle	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManager com 1btn &pos x y size  �  
 &�6     9  +  -  9B 6     9  -  9 9B6 ' B99+  5	 - B K  �   
insIdMchapterIdbatType 	hardREADYTOBATTLEdata.Config_UIrequiregetParent	view
addUI	nameremoveUIUIManagerparam step6  �@��9 6 ' B99  X6�6 9 9)  B9 9'	 B 9
B 96 9 9	B	 A  A99	 9B3 6	 	 9		+  5 >>>6 9*  *  B>5 =5 =>B	6	 	 9		6 B	2  �K    NewbieForLvremoveEventsEventManager       点击剿匪
param  123callBack  showNewBieHelpUIManager getContentSizeyxgetPositionpccconvertToWorldSpacegetParentButton_1getChildByName	viewcanNotClickScreenForSecnewBieProxyGameGlobal#ORDINARYANDHARDINSTSELECTPANELdata.Config_UIrequire	name����step6 objectg  Aparam  Aui /btn +pos x y size complete  �   �6     9  6 996 ' B99+  5	 -  =
B K    id  	name#ORDINARYANDHARDINSTSELECTPANELdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagercityId  � /f�
3   - 9 9' B 9B 96 9	 9B A  A9	9
6 9)d )d B6  9+	  5
 >
>
>
6 9*  *  B>
5 = 5 =>
BK  ��       点击关卡
param  123callBack  showNewBieHelpUIManager	sizeyxgetPositionpccconvertToWorldSpacegetParentButton_4getChildByNamecurMenu ����																				
cityId worldMapLogic com .btn (pos x y size  �  +^�+3   6  96 6 6 ' B9  B6 9	 9
B6  9+  ' B6  9+  6 ' B99B3  9 + 	 +
 B2  �K   �scroll2City 	nameWORLDMAPdata.Config_UIgetUILogicByNameBATTLEBANDITSremoveUIgetMaxTreasureBoxinstanceProxyGameGlobalADDapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManager ')))))))++step6 shown *cityId worldMapLogic 
toCityCb 	 [   	�6     9  -  + +  + B K  �returnWorldMapGameGlobalstep5  �  	 *�	4  5 6  99=> 5 > 5 > 6  96  99	6
 ' B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name巡防吏	talkM大事不好！北海城区发现大量匪患，请将军前往剿灭。 headId�	name曹植	talkn启禀主公，巡防吏正在营外候命，称北海有紧急军情相报，还请主公立即接见。 headId����	talkM哈哈，皇宫就在前方，我们若能救出皇帝，岂不是……	namelocalPlayerGameGlobal	step2 arr  � 	 4�V6   9    9  + B 3  3 3 3 6  9 9*   B2  �K  send_modifyNewbieLv    setGuidingnewBieProxyGameGlobal͙�����DISUUUUUUUVVstep6 step5 step2 
step1 	 ;   �6   *  8  B K  NewbieForLv�̙���� �  (�9 6 ' B99  X�6  96 B-  BK    NewbieForLvremoveEventsEventManager#ORDINARYANDHARDINSTSELECTPANELdata.Config_UIrequire	namestep7 object  param   � 	 �
3   6  96 6 6 ' B9  BK   �ADDapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManager 											
step7 shown  � 	 #0�6  9 9  B6  9+  6 ' B99B6  9	6  9
96 ' B99+  5 5 == -  BK  �arrinsInfo 
insIdM	hardbatType chapterId starNumBATTLERESULTUIsceneContextnewBieProxy
addUI	nameBATTLEUIdata.Config_UIrequireremoveUIUIManagerMODULE_INSTANCE_instBattleinstanceProxyGameGlobalstep6 arr  $ � %=�6  999 9B  X�6  99 9B	  X�6  96 B6  9 9	-  * ) ) )	 )
 )M ) '
 BK    "send_modifyLvNewbieAndCallFunNewbieForLvremoveEventsEventManagercheckAllPlayersAliveLeftcheckAllEnemysAliveLeft
logicsceneContextnewBieProxyGameGlobal ����̙�step5 object  &param  & � 	
 %�
3   6  96 6 996 ' B9	  BK  �STATE_ONDIEDapp.event.StateEventrequiresceneContextnewBieProxyGameGlobalNewbieForLvaddEventEventManager 													
step5 diedCallBack  #    
�-   B K  �step4  � 	 <�6   96 B6 99 9+ B6  9+  6	 '
 B99B 9B-  BK    checkAutoButton	nameBATTLEUIdata.Config_UIrequiregetUILogicByNameUIManagersetAutoBattlesceneContextnewBieProxyGameGlobalNewbieForLvremoveEventsEventManagerstep3 object  param  logic  � 	
  �
3   6  96 6 996 ' B9	  BK  �BATTLECONTROL_START!app.event.BattleControlEventrequiresceneContextnewBieProxyGameGlobalNewbieForLvaddEventEventManager 													
step3 started  s   �6   96 B-  BK    NewbieForLvremoveEventsEventManagerstep1 object  	param  	 � 
 *>�6     9  +  6 ' B99B    X�3 6  96	 6
 96 '	 B9 B6
 9 9B6
 9 9) ) )M BX�-  BK  �send_validInstBattlesend_getInstInfovalidInstBattle!app.event.InstanceProxyEventinstanceProxyGameGlobalNewbieForLvaddEventEventManager 	nameBATTLEFIELD5data.Config_UIrequiregetUIByNameUIManager												




step1 ui  shown  �  
I�@3   3 3 3 3 3 3 6 9	 9	*
   B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal       ����̙�"->???????@@step7 step6 step5 step4 step3 step1 
step0 	 M    �6   9    9  B K  onlyCheckLvnewBieProxyGameGlobal $    �-   B K    step15  �  �3   6  9+  6 ' B99B 9  BK    moveToMaxCity	nameWORLDMAPUIdata.Config_UIrequiregetUILogicByNameUIManager step15 cb  � 7X�6     9  +  6 ' B99B   9  ' B   9 B 9	6
 9  9 B A  A6
 9)d )d B3 6   9+  5 9	>	9	>	>6	
 9		*  *  B	>	5	 =	5
 =
	>	BK  �       点击收复
param  123callBack  yxshowNewBieHelp 	sizegetPositionpccconvertToWorldSpacegetParentButton_ShoufugetChildByName	nameWORLDMAPUIdata.Config_UIrequiregetUIByNameUIManager����
step15 btn )pos size com  �  	 +�6     9  +  6 99B 4  5 > 6   96 99	6
 ' B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUI headId�N	name香香	talk;匪患已平，我们还是继续回去救皇帝吧！	name#ORDINARYANDHARDINSTSELECTPANELConfig_UIremoveUIUIManagerstep14 arr  �  Gk�6     9  +  6 99B 6     9  +  6 ' B99B .   -   9 	   9 
 ' B   9 B 96 9  9 B A  A  9 B6   9+  5 9>9>6 99

 
9 B>6 9*
 * B>5 -	 =	5	 =	>BK   ��       点击关闭
param  123callBack  height
width	sizeyxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParent
closegetChildByName	view#ORDINARYANDHARDINSTSELECTPANELdata.Config_UIrequiregetUILogicByName	nameMOPUPRESULTUIConfig_UIremoveUIUIManager����ordLogic step13 btn .pos "size  �  Ck�	6   9    9  + B 6    9  +  6 ' B99B 9	  9
' B 9B 96 9	 9B A  A 9B6  9+  5 9	>	9	>	6	 9		9 9 B	>	6	 9		* * B	>	5	 -
  =
	5
 =
	>	BK  �       点击关闭
param  123callBack  height
width	sizeyxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentcloseButtongetChildByName	view	nameMOPUPRESULTUIdata.Config_UIrequiregetUILogicByNameUIManagersetGuidingnewBieProxyGameGlobal����	step12 mopupLogic 3btn .pos "size  � 	 ,�9 6 99  X�6  96 B6 9 9) -  BK    canNotClickScreenForSecnewBieProxyGameGlobalNewbieForLvremoveEventsEventManagerMOPUPRESULTUIConfig_UI	namestep11 object  param   �
 M�3  6 9 9+ B6  96 6 6 '		 B9
 B6 9 9  - - - -	 BK    �� ��MODULE_INSTANCE_mopupInstinstanceProxyADDapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManagersetGuidingnewBieProxyGameGlobal 						










step11 time insType cityId insId arr  shown  � 	H�)  6  8 9) ) 3 6 9 9 *	  6
 9

6 9     B
2  �K  �MODULE_INSTANCE_mopupInstMODULE_INSTANCEConst_MsgType"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal ordinaryInstConfig_City�̙����step11 cityId insId time insType com  �  8\�6     9  +  6 ' B99B .   -   9    9  ' B   9	 B 9
6 9  9 B A  A  9 B6   9+  5 9>9>>6 9*
  *  B>5 -	 =	5	 =	>BK   ��       点击扫荡
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentButton_1getChildByName	view	name#ORDINARYANDHARDINSTSELECTPANELdata.Config_UIrequiregetUILogicByNameUIManager����ordLogic step10 btn 'pos size  �  	 "�4  5  > 6  96 996 ' B99	+  5
 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkk主公，成功通关后就能开启扫荡功能了哦。扫荡可以轻松获得武将进阶材料。step4 arr  �   %A�6     9  +  6 99B    X�6 9 9B6   96 9	9
6 ' B99+  5 =-	  ,
 ) BX�-  BK  �id  data.Config_UIrequiresceneContextnewBieProxy
addUIgetMaxTreasureBoxinstanceProxyGameGlobal	name#ORDINARYANDHARDINSTSELECTPANELConfig_UIgetUIByNameUIManagerstep3 jiaofeiUI 	cityId  �   "�6     9  B   9  B 6   9B99  X �-   B X �6     9  -  + +  + B K  	�returnWorldMapWORDMAPSCENEsceneNametblgetCurScenegetResourceManagerGameGlobalstep2  �  v�g+   3  3 3 3 3 3 3 3 3	 3
	 6
 9 9*  
 B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal          �̙����"-ELS]efffffffggordLogic step15 step14 step13 step12 step11 step10 step4 step3 step2 
step1 	 Z    �6   9    9  ) B K  send_modifyNewbieLvnewBieProxyGameGlobal �  	 "�6     9  6 B 6  ' B 9  6  96 9	9
9 , -  BK    	namesceneContextnewBieProxyGameGlobal
addUIUIManagerMISSIONUIdata.Config_UIrequireNewbieForLvremoveEventsEventManagerstep5 conf 
 � 	 )�3   6  96 6 96 ' B9  B6 9 9	B6 9 9
B6 9 9BK   �send_getMeanMissionInfosend_getAchieveInfosend_getMissionInfogetMeanMissionInfoapp.event.MissionEventrequiremissionGameGlobalNewbieForLvaddEventEventManager 					




step5 cb  �  Ij�6     9  +  6 99B    X�6     9  +  6 99B   9 ' B  X�  9 ' B 9'	 B 9
B 96 9	 9B A  A6 9)d )d B6   9+  5 9	>	9	>	>6	 9		*  *  B	>	5	 -
  =
	5
 =
	>	BK  �       点击任务
param  123callBack  yxshowNewBieHelp	sizegetPositionpccconvertToWorldSpacegetParentButton_MissionNodeMenuButton_RenWugetChildByNameWORLDMAPUI	nameHOMEUIConfig_UIgetUIByNameUIManager����step4 view 7btn )pos size  �   $�6     9  B   9  B 6   9B99  X �6     9  -  + B X �6     9  -  + B K  �returnHomereturnWorldMapWORDMAPSCENEsceneNametblgetCurScenegetResourceManagerGameGlobalstep3  �  	 #0�4  5 6  99=> 5 > 5 6  99=> 5 > 6  96  9	9
6 ' B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name香香	talkq主公日后若是迷惘之时，便可打开这任务锦囊，依囊中之计行事，必能平定天下。 headId����	talk)你怎么总是神出鬼没的…… headId�N	name香香	talkk嘻嘻，看来主公离开了我便寸步难行了。唉，罢了罢了，我再来指引一番吧！ headId����	talkV接下来该做什么呢……少了香香那个丫头还真是不习惯呢……	namelocalPlayerGameGlobalstep2 arr  � 
  7�.3   3 3 3 3 6 9 9)��	 B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal      )-------..step5 step4 step3 step2 
step1 	 M    �6   9    9  B K  onlyCheckLvnewBieProxyGameGlobal �  Lz�6     9  +  6 ' B99B   9 B6   9+  6 ' B99B
  X0�9 9	'
 B 9	' B 9B 96 9
 9B A  A 9B6   9+  5	 9
>
	9
>
	>	6
 9

*  *  B
>
	5
 -  =
5 =
>
	BX�-  BK  �       点击返回
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentButton_ChangeProjectNode_1getChildByName	viewHEROUIcloseIt	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManager����			























step8 logic BheroLogic 5btn &pos size  �  :\�6     9  +  6 ' B99B 9  9' B 9'	 B 9
B 96 9	 9B A  A 9B6   9+  5 9	>	9	>	>6	 9		*  *  B	>	5	 -
  =
	5
 =
	>	BK  �       点击返回
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentButton_ChangeProjectNode_1getChildByName	view	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManager����step7 logic 0btn 	'pos size  � 
 $�6  9 9  B6  9 9+ B6  9+  6 99	B-  BK   	nameHEROYUANConfig_UIremoveUIUIManagersetGuidingnewBieProxy"MODULE_HERO_upgradeHeroYuanLvheroProxyGameGlobalstep6 arr   �  	 =�6   ' B   9  -  B 6 9 9- ) ) ) - 8 9BK   � id"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobalgetYuanByHeroIdapp.const.Const_YuanInforequirezhaoyunId complete yuanIndex heroYuan  �  4d�6     9  +  6 99B 9  9' B 9B 9	6
 9	 9B A  A6   9+  5 9>9>
 9B>6
 9*
  *  B>5 -	  =	5	 =	>BK  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentButton_2getChildByName	view	nameHEROYUANConfig_UIgetUILogicByNameUIManager����activeYuan yuanLogic 	,activeBtn 'activePos  �  	
 >�6   9    9  -  B 6  96  996 99	+  4 > - >- BK    �	nameHEROYUANConfig_UIsceneContextnewBieProxy
addUIUIManagergetHeroByIdlocalPlayerGameGlobalzhaoyunId yuanIndex showYuanUI hero  � 7��#-     9   B   9 ' B 9' B 9B 96 9
 9B A  A3	 3
 3 3 6 
 9+  5 9>9> 9B>6 9*  *  B>5 =5 =>B2  �K   �           点击此处
param  123callBack  getContentSizeyxshowNewBieHelpUIManager    getPositionpccconvertToWorldSpacegetParentButton_1pj3getChildByNamegetCurrentHeroJiBanNode���� !!!!!!!!!!!!!!!!!!!!""""!##attrLogic step6 zhaoyunId yuanIndex jibanNode 3yuanNode /viewButton +viewPos complete activeYuan showYuanUI finishClick  � 
 "Z�-6     9  +  6 99B   9 ' B3 4 5 >6   9	6
 996 '	 B99+  5	 =	=	B2  �K  � ��callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUI headId�N	name香香	talk\激活武将羁绊之后可获得战力提升，赶紧为关平将军激活羁绊吧！ Jiban_ButtonwigetTouched	nameHEROATTRIBUIConfig_UIgetUILogicByNameUIManager'((),,,,,,,,,,,,,,,,--step6 zhaoyunId yuanIndex attrLogic 	showTalk arr  �  4]�6     9  +  6 99B 9  9' B 9B 9	6
 9	 9B A  A6   9+  5 9>9>
 9B>6
 9)
  *  B>5 -	  =	5	 =	>BK  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentJiban_ButtongetChildByName	view	nameHEROATTRIBUIConfig_UIgetUILogicByNameUIManager����step5 attrLogic 	,jibanBtn 'jibanPos  �   !2�6     9  6 996 ' B99+  5 6 9		 9
-
  B=6 '	 B	 96
 9
	
9

B=- B K   ��allHero
herosgetArraySortByBatPowerapp.uiLogic.CommonHeroInfo	hero  getHeroByIdlocalPlayer	nameHEROATTRIBUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerzhaoyunId step4  �   (/�6     9  B   9  B 6   9B99  X �6     9  B   9  B 6   9B99  X �6     9  -  + B X �-   B K  �returnHomeWORDMAPSCENEHOMEUISCENEsceneNametblgetCurScenegetResourceManagerGameGlobalstep3  �  	 %2�
4  5  > 5 6 99=> 5 > 5 6 99=> 5 > 6  9	6 9
96 ' B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name香香	talkq乱世中的每个武将都拥有自己的羁绊，满足条件后便可触发羁绊，一起来看看吧！ headId����	talk)羁……羁绊？这是什么鬼！ headId�N	name香香	talkY主公你在胡说八道些什么啊？关平将军这是触发了羁绊的缘故！ headId����	talk,难道是洪荒之力快要爆发了？	namelocalPlayerGameGlobal headId�	name关平	talk_启禀主公，不知为何，末将近日总觉得体内有股力量在隐隐涌动……																	
step2 arr  �   r�o) �) 6  9 9+ B3 3 3 3 3 3 3	 3	
 6
  9


 9

)��	 B
2  �K  send_modifyNewbieLv        setGuidingnewBieProxyGameGlobalNVZbmnnnnnnnoozhaoyunId yuanIndex step8 step7 step6 step5 step4 step3 step2 
step1 	 M    �6   9    9  B K  onlyCheckLvnewBieProxyGameGlobal � 	   2�6     9  + B 6  9    9  + B 3  4 5 >6  96 99	6
 ' B99+  5 == BK  callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContext
addUIUIManager headId�N	name香香	talk\完成任务后可获得大量经验、元宝和铜币，请主公时刻保持关注。 setGuidingnewBieProxyGameGlobalisNeedShadeNewbieForLv















touchFun arr  `  �3   6 9  *  BK  performWithDelayGlobalscheduler ����finish  �  #�6   9+ B6 9 9) +  + B6 9 9  B-  BK   $MODULE_MISSION_acqMissionRewardmissionsend_modifyNewbieLvnewBieProxyGameGlobalisNeedShadeNewbieForLvstep3 arr   �
 R�6  9-  9B- !6  9-  98' + B3 6 9 9	 ) )	 )
 :BK  ��  "send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal _
splitStringUtilai	nums
table	









taskLogic idx step3 param  index tmp 	complete  �"R��9 6 99  X�2 J�6  96 B6  9+  6 '	 B99 B6
 99B 9 9)  B= 9' B 9' B 9B 96	 9		 9B A	  A3 6 
 9+  5! 9>9> 9B>6 9* * B>5 =5 = >B2  �K  K  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelp getPositionpccconvertToWorldSpacegetParentButton_1	nodegetChildByNamecurCellcellAtIndex_tableviewai	nums
tabledata.Config_UIrequiregetUILogicByNameUIManagerNewbieForLvremoveEventsEventManagerMISSIONUIConfig_UI	name����								











step3 object  Rparams  RtaskLogic ;idx 6cell 1btn 	(pos touchFun  � 	 .�
6   96 6 6 ' B9-  B6 ' B96  9	6
 999BK   	namesceneContextnewBieProxyGameGlobal
addUIMISSIONUIdata.Config_UIINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManager
step2 param  conf 	 �U��6  9= +  -    X�6  9+  6 ' B99B. -  9	'
 B X�6  9+  6 ' B99B. -  9	' B 9	' B  9B 96 9	 9B A  A3 6  9+  5 9	>	9	>	 9	B	>	6	 9		*  *  B	>	5	 =	5
 =
	>	BK             点击此处
param  123callBack  getContentSizeyxshowNewBieHelp getPositionpccconvertToWorldSpacegetParentButton_MissionNodeMenuWORLDMAPUIButton_RenWugetChildByName	nameHOMEUIdata.Config_UIrequiregetUIByNameUIManagersceneContextnewBieProxyGameGlobal����











isHome view step2 newScene  Vbtn Qpos 6touchFun  �  ":�#3   6  9+  6 ' B' 6 99&89	B  X�1  6  9
  + BX�1  6  9  + BK   ���returnHomereturnWorldMap	namehomeStyleIdlocalPlayerGameGlobalHOMESTYLEdata.Config_UIrequiregetUIByNameUIManager       #isHome view step2 cb ! �   &U�[6   9    9  + B 6   9    9  )��B +  +  3 3 3 4 5 >6  9	6	  9		9	
	6
 ' B
9

9

+  5 ==B2  �K  callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContext
addUIUIManager headId�N	name香香	talkn主公近日来战功累累，朝廷特意发来嘉奖。通过任务面板，即可随时领取奖励。   send_modifyNewbieLvsetGuidingnewBieProxyGameGlobal0VWWXZZZZZZZZZZZZZZZZ[[isHome view step3 step2 step1 arr  �  �6  9 9  B6 *  8BK  NewbieForLv MODULE_PLAYER_addNewbieItemnewBieProxyGameGlobal�̙��昁arr   � 	 �3   6 9 9  *  ) ) ) BK  "send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal �̙��朁com  w  	�	3   6 9 9*    BK  send_modifyNewbieLvnewBieProxyGameGlobal �̙��朁	step1  �  �6  9 9  B6 *  8BK  NewbieForLvMODULE_MANOR_upgradeBuildmanorProxyGameGlobal͙���̙�arr   � 
$�	3   6 9 9  *  6 96 9-  6	 9		9			9	
	BK  �nongtianbuildId
ManorConfig_GameDataMODULE_MANOR_upgradeBuildMODULE_MANORmsgType"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal �̙��昁	buildIndex com  �  !`��6     9  +  6 99B +  ) 9  ) M�9 896 99	9
 X� X�O�6 9 B9  9 B+  	 X�) X�)  9' B 9' 	 &	B 9'	 B	 9B	 96
 9

 9B A
  A6  
 9+  5  9>9> 9B>6 9* * B>5 -  =5 =>BK  �       点击建造
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentButton_CreateBIGBUILDINFOcellNodegetChildByNamecellAtIndex_tableview
floor	mathnongtianbuildId
ManorConfig_GameDataidbuildList	nameBUILDLISTFORCREATEConfig_UIgetUILogicByNameUIManager ����					




step8 listLogic 	XnongtianIndex W  i line Acell <order ;node +btn 'pos  �  	 +�6   ' B 9  6  96 999 +  5	 -  =
- BK  ��
index  	namesceneContextnewBieProxyGameGlobal
addUIUIManagerBUILDLISTFORCREATEdata.Config_UIrequirebuildIndex step7 conf  �  /]�-   9     9  ' - &B   9 B 96 9  9 B A  A6  9	+  5 9
>9>	  9 B>6 9*	  *
  B>5 - =5 =>BK   ���       点击建造
param  123callBack  getContentSizeyxshowNewBieHelpUIManagergetPositionpccconvertToWorldSpacegetParentImage_BuildinggetChildByName	view����buildingLogic buildIndex step6 build 	'pos  �  (U�9  X�K  9.  6  96 B4 5 >5	 6 99 = >5
 >6  96 996 '	 B99 +  5	 =	-
 =
	BK     callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name香香	talk;民以食为天，我们先来建造一块农田吧！ headId����	talkt嘻嘻，多谢香香信任。不过…我第一次当地主，没什么经验，接下来应该做什么呢？localPlayerGameGlobal headId�N	name香香	talkz嗯，虽然很空旷，但好歹算有了自己的基业！我相信主公一定能把这里发展得繁荣昌盛！NewbieForLvremoveEventsEventManager
logicFARMBUILDING	name		

buildingLogic step5 object  )params  )arr  � 	 6�3   6  96 6 6 ' B9  B6  96	 9
96 ' B99+  5 BK   �� isFold	nameFARMWORLDUIdata.Config_UIsceneContextnewBieProxyGameGlobal
addUIINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManager buildingLogic step5 com  �  Gj�6     9  +  6 ' B99B +     X�6   9+  6 99B99	X�9
  9'	 B  9B 96 9	 9B A  A6 9)d )d B6   9+  5 9	>	9	>	>6	 9		*  *  B	>	5	 -
  =
	5
 =
	>	BK  �       点击封地
param  123callBack  yxshowNewBieHelp	sizegetPositionpccconvertToWorldSpacegetParentgetChildByName	viewButton_ManorCommonMenuWORLDMAPUIConfig_UI	nameHOMEUIdata.Config_UIrequiregetUILogicByNameUIManager����					






















step4 homeUI =btn <pos size  �   $�6     9  B   9  B 6   9B99  X �6     9  -  + B X �6     9  -  + B K  �returnWorldMapreturnHomeHOMEUISCENEsceneNametblgetCurScenegetResourceManagerGameGlobalstep3  �  
 +>�'   4 5   9 6 99B=>5 6 99=>5 >5	 6 99=>6
  96 996 ' B99+  5 =-	  =	BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId����	talk;臣领旨谢恩，请大人赶紧带我去封地吧！ headId�'	name钦差	talk8…………将…将军，赶紧领旨谢恩吧！ headId����	talkq封地……发…财…啦！哇哈哈哈，想不到浓眉大眼的我，也有成为地主的一天啊！	talk	namelocalPlayerGameGlobalformat headId�'	name钦差s圣旨到！！！奉天承运，皇帝诏曰：%s平叛有功，特赐封地百户，以嘉其功！钦此！		




step2 str *arr  �  q�h+   ) 3  3 3 3 3 3 3 3	 6
 9
	

 9


*  	 B
2  �K  send_modifyNewbieLvnewBieProxyGameGlobal        �̙��昁&*0DPWfggggggghhbuildingLogic buildIndex step8 step7 step6 step5 step4 step3 step2 
step1 	 �  �6  9 9  B6 *  8BK  NewbieForLvMODULE_MANOR_openNewManormanorProxyGameGlobal��̙����arr   �  �3   6 9 9  *  6 96 9BK  MODULE_MANOR_openNewManorMODULE_MANORmsgType"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal ͙���̙�com  �  7q�6     9  +  6 99B 9 9 9' -  &B 9	B 9
6 9
 9B A  A6   9+  5 9	>	9	>	 9	B	>	6	 9		*  *  B	>	5	 -
 =
	5
 =
	>	BK   ��       点击开垦
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentImage_BuildinggetChildByName	viewbuildingLogic	nameFARMWORLDUIConfig_UIgetUILogicByNameUIManager����buildIndex step4 manorLogic 	/buildLogic .build 'pos  �  	 $�	4  5  > 5 > 6  96 996 ' B9	9
+  5 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talk\咦，建造所需的空地似乎不够了，我们还是先来开垦一块空地吧！ headId�N	name香香	talkc农田每5分钟可产出一次粮草，主公记得来收取哦！接下来我们建造……	step3 arr  �  %�9  X�K  6  96 B-  BK    NewbieForLvremoveEventsEventManagerFARMBUILDING	namestep2 object  params   � 
 (=�6     9  +  6 99B    X�3 6  96 6  6	 '	
 B9 B6   96 996	 ' B99+  5 BX�-  BK  � isFolddata.Config_UIsceneContextnewBieProxyGameGlobal
addUIINITCOMPLETEapp.event.UIManagerEventrequireNewbieForLvaddEventEventManager 	nameFARMWORLDUIConfig_UIgetUILogicByNameUIManager	










step2 manor 	 com  � 
 <�-)  3  3 3 3 6 9 9*  	 B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal    ͙���̙�	+,,,,,,,--buildIndex step4 step3 step2 
step1 	 �  �:   X�K  6  9 9  B6 * 8BK  NewbieForLvMODULE_MANOR_upgradeBuildmanorProxyGameGlobal����̙��arr   � 
$�3   6 9 9  *  6 96 9-  6	 9		9			9	
	BK   �
minhubuildId
ManorConfig_GameDataMODULE_MANOR_upgradeBuildMODULE_MANORmsgType"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal ��̙����	















buildIndex com  �  !`��6     9  +  6 99B +  ) 9  ) M�9 896 99	9
 X� X�O�6 9 B9  9 B+  	 X�) X�)  9' B 9' 	 &	B 9'	 B	 9B	 96
 9

 9B A
  A6  
 9+  5  9>9> 9B>6 9* * B>5 -  =5 =>BK  �       点击建造
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentButton_CreateBIGBUILDINFOcellNodegetChildByNamecellAtIndex_tableview
floor	math
minhubuildId
ManorConfig_GameDataidbuildList	nameBUILDLISTFORCREATEConfig_UIgetUILogicByNameUIManager ����					




step8 listLogic 	XnongtianIndex W  i line Acell <order ;node +btn 'pos  �  	 +�6   ' B 9  6  96 999 +  5	 -  =
- BK   ��
index  	namesceneContextnewBieProxyGameGlobal
addUIUIManagerBUILDLISTFORCREATEdata.Config_UIrequirebuildIndex step7 conf  �  9a�6     9  +  6 99B 9 7 6 9 9' -  &B 9	B 9
6 9	 9B A  A6   9+  5 9>9>
 9B>6 9*
  *  B>5 -	 =	5	 =	>BK   ��       点击建造
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentImage_BuildinggetChildByName	viewbuildingLogic	nameFARMWORLDUIConfig_UIgetUILogicByNameUIManager����buildIndex step6 manor 	1build 
'pos  �  	 "�4  5  > 6  96 996 ' B99	+  5
 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkG主公那么喜欢钱，接下来我们建造一个民户好了！step5 arr  �  %�9  X�K  6  96 B-  BK    NewbieForLvremoveEventsEventManagerFARMBUILDING	namestep2 object  params   � 
 (=�6     9  +  6 99B    X�3 6  96 6  6	 '	
 B9 B6   96 996	 ' B99+  5 BX�-  BK  � isFolddata.Config_UIsceneContextnewBieProxyGameGlobal
addUIINITCOMPLETEapp.event.UIManagerEventrequireNewbieForLvaddEventEventManager 	nameFARMWORLDUIConfig_UIgetUILogicByNameUIManager	










step2 manor 	 com  �  	N�M)  3  3 3 3 3 3 6 9	 9*
   B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal      ��̙����'+3;KLLLLLLLMMbuildIndex step8 step7 step6 step5 step2 
step1 	 �   
 �6     9  +  6 ' B99B   9  B 6  9    9 	 B K  onlyCheckLvnewBieProxyGameGlobalcloseIt	nameFARMWORLDUIdata.Config_UIrequiregetUILogicByNameUIManager �  :\�	6     9  +  6 ' B99B 9  9' B 9'	 B 9
B 96 9	 9B A  A 9B6   9+  5 9	>	9	>	>6	 9		*  *  B	>	5	 -
  =
	5
 =
	>	BK  �       点击返回
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentButton_ChangeNode_CommonBackgetChildByName	view	nameFARMWORLDUIdata.Config_UIrequiregetUILogicByNameUIManager����	step9 manor 0btn 	'pos size  w  	�6  9 9  B-  BK    MODULE_MANOR_upgradeBuildmanorProxyGameGlobalstep8 arr  
 � 
*�3   6 9 9  *  6 96 9- 6	 9		9			9	
	BK  � �guandibuildId
ManorConfig_GameDataMODULE_MANOR_upgradeBuildMODULE_MANORmsgType"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal ����̙��step8 buildIndex com  �  3R�6     9  +  6 99B   9 ' B 9B 96	 9
	 9B A  A6   9+  5 9>9>
 9B>6	 9
*
  *  B>5 -	  =	5	 =	>BK  �       点击升级
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentButton_buygetChildByName	nameBUILDLEVUPConfig_UIgetUIByNameUIManager����step7 upgradeUI 	+btn 'pos  �  	 =�-     9   B 6  ' B 9  6  96 999	 +  5
 - =- BK  � ��
index  	namesceneContextnewBieProxyGameGlobal
addUIUIManagerBUILDLEVUPdata.Config_UIrequireremovePopMenubuildingLogic buildIndex step6 conf 	 �  9l�-     9   - B -   9    9  ' B   9 ' B 9B 96 9	 9	B A  A9
 =
6  9+  5 9>9
>
 9B>6 9*
 )  B>5 -	 =	5	 =	>BK  � ��       点击升级
param  123callBack  getContentSizexshowNewBieHelpUIManagerygetPositionpccconvertToWorldSpacegetParentButton_LevelupFarmPopMenugetChildByName	viewbuildTouchedp����buildingLogic buildIndex step5 menu .btn *pos  �  7b�6     9  +  6 99B 9 .  -  9 9' B 9	B 9
6 9	 9B A  A6   9+  5 9>9>
 9B>6 9*
  *  B>5 -	 =	5	 =	>BK  ��       点击官邸
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentImage_MaingetChildByName	viewbuildingLogic	nameFARMWORLDUIConfig_UIgetUILogicByNameUIManager����buildingLogic step4 manor 	/build 'pos  �  	 $�	4  5  > 5 > 6  96 996 ' B9	9
+  5 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talk}升级民户与农田之后，粮草和铜钱的产量会大大得以提升。不过在这之前必须先升级官邸。 headId�N	name香香	talkc民户每5分钟会自动产出一次铜钱，你这个大财迷应该不会忘了收取吧！	step3 arr  �  %�9  X�K  6  96 B-  BK    NewbieForLvremoveEventsEventManagerFARMBUILDING	namestep2 object  params   � 
 (=�6     9  +  6 99B    X�3 6  96 6  6	 '	
 B9 B6   96 996	 ' B99+  5 BX�-  BK  	� isFolddata.Config_UIsceneContextnewBieProxyGameGlobal
addUIINITCOMPLETEapp.event.UIManagerEventrequireNewbieForLvaddEventEventManager 	nameFARMWORLDUIConfig_UIgetUILogicByNameUIManager	










step2 manor 	 com  �  z�T)  +  3  3 3 3 3 3 3 3	 3
 6	 9
 9*  
 B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal         ����̙��!'08BRSSSSSSSTTbuildIndex buildingLogic step9 step8 step7 step6 step5 step4 step3 step2 
step1 	 i   �
	6  9 9  BK  #MODULE_HERO_heroUpdatePositionheroProxyGameGlobal	arr   �   0<�
3   6  9+  6 ' B99B 9B6 9	 9
  ) ) ) 6 99:6	 9		9		:		6
 9

9

:

6 99:6 99:6 99:BK  arenaInfo_atkSquadcampaign"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobalbattleArrayAjust	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManager 
complete / �   2T�
6     9  +  6 ' B99B 9    9 B 96	 9
  9 B A  A99  9 B6   9+  5	 >	>	>	6
	 9


)  )  B
>
	5
 -  =
5 =
>
	BK  �       点击出征
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnBattle	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManagerstep7 btn 'pos x y size  X  !�
-   9 B- BK   �  oneKeySetupreadyLogic step6 param   �  1k�
6     9  +  6 99B 9  9B 96 9		 9
B A  A99 9B3 6  	 9+
  5 >>>6 9	)  )  B>5 =5 =>B2  �K  �       
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnOneKey	nameREADYTOBATTLEConfig_UIgetUILogicByNameUIManagerstep6 readyLogic 	)btn (pos x y size touchFun  c   	�
6   9    9  + B -   B K    setGuidingnewBieProxyGameGlobalstep5  � 	 '�
3   6 9) =6  96 996 '	 B9
9+  5   BK     batTypesubBatType 	nameREADYTOBATTLEdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManagerarenaInfo_opponentSeqcampaignGameGlobal step5 complete  � M��
6     9  +  6 ' B99B   9 ' B 9' B 9'	 B 9
B 96 9 9	
B	 A  A9 9B9  =9 9B9  =3 6   9+	  5
 9>
9>
 9B>
6 9* * B>
5 =5 =>
BK  �       
param  123callBack  showNewBieHelp heighty
widthgetContentSizexpccconvertToWorldSpacegetParentButtonfightButtonuu4getChildByName	nameARENAMAINUIdata.Config_UIrequiregetUIByNameUIManager����step5 view Cnode ?nodeButton ;tarButton 7pos +touchFun  �  	 $1�
	6   9    9  )  B 6    9  6 B 4  5 > 5 > 5 > 6	  9
6  996 ' B99+  5 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContext
addUIUIManager headId�N	name香香	talk主公赶紧来试试吧 headId�N	name香香	talkP在演武场中获得的竞技币，可以在演武商店中购买道具。 headId�N	name香香	talkP提升排名可获得元宝奖励，排名越靠前，奖励越丰厚哦！NewbieForLvremoveEventsEventManagercanNotClickScreenForSecnewBieProxyGameGlobal	step4 arr  �  &�
6     9  6 6 6 ' B9-  B 6    9  6 9	9
6 ' B99, B 6  9 	   9  *  B K   canNotClickScreenForSec	nameARENAMAINUIdata.Config_UIsceneContextnewBieProxyGameGlobal
addUIINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManager��zstep3  �  @r�
6     9  +  6 99B 9  9' B 9' B 9	B 9
B 96 9 9		B	 A  A6  96 B6   9+  5	 9
>
	9
>
	 9
B
>
	6
 9

*  *  B
>
	5
 -  =
5 =
>
	BK           点击此处
param  123callBack  getContentSizeyxshowNewBieHelpNewbieForLvremoveEventsEventManagerpccconvertToWorldSpacegetParentgetPositionImage_YanwuNode_YanwugetChildByName	view	nameARENAENTRYConfig_UIgetUILogicByNameUIManager����openArena ARENAENTRY_logic 	8btn 	/x ,y  ,pos   � 	/�
6   96 6 6 ' B9-  B6  96 9	9
6 ' B99, B6 9	 9*  BK   �canNotClickScreenForSec	nameARENAENTRYdata.Config_UIsceneContextnewBieProxyGameGlobal
addUIINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManager��zopened param    � 2a�
3   3 6  9- ' B-  9B 96 9- 	 9	B A  A6
  9+  5 9>9>- 
 9B>6 9*
  *  B>5 =5	 =	>B2  �K  �  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelpUIManagergetPositionpccconvertToWorldSpacegetParentyanlianplayButtonEffectNewbieForLv  ����openArena logic btn opened 1touchFun 0pos  � (g�
"6  9= 6  9+  6 ' B' 6  99	&89
B.  -  9 9' B3 3  9B-   9	 
 +  B2  �K     cameraTogetPosition  button_yanliangetChildByName	view	namehomeStyleIdlocalPlayerHOMESTYLEdata.Config_UIrequiregetUILogicByNameUIManagersceneContextnewBieProxyGameGlobal   !!!!!!!!""logic step3 newScene  )btn openArena cameraToCb x 
y  
 �   2�
)3   6  9+  6 ' B' 6 99&89	B  X�6  9
  + BX�6  9
  + BK   ��returnHome	namehomeStyleIdlocalPlayerGameGlobalHOMESTYLEdata.Config_UIrequiregetUIByNameUIManager #$$$$$$$$$$$$$$$$$%%%%%%%'''''')logic step3 cb  �   (g�
~6   9    9  + B 6   9    9  )��B +   3 3 3 3 3 3	 4 5
 >6 
 96  996 ' B99+  5 ==B2  �K  callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContext
addUIUIManager headId�N	name香香	talkG主公军势日益壮大，是时候参与群雄争霸之战了。      send_modifyNewbieLvsetGuidingnewBieProxyGameGlobal.BLvyyz||||||||||||||||~~logic step7 step6 step5 step4 step3 step1 arr  M    �6   9    9  B K  onlyCheckLvnewBieProxyGameGlobal �   $�	6   9    9  + B 6   9    9  )  B 6    9  +  6 ' B99	B   9
 3 BK   closeIt	nameCITYWARGATERESULTUIdata.Config_UIrequiregetUILogicByNameUIManagercanNotClickScreenForSecsetGuidingnewBieProxyGameGlobal	logic  u  	�3   6 9 9*    BK  send_modifyNewbieLvnewBieProxyGameGlobal �̙��渁
com  �  8c�	6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A996 9)< )< B6   9+	  5
 >
>
>
6 9*  *  B>
5 -  =5 =>
BK   �       
param  123callBack  showNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParentButton_1getChildByName	view	nameCITYWARGATERESULTUIdata.Config_UIrequiregetUILogicByNameUIManager����	step26 logic .btn )pos x y size  �  	 %�4  5  > 5 > 6  96 996 ' B9	9
+  5 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�	name曹植	talkV不必可惜，主公雄才大略，日后加入军团再来攻城略地不迟。 headId�N	name香香	talkb唉，真是可惜，此战虽胜，但主公尚未加入军团，所以无法占领城池。step25 arr  �  	 )C�6   9    9  5 B 6   9    9  5 B 4   ) = ) = ) = ) =	 )  =
 6  9= 6  96  996 ' B99, -  BK    	nameCITYWARGATERESULTUIdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManagerbattleEndedInfodefGroupsLeftdefGroupsDiedatkGroupsLeftatkGroupsDiedcityFall
          (MODULE_FACTIONWAR_groupNumChanged_r  ����%MODULE_FACTIONWAR_battleResult_rfactionWarProxyGameGlobal		


step24 battleEndedInfo  �    �
4   ) > )
 > 6  :9> 6 9 9  BK  %MODULE_FACTIONWAR_battleReward_rfactionWarProxyGameGlobalrewardsConfig_NewbieItem						
arr  �  )�3   3 6 9 95 B6 9  ) BK  �performWithDelayGlobalscheduler  
8,-310�N $MODULE_FACTIONWAR_battleBegin_rfactionWarProxyGameGlobal  step24 finish finish2  �  	 #�4  5  > 6  96 996 ' B99	+  5
 = -  =BK    callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkJ主公，城防军出现了，赶紧将其击杀，夺取虎牢关！step23 arr  �  �
6   9    9  5 B 3  6 9  ) BK  �performWithDelayGlobalscheduler   ?-31,9003,城防军,100000,100000,1,10,0,1,1,3_2_吕_5,0,-1!MODULE_FACTIONWAR_addGroup_rfactionWarProxyGameGlobal					
step23 finish  �  	 #�4  5  > 6  96 996 ' B99	+  5
 = -  =BK    callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�	name吕布	talkb呃……又是你这家伙，今日本大爷心情不好，改日再找你们算账。撤！step22 arr  c  �	3   6 9  ) BK  �performWithDelayGlobalscheduler 	step22 finish  �  C ���,4  5  4 5 6 9=6 99=5 =>5	 6 9=6 99=5
 =>5 6 9=6 99=5 =>5 6 9=6 99=4 5 >=>5 6 9=6 99=4 5 >=>5 6 9=6 99=4 5 >=>=> 5 4 5 6 9=6 99=4 5 >=>5 6 9=6 99=4 5 >=>5 6 9=6 99=4 5 >=>5 6 9=6 99=4 5 >=>=> 5  4 5! 6 9=6 99"=4 5# >=>5$ 6 9=6 99"=4 5% >=>5& 6 9=6 99"=4 5' >=>=> 5( 4 5) 6 9=6 99=5* =>5+ 6 9=6 99=5, =>5- 6 9=6 99=5. =>5/ 6 9=6 99=4 50 >=>51 6 9=6 99=4 52 >=>53 6 9=6 99=4 54 >=>=> 55 4 56 6 9=6 99=4 57 >=>58 6 9=6 99=4 59 >=>5: 6 9=6 99=4 5; >=>5< 6 9=6 99=4 5= >=>=> 6> '? B 9@B 9A  B 9B-  BK  �
startaddByArrcreateapp.control.ScriptExecutorrequire
             	����    ����    ����   
delay ��Ȁ  
9,-300�!     
8,-290��      
7,-280�(     		    	    	   
delay  	    	     	)MODULE_FACTIONWAR_gridStateChanged_r   
delay
        (MODULE_FACTIONWAR_groupNumChanged_r    	����    ����    ����%MODULE_FACTIONWAR_battleResult_r   
delay ����cmd  
9,-270��     
8,-260ٸ      
7,-250ֹ $MODULE_FACTIONWAR_battleBegin_r    ����	    ����	  
param  ����	funfixGroupGridcaller  factionWarProxyGameGlobal 
delay ����												


   ""#############$$$$$$$$$$$$$%%%%%%%%%%%%%&&&&&&&&&&&&''))))))****++++,step21 cmds �cmdExecutor 	 �  	 ,�4  5  > 5 ' 6 99' &=> 6  9	6 9
96 ' B99+  5 = -  =BK    callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager	talk&麾下大军特来取尔性命！	namelocalPlayerGameGlobal吕布狗贼， headId�	name关平 headId�N	name香香	talkb主公快看，那是我们的队伍，关平将军在沙场上好帅！（双眼冒星星）step20 arr  c  �
3   6 9  ) BK  �performWithDelayGlobalscheduler 					
step20 finish  �h  � ����6     9  +  6 ' B99B 4$ 5 4 5	 6 9=
6 99=4 5 >=>5 6 9=
6 99=4 5 >=>5 6 9=
6 99=4 5 >=>=>5 4 5 6 9=
6 99=4 5 >=>5 6 9=
6 99=4 5 >=>5 6 9=
6 99=4 5 >=>=>5 4 5 6 9=
6 99=4 5  >=>5! 6 9=
6 99=4 5" >=>=>5# 4 5$ 6 9=
6 99=4 5% >=>5& 6 9=
6 99=4 5' >=>=>5( 4 5) 6 9=
6 99=4 5* >=>=>5+ 4 5, 6 9=
6 99-=5. =>5/ 6 9=
6 99-=50 =>51 6 9=
6 99-=52 =>53 6 9=
6 99-=54 =>55 6 9=
6 99=4 56 >=>57 6 9=
6 99=4 58 >=>=>59 4 5: 6 9=
6 99-=5; =>5< 6 9=
6 99-=5= =>5> 6 9=
6 99=4 5? >=>=>5@ 4 5A 6 9=
6 99=4 5B >=>5C 6 9=
6 99=4 5D >=>5E 6 9=
6 99=4 5F >=>5G 6 9=
6 99=4 5H >=>=>5I 4 5J 6 9=
6 99=4 5K >=>5L 6 9=
6 99=4 5M >=>5N 6 9=
6 99=4 5O >=>=>	5P 4 5Q 6 9=
6 99-=5R =>5S 6 9=
6 99-=5T =>5U 6 9=
6 99-=5V =>5W 6 9=
6 99=4 5X >=>5Y 6 9=
6 99=4 5Z >=>5[ 6 9=
6 99=4 5\ >=>=>
5] 4 5^ 6 9=
6 99=4 5_ >=>5` 6 9=
6 99=4 5a >=>5b 6 9=
6 99=4 5c >=>5d 6 9=
6 99=4 5e >=>=>5f 4 5g 6 9=
6 99=4 5h >=>5i 6 9=
6 99=4 5j >=>5k 6 9=
6 99=4 5l >=>5m = 
9n =5o =>=>5p 4 5q 6 9=
6 99-=5r =>5s 6 9=
6 99-=5t =>5u 6 9=
6 99-=5v =>5w 6 9=
6 99=4 5x >=>5y 6 9=
6 99=4 5z >=>5{ 6 9=
6 99=4 5| >=>=>5} 4 5~ 6 9=
6 99=4 5 >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>=>5� 4 5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� = 
9n =5� =>=>5� 4 5� 6 9=
6 99�=4 5� >=>5� 6 9=
6 99�=4 5� >=>5� 6 9=
6 99�=4 5� >=>5� 6 9=
6 99=4 5� >=>=>5� 4 5� 6 9=
6 99-=5� =>5� 6 9=
6 99-=5� =>5� 6 9=
6 99-=5� =>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>=>5� 4 5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>=>5� 4 5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>=>5� 4 5� 6 9=
6 99-=5� =>5� 6 9=
6 99-=5� =>5� 6 9=
6 99-=5� =>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>=>5� 4 5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>=>5� 4 5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>=>5� 4 5� 6 9=
6 99-=5� =>5� 6 9=
6 99-=5� =>5� 6 9=
6 99-=5� =>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>=>5� 4 5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>=>5� 4 5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>=>5� 4 5� 6 9=
6 99-=5� =>5� 6 9=
6 99-=5� =>5� 6 9=
6 99-=5� =>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>5� 6 9=
6 99=4 5� >=>=>5� 4 5� 6 9=
6 99=4 5� >=>5 6 9=
6 99=4 5>=>56 9=
6 99=4 5>=>56 9=
6 99=4 5>=>=>54 56 9=
6 99=4 5>=>5	6 9=
6 99=4 5
>=>56 9=
6 99=4 5>=>=>54 56 9=
6 99-=5=>56 9=
6 99-=5=>56 9=
6 99-=5=>56 9=
6 99=4 5>=>56 9=
6 99=4 5>=>56 9=
6 99=4 5>=>=>54 56 9=
6 99=4 5>=>56 9=
6 99=4 5>=>56 9=
6 99=4 5 >=>5!6 9=
6 99=4 5">=>=>5#4 5$6 9=
6 99�=4 5%>=>5&6 9=
6 99�=4 5'>=>5(6 9=
6 99�=4 5)>=>5*6 9=
6 99=4 5+>=>=>5,4 5-6 9=
6 99=4 5.>=>5/6 9=
6 99=4 50>=>516 9=
6 99=4 52>=>=> 534 546 9=
6 99=4 55>=>566 9=
6 99=4 57>=>586 9=
6 99=4 59>=>5:6 9=
6 99=4 5;>=>=>!5<4 5=6 9=
6 99=4 5>>=>5?6 9=
6 99=4 5@>=>5A6 9=
6 99=4 5B>=>=>"5C4 5D6 9=
6 99�=4 5E>=>5F6 9=
6 99�=4 5G>=>5H6 9=
6 99�=4 5I>=>5J6 9=
6 99=4 5K>=>=>#6 'LB 'M8B 'N8 B 'O8-  BK  �
startaddByArrcreateapp.control.ScriptExecutor
            <-30,9002,陈宫,100000,100000,2,10,0,1,1,3_2_吕_5,0,-1    <-29,9003,吕布,100000,100000,1,10,0,1,1,3_2_吕_5,0,-1    <-28,9004,貂蝉,100000,100000,0,10,0,1,1,3_2_吕_5,0,-1   
delay ����  	    	     	   
delay
         ����    ����    ����   
delay ����  
6,-270 ��    
5,-260 �     
4,-250 ��   
delay
         <-27,9002,高顺,100000,100000,2,10,0,1,1,3_2_吕_5,0,-1    <-26,9005,张辽,100000,100000,1,10,0,1,1,3_2_吕_5,0,-1    <-25,9001,宋宪,100000,100000,0,10,0,1,1,3_2_吕_5,0,-1   
delay ����
         ����    ����    ����   
delay  
6,-240�@     
5,-230�V      
4,-220�`     	    	    	   
delay ���  	    	     	   
delay ���
  	       ����    ����    ����   
delay ���  
6,-210��     
5,-200�      
4,-190��                
delay ��ށ              
delay ��ց
         ����    ����    ����   
delay ��ҁ  
6,-180��     
5,-170��      
4,-160�                
delay ��΁              
delay ��Ɓ
         ����    ����    ����   
delay  
6,-150��     
5,-140��      
4,-130��                
delay              
delay
         ����    ����    ����   
delay ����  
6,-120��     
5,-110��      
4,-100��     ����    ����    ����   
delay
  	       B-24,9005,叛乱将领,100000,100000,2,10,0,1,1,3_2_吕_5,0,-1    B-23,9003,叛乱将领,100000,100000,1,10,0,1,1,3_2_吕_5,0,-1    B-22,9004,叛乱将领,100000,100000,0,10,0,1,1,3_2_吕_5,0,-1!MODULE_FACTIONWAR_addGroup_r   
delay  ��                 
delay ����
         ����    ����    ����   
delay  
3,-120 ��    
2,-110 ��     
1,-100 ��               
delay ����  �� cameraTo                
delay	
  	       ����    ����    ����   
delay ����  	3,-90�N     	2,-80�I      	1,-70�A                
delay ���              
delay ��Ԁ
  	       ����    ����    ����   
delay ��̀  	2,-50��     ����       
delay  	3,-60�      	1,-40��     ����        ����    fixGroupGrid   
delay ����     
delay ����
  	       ����   
delay       )MODULE_FACTIONWAR_gridStateChanged_r   
delay
  	   (MODULE_FACTIONWAR_groupNumChanged_r    ����    ����%MODULE_FACTIONWAR_battleResult_r   
delay ����cmd  	3,-389,1_6,2_3,3_-3,4_-6,5_-9,6_-12,7_-15,8_-18,9_-21,10�     	2,-288,1_5,2_2,3_-2,4_-5,5_-8,6_-11,7_-14,8_-17,9_-20,10��   
param   	1,-187,1_4,2_1,3_-1,4_-4,5_-7,6_-10,7_-13,8_-16,9_-19,10�� fun$MODULE_FACTIONWAR_battleBegin_rcaller  factionWarProxyGameGlobal 
delay	nameCITYWARMAPdata.Config_UIrequiregetUILogicByNameUIManager

           !!!!!!!!!!!"""""""""""#############$$$$$$$$$$$$%%%''((((((((((()))))))))))************+++--............./////////////00000000000001111111111112224455555555555556666666666666777777777777888::;;;;;;;;;;;<<<<<<<<<<<===========>>>>>>>>>>>>>?????????????@@@@@@@@@@@@AAACCDDDDDDDDDDDDDEEEEEEEEEEEEEFFFFFFFFFFFFFGGGGGGGGGGGGHHHJJKKKKKKKKKKKKKLLLLLLLLLLLLLMMMMMMMMMMMMMNNNNNNOOOQQRRRRRRRRRRRSSSSSSSSSSSTTTTTTTTTTTUUUUUUUUUUUUUVVVVVVVVVVVVVWWWWWWWWWWWWXXXZZ[[[[[[[[[[[[[\\\\\\\\\\\\\]]]]]]]]]]]]]^^^^^^^^^^^^___aabbbbbbbbbbbbbcccccccccccccdddddddddddddeeeeeefffhhiiiiiiiiiiiiijjjjjjjjjjjjjkkkkkkkkkkkkkllllllllllllmmmoopppppppppppqqqqqqqqqqqrrrrrrrrrrrssssssssssssstttttttttttttuuuuuuuuuuuuvvvxxyyyyyyyyyyyyyzzzzzzzzzzzzz{{{{{{{{{{{{{||||||||||||}}}���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������step19 logic �cmds �cmdExecutor  �  	 )�4  5  > 5 > 5 > 5 > 6  96 996	 '
 B99+  5 = -  =BK    callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�	name曹操	talk;三军听令，全力进攻虎牢关，违令者斩！ headId�	name吕布	talk>张辽！高顺！跟本大爷一起剁了这帮家伙！ headId�	name吕布	talkh哼，弱鸡一样的家伙，竟敢跑到此地呱噪。本大爷今日便让你们有来无回！ headId�	name袁绍	talkh吕布狗贼，你犯上作乱，要挟皇帝，我特率诸侯联军勤王，还不束手就擒！step18 arr 
 _  �3   6 9  ) BK  �performWithDelayGlobalscheduler 	step18 cb  �.  w���M6     9  +  6 ' B99B   9 *  )  ) B6 9 9	+ B6 9 9
* B+  6  9B6 994 5 4 5 6 9=6 99=4 5	 >	=>5 6 9=6 99=4 5	 >	=>5 6 9=6 99=4 5	 >	=>5 6 9=6 99=4 5	 >	=>=>5 4 5 6 9=6 99=4 5	  >	=>5! 6 9=6 99=4 5	" >	=>5# 6 9=6 99=4 5	$ >	=>5% 6 9=6 99=4 5	& >	=>=>5' 4 5( 6 9=6 99=4 5	) >	=>5* 6 9=6 99=4 5	+ >	=>5, 6 9=6 99=4 5	- >	=>5. 6 9=6 99=4 5	/ >	=>=>50 4 51 6 9=6 99=4 5	2 >	=>53 6 9=6 99=4 5	4 >	=>55 6 9=6 99=4 5	6 >	=>57 6 9=6 99=4 5	8 >	=>=>59 4 5: 6 9=6 99=4 5	; >	=>5< 6 9=6 99=4 5	= >	=>5> 6 9=6 99=4 5	? >	=>5@ 6 9=6 99=4 5	A >	=>=>5B 4 5C 6 9=6 99=4 5	D >	=>5E 6 9=6 99=4 5	F >	=>5G 6 9=6 99=4 5	H >	=>5I 6 9=6 99=4 5	J >	=>=>5K 4 5L 6 9=6 99=4 5	M >	=>5N 6 9=6 99=4 5	O >	=>5P 6 9=6 99=4 5	Q >	=>5R 6 9=6 99=4 5	S >	=>=>5T 4 5U = 9 =5V =>5W 6 9=6 99=4 5	X >	=>5Y 6 9=6 99=4 5	Z >	=>5[ 6 9=6 99=4 5	\ >	=>5] 6 9=6 99=4 5	^ >	=>=>5_ 4 5` 6 9=6 99=4 5	a >	=>5b 6 9=6 99=4 5	c >	=>5d 6 9=6 99=4 5	e >	=>5f 6 9=6 99=4 5	g >	=>=>	5h 4 5i 6 9=6 99=4 5	j >	=>5k 6 9=6 99=4 4	 '
l  'm 6 99n&

>
	>	=>5o 6 9=6 99=4 5	p >	=>5q 6 9=6 99=4 5	r >	=>=>
6 's B 9tB 9u	 B 9v-	  BK  	�
startaddByArrcreateapp.control.ScriptExecutor
  	       99,1001,曹操,100000,100000,2,1,0,0,1,1_3_联_4,0,-1  playerUId*,100000,100000,1,1,0,0,1,1_3_联_4,0,8,2009,    97,2001,刘备,100000,100000,0,1,0,0,1,1_3_联_4,0,-1   
delay
  	    <6,1015,夏侯惇,100000,100000,2,1,0,0,1,1_3_联_4,0,-1    95,4008,马腾,100000,100000,1,1,0,0,1,1_3_联_4,0,-1    94,3001,孙权,100000,100000,0,1,0,0,1,1_3_联_4,0,-1   
delay ��Ā  		    93,3009,孙策,100000,100000,2,1,0,0,1,1_3_联_4,0,-1    92,4004,袁绍,100000,100000,1,1,0,0,1,1_3_联_4,0,-1    91,4007,袁术,100000,100000,0,1,0,0,1,1_3_联_4,0,-1         
delay ����
  	       B-21,9004,叛乱将领,100000,100000,2,10,0,1,1,3_2_吕_5,0,-1    B-20,9003,叛乱将领,100000,100000,1,10,0,1,1,3_2_吕_5,0,-1    B-19,9002,叛乱将领,100000,100000,0,10,0,1,1,3_2_吕_5,0,-1   
delay
  	       B-18,9004,叛乱将领,100000,100000,2,10,0,1,1,3_2_吕_5,0,-1    B-17,9003,叛乱将领,100000,100000,1,10,0,1,1,3_2_吕_5,0,-1    B-16,9002,叛乱将领,100000,100000,0,10,0,1,1,3_2_吕_5,0,-1   
delay ��Ā
  	       B-15,9004,叛乱将领,100000,100000,2,10,0,1,1,3_2_吕_5,0,-1    B-14,9003,叛乱将领,100000,100000,1,10,0,1,1,3_2_吕_5,0,-1    B-13,9002,叛乱将领,100000,100000,0,10,0,1,1,3_2_吕_5,0,-1   
delay ����
  	       <-12,9004,曹性,100000,100000,2,10,0,1,1,3_2_吕_5,0,-1    <-11,9003,臧霸,100000,100000,1,10,0,1,1,3_2_吕_5,0,-1    <-10,9002,侯成,100000,100000,0,10,0,1,1,3_2_吕_5,0,-1   
delay ����
  	       A-9,9001,叛乱将领,100000,100000,2,10,0,1,1,3_2_吕_5,0,-1    A-8,9005,叛乱将领,100000,100000,1,10,0,1,1,3_2_吕_5,0,-1    A-7,9004,叛乱将领,100000,100000,0,10,0,1,1,3_2_吕_5,0,-1   
delay
  	<    A-6,9003,叛乱将领,100000,100000,2,10,0,1,1,3_2_吕_5,0,-1    A-5,9002,叛乱将领,100000,100000,1,10,0,1,1,3_2_吕_5,0,-1    A-4,9001,叛乱将领,100000,100000,0,10,0,1,1,3_2_吕_5,0,-1   
delay ����cmd
  	   			(MODULE_FACTIONWAR_groupNumChanged_r    A-3,9003,叛乱将领,100000,100000,2,10,0,1,1,3_2_吕_5,0,-1    A-2,9002,叛乱将领,100000,100000,1,10,0,1,1,3_2_吕_5,0,-1  
param  A-1,9001,叛乱将领,100000,100000,0,10,0,1,1,3_2_吕_5,0,-1fun!MODULE_FACTIONWAR_addGroup_rcaller  factionWarProxy 
delaylocalPlayergetSystemTime
CUtilcanNotClickScreenForSecsetGuidingnewBieProxyGameGlobalcameraTo	nameCITYWARMAPdata.Config_UIrequiregetUILogicByNameUIManager�����				

             !!!!!!!!!!!!"""##$$$$$$$$$$$$$%%%%%%%%%%%%%&&&&&&&&&&&&&''''''''''''((())*************+++++++++++++,,,,,,,,,,,,,------------...//00000000000001111111111111222222222222233333333333344466777777788888888888889999999999999:::::::::::::;;;;;;;;;;;;<<<==>>>>>>>>>>>>>?????????????@@@@@@@@@@@@@AAAAAAAAAAAABBBCCDDDDDDDDDDDDDEEEEEEEEEEEEEEEEEEEEEFFFFFFFFFFFFFGGGGGGGGGGGGHHJJJJJJKKKKLLLLMstep17 logic �ticker �timeStamp �playerName �cmds �cmdExecutor 	 �  �6   9    9  5 6   9B >B -   B K  
�getServerTime   诸侯联军1_3_联_4)MODULE_FACTIONWAR_cityStateChanged_rfactionWarProxyGameGlobal�
step16  �  	 #�4  5  > 6  96 996 ' B99	+  5
 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talk)咦，城战似乎要开启了呢！step15 arr  �  8c�6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A996 9)< )< B6   9+	  5
 >
>
>
6 9*  *  B>
5 -  =5 =>
BK           
param  123callBack showTimeshowNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParentwenhaogetChildByName	view	nameCITYWARSETUPUIdata.Config_UIrequiregetUILogicByNameUIManager����step14 logic .btn )pos x y size  � 	 )�3   4 5 >6  96 996 ' B9	9
+  5 == BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkA若主公日后有何疑虑，可在此处随时查看哦！ 	step14 com arr  �  	 #�4  5  > 6  96 996 ' B99	+  5
 = -  =BK    callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkq派遣成功啦，我军的队伍已经驻扎到攻击方的大营中，城战开启后便可自动战斗。step13 arr  � %V��6   9  )	 = 5  6  99> 6  9 9  B6  9 95 B3	 6
  9+  6 ' B99B*  =* = 9B9 9' )  ' )	 &	B 9B 96 9 9	B	 A  A99	 9B6
 
 9+  5$ >>>6 9* * B>5  =!5" =#>BK  �       
param  123callBack showTimeshowNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParent_circleHead_getChildByName	viewinitPosmoveEachGridCostSecattackEachTimeCostSec	nameCITYWARMAPdata.Config_UIrequiregetUILogicByNameUIManager 
  	


(MODULE_FACTIONWAR_groupNumChanged_r$MODULE_FACTIONWAR_dispatchGrouparmyFoodlocalPlayer   �attackerGroupsNumfactionWarProxyGameGlobal�̙�������������step13 arr 
Mcom @logic 
6btn &pos x y size  �   )R�-   9     9 B 96 9  9 B A  A99  9 B6	  9
+  5	 >	>	>	6
 9

)  )  B
>
	5
 - =
5 =
>
	BK   �         
param  123callBack  showNewBieHelpUIManagergetContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnBattlelogic step12 btn 'pos x y size  �  	 +�-     9   B 4  5 > 6  96 996 ' B9	9
+  5 = - =BK   ��callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talk8点击这里便能将队伍派遣到大营中啦！oneKeySetuplogic com2 arr  �  6n�6     9  +  6 ' B99B 3 3 9  9	B 9
6 9 9	B	 A  A996 9)	� )
P B6  
 9+  5 >>>6 9)  )  B>5 =5 =>B2  �K  �       
param  123callBack  showNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParentBtnOneKey  	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManager	step12 logic ,com2 +com *btn )pos x y size  �  	 )�6   9    9  5 B 4  5 > 6  96  996	 '
 B99+  5 = -  =BK    callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name香香	talkW需要5人队伍才可进行城战哦，把诸位将军都派遣到队伍中吧！  -1-1-1+MODULE_FACTIONWAR_getAvailableHeroInfofactionWarProxyGameGlobalstep11 arr 
 � 	 $�
3   6  96 996 ' B99	+  5
   BK  � subBatTypesendRequestbatType	nameREADYTOBATTLEdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager 															
step11 complete  �  6a�6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A99 9B6   9+	  5
 >
>
>
6 9*  *  B>
5 -  =5 =>
BK  �       
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentbtn_gonggetChildByName	view	nameCITYWARSETUPUIdata.Config_UIrequiregetUILogicByNameUIManager����step10 logic ,btn 'pos x y size  �  	 &�6   9  ) = 4  5 > 6  96  996 '	 B9
9+  5 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name香香	talkD主公点这里，便可将队伍派遣到攻击阵营中哦！curSendDispatchGroupSidefactionWarProxyGameGlobalstep9 arr  �  <f�6     9  +  6 ' B99B 9  9' B 9'	 B 9
B 96 9	 9B A  A996 9)� )2 B6   9+	  5
 >
>
>
6 9*  *  B>
5 -  =5 =>
BK  �       
param  123callBack showTimeshowNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParentdefenderNpcBarcityWarTopInfoNodegetChildByName	view	nameCITYWARSETUPUIdata.Config_UIrequiregetUILogicByNameUIManager����step8 logic 2btn 	)pos x y size  �  	 $�4  5  > 5 > 6  96 996 ' B9	9
+  5 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talk2这里显示的便是守备军剩余数量。 headId�N	name香香	talkV每个城池中都有守备军，只需将他们全部击败就能夺下城池。step7 arr  �  <f�6     9  +  6 ' B99B 9  9' B 9'	 B 9
B 96 9	 9B A  A996 9)2 )2 B6   9+	  5
 >
>
>
6 9*  *  B>
5 -  =5 =>
BK  �       
param  123callBack showTimeshowNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParentattackerNumcityWarTopInfoNodegetChildByName	view	nameCITYWARSETUPUIdata.Config_UIrequiregetUILogicByNameUIManager����step6 logic 2btn 	)pos x y size  �  	 *�4  5 6  99=> 5 > 5 > 6  96  99	6
 ' B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name香香	talk)这里显示攻击方队伍数量。 headId�N	name香香	talk5主公莫慌，我来教你如何进行城战。 headId����	talk>……第一次见这么大阵仗，该如何行动呢？	namelocalPlayerGameGlobalstep5 arr  �   !=�
4  5  4 5 6 9=6 99=4 5 >=>=	> 6
 ' B 9B 9  B 9-  BK  �
startaddByArrcreateapp.control.ScriptExecutorrequirecmd
param   诸侯联军吕布1_3_联_43_2_吕_5


-1-1����funMODULE_FACTIONWAR_logincaller  factionWarProxyGameGlobal 
delay����	����				
step4 cmds cmdExecutor 	 �   �6   9  ) = 6     9  ) -  + +  + B K  �returnCityWarSetupMapcityIdfactionWarProxyGameGlobalstep3  �  /_�-   9     9  ' B   9 B 96 9  9 B A  A99	6 9
)d )d B6  9+  5	 >	>	>	6
 9

*  *  B
>
	5
 - =
5 =
>
	BK   �         点击关卡
param  123callBack  showNewBieHelpUIManager	sizeyxgetPositionpccconvertToWorldSpacegetParentButton_2getChildByNamecurMenu����worldMapLogic step2 btn )pos x y size  � 	 5�6     9  +  6 ' B99B 3   9 B  9 +   B2  �K    showMenuremoveInstanceMenu 	nameWORLDMAPdata.Config_UIrequiregetUILogicByNameUIManager
step2 worldMapLogic menuCb 
 � 	 /�3   + 6  9B 9B6  9B99 X�+ 6  9   ) + BK  �returnWorldMapHOMEUISCENEsceneNametblgetCurScenegetResourceManagerGameGlobal step2 cb trans  � " .K���6   9    9  + B 6   9    9  *  B 3  3 3 3 3 3	 3
 3 3 3	 3
 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 4 5 >5! 6  99 = >5" >5# >5$ 6  99 = >6%  9&6  99'6( '!) B9*9 +   5!+ =,!=-!B2  �K  callBack	list  TALKBOXdata.Config_UIrequiresceneContext
addUIUIManager headId����	talk5言之有理，全军听令，发兵虎牢关。 headId�N	name香香	talkY主公虽征战已久，但从未参与过城战，此次不妨前去见识一番。 headId�'	name传令官	talk_皇帝暗中发出讨贼密旨，现各路诸侯已齐聚虎牢关，准备攻打城池。 headId����	talkY吕布这个反复无常的家伙，我就知道他不会老老实实归顺朝廷。	namelocalPlayer headId�'	name传令官	talkb报——禀主公，吕布在长安城中发起叛乱，率军将皇帝劫到了虎牢关。                          send_modifyNewbieLvsetGuidingnewBieProxyGameGlobal�̙��渁              " A L V � � �����7BKR[bks~���������������������������������������step26 >step25 =step24 <step23 ;step22 :step21 9step20 8step19 7step18 6step17 5step16 4step15 3step14 2step13 1step12 0step11 /step10 .step9 -step8 ,step7 +step6 *step5 )step4 (step3 'step2 &step1 %arr  �   �6   9    9  + B 6   9    9  *  B K  send_modifyNewbieLvsetGuidingnewBieProxyGameGlobal�̙��漁 �  	 &�4  5  > 5 > 5 > 6  96 996 '	 B9
9+  5 = -  =BK   �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talk\加入军团之后便可在城战中攻占城池，建立起属于您的庞大基业。 headId�N	name香香	talkD主公也可自行创建军团，召集群雄，攻城掠地。 headId�N	name香香	talkV主公在此处可查看并加入乱世豪杰所创建之军团，以为后图。step4 arr  � 	 #�6   9+ B6  96 996 ' B9	9
, -  BK    	namePALACEdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerisNeedShadeNewbieForLvstep3 param   � *F�3   -  9B 96 9-  9B A  A6  9+  5 9>9	>- 	 9
B>6 9*	  *
  B>5 = 5 =>BK           点击此处
param  123callBack  getContentSizeyxshowNewBieHelpUIManagergetPositionpccconvertToWorldSpacegetParent ����step3 btn touchFun )pos  � '�6     9  -  ' B 3  6 9  *  BK   �  �performWithDelayGlobalscheduler juntuandatingplayButtonEffectNewbieForLv͙���̙�
logic step3 btn finish  �  &P�6     9  +  6 ' B' 6 99&89B 6	  9
+ B9  9' B 9B3   9  	 +
  B2  �K  �cameraTo getPositionButton_PalacegetChildByName	viewisNeedShadeNewbieForLv	namehomeStyleIdlocalPlayerGameGlobalHOMESTYLEdata.Config_UIrequiregetUILogicByNameUIManagerstep3 logic btn 
x 
y  
cameraToCb 	 �  	 *�
4  5  > 5 > 5 > 5 > 5 > 6  96 99	6
 ' B99+  5 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�	name关平	talk\说得对，主公已非昔日无名小辈，何不趁势而起，建立不世功勋！ headId�N	name香香	talk_诸位的好意我代主公谢过，不过我家主公雄才大略，岂能屈居人下？ headId�	name孙策	talk_你俩都歇着吧，如将军这般英勇之人，唯有江东方能让您大展拳脚！ headId�	name刘备	talkz虎牢一别已久，想不到将军竟能闯出这番作为，不知可否随备一同横扫六合，匡扶汉室？ headId�	name曹操	talk\曹某早听植儿说起将军大名，今日特来相见，望将军能加入我军。																	
step2 arr  P   �6     9  -  + B K  �returnHomeGameGlobalstepExt2  �  	 ,�4  5  > 5 > 5 6 99=> 6  96 99	6
 ' B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId����	talkb想不到我在乱世中也闯出了这般名头，大家随我一同回城看看情况吧。	namelocalPlayerGameGlobal headId�	name曹植	talk_主公军势日益壮大，若没猜错，父亲与孙刘二人必为招纳主公而来。 headId�N	name探子	talkw启禀主公，小人近日发现刘备、曹操、孙策三位豪杰出现在我们的城池中，不知何故。stepExt arr  �  
K�=6   9    9  + B 3  3 3 3 3 3 6  9 9	*	  
 B2  �K  send_modifyNewbieLv      setGuidingnewBieProxyGameGlobal�̙��漁$/2;<<<<<<<==step4 step3 step2 stepExt2 stepExt 
step1 	 M    �6   9    9  B K  onlyCheckLvnewBieProxyGameGlobal �   �6     9  +  6 99B 6    9  -  + +  + + B K   �returnWorldMapGameGlobal	nameSHOWCOUNTRYWARINFOConfig_UIremoveUIUIManagerstep8  �  =_�6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A 9B6   9+  5 9	>	9	>	6	 9		9 9 B	>	6	 9		* * B	>	5	 -
  =
	5
 =
	>	BK  �       点击返回
param  123callBack  height
width	sizeyxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParent
closegetChildByName	view	nameSHOWCOUNTRYWARINFOdata.Config_UIrequiregetUILogicByNameUIManager����step7 logic 3btn .pos "size  q  �6   9    9  *  -  B K  �send_modifyNewbieLvnewBieProxyGameGlobal͙���̽�step6  �  	 �6     9  6 996 ' B99, -  B K    	nameSHOWCOUNTRYWARINFOdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep5  � 3^�	6     9  +  6 99B   9 ' B 9B 96	 9
	 9B A  A3 6   9+  5 9	>	9	>	 9	B	>	6		 9	
	*  *  B	>	5	 =	5
 =
	>	BK  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelp getPositionpccconvertToWorldSpacegetParentzhushougetChildByName	nameWORLDMAPUIConfig_UIgetUIByNameUIManager����	step5 worldMapUI 	+btn 'pos touchFun  [   	�6     9  -  + +  + B K    returnWorldMapGameGlobalstep4  � Ov�6     9  B   9  B 6   9B99  X 7�6    9  +  6 99	B   9
 ' B 9
' B 9B 96 9	 9B A  A3 6  9+  5 9	>	9	>	 9	B	>	6	 9		*  *  B	>	5	 =	5
 =
	>	BX �6     9  -  + +  + B K  �returnWorldMap       点击此处
param  123callBack  getContentSizeyxshowNewBieHelp getPositionpccconvertToWorldSpacegetParentButton_ChangeNode_CommonBackgetChildByName	nameHOMEUIConfig_UIgetUIByNameUIManagerHOMEUISCENEsceneNametblgetCurScenegetResourceManagerGameGlobal����step4 homeUI .btn &pos touchFun  t   �6     9  +  6 99B -   B K    	namePALACEConfig_UIremoveUIUIManagerstep3  � >g�6     9  +  6 ' B99B    X�-  BX.�  9 ' B 9' B 9	B 9
6 9	 9B A  A3 6   9+  5 9	>	9	>	 9	B	>	6	 9		*  *  B	>	5	 =	5
 =
	>	BK  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelp getPositionpccconvertToWorldSpacegetParentButton_ChangeProjectNode_1getChildByName	namePALACEdata.Config_UIrequiregetUIByNameUIManager����
step3 palaceUI 4btn &pos touchFun  �  	 "�4  5  > 6  96 996 ' B99	+  5
 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkM如果主公对城战还有何疑虑的话，可以在这里查看哦！step2 arr  �  R�A3   3 3 3 3 3 3 3 6 9	
 9
*   B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal        ͙���̽�*8?@@@@@@@AAstep8 step7 step6 step5 step4 step3 step2 
step1 	 d   �6   9    9  *  B K  send_modifyNewbieLvnewBieProxyGameGlobal��̙��ā �  3T�6     9  +  6 99B   9 ' B 9B 96	 9
	 9B A  A 9B6   9+  5 9	>	9	>	>6		 9	
	*  *  B	>	5	 -
  =
	5
 =
	>	BK  �       
param  123callBack showTimeyxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentqcgetChildByName	nameQIECUOUIConfig_UIgetUIByNameUIManager����step6 bfUI 	+btn 'pos size  �  	 "�4  5  > 6  96 996 ' B99	+  5
 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�	name曹植	talkS主公可与武将进行切磋，切磋胜利后即可获得该武将将魂。step5 arr  �  	 +�6     9  6 996 99+  5 -  =	6
 -  89=- B K   ��
insIdfightInsConfig_CitycityId  	nameQIECUOUIConfig_UIsceneContextnewBieProxyGameGlobal
addUIUIManagercurClickCityId step4  �  8j�6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A996 9)d )d B6   9+	  5
 >
>
>
6 9*  *  B>
5 -  =5 =>
BK           点击关卡
param  123callBack  showNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParentButton_5getChildByNamecurMenu	nameWORLDMAPdata.Config_UIrequiregetUILogicByNameUIManager����step3 worldMapLogic .btn )pos x y size  w  
%�3   6  9  + - + BK  � �returnWorldMapGameGlobal 	







step3 curClickCityId cb 	 �  	 (�	4  5  > 5 6 99=> 6  96 996	 '
 B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId����	talk)子建言之有理，前头带路！	namelocalPlayerGameGlobal headId�	name曹植	talkk末将听说北海城中居住着一位猛将，主公何不效仿古人探贤，前去拜访一番。	step2 arr 
 �  	R�0)  3  3 3 3 3 3 6 9	 9*
   B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal      ��̙��ā$.///////00curClickCityId step6 step5 step4 step3 step2 
step1 	 �  �6  9 9  B6 *  8BK  NewbieForLv MODULE_PLAYER_addNewbieItemnewBieProxyGameGlobal����̙Łarr   � 	 �3   6 9 9  *  ) ) ) BK  "send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal �̙���ācom  �  3T�6     9  +  6 99B   9 ' B 9B 96	 9
	 9B A  A 9B6   9+  5 9	>	9	>	>6		 9	
	*  *  B	>	5	 -
  =
	5
 =
	>	BK  �       
param  123callBack showTimeyxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentbfgetChildByName	nameQIECUOUIConfig_UIgetUIByNameUIManager����step4 bfUI 	+btn 'pos size  �  	 "�4  5  > 6  96 996 ' B99	+  5
 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�	name曹植	talkM除了切磋之外还可拜访武将，消耗拜帖直接获得将魂。step3 arr  �  	 #�6     9  6 996 99+  5 -  =	6
 -  89=- B K     
insIdfightInsConfig_CitycityId  	nameQIECUOUIConfig_UIsceneContextnewBieProxyGameGlobal
addUIUIManagercityId step2  � 8|�6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A996 9)d )d B3 6  	 9+
  5 >>>6 9*  *  B>5 =5 =>BK            点击关卡
param  123callBack  showNewBieHelp 	sizeyxgetPositionpccconvertToWorldSpacegetParentButton_5getChildByNamecurMenu	nameWORLDMAPdata.Config_UIrequiregetUILogicByNameUIManager����	



















cityId step2 worldMapLogic .btn )pos x y size touchFun  �  *�6     9  +  6 99B    X�-   B X 	�3  6  9  + - + BK  � �returnWorldMapGameGlobal 	nameQIECUOUIConfig_UIgetUIByNameUIManagerstep2 cityId cb  � 
 8�/)  3  3 3 3 6 9 9*  	 B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal    �̙���ā,.......//cityId step4 step3 step2 
step1 	 �  "�6  9 9  -  - B6  9 9BK   ��onlyCheckLvnewBieProxy MODULE_INSTANCE_visit_visitinstanceProxyGameGlobalcityId times arr   �  	 �6   9    9  -  *  ) ) - - B K  � ��"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal����̙Łstep5 cityId times  �  3T�6     9  +  6 99B   9 ' B 9B 96	 9
	 9B A  A 9B6   9+  5 9	>	9	>	>6		 9	
	*  *  B	>	5	 -
  =
	5
 =
	>	BK  �       拜访十次
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentbf2getChildByName	nameQIECUOUIConfig_UIgetUIByNameUIManager����step4 bfUI 	+btn 'pos size  �  	 "�4  5  > 6  96 996 ' B99	+  5
 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�	name曹植	talkG子建有十张拜帖相献，主公可用于拜访关平将军。step3 arr  �  	 #�6     9  6 996 99+  5 -  =	6
 -  89=- B K     
insIdfightInsConfig_CitycityId  	nameQIECUOUIConfig_UIsceneContextnewBieProxyGameGlobal
addUIUIManagercityId step2  � 8|�6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A996 9)d )d B3 6  	 9+
  5 >>>6 9*  *  B>5 =5 =>BK            点击关卡
param  123callBack  showNewBieHelp 	sizeyxgetPositionpccconvertToWorldSpacegetParentButton_5getChildByNamecurMenu	nameWORLDMAPdata.Config_UIrequiregetUILogicByNameUIManager����	



















cityId step2 worldMapLogic .btn )pos x y size touchFun  �  *�6     9  +  6 99B    X�-   B X 	�3  6  9  + - + BK  � �returnWorldMapGameGlobal 	nameQIECUOUIConfig_UIgetUIByNameUIManagerstep2 cityId cb  �  J�0)  )
 3  3 3 3 3 6 9	 9*
   B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal     ����̙Ł	-///////00cityId times  step5 step4 step3 step2 
step1 	 M    �6   9    9  B K  onlyCheckLvnewBieProxyGameGlobal [   	�6     9  -  + +  + B K  �returnWorldMapGameGlobalstep9  �  8b�
6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A99 9B6   9+	  5
 9>
9>
>
6 9*  *  B>
5 -  =5 =>
BK  �       点击确定
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnConfirmgetChildByName	view	nameHEROSTARUPSUCCESSdata.Config_UIrequiregetUILogicByNameUIManager����
step8 logic .btn )pos x y size  �  	 ,�	4  5  > 5 > 5 6 99=> 5 > 6  96 9	9
6 ' B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name香香	talkk（悄悄从角落伸出头）小白脸竟然勾引主公，还想生个几次，简直太恶心啦！ headId����	talkb子建真是个好同志啊，放心好啦，日后我定会让你这奶爸也升个几次。	namelocalPlayerGameGlobal headId�	name曹植	talkh关平将军乃是先锋，属下建议主公日后重点为关将军升星，以保全军安危。 headId�	name曹植	talkb武将升星之后，三围成长与技能效果将得以大幅提升，战力突飞猛进。	step7 arr  #    
�-   B K    step6  �
 9�	9 6 ' B99  X�6  96 6 6 '	 B9	B3
 6 9 9)  BK    canNotClickScreenForSecnewBieProxyGameGlobal ADDapp.event.UIManagerEventUIManagerNewBieScriptremoveEventEventManagerHEROSTARUPSUCCESSdata.Config_UIrequire	name	step6 objectg  param  ok  �
 /�3  6  96 6 6 '	 B9 B6 9	 9
  - 9BK  ��uIdMODULE_HERO_heroUpStarheroProxyGameGlobalADDapp.event.UIManagerEventrequireUIManagerNewBieScriptaddEventEventManager 
step6 hero arr  shown  �  �6   9    9  -  *  ) ) - 9B K     uId"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal͙����Łstep5 hero  � <|�6     9  +  6 ' B99B   9 B 9' B 9'	 B 9
B 96 9	 9B A  A99 9B3 6  	 9+
  5 >>>6 9*  *  B>5 =5 =>BK  ��       点击关卡
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParentButton_levelup_starImage_1getChildByNamegetCurrentRightUI	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManager����	



















step5 hero attribLogic 2btn 'pos x y size touchFun  �   !/�6     9  6 996 ' B99+  5 6 9		 9
-
  B=6 '	 B	 96
 9
	
9

B=- B K  ��allHero
herosgetArraySortByBatPowerapp.uiLogic.CommonHeroInfo	hero  getHeroByIdlocalPlayer	nameHEROATTRIBUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerheroId step4  �  	 *�4  5  > 5 6 99=> 5 > 6  96 99	6
 ' B99+  5 = -  =BK    callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�	name曹植	talkV…主公想多了，子建是说关平将军快要升星了，且随我观之。 headId����	talkP生……生了，这…这…这件事跟我绝对没有关系啊！！！	namelocalPlayerGameGlobal headId�	name曹植	talkA恭喜主公，贺喜主公，关平将军似乎要升了！step3 arr  o  
�3   6  9  + - + BK  	� �returnWorldMapGameGlobal step3 cityId cb 	 �  s�X)  )�6  9 9 B3 3 3 3 3 3 3		 3

 6  9 9*  
 B2  �K  send_modifyNewbieLvnewBieProxy        getHeroByIdlocalPlayerGameGlobal͙����Ł
!6BGVWWWWWWWXXcityId heroId hero step9 step8 step7 step6 step5 step4 step3 
step2 	 �    �6   9    9  + B 6   9    9  )" B K  send_modifyNewbieLvsetGuidingnewBieProxyGameGlobal �  	 "�4  5  > 6  96 996 ' B99	+  5
 = -  =BK   �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talk&点击空白区域可退出演武step6 arr  �  /W�6     9  +  6 99B   9 6 9)m)5B A)� )�6   9+  5 9		>	9	
>	6	 9		  B	>	6	 9		*  *  B	>	5	 -
  =
	5
 =
	>	BK  �       
param  123callBack showTime	sizeyxshowNewBieHelppccconvertToWorldSpace	nameARENAENTRYConfig_UIgetUIByNameUIManager����step5 uiEntry 	'pos width height   �  	  -�6     9  6 B 6  9    9  )  B 4  5 > 6  96 99	6
 ' B99+  5 = -  =BK    callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContext
addUIUIManager headId�N	name香香	talkG在活动开放时间，主公通过此处便可参与争霸啦！canNotClickScreenForSecnewBieProxyGameGlobalNewbieForLvremoveEventsEventManagerstep4 arr  � 	/�6   96 6 6 ' B9-  B6  96 9	9
6 ' B99, B6 9	 9*  BK   �canNotClickScreenForSec	nameARENAENTRYdata.Config_UIsceneContextnewBieProxyGameGlobal
addUIINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManager��zopened param    � ,Q�3   3 -  9B 96 9- 	 9B A  A6  9+  5 9	>9
>- 
 9B>6 9*
  *  B>5 =5	 =	>B2  �K    �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelpUIManagergetPositionpccconvertToWorldSpacegetParent  ����	step4 btn opened +touchFun *pos  �  !K�6     9  +  6 ' B' 6 99&89B 9	  9
' B 9B3   9  	 +
  B2  �K  �cameraTo getPositionbutton_yanliangetChildByName	view	namehomeStyleIdlocalPlayerGameGlobalHOMESTYLEdata.Config_UIrequiregetUILogicByNameUIManagerstep4 logic btn x 
y  
cameraToCb 	 M   �6     9  -  + B K  �returnHomeGameGlobalstep3  �  	  �4  5  > 6  96 996 99+  5	 = 
-  =BK  �callBack	list  	nameTALKBOXConfig_UIsceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talke恭喜主公开启了无双争霸，在这里挑战天下豪杰，让您的威名远扬四方。step2 arr  �  
 F�73   3 3 3 3 3 6 9 9+	 B6 9 9	)	��
 B2  �K  send_modifyNewbieLvsetGuidingnewBieProxyGameGlobal      
+.4555555666666677step6 step5 step4 step3 step2 step1  i   �6  9 9  BK  #MODULE_HERO_heroUpdatePositionheroProxyGameGlobalarr   �   0<�6     9  +  6 ' B99B   9  B 3  6 9	 9
  ) ) ) 6 99:6	 9		9		:		6
 9

9

:

6 99:6 99:6 99:BK  heroTrialInBatSetupcampaign"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal battleArrayAjust	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManagercomplete " �   0d�6     9  +  6 99B 9  9B 96 9		 9
B A  A99 9B3 6  	 9+
  5 >>>6 9	)  )  B>5 =5 =>BK         
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnBattle	nameREADYTOBATTLEConfig_UIgetUILogicByNameUIManagerreadyLogic 	(btn 'pos x y size touchFun  X  !�-   9 B- BK   �  oneKeySetupreadyLogic step5 param   �  7q�6   9    9  + B 6    9  +  6 99B 9  9	B 9
6 9	 9B A  A99 9B3 6 	 9+
  5 >>>6 9)  )  B>5 =5 =>B2  �K           
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnOneKey	nameREADYTOBATTLEConfig_UIgetUILogicByNameUIManagersetGuidingnewBieProxyGameGlobal	


step5 readyLogic )btn (pos x y size touchFun  � 
 9�6     9  +  6 99B 3 6   96 99	6 9
9+  5 9	 =	9	 =		 BK  �
insIdcurSelectInsIndexchapterId 	hard batTypechapterREADYTOBATTLEsceneContextnewBieProxyGameGlobal
addUI 	nameHEROTRIALINFOUIConfig_UIgetUILogicByNameUIManagerstep5 infoLogic 	complete  � 3X�6   9+  6 99B 9' B 9B 96	 9

 9B A  A6   9+  5 9	>	9	>	 9	B	>	6		 9	
	*  *  B	>	5	 -
  =
	5
 =
	>	BK          点击出征
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentButton_3getChildByName	nameHEROTRIALINFOUIConfig_UIgetUIByNameUIManager����step4 param  4view 	+btn 'btnPos  �   ,�6     9  6 996 99+  5 -  9		 9
'
 ) &

B=- B K    �	nodeheroNodegetChildByNamesc chapter	nameHEROTRIALINFOUIConfig_UIsceneContextnewBieProxyGameGlobal
addUIUIManagertrialLogic touchFun  � <r�6     9  +  6 ' B99B .   -   9    9  ' B   9	 B 9
6 9  9 B A  A4  )n =)n =3 3 6   9+  5	 9
>
	9
>
	>	6
 9

*  )  B
>
	5
 =
5 =
>
	B2  �K  ��       选择关卡
param  123callBack  yxshowNewBieHelp  height
widthgetPositionpccconvertToWorldSpacegetParentn1getChildByNamesc	nameHEROTRIALUIdata.Config_UIrequiregetUILogicByNameUIManager����trialLogic step4 btn +pos size touchFun com  � 		 �6   96 996 ' B99, -  BK    	nameHEROTRIALUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep3 param   � C~�6     9  6 6 6 ' B9B 6    9  +  6 ' B9	9
B 9 9  9)  B 9B 96 9
 9B A  A4  )� =)s=3 6  9+	  5
 9>
9>
>
6 9)  *  B>
5 =5 =>
BK  �       点击此处
param  123callBack  yxshowNewBieHelp height
widthgetPositionpccconvertToWorldSpacegetParentcellAtIndex_tableview	view	nameWORLDWARUIdata.Config_UIgetUILogicByNameINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvremoveEventEventManager��̙����step3 logic /shilianView .btn )pos size touchFun  � 
 4�6   9+ B6  96  6 6 ' B9-  B6 ' B9	6  9
6 999,	 BK    	namesceneContextnewBieProxyGameGlobal
addUIWORLDWARUIdata.Config_UIINITCOMPLETEapp.event.UIManagerEventrequireUIManageraddEventEventManagerisNeedShadeNewbieForLvstep2 param  conf 
 � *F�3   -  9B 96 9-  9B A  A6  9+  5 9>9	>- 	 9
B>6 9*	  *
  B>5 = 5 =>BK           点击此处
param  123callBack  getContentSizeyxshowNewBieHelpUIManagergetPositionpccconvertToWorldSpacegetParent ����														step2 btn touchFun )pos  � '�6     9  -  ' B 3  6 9  *  BK     �performWithDelayGlobalscheduler heroTrialplayButtonEffectNewbieForLv͙���̙�logic step2 btn finish  � ,_�6   9+ B6 9= 6  9+  6 ' B'	 6 9
9&89B.  -  9 9' B3  9B-   9 	 +
  B2  �K     cameraTogetPosition zhanyigetChildByName	view	namehomeStyleIdlocalPlayerHOMESTYLEdata.Config_UIrequiregetUILogicByNameUIManagersceneContextnewBieProxyGameGlobalisNeedShadeNewbieForLvlogic step2 newScene  -btn cameraToCb x 
y  
 �   2�$3   6  9+  6 ' B' 6 99&89	B  X�6  9
  + BX�6  9
  + BK   ��returnHome	namehomeStyleIdlocalPlayerGameGlobalHOMESTYLEdata.Config_UIrequiregetUIByNameUIManager        """"""$logic step2 cb  �   'k��6   9    9  + B 6   9    9  )��B ,  3 3 3 3 3 4 5	 >6
 
 96  996 ' B99+  5 ==B2  �K  callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContext
addUIUIManager headId�N	name香香	talke恭喜主公开启了英雄试练活动，勇敢参加试练可以获得大量珍贵装备哦！     send_modifyNewbieLvsetGuidingnewBieProxyGameGlobal5KZ����������������������logic trialLogic  step5 step4 step3 step2 step1 arr  i   �6  9 9  BK  #MODULE_HERO_heroUpdatePositionheroProxyGameGlobalarr   �   0<�6     9  +  6 ' B99B   9  B 3  6 9	 9
  ) ) ) 6 99:6	 9		9		:		6
 9

9

:

6 99:6 99:6 99:BK  classicBatInBatSetupcampaign"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal battleArrayAjust	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManagercomplete " �   0d�6     9  +  6 99B 9  9B 96 9		 9
B A  A99 9B3 6  	 9+
  5 >>>6 9	)  )  B>5 =5 =>BK         
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnBattle	nameREADYTOBATTLEConfig_UIgetUILogicByNameUIManagerreadyLogic 	(btn 'pos x y size touchFun  X  !�-   9 B- BK   �  oneKeySetupreadyLogic step7 param   �  1k�6     9  +  6 99B 9  9B 96 9		 9
B A  A99 9B3 6  	 9+
  5 >>>6 9	)  )  B>5 =5 =>B2  �K  �       
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnOneKey	nameREADYTOBATTLEConfig_UIgetUILogicByNameUIManagerstep7 readyLogic 	)btn (pos x y size touchFun  �   .�6     9  6 996 ' B99+  5
 -  9	=-  9=- B K   �  
insIdpointSelectedchapterId batTypeid	nameREADYTOBATTLEdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerclassicInfoLogic step6  � ;{�6   9    9  + B 6    9  +  6 99B 9  9	'
 B 9B 96 9	 9B A  A99 9B3 6 	 9+
  5 >>>6 9*  *  B>5 =5 =>B2  �K           
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParent	goOngetChildByName	view	nameCLASSICBATINFOUIConfig_UIgetUILogicByNameUIManagersetGuidingnewBieProxyGameGlobal����step6 classicInfoLogic -btn (pos x y size battleCb  � 	 -�4  5  > 3 6  96 996 ' B9	9
+  5 = =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager  headId�N	name香香	talk�每场战役所能上阵的武将都是有限制的哦，比如关平将军就只能在蜀国的战役中出战，所以兵多将广才是战役中的称霸之要step6 arr touchFun  � 	
 3�6   9-  9 9B6 ' B99+  5 - =	- BK    � id  	nameCLASSICBATINFOUIdata.Config_UIrequiregetParent	view
addUIUIManagerclassicLogic id step5 param   � O��6     9  +  6 ' B99B .   6  9  9  +  6	   BH�9
	  X�6 9= X�FR�-  9 9'  &B 9B 96 9
 9B A  A4  )=)�=3 6   9+	  5
 9>
9>
>
6 9* * B>
5 =5 =>
B2  �K  ��       点击此处
param  123callBack  yxshowNewBieHelp height
widthgetPositionpccconvertToWorldSpacegetParent
pointgetChildByName	viewclassicBatCurSelectIdisOpen
pairsclassicBatStatecampaignGameGlobal	nameCLASSICBATSELECTUIdata.Config_UIrequiregetUILogicByNameUIManager����classicLogic step5 classicBatInfo Aid @  k v  pointView *pos size touchFun  �  	 "�4  5  > 6  96 996 ' B99	+  5
 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkJ不同日期会开启不同的战役，未开启的战役无法挑战step4 arr  � 	 +�6   9-   9B6 ' B99, - BK  �  	nameCLASSICBATSELECTUIdata.Config_UIrequiregetParent
addUIUIManagershilianView step3 param   � D�6     9  6 6 6 ' B9B 6    9  +  6 ' B9	9
B 9 9  9) B 9B 96 9
 9B A  A4  )� =)s=3 6  9+	  5
 9>
9>
>
6 9)  *  B>
5 =5 =>
B2  �K  �       点击此处
param  123callBack  yxshowNewBieHelp height
widthgetPositionpccconvertToWorldSpacegetParentcellAtIndex_tableview	view	nameWORLDWARUIdata.Config_UIgetUILogicByNameINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvremoveEventEventManager��̙����step3 logic 0shilianView /btn *pos size touchFun  � 
 /�6   96 6 6 ' B9-  B6 ' B96  9	6
 999,	 BK    	namesceneContextnewBieProxyGameGlobal
addUIWORLDWARUIdata.Config_UIINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManagerstep2 param  conf 
 � /K�6     9  + B 3  -  9B 96 9-  9B A  A6  9	+  5 9
>9>- 	 9B>6 9*	  *
  B>5 = 5 =>BK            点击此处
param  123callBack  getContentSizeyxshowNewBieHelpUIManagergetPositionpccconvertToWorldSpacegetParent isNeedShadeNewbieForLv����step2 btn touchFun )pos  �  �6     9  + B 3  6 9  *  BK   �performWithDelayGlobalscheduler isNeedShadeNewbieForLv͙���̙�step2 btn finish  � 'Z�6  9= 6  9+  6 ' B' 6  99	&89
B.  -  9 9' B3  9B-   9 	 +
  B2  �K     cameraTogetPosition zhanyigetChildByName	view	namehomeStyleIdlocalPlayerHOMESTYLEdata.Config_UIrequiregetUILogicByNameUIManagersceneContextnewBieProxyGameGloballogic step2 newScene  (btn cameraToCb x 
y  
 �   2� 3   6  9+  6 ' B' 6 99&89	B  X�6  9
  + BX�6  9
  + BK   ��returnHome	namehomeStyleIdlocalPlayerGameGlobalHOMESTYLEdata.Config_UIrequiregetUIByNameUIManager  logic step2 cb  �   )��6   9    9  + B 6   9    9  )��B ,  3 3 3 3 3 3	 3
 4	 5
 >
	6
 
 9

6  996 ' B99+  5 =	=B
2  �K  callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContext
addUIUIManager headId�N	name香香	talk�恭喜主公开启了经典战役活动，在战役中不仅能体会到三国群雄间激烈鏖战，还能获得丰厚奖励。       send_modifyNewbieLvsetGuidingnewBieProxyGameGlobal*BX^n����������������������logic classicLogic  step7 step6 step5 step4 step3 step2 step1 arr  Z    �6   9    9  ) B K  send_modifyNewbieLvnewBieProxyGameGlobal �  	 "�4  5  > 6  96 996 ' B99	+  5
 = -  =BK   �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkY激活战鼓后可为所有武将提供属性加成，主公千万不要错过哟！step5 arr  Z   #�-     9   - B -  B K   ��  
touchtreasureLogic index step4  � Q��6     9  +  6 99B 6     9  +  6 99B ) ) 9  ) M�9 89	 X� X�O�9
  99  !B 9' B 9B 96 9 9	B	 A  A3 6   9+	  5
 9>
9>
 9B>
6 9*  *  B>
5 =5 =>
B2  �K  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelp getPositionpccconvertToWorldSpacegetParentpicgetChildByNamecellAtIndex_tableviewPLAYERSYSZHANGU
logicleftTablePLAYERSYSgetUILogicByName	nameZHANGURECHARGEINFOConfig_UIremoveUIUIManager����






step4 treasureLogic Aindex @	 	 	i cell ,btn (pos touchFun  �   �6     9  6 996 99, -  B K    	namePLAYERSYSConfig_UIsceneContextnewBieProxyGameGlobal
addUIUIManagerstep3  � =b�	6     9  +  6 99B    X�6     9  +  6 99B   9 ' B 9B 9	6
 9	 9B A  A3 6   9+  5 9	>	9	>	 9	B	>	6	
 9		*  *  B	>	5	 =	5
 =
	>	BK  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelp getPositionpccconvertToWorldSpacegetParentButton_practicegetChildByNameWORLDMAPUI	nameHOMEUIConfig_UIgetUIByNameUIManager����	step3 view +btn 'pos touchFun  �   &�6     9  +  6 ' B' 6 99&89B 
   X �6    9 	 -  + B X �6    9 
 -  + B K  �returnWorldMapreturnHome	namehomeStyleIdlocalPlayerGameGlobalHOMESTYLEdata.Config_UIrequiregetUIByNameUIManagerstep2  �  	 "�4  5  > 6  96 996 ' B99	+  5
 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talk_春风吹，战鼓擂，当今社会谁怕谁？恭喜主公开启战鼓，来看看吧！step1 arr  �  	 @�53   3 3 3 3 3 6 9 9)	��
 B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal      	&-3444444455step5 step4 step3 step2 step1 
step0 	 i   �6  9 9  BK  #MODULE_HERO_heroUpdatePositionheroProxyGameGlobalarr   �   0<�6     9  +  6 ' B99B   9  B 3  6 9	 9
  )# ) ) 6 99:6	 9		9		:		6
 9

9

:

6 99:6 99:6 99:BK  expeditionInBatSetupcampaign"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal battleArrayAjust	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManagercomplete " �   0d�6     9  +  6 99B 9  9B 96 9		 9
B A  A99 9B3 6  	 9+
  5 >>>6 9	)  )  B>5 =5 =>BK         
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnBattle	nameREADYTOBATTLEConfig_UIgetUILogicByNameUIManagerreadyLogic 	(btn 'pos x y size touchFun  X  !�-   9 B- BK   �  oneKeySetupreadyLogic step6 param   �  1k�6     9  +  6 99B 9  9B 96 9		 9
B A  A99 9B3 6  	 9+
  5 >>>6 9	)  )  B>5 =5 =>B2  �K  �       
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnOneKey	nameREADYTOBATTLEConfig_UIgetUILogicByNameUIManagerstep6 readyLogic 	)btn (pos x y size touchFun  �   �6     9  6 996 ' B99+  5 6 9	9
=6 9	9 =-  B K    
insIdexpeditionLatestPointIdchapterId 	hard batTypeexpeditionLatestChapterIdcampaign	nameREADYTOBATTLEdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep5  � :y�6   9    9  + B 6    9  +  6 99B 9  9	'
 B 9B 96 9	 9B A  A99 9B3 6 	 9+
  5 >>>6 9*  *  B>5 =5 =>BK           
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParentButton_2getChildByName	view	nameEXPEDITIONINSINFOConfig_UIgetUILogicByNameUIManagersetGuidingnewBieProxyGameGlobal����step5 expeditionLogic ,btn 'pos x y size battleCb  � 	 +�3   4 5 >6  96 996 ' B9	9
+  5 == BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talk开启征讨之战吧！ step5 finish arr  �   �6     9  6 B 6    9  6 996 '	 B9
9, -  B K    	nameEXPEDITIONINSINFOdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerNewbieForLvremoveEventsEventManagerstep4  � 	
 $�3   6  96 6 96 ' B9  B6 9 9	BK    send_getFourSidesWarEnemygetFourSidesWarEnemyapp.event.CampaignEventrequirecampaignGameGlobalNewbieForLvaddEventEventManager step4 gotData  � 7b�6     9  +  6 99B   9 ' B 9' B 9B 9	6
 9
 9B A  A3 6   9+  5	 9
>
	9
>
	 9
B
>
	6

 9

*  )  B
>
	5
 =
5 =
>
	BK  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelp getPositionpccconvertToWorldSpacegetParent
node1bggetChildByName	nameEXPEDITIONPOINTUIConfig_UIgetUIByNameUIManager����step4 view 	/bg +node 'pos touchFun  � 		 �6   96 996 ' B99, -  BK    	nameEXPEDITIONPOINTUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep3 param   � C~�6     9  6 6 6 ' B9B 6    9  +  6 ' B9	9
B 9 9  9) B 9B 96 9
 9B A  A4  )� =)s=3 6  9+	  5
 9>
9>
>
6 9)  *  B>
5 =5 =>
BK  �       点击此处
param  123callBack  yxshowNewBieHelp height
widthgetPositionpccconvertToWorldSpacegetParentcellAtIndex_tableview	view	nameWORLDWARUIdata.Config_UIgetUILogicByNameINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvremoveEventEventManager��̙����step3 logic /shilianView .btn )pos size touchFun  � 
 /�6   96 6 6 ' B9-  B6 ' B96  9	6
 999,	 BK    	namesceneContextnewBieProxyGameGlobal
addUIWORLDWARUIdata.Config_UIINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManagerstep2 param  conf 
 � *F�3   -  9B 96 9-  9B A  A6  9+  5 9>9	>- 	 9
B>6 9*	  *
  B>5 = 5 =>BK   �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelpUIManagergetPositionpccconvertToWorldSpacegetParent ����

























step2 btn touchFun )pos  � 'Z�6  9= 6  9+  6 ' B' 6  99	&89
B.  -  9 9' B3  9B-   9 	 +
  B2  �K     cameraTogetPosition zhanyigetChildByName	view	namehomeStyleIdlocalPlayerHOMESTYLEdata.Config_UIrequiregetUILogicByNameUIManagersceneContextnewBieProxyGameGloballogic step2 newScene  (btn cameraToCb x 
y  
 �   2�3   6  9+  6 ' B' 6 99&89	B  X�6  9
  + BX�6  9
  + BK   ��returnHome	namehomeStyleIdlocalPlayerGameGlobalHOMESTYLEdata.Config_UIrequiregetUIByNameUIManager logic step2 cb  �  	 *�6     9  +  6 99B 4  5 > 6   96 99	6
 ' B99+  5 = -  =BK    callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUI headId�N	name香香	talkS远征西域中不仅可获取强化材料，还能掠夺大量丰厚物资。	namePLAYERSYSConfig_UIremoveUIUIManagerstep1 arr  � 	 1�3   4 5 >5 >5 >6  96 996	 '
 B99+  5 == BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkP强化宝物需消耗朱雀令，朱雀令可在远征西域中获取哦！ headId�N	name香香	talkY强化宝物可提升属性加成哦，强化到指定等级后还可进阶宝物。 headId�N	name香香	talkS宝物虽不能卖钱，但佩戴之后可为所有武将提供属性加成。 		

step1 touchFun arr  ]   &�-     9   - B -  B K     � 
touchtreasureLogic index stepExt4  � V��6     9  +  6 99B 6     9  +  6 99B .   )  ) -  9 ) M	�-  989	 X�  X�O�-  9
 9-  9 ! B 9' B 9B 96 9
 9B A  A3 6   9+  5	 9
>
	9
>
	 9
B
>
	6
 9

*  *  B
>
	5
 =
5 =
>
	B2  �K  ��       点击此处
param  123callBack  getContentSizeyxshowNewBieHelp getPositionpccconvertToWorldSpacegetParentpicgetChildByNamecellAtIndex_tableviewPLAYERSYSTREASURE
logicleftTablePLAYERSYSgetUILogicByName	nameZHANGURECHARGEINFOConfig_UIremoveUIUIManager����








treasureLogic stepExt4 index D
 
 
i cell ,btn (pos touchFun  �   �6     9  6 996 99, -  B K    	namePLAYERSYSConfig_UIsceneContextnewBieProxyGameGlobal
addUIUIManagerstepExt3  � =e�	6     9  +  6 99B    X�6     9  +  6 99B   9 ' B 9B 9	6
 9	 9B A  A3 6   9+  5 9	>	9	>	 9	B	>	6	
 9		*  *  B	>	5	 =	5
 =
	>	BK  	�       点击此处
param  123callBack  getContentSizeyxshowNewBieHelp getPositionpccconvertToWorldSpacegetParentButton_practicegetChildByNameWORLDMAPUI	nameHOMEUIConfig_UIgetUIByNameUIManager����	stepExt3 view +btn 'pos touchFun  �   )�6     9  +  6 ' B' 6 99&89B 
   X �6    9 	 -  + B X �6    9 
 -  + B K  
�returnWorldMapreturnHome	namehomeStyleIdlocalPlayerGameGlobalHOMESTYLEdata.Config_UIrequiregetUIByNameUIManagerstepExt2  �  	 -�4  5  > 5 6 99=> 5 > 6  96 99	6
 ' B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name香香	talkY乱世宝物不值钱，您就别做青天白日梦了。赶紧随我来看看吧！ headId����	talk2宝物？能卖钱吗？发达了发达了！	namelocalPlayerGameGlobal headId�N	name香香	talk)恭喜主公开启了宝物功能。
















stepExt1 arr  �   ���+   6  9 9+ B3 3 3 3 3 3 +  3	 3	
 3
 3 3 6  9 9)�� B2  �K  send_modifyNewbieLv           setGuidingnewBieProxyGameGlobal(>O_}��������������logic step6 step5 step4 step3 step2 step1 treasureLogic stepExt4 stepExt3 stepExt2 stepExt1 
step0 	 d   �6   9    9  *  B K  send_modifyNewbieLvnewBieProxyGameGlobal����̙�� �  	 3� 
-     9   ' B 4  5 > 5 > 6  96 996	 '
 B99+  5 = - =BK   ��callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkt升级与进阶神器都需要消耗神器碎片与陨铁，在巅峰对决中可以轻松获得这些材料。 headId�N	name香香	talkb神器进阶后可开启武魂，某些武魂可以为所有武将都提供属性加成哦！Shenqi_ButtonwigetTouched
attrLogic step7 arr  �  8U� 6     9  +  6 ' B99B .   -   9    9  ' B   9	 B 9
6 9  9 B A  A6   9+  5 9>9>	  9 B>6 9)	  *
  B>5 - =5 =>BK   ��       点击此处
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentShenqigetChildByName	view	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManager����attrLogic step6 btn 'pos  �   3_� 6     9  +  6 99B 9 :) 9  ) M	�9 89
 X�9 8X�O�6   96 9	9
6 ' B99+  5 =6	 ' B		 9		6 99B	=	-	  BK  �allHero
heroslocalPlayergetArraySortByBatPowerapp.uiLogic.CommonHeroInfo	hero  HEROATTRIBUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIready_Recruit_status _Activated_heroConfigsArray	nameHEROUIConfig_UIgetUILogicByNameUIManager













step5 heroLogic 	+firstHero )
 
 
i  �  	u�� 6     9  +  6 ' B99B 4  ) ) 9  ) M�9 89
 X� X�O�6 9	 B9
  9B9  6 9	 B6 9	9	 		 	 	B ! 5  =9
 
 9 B5  9	B		 9		6 9 9B A  A	9
	

=

 	
 X
�9
	



=
X
�9
	





=
6
 9

)h)� B
6   9+  5 9>9>>
6 9* * B>5 -  =5 =>BK           点击武将
param  123callBack  showNewBieHelp	sizexgetPositionpccconvertToWorldSpacegetParent x y setContentOffsety x "_Unactivated_heroConfigsArraycellAtIndex_heroList_tableview	ceil	mathready_Recruit_status _Activated_heroConfigsArray	nameHEROUIdata.Config_UIrequiregetUILogicByNameUIManager�T�������



step4 logic kpos jheroIndex i	 	 	i cellIndex Xcell SinactiveNum QoffsetY Doffset ?cellPos 9cellPos -size  /  � "3     BK  �  !!"step4 com  �  	 � 6     9  6 996 ' B99, -  B K    	nameHEROUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep3  � Z~� +   6   9B 9B6   9B99 X�6  9+  6 99	B9
 9' B  X�6  9+  6 99	B9
 9' B 9' B    9 B 96 9  9 B A  A6 9)d )d B3 6  9+  5 9	>	9	>	>6	 9		*  *  B	>	5	 =	5
 =
	>	BK  �       点击武将
param  123callBack  yxshowNewBieHelp 	sizegetPositionpccconvertToWorldSpacegetParentNodeMenuWORLDMAPUIButton_HerogetChildByName	view	nameHOMEUIConfig_UIgetUILogicByNameUIManagerHOMEUISCENEsceneNametblgetCurScenegetResourceManagerGameGlobal����step3 heroBtn Ypos <size com  �   $� 6     9  B   9  B 6   9B99  X �6     9  -  + B X �6     9  -  + B K  �returnWorldMapreturnHomeHOMEUISCENEsceneNametblgetCurScenegetResourceManagerGameGlobalstep2  �  	 '� 4  5  > 5 > 6  96 996 ' B9	9
+  5 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkw每个武将都拥有一件独特的神器，升级神器后可以获得大量属性加成，一起来看看吧！ headId�N	name香香	talk)恭喜主公开启了神器功能。stepExt1 arr  �  b�q+   3  3 3 3 3 3 3 3 6	 9				 9	
	*   B	2  �K  send_modifyNewbieLvnewBieProxyGameGlobal        ����̙��(L]eopppppppqqattrLogic step7 step6 step5 step4 step3 step2 stepExt1 
step1 	 d   � 6   9    9  *  B K  send_modifyNewbieLvnewBieProxyGameGlobal��̙���� �  	 $� 4  5  > 5 > 6  96 996 ' B9	9
+  5 = -  =BK   �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkh每次巅峰对决只可出战一名武将，胜利之后可获得对应的神器碎片与陨铁。 headId�N	name香香	talk�巅峰对决每次会随机刷新4名武将作为参赛者，主公招募的武将越多，可参赛的机会就越多哦！step6 arr  � 		 �!6   96 996 ' B99, -  BK    	nameHEROVSHEROdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep5 param   � Bo� 6     9  6 6 6 ' B9B 6    9  +  6 ' B9	9
B 9  9) B 9B 96 9	 9B A  A4  )� =)s=3 6  9+  5	 9
>
	9
>
	>	6
 9

)  *  B
>
	5
 =
5 =
>
	BK  �       点击此处
param  123callBack  yxshowNewBieHelp height
widthgetPositionpccconvertToWorldSpacegetParentcellAtIndex_tableview	nameWORLDWARUIdata.Config_UIgetUILogicByNameINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvremoveEventEventManager��̙����
step5 logic .btn )pos size touchFun  � 
 /�!6   96 6 6 ' B9-  B6 ' B96  9	6
 999,	 BK    	namesceneContextnewBieProxyGameGlobal
addUIWORLDWARUIdata.Config_UIINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManagerstep4 param  conf 
 � *F�!3   -  9B 96 9-  9B A  A6  9+  5 9>9	>- 	 9
B>6 9*	  *
  B>5 = 5 =>BK    �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelpUIManagergetPositionpccconvertToWorldSpacegetParent ����

























step4 btn touchFun )pos  �  !K�!6     9  +  6 ' B' 6 99&89B 9	  9
' B3  9B  9  	 +
  B2  �K  �cameraTogetPosition zhanyigetChildByName	view	namehomeStyleIdlocalPlayerGameGlobalHOMESTYLEdata.Config_UIrequiregetUILogicByNameUIManagerstep4 logic btn cameraToCb x 	y  	 �  
 &�!6     9  +  6 ' B' 6 99&89B    X �6    9 	 -  + B X �6    9 	 -  + B K  �returnHome	namehomeStyleIdlocalPlayerGameGlobalHOMESTYLEdata.Config_UIrequiregetUIByNameUIManagerstep3  �  	 "�!4  5  > 6  96 996 ' B99	+  5
 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkD香香：主公，巅峰对决开启了，赶紧来看看吧！step2 arr  �  	@� ?3   3 3 3 3 3 6 9 9*	  
 B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal      ��̙����07=>>>>>>>??step6 step5 step4 step3 step2 
step1 	 ;   �!6   *  8  B K  NewbieForLv��̙���� �  �!6  9 9  B6  9 9) -  BK   �canNotClickScreenForSecnewBieProxyMODULE_HERO_acqMountheroProxyGameGlobalstep6 arr   � 
�!6  9 9-  *  ) )# BK    "send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal����̙��step5 param   � 4f�!
6     9  +  6 99B 9  9' B 9B 9	6
 9	 9B A  A 9B3 6   9+  5	 9
>
	9
>
	>	6

 9

*  *  B
>
	5
 =
5 =
>
	BK  �       点击此处
param  123callBack  yxshowNewBieHelp getContentSizegetPositionpccconvertToWorldSpacegetParentButton_SubmitgetChildByName	view	namePLAYERSYSMOUNTCHANGESHOWConfig_UIgetUILogicByNameUIManager����
step5 mountLogic 	,btn 'pos size touchFun  �   �!6     9  6 996 99, -  B K  �	namePLAYERSYSMOUNTCHANGESHOWConfig_UIsceneContextnewBieProxyGameGlobal
addUIUIManagerstep4  �  	 %2�!4  5  '  96 99B=> 5 6 99=> 5 > 6	  9
6 996 ' B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name香香	talkh别感慨了，师父近日刚传授我一套驯养坐骑的秘诀，或许可以帮到主公哦！ headId����	talk_苍天啊！大地啊！光腿跑了那么多年，终于要上马了。（双目泛泪）	talk	namelocalPlayerGameGlobalformat�奉天承运，皇帝诏曰：%s奔波四方，平乱安邦，朕深感欣慰。今特赐良驹一匹，以慰卿心。钦此！ headId�'	name钦差																	step3 arr  �   �!6     9  +  6 99B 6    9  -  + B K  �returnWorldMapGameGlobal	nameLEVELUPConfig_UIremoveUIUIManagerstep2  �  N�!/6   9  9  )    X �6   9    9  *  B 2 �3  3 3 3 3	 3
 6  9 9*	 
 B2  �K  K        send_modifyNewbieLvnewBieProxymountIdlocalPlayerGameGlobal͙���̐�����̙��	)-.......//step6 step5 step4 step3 step2 
step1 	 �  �!6  9 9  B6 *  8BK  NewbieForLv MODULE_PLAYER_addNewbieItemnewBieProxyGameGlobal͙���̐�arr   � 	 �!3   6 9 9  *  ) ) ) BK  "send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal ��̙����com  �  	 &�!4  5  > 5 > 5 > 6  96 996 '	 B9
9+  5 = -  =BK   �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talk}哎呀呀，不愧是御赐之物，真是匹世间罕见的良驹呢。就让香香来帮主公驯养这匹良驹吧！ headId�N	name香香	talkS经过驯养之后，坐骑还可在战场中与武将一起进攻敌人哦！ headId�N	name香香	talkq坐骑乃是武将在战场上最好的伙伴，拥有坐骑后，即可为所有武将提供属性加成。step2 arr  �  �!3   3 6 9 9*   B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal  ��̙����step2 
step1 	 d   �!6   9    9  *  B K  send_modifyNewbieLvnewBieProxyGameGlobal͙���̐� �  	 *�!
4  5  > 5 > 5 > 5 > 5 > 6  96 99	6
 ' B99+  5 = -  =BK   �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkM好了，这便是驯养秘诀。其他的就靠主公自行摸索吧！ headId�N	name香香	talkM坐骑还可通过幻化来随意更换外观，是不是很方便呢？ headId�N	name香香	talkb驯养进度满了之后坐骑将自动进阶，进阶后会获得新的外观和特性哦！ headId�N	name香香	talk8每次驯养都可以提升武将加成属性哦！ headId�N	name香香	talk\嘻嘻，其实驯养坐骑也不是很难了，只要将灵丹喂给坐骑就好了。
step6 arr  �  8b�"6     9  +  6 99B 9  9' B 9' B 9	B 9
6 9	 9B A  A99 9B6   9+	  5
 >
>
>
6 9*  *  B>
5 -  =5 =>
BK  �       
param  123callBack showTimeshowNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentButton_OnechildNodegetChildByName	view	namePLAYERSYSConfig_UIgetUILogicByNameUIManager����step5 logic 	0btn 	'pos x y size  [   $�"-     9   - B -  B K   ��  
touchplayersysLogic index step4  � I��"6     9  +  6 99B ) ) 9  ) M�9 89 X� X�O�9  9	9  !B 9
' B 9B 96 9 9	B	 A  A3 6   9+	  5
 9>
9>
 9B>
6 9*  *  B>
5 =5 =>
B2  �K  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelp getPositionpccconvertToWorldSpacegetParentpicgetChildByNamecellAtIndex_tableviewPLAYERSYSSADDLE
logicleftTable	namePLAYERSYSConfig_UIgetUILogicByNameUIManager����							



step4 playersysLogic 	Aindex @	 	 	i cell ,btn (pos touchFun  �   �"6     9  6 996 99, -  B K    	namePLAYERSYSConfig_UIsceneContextnewBieProxyGameGlobal
addUIUIManagerstep3  � 3X�"6     9  +  6 99B   9 ' B 9B 96	 9
	 9B A  A3 6   9+  5 9	>	9	>	 9	B	>	6		 9	
	*  *  B	>	5	 =	5
 =
	>	BK  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelp getPositionpccconvertToWorldSpacegetParentButton_practicegetChildByName	nameWORLDMAPUIConfig_UIgetUIByNameUIManager����step3 view 	+btn 'pos touchFun  Q   �"6     9  -  + B K  �returnWorldMapGameGlobalstep2  �  	@�!B3   3 3 3 3 3 6 9 9*	  
 B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal      ͙���̐�2<@AAAAAAABBstep6 step5 step4 step3 step2 
step1 	 d   �"6   9    9  *  B K  send_modifyNewbieLvnewBieProxyGameGlobal�̙��搂 �  	 (�"4  5  > 5 6 99=> 6  96 996	 '
 B99+  5 = -  =BK   �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId����	talk5哇哈哈哈，金银财宝，本大爷来啦！	namelocalPlayerGameGlobal headId�N	name香香	talkY主公，此地虽藏有无数珍宝，却也危险重重，请主公小心行事。step6 arr 
 [   	�"-     9   ' ) B -  B K   �  battle
touchtowerLogic step5  �  7i�"
6     9  +  6 99B 9  9' B 9B 9	6
 9	 9B A  A6
 9)� ),B3 6   9+  5	 9
>
	9
>
	>	6

 9

)  )  B
>
	5
 =
5 =
>
	B2  �K  �       点击此处
param  123callBack  yxshowNewBieHelp 	sizegetPositionpccconvertToWorldSpacegetParent
Node1getChildByName	view	nameTOWERCHALLENGEConfig_UIgetUILogicByNameUIManager																						

step5 towerLogic 	/btn *pos size touchFun  �  	 �"6     9  6 996 ' B99, -  B K    	nameTOWERCHALLENGEdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep4  � F|�"6     9  6 6 6 ' B9B 6    9  +  6 9	9
B 5 9  9 B9  9) B 9B 96 9
 9B A  A4  )� =)s=3 6  9+	  5
 9>
9>
>
6 9*  * B>
5 =5 =>
BK  �       点击此处
param  123callBack  yxshowNewBieHelp height
widthgetPositionpccconvertToWorldSpacegetParentcellAtIndexsetContentOffset_tableview x����y 	nameWORLDWARUIConfig_UIgetUILogicByNameINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvremoveEventEventManager��̙�����̙����												
step4 logic 4offset 3btn 
)pos size touchFun  � 
 /�"6   96 6 6 ' B9-  B6 ' B96  9	6
 999,	 BK    	namesceneContextnewBieProxyGameGlobal
addUIWORLDWARUIdata.Config_UIINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManagerstep3 param  conf 
 � *F�"
3   -  9B 96 9-  9B A  A6  9+  5 9>9	>- 	 9
B>6 9*	  *
  B>5 = 5 =>BK    �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelpUIManagergetPositionpccconvertToWorldSpacegetParent ����																										
step3 btn touchFun )pos  �  I�"6     9  +  6 ' 6 99&89B 9  9	'
 B3  9B  9  	 +
  B2  �K  �cameraTogetPosition zhanyigetChildByName	view	namehomeStyleIdlocalPlayerGameGlobalHOMESTYLEConfig_UIgetUILogicByNameUIManagerstep3 logic btn cameraToCb x 	y  	 �  	 #0�"4  5  > 5 6 99=> 5 > 5 6 99=> 6  96 9	9
6 ' B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId����	talkM哼，管他什么奇怪不奇怪，敢阻挡俺寻宝，死路一条！ headId�N	name香香	talkq别高兴太早了，黄巾军似乎在藏宝地中施展了幻术，出现了不少……奇怪的守卫。 headId����	talk8黄巾宝藏？？？哇哈哈，发！财！啦！	namelocalPlayerGameGlobal headId�N	name香香	talkJ启禀主公，探子在城外发现了黄巾反贼的藏宝之处！					step2 arr  M   �#6     9  -  + B K  �returnHomeGameGlobalstep1  �  
I�"V3   3 3 3 3 3 3 6 9	 9	*
   B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal       �̙��搂.@OSUUUUUUUVVstep6 step5 step4 step3 step2 step1 
step0 	 �  �#6  9 9  B6 *  8BK  NewbieForLv MODULE_PLAYER_addNewbieItemnewBieProxyGameGlobal��̙����arr   � 	 �#3   6 9 9  *  ) ) ) BK  "send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal ����̙��com  �  	 -:�#4  5  > 5 6 99=> 5 > 5 6 99=> 5 > 5 6 99=> 5	 > 6
  96 996 ' B99+  5 = -  =BK   �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name香香	talkY……算了算了，我叫人准备了几件装备，主公你先穿上再说吧！ headId����	talke我…我…我真不知道啊，你以前也没告诉我，再说…这也不符合逻辑啊！ headId�N	name香香	talk\你是不是傻呀，穿戴装备可以为麾下将士提供属性加成你不知道？ headId����	talk;废话，我又不上阵杀敌，穿装备有何用？ headId�N	name香香	talkM主公您征战沙场如此长的时间，为何从不佩戴装备呢？ headId����	talk什么问题？	namelocalPlayerGameGlobal headId�N	name香香	talk8主公，我突然发现一个很奇怪的问题。
















step3 arr  �   �#6     9  +  6 99B 6    9  -  + B K  �returnWorldMapGameGlobal	nameLEVELUPConfig_UIremoveUIUIManagerstep2  �  %�#3   3 3 6 9 9*   B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal   ����̙��step3 step2 
step1 	 � �#6  9 9  ) -  B6 *  8BK    NewbieForLvMODULE_HERO_equipChangeheroProxyGameGlobal͙���̤�itemId arr   �  7�#)  -  9 :9. 6 9 9- *  6 96 9	  
 BK   �  �MODULE_HERO_equipChangeMODULE_HEROmsgType"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobalid
infos��̙����logic itemId complete part id  � ?x�#6     9  +  6 99B 3 3 9  99	  B 9
' B 9
' B 9B 96 9 9
B
 A  A6   9+	  5
 9>
9>
 9B>
6 9* * B>
5 =5 =>
B2  �K   �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentButton_1
node1getChildByNamecellNumcellAtIndex_tableviewRank  	namePLAYERSYSEQUIPCHANGEConfig_UIgetUILogicByNameUIManager����itemId logic 	7complete 6touchFun 5cell /btn 'pos  �  (�#9 6 ' B99  X�6  96 B-  BK    NewbieForLvremoveEventsEventManagerPLAYERSYSEQUIPCHANGEdata.Config_UIrequire	namestep6 object  param   � 	 -�#
3   6  96 6 6 ' B9  B6  96	 9
 9B 9B6 99+  5 BK     	part	namePLAYERSYSEQUIPCHANGEConfig_UIgetRunningScenegetInstanceDirectorcc
addUIADDapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManager 																	
step6 shown  � 6e�#3   6  9+  6 99B999 9	'
 B 9B 96 9
 9B A  A6  9+  5 9	>	9	>	 9	B	>	6	 9		*  *  B	>	5	 = 	5
 =
	>	BK  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParente1getChildByName	view
logiccurLogics	namePLAYERSYSConfig_UIgetUILogicByNameUIManager ����step6 touchFun 5playersysLogic -btn &pos  �  	 $�#4  5  > 5 > 6  96 996 ' B9	9
+  5 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkP穿戴装备之后，所有主公麾下的将士均可获得属性提升。 headId�N	name香香	talkc装备共分8个部位，每个部位均可穿戴一件装备，并获得对应装备属性。step5 arr  Z   #�#-     9   - B -  B K   ��  
touchtreasureLogic index step4  � Q��#6     9  +  6 99B 6     9  +  6 99B ) ) 9  ) M�9 89	 X� X�O�9
  99  !B 9' B 9B 96 9 9	B	 A  A3 6   9+	  5
 9>
9>
 9B>
6 9*  *  B>
5 =5 =>
B2  �K  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelp getPositionpccconvertToWorldSpacegetParentpicgetChildByNamecellAtIndex_tableviewPLAYERSYSEQUIP
logicleftTablePLAYERSYSgetUILogicByName	nameZHANGURECHARGEINFOConfig_UIremoveUIUIManager����






step4 treasureLogic Aindex @	 	 	i cell ,btn (pos touchFun  �   �#6     9  6 996 99, -  B K    	namePLAYERSYSConfig_UIsceneContextnewBieProxyGameGlobal
addUIUIManagerstep3  � =b�#6     9  +  6 99B    X�6     9  +  6 99B   9 ' B 9B 9	6
 9	 9B A  A3 6   9+  5 9	>	9	>	 9	B	>	6	
 9		*  *  B	>	5	 =	5
 =
	>	BK  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelp getPositionpccconvertToWorldSpacegetParentButton_practicegetChildByNameWORLDMAPUI	nameHOMEUIConfig_UIgetUIByNameUIManager����step3 view +btn 'pos touchFun  �  A�#K+   3  3 3 3 3 6 9 9*	  
 B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal     ��̙����$+>GIIIIIIIKKitemId step6 step5 step4 step3 
step2 	 � �$6  9 9  ) -  B6 *  8BK    NewbieForLvMODULE_HERO_equipChangeheroProxyGameGlobal�̙��椂itemId arr   �  7�$)  -  9 :9. 6 9 9- *  6 96 9	  
 BK   �  �MODULE_HERO_equipChangeMODULE_HEROmsgType"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobalid
infos͙���̤�logic itemId complete part id  � ?x�#6     9  +  6 99B 3 3 9  99	  B 9
' B 9
' B 9B 96 9 9
B
 A  A6   9+	  5
 9>
9>
 9B>
6 9* * B>
5 =5 =>
B2  �K   �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentButton_1
node1getChildByNamecellNumcellAtIndex_tableviewRank  	namePLAYERSYSEQUIPCHANGEConfig_UIgetUILogicByNameUIManager����itemId logic 	7complete 6touchFun 5cell /btn 'pos  �  (�$9 6 ' B99  X�6  96 B-  BK    NewbieForLvremoveEventsEventManagerPLAYERSYSEQUIPCHANGEdata.Config_UIrequire	namestep3 object  param   � 	 -�$
3   6  96 6 6 ' B9  B6  96	 9
 9B 9B6 99+  5 BK     	part	namePLAYERSYSEQUIPCHANGEConfig_UIgetRunningScenegetInstanceDirectorcc
addUIADDapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManager 																	
step3 shown  � 6e�$3   6  9+  6 99B999 9	'
 B 9B 96 9
 9B A  A6  9+  5 9	>	9	>	 9	B	>	6	 9		*  *  B	>	5	 = 	5
 =
	>	BK  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParente3getChildByName	view
logiccurLogics	namePLAYERSYSConfig_UIgetUILogicByNameUIManager ����step3 touchFun 5playersysLogic -btn &pos  �   %Q�$6     9  +  6 99B 6     9  +  6 99B ) ) 9  ) M�9 89	 X� X�O�  9
  B-  BK    
touchPLAYERSYSEQUIP
logicleftTablePLAYERSYSgetUILogicByName	nameZHANGURECHARGEINFOConfig_UIremoveUIUIManager



step2 treasureLogic index 	 	 	i  � 

 3�$6     9  +  6 99B    X�3 6   96 99	6 99, 	 BX�-  BK  �sceneContextnewBieProxyGameGlobal
addUI 	namePLAYERSYSConfig_UIgetUILogicByNameUIManagerstep2 logic 	opened  � 	 /�#=+   3  3 3 6 9 9*   B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal   ͙���̤�$;<<<<<<<==itemId step3 step2 
step1 	 �  �$) 6  9 9   B6 *  8BK  NewbieForLvMODULE_HERO_equipLevelUpheroProxyGameGlobal����arr  part  �  )�$)  ) 6  9 9-  *  6 96 9	  
 BK  �MODULE_HERO_equipLevelUpMODULE_HEROmsgType"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal�̙��椂complete part times  �  8��$6     9  +  6 99B 9 99 9'	 B3
 3  9B 96	 9		 9B A	  A6  	 9+
  5 9>9> 9B>6 9*  *  B>5 =5 =>B2  �K         点击此处
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParent  Button_1getChildByName
node2
logiccurLogics	namePLAYERSYSConfig_UIgetUILogicByNameUIManager����playersysLogic 	0playerSysEquLogic .node2 -btn )complete (touchFun 'pos  �  >t�$	-   ) =  -     9  ) B 6    9  +  6 99B 9 99	 9
' B 9B 96 9	 9B A  A6  9+  5 9>9>
 9B>6 9*
  *  B>5 -	 =	5	 =	>BK  �         点击此处
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParente3getChildByName	view
logiccurLogics	namePLAYERSYSConfig_UIgetUILogicByNameUIManagerinitRightcurEquip����	playerSysEquLogic step3 playersysLogic .btn 'pos  � 9|�$6     9  +  6 99B 9 93 9 99 9	'
 B 9B 96 9 9	B	 A  A6   9+  5	 9
>
	9
>
	 9
B
>
	6
 9

*  *  B
>
	5
 =
5 =
>
	B2  �K   �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentButton_i2getChildByName	view 
logiccurLogics	namePLAYERSYSConfig_UIgetUILogicByNameUIManager����step3 playersysLogic 	1playerSysEquLogic /touchFun .btn 'pos  �   %Q�$6     9  +  6 99B 6     9  +  6 99B ) ) 9  ) M�9 89	 X� X�O�  9
  B-  BK    
touchPLAYERSYSEQUIP
logicleftTablePLAYERSYSgetUILogicByName	nameZHANGURECHARGEINFOConfig_UIremoveUIUIManager



step2 treasureLogic index 	 	 	i  � 

 3�$6     9  +  6 99B    X�3 6   96 99	6 99, 	 BX�-  BK  �sceneContextnewBieProxyGameGlobal
addUI 	namePLAYERSYSConfig_UIgetUILogicByNameUIManagerstep2 logic 	opened  �  	 "�$4  5  > 6  96 996 ' B99	+  5
 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkY通过强化与精炼，可以提升部位属性加成，让装备更加强力哦！step1 arr  � 	 .�$D3   3 3 3 6 9 9*   B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal    �̙��椂%<BCCCCCCCDDstep3 step2 step1 
step0 	 M    �%6   9    9  B K  onlyCheckLvnewBieProxyGameGlobal � 	
 �%6   96 9996 ' B99	, -  BK    	nameSHOPEQUIPENTRYdata.Config_UIrequireuiLayersceneContextnewBieProxyGameGlobal
addUIUIManagerstep5 param   � :n�%6     9  +  6 ' B' 6 99&89B   9	 '
 B 9B 96 9	 9B A  A99 9B3 6  	 9+
  5 >>>6 9*  *  B>5 =5 =>BK   �       
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParentbutton_shop2getChildByName	namehomeStyleIdlocalPlayerGameGlobalHOMESTYLEdata.Config_UIrequiregetUIByNameUIManager����	step5 view +btn 'pos x y size touchFun  �   G�%6     9  +  6 ' B' 6 99&89B 9	  9
' B 9B  9   +	 -
  BK  �cameraTogetPositionbutton_shop2getChildByName	view	namehomeStyleIdlocalPlayerGameGlobalHOMESTYLEdata.Config_UIrequiregetUILogicByNameUIManagerstep4c viewLogic btn posX posY   N   �%6     9  -  + B K  �returnHomeGameGlobalstep4b  �  9�%) 6  9 9   B4 5 >5 >6  96  996	 '	
 B99+  5	 =	-
  =
	BK    callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name香香	talkb对了主公，神工铺开业了，随我去看看吧！说不定能挑到称心的装备！ headId�N	name香香	talkM这便是装备的妙用，其他功能待主公日后慢慢发掘吧！MODULE_HERO_equipLevelUpheroProxyGameGlobalstep4 arr   part arr  �  )�%)  )
 6  9 9-  *  6 96 9	  
 BK  �MODULE_HERO_equipLevelUpMODULE_HEROmsgType"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal����complete part times  � 8��%6     9  +  6 99B 9 99 9'	 B3
 3  9B 96	 9		 9B A	  A6  	 9+
  5 9>9> 9B>6 9*  *  B>5 =5 =>B2  �K  �       点击此处
param  123callBack  getContentSizeyxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParent  Button_2getChildByName
node2
logiccurLogics	namePLAYERSYSConfig_UIgetUILogicByNameUIManager����step4 playersysLogic 	0playerSysEquLogic .node2 -btn )complete (touchFun 'pos  r   $�%-   ) =  -     9  ) B -  B K  �  initRightcurEquipplayerSysEquLogic step3  �  F�%	6     9  +  6 99B 9 93  B2  �K  � 
logiccurLogics	namePLAYERSYSConfig_UIgetUILogicByNameUIManager		step3 playersysLogic 	playerSysEquLogic touchFun  �   %Q�%6     9  +  6 99B 6     9  +  6 99B ) ) 9  ) M�9 89	 X� X�O�  9
  B-  BK    
touchPLAYERSYSEQUIP
logicleftTablePLAYERSYSgetUILogicByName	nameZHANGURECHARGEINFOConfig_UIremoveUIUIManager



step2 treasureLogic index 	 	 	i  � 

 3�%6     9  +  6 99B    X�3 6   96 99	6 99, 	 BX�-  BK  �sceneContextnewBieProxyGameGlobal
addUI 	namePLAYERSYSConfig_UIgetUILogicByNameUIManagerstep2 logic 	opened  �  
K�%U3   3 3 3 3 3 3 6 9	 9	*
   B2  �K  send_modifyNewbieLvnewBieProxyGameGlobal       ����2<STTTTTTTUUstep5 step4c step4b step4 step3 step2 
step1 	 �  �%6  9 9  B6 *  8BK  NewbieForLv MODULE_PLAYER_addNewbieItemnewBieProxyGameGlobal����ׂ̙arr   � 	 �%3   6 9 9  *  ) ) ) BK  "send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal ͙���ׂcom  t   &�%-     9   B -    9   B -  B K  � �  removeFromParent_Text_2 blackRect stepExt  �	 *���%6     9  6 996 96  99 6  99	 6  996	  9		9					B5 6 9
)  )	  )
  )� B=6 9
)  )	  )
  )  B=, *	 B 	6 9 9B 9' B 9)( B 9' B 9' B 96  96  9B 9) ) B 9* * B 96 9)� )� )	� )
  B A 9)� )d B6 99 9  B 9!* B 9")  B3# 6 9$ 96 9% 9)	 B6 9&	 9)
 B6 9'
 9) B6	 9	(		 9		 B	 A 9) B2  �K   �runActionCallFuncFadeOutDelayTimeFadeInSequence setOpacitysetLocalZOrderaddChildsetContentSizec4bsetColorsetAnchorPointsetScaleCenterYCenterXsetPositionText_2setName三日之后setStringsetFontSizesimhei.ttfsetFontNamecreate	Text	ccuiborderColorfillColor borderWidth	nameTALKBOXc4fheight
widthActualDesignSize	rectccsceneContextnewBieProxyGameGlobalcreateRectUIManager����
��z��������						



stepExt blackRect .i_Text_2 dcom A#fade  �  	 %2�%4  5  > 5 6 99=> 5 > 5 > 6  96 9	9
6 ' B99+  5 = -  =B6 9	 9)'BK  �canNotClickScreenForSeccallBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name香香	talke我去帮你筹办后宫事宜，你自己去找合适的人选，三天之后便帮你完婚。 headId�N	name香香	talke……唉，果然还是一副白痴模样，罢了罢了，谁让师父将你托付于我呢。 headId����	talk�等了好久终于等到今天，我每天都在考虑啊，可是你们谁都不提我也不好意思，终于…终于……	namelocalPlayerGameGlobal headId�N	name香香	talkV主公，如今天下即将平定，您也该考虑自己的终生大事了吧？		
step2 arr  L   "�%63   3 3  B2  �K     %45566stepExt step2 step1  �   �&6   9    9  )  B 6  *  8  B K  NewbieForLvcanNotClickScreenForSecnewBieProxyGameGlobal�̙���ׂ � (�&6  9 9  -  B6 9- ) B6  9 9*  BK  �  canNotClickScreenForSecnewBieProxyperformWithDelayGlobalschedulerMODULE_BEAUTY_openBeautyqueenProxyGameGlobal��queenId step6 arr   � 	'�&6  9 9-  *  6 96 9- BK  ��MODULE_BEAUTY_openBeautyMODULE_BEAUTYConst_MsgType"send_modifyLvNewbieAndCallFunnewBieProxyGameGlobal����ׂ̙complete queenId param   �  ;��&6     9  +  6 ' B99B 9  9)  B 9B 9	6
 9	 9B A  A6
 9)� )�B)�3 3 6  	 9+
  5 9>9>>6
 9)  )  B>5 =5 =>B2  �K   �       点击此处
param  123callBack  yxshowNewBieHelp  	sizegetPositionpccconvertToWorldSpacegetParentcellAtIndex_tableview	nameQUEENMAINUIdata.Config_UIrequiregetUILogicByNameUIManager
step6 taskLogic 1cell ,pos  size queenId complete touchFun  �  	 (�&4  5  > 5 6 99=> 6  96 996	 '
 B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId����	talk#新娘子就是……你啊！	namelocalPlayerGameGlobal headId�N	name香香	talk}这便是后宫，主公日后只需收集佳丽信物，即可在后宫中迎娶佳丽。咦，新娘子去哪里了？step5 arr 
 �   �&6     9  6 6 6 ' B9B -   B K    INITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvremoveEventEventManagerstep4  �
 3�&3  6  96 6 6 '	 B9 B6  96	 9
96 ' B99, BK    	nameQUEENMAINUIdata.Config_UIsceneContextnewBieProxyGameGlobal
addUIINITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvaddEventEventManager step4 param  initCom  � Cw�&6   9    9  )  B 6    9  +  6 99B    X�6    9  +  6 99B   9	 '
 B 9B 96 9	 9B A  A99 9B3 6 	 9+
  5 >>>6 9*  *  B>5 =5 =>BK  �       
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParentButton_queengetChildByNameWORLDMAPUI	nameHOMEUIConfig_UIgetUIByNameUIManagercanNotClickScreenForSecnewBieProxyGameGlobal����step4 view +btn 'pos x y size touchFun  �  	 #�&4  5  > 6  96 996 ' B99	+  5
 = -  =BK  �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkP呼，终于忙完了，主公随我来吧，我这便带你前往后宫！step3b arr  �   $�&6     9  B   9  B 6   9B99  X �6     9  -  + B X �6     9  -  + B K  �returnWorldMapreturnHomeHOMEUISCENEsceneNametblgetCurScenegetResourceManagerGameGlobalstep3  w   
>�&>3   3 3 3 3 3  B2  �K        /5<==>>step6 	step5 step4 step3b step3 stepExt  �  �&6  9 9  B6 *  8BK  NewbieForLvMODULE_BEAUTY_giveBeautyqueenProxyGameGlobal��̙��ׂarr   � 
B�&6   9  9  -  8  9 3 6  9 9 *  6 96	 9			
 - ) B	K    �MODULE_BEAUTY_giveBeautyMODULE_BEAUTYConst_MsgType"send_modifyLvNewbieAndCallFunnewBieProxy uIdqueenListqueenProxyGameGlobal�̙���ׂqueenId itemId oneQueen uId complete  � X��&)  +  ) ) ) M�6  -  8986 9 9	 B)   X�  X�O�6  9+  6 ' B9	9
B9 9' B 9'   &B 9' B 9B 96 9 9	B	 A  A 9B3 6 	 9+
  5 9>9>>6 9*  *  B>5 =5 =>B2  �K   �       返回
param  123callBack  yxshowNewBieHelp getContentSizegetPositionpccconvertToWorldSpacegetParentButton_1ProjectNode_Node_16getChildByName	view	nameQUEENATTRLAYERdata.Config_UIrequiregetUILogicByNameUIManagergetItemNumByIdlocalPlayerGameGlobalawardIdsConfig_Beauty����	queenId index WitemId V  i itemNum uiLogic 7btn (pos size touchCb  �  	 7F�&-   9     9  ' B   9  + B -   9     9  ' B   9  + B -   9     9  ' B   9  ' B   9  + B -   9     9  ' B   9  ' B   9  + B -     9  B -  B K   �  updateAwardNodeText_36Image_26Node_powerNode_16setVisibleNode_TalentgetChildByName	viewuiLogic step4  � ;i�&6     9  +  6 ' B99B 9  9' B 9'	 B 9
B 96 9	 9B A  A 9B3 6   9+  5	 9
>
	9
>
	>	6
 9

*  *  B
>
	5
 =
5 =
>
	B2  �K  �       返回
param  123callBack  yxshowNewBieHelp getContentSizegetPositionpccconvertToWorldSpacegetParentButton_20Node_TalentgetChildByName	view	nameQUEENATTRLAYERdata.Config_UIrequiregetUILogicByNameUIManager����step4 uiLogic 1btn 	(pos size touchCb  �  	 -:�&4  5  > 5 6 99=> 5 > 5 > 5 6 99=> 5 > 5	 6 99=> 6
  96 996 ' B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId����	talk 我了解…我了解…… headId�N	name香香	talkP（挥拳）笨蛋，说得这么明显了你还不知道要做什么吗？ headId����	talk 不敢动…不敢动…… headId�N	name香香	talke用天赋点升级天赋后，可为夫君麾下指定武将提供加成哦，感不感动呢？ headId�N	name香香	talke除了宠爱佳丽之外，还能赏赐她们，借此提升魅力值，获得佳丽天赋点。 headId����	talk2（垂头丧气）您继续…您继续……	namelocalPlayerGameGlobal headId�N	name香香	talkD夫君，在这后宫可不是完全用来做羞羞之事哦！
















step3 arr  �  !O�')�6  9986  96 9 9B 9B6	 '	
 B99+  5	 =	6
 -  -  9B
=
	-
 BK   �  callBackupdateUIhandleroneQueen  	nameQUEENATTRLAYERdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagerqueenListqueenProxyGameGlobaltaskLogic step2 param  "queenId  oneQueen  �  9k�'6     9  +  6 ' B99B 9  9)  B 9B 9	6
 9	 9B A  A6
 9)� )�B3 6   9+  5	 9
>
	9
>
	>	6

 9

)  )  B
>
	5
 =
5 =
>
	B2  �K  �       点击此处
param  123callBack  yxshowNewBieHelp 	sizegetPositionpccconvertToWorldSpacegetParentcellAtIndex_tableview	nameQUEENMAINUIdata.Config_UIrequiregetUILogicByNameUIManager	





















step2 taskLogic /cell *pos size touchFun  �	  	 1>�'4  5  > 5 6 99=> 5 6 99=> 5 > 5 6 99=> 5 > 5	 6 99=> 6
  96 996 ' B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId����	talkV不会吧，洞房花烛也要来一套引导吗……苍天啊，放过我吧！ headId�N	name香香	talkt别乱叫，你想让全城的人都听到吗！赶紧随我进后宫吧，还有一些事需向你交代…… headId����	talkn嘻嘻，没事，很快我就会把她变成你的姐……哇我的肚子，救命啊谋杀亲夫啦！ headId�N	name香香	talkG我…我…我一直以为你更喜欢貂蝉姐姐一些呢…… headId����	talk\今天，总算凑齐了能迎娶你的信物，怎么，香香你不愿嫁给我吗？ headId����	talk�嘻嘻，从见到你的第一面起我就默默发誓一定要娶你为妻，所以一直在暗中偷偷收集你的信物。	namelocalPlayerGameGlobal headId�N	name香香	talkP哇哇哇哇，你这个大色狼从哪里收集到这么多我的碎片！
















step1 arr   �   �'6     9  6 6 6 ' B9B -   B K  �INITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvremoveEventEventManageruiOpened  �   0z�&`) �3  3 3 3 3 6  9+	  6
 ' B
9
	
9


B  X�3 6 
 96 6 6 ' B9 B6 
 96 996 ' B9	9
, BX� B2  �K  sceneContextnewBieProxyGameGlobal
addUIINITCOMPLETEapp.event.UIManagerEventNewbieForLvaddEventEventManager 	nameQUEENMAINUIdata.Config_UIrequiregetUILogicByNameUIManager     .:FSTTTTTTTTTTUUZ[[[[[[[[[[[\\\\\\\\\\\\\\^^``queenId /step4 .step3 -step2 ,step1 +uiOpened *uiLogic 
 initCom  �   �'6     9  +  6 ' B99B 6  *  8  B K  NewbieForLv	nameQUEENTALENTLAYERdata.Config_UIrequireremoveUIUIManager��ׂ �  6X�'6     9  +  6 ' B99B 9  9' B 9	B 9
B 96 9
 9B A  A6   9+  5 9	>	9	>	>6	 9		*  *  B	>	5	 -
  =
	5
 =
	>	BK  �       点击此处
param  123callBack  yxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentgetContentSizeButton_1getChildByName	view	nameQUEENTALENTLAYERdata.Config_UIrequiregetUILogicByNameUIManager����step4 logic ,btn 'size $pos  �  
�'6  9 9  -  B- BK     !MODULE_BEAUTY_upBeautyTalentqueenProxyGameGlobalskillId step3 arr   �  #^�')  )�6  99896  96 )�89' +	 B:.  ) 6  9	 9
- *	  6
 9

6 9 -   B	K     �!MODULE_BEAUTY_upBeautyTalentMODULE_BEAUTYConst_MsgType"send_modifyLvNewbieAndCallFunnewBieProxy,talentSkillIdsConfig_Beauty
splitStringUtiluIdqueenListqueenProxyGameGlobal��̙��ׂskillId complete uId "queenId !oneQueen uId upNum  �  @h�'6     9  +  6 ' B99B 9  99   B 9	'
 B 9	' B 9B 9B 96 9 9	B	 A  A6   9+  5	 9
>
	9
>
	>	6
 9

* * B
>
	5
 -  =
5 =
>
	BK  �       点击此处
param  123callBack  yxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentgetContentSizeButton_1	NodegetChildByNameskillscellAtIndex_tableview	nameQUEENTALENTLAYERdata.Config_UIrequiregetUILogicByNameUIManager����com2 logic 6cell /btn 'size $pos  �  [�'3   3 3 )�6 9986  96 9	
 9
B
 9B6	 ' B	9		9		+
  5 = B2  �K  ��oneQueen  	nameQUEENTALENTLAYERdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagerqueenListqueenProxyGameGlobal   skillId step3 complete com2 com queenId oneQueen  �  1S�'-   9     9  ' B   9  ' B   9 B 96 9  9 B A  A  9	 B6
  9+  5 9>9>>6 9*
  *  B>5 -	 =	5	 =	>BK   �         点击此处
param  123callBack  yxshowNewBieHelpUIManagergetContentSizegetPositionpccconvertToWorldSpacegetParentButton_16Node_TalentgetChildByName	view����uiLogic step2 btn 'pos size  � 
 Lm�'6     9  +  6 ' B99B 9  9' B 9	+ B9  9'
 B 9	+ B9  9' B 9' B 9	+ B9  9' B 9' B 9	+ B3 4 5 >6   96 996 '	 B99+  5	 =	=	B2  �K  �callBack	list  TALKBOXsceneContextnewBieProxyGameGlobal
addUI headId�N	name香香	talkY我的天赋可以为我兄…朋友——许褚将军提供加成，来看看吧！ Text_36Image_26Node_powerNode_16setVisibleNode_TalentgetChildByName	view	nameQUEENATTRLAYERdata.Config_UIrequiregetUILogicByNameUIManagerstep2 uiLogic BtalkCom -arr  #    
�'-   B K  �step1  �   9o�'6     9  +  6 ' B99B 6   9+  6 ' B99B   X �)�6 99	86   9
6 9	 9B	 9B6 '
 B99+	  5
 =
6  9B=
-  BX�-  BK  �callBackupdateUIhandleroneQueen  getRunningScenegetInstanceDirectorcc
addUIqueenListqueenProxyGameGlobalQUEENMAINUI	nameQUEENATTRLAYERdata.Config_UIrequiregetUILogicByNameUIManager		uiOpened2 uiLogic /taskLogic 
%queenId oneQueen  �   �'6     9  6 6 6 ' B9B -   B K  �INITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvremoveEventEventManageruiOpened  �   1��'U,  3  3 3 3 3 3 6 
 9+  6 '	 B9
9B  X	�3	 6
 
 9

6 6 6 ' B9	 B
6
 
 9

6 996 '	 B9
9, B
X	�	 B	2  �K  sceneContextnewBieProxyGameGlobal
addUIINITCOMPLETEapp.event.UIManagerEventNewbieForLvaddEventEventManager 	nameQUEENMAINUIdata.Config_UIrequiregetUILogicByNameUIManager      (9<HIIIIIIIIIIJJOPPPPPPPPPPPQQQQQQQQQQQQQQSSUUitemId 0skillId  0step4 /step3 .step2 -step1 ,uiOpened2 +uiOpened *uiLogic 
 initCom  g   �(6  9 9  BK   MODULE_BEAUTY_darlingBeautyqueenProxyGameGlobalarr   �  0_�(6     9  +  6 ' B99B 9  9' B 9	+ B9  9'
 B 9	+ B)�6 99896 9 9-  *  6	 9		6
 9

 ) BK   � MODULE_BEAUTY_darlingBeautyMODULE_BEAUTYConst_MsgType"send_modifyLvNewbieAndCallFunnewBieProxyuIdqueenListqueenProxyGameGlobalNode_16setVisibleNode_TalentgetChildByName	view	nameQUEENATTRLAYERdata.Config_UIrequiregetUILogicByNameUIManager��ׂcomplete uiLogic &queenId oneQueen uId  �  :^�(6     9  +  6 ' B99B 9  9' B 9'	 B 9
B 9B 96 9
 9B A  A6   9+  5 9	>	9	>	>6	 9		*  *  B	>	5	 -
  =
	5
 =
	>	BK  �       点击此处
param  123callBack  yxshowNewBieHelpgetPositionpccconvertToWorldSpacegetParentgetContentSizeButton_18Node_TalentgetChildByName	view	nameQUEENATTRLAYERdata.Config_UIrequiregetUILogicByNameUIManager����step3 uiLogic 0btn 	'size $pos  �  	 (�(4  5 6  99=> 5 > 6  96  996	 '
 B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name香香	talke唉，想不通我怎么会看上你这个没出息的家伙，好啦好啦，就寝吧夫君！ headId����	talk\娘子，春宵一刻值千金，你确定要浪费整晚的时间来新手引导吗？	namelocalPlayerGameGlobalstep2 arr 
 #    
�(-   B K  �step1  �   9o�(6     9  +  6 ' B99B 6   9+  6 ' B99B   X �)�6 99	86   9
6 9	 9B	 9B6 '
 B99+	  5
 =
6  9B=
-  BX�-  BK  �callBackupdateUIhandleroneQueen  getRunningScenegetInstanceDirectorcc
addUIqueenListqueenProxyGameGlobalQUEENMAINUI	nameQUEENATTRLAYERdata.Config_UIrequiregetUILogicByNameUIManager		uiOpened2 uiLogic /taskLogic 
%queenId oneQueen  �   �(6     9  6 6 6 ' B9B -   B K  �INITCOMPLETEapp.event.UIManagerEventrequireUIManagerNewbieForLvremoveEventEventManageruiOpened  �   0�(63   3 3 3 3 3 6  9+	  6
 '	 B
9


9

B  X�3 6 
 96 6 6 ' B9 B6 
 96 996 '	 B9
9, BX� B2  �K  sceneContextnewBieProxyGameGlobal
addUIINITCOMPLETEapp.event.UIManagerEventNewbieForLvaddEventEventManager 	nameQUEENMAINUIdata.Config_UIrequiregetUILogicByNameUIManager      )**********++011111111111222222222222224466complete /step3 .step2 -step1 ,uiOpened2 +uiOpened *uiLogic 
 initCom  � +���(*, 6  9B  96 )
  )  6  96  9B A 96 9*
  *  B A 9	6 9
)
� )� )� B A 9)  B-  89 X�9 9-  89B 9-  896	 9		9		BX�-  89 X�9 9-  89B 9-  896	 9		9		B6  9' -  89&B  99
 9-  89B
 9B A6 9 96 9
 9* * B6	 9			 9		* ) B	 A9 9-	  8		9		B 9	 B 9 9	B	 A6 9  9	 B	 9!
 B	 9")
  B	 9#)
�B9	 9!
 B6 9	 96
 9
$

 9

* )� B
6 9$ 9* )  B6 9% 96&   9' B5( =)=*B A
 9 B6 9
 96 9 9* * B6 9 9* ) B A 9	 B	K   �
logicbtnName  playButtonEffectCbhandlerCallFuncFadeTosetLocalZOrdersetAlphaThresholdaddChildClippingNoderunActionScaleTocreateSequencegetPositionsetPositionup#loadTextureNormalbuttonplistTypeTextureResType	ccui	downloadTexture	namegetChildByName	view
image
classsetOpacityc3bsetColorpccsetAnchorPointheight
widthCCRectsetTextureRectnewSpritedisplay������̙�����̙�����				       !!!!!!!""""""""""""$$$$%%%%&&&&&&&'''''''%))))*BTNDIC self  �logic  �btnName  �sprite �mask  �actionButton xcm_clip LactionDelay 0actionSprite  �  4T�)-  9 89 X�99 9-  9 89B 9-  9 896	 9
9BX�-  9 89 X�99 9-  9 89B 9-  9 896	 9
9BK   �loadTextureNormalbuttonplistTypeTextureResType	ccuiuploadTexture	namegetChildByName	view
logic
image
classbtnNameBTNDIC self  5sender  5value  5 �   BR�) X3�6  6  96 996 9)	  )
  6 99	6 99
B5 6	 9		)  )  )  )  B	=	6	 9		)  )  )  )  B	=	B=6  9 9)'B6  9 9)  )  BX�6  9
  X�6  9 9B6  +  =K  removeFromParentsetPositionsetLocalZOrderborderColorfillColor borderWidthc4fheight
widthframeSizeccsceneContextnewBieProxyGameGlobalcreateRectUIManager	rectNewbieForLv			self  CbNeed  C �  @"�� �)5  5  = 7  6  *  3 < 6  * 3 < 6  * 3 < 6  * 3 < 6  * 3 < 6  * 3	 < 6  3
 > 6  3 > 6  3 > 6  * 3 < 6  * 3 < 6  * 3 < 6  *	 3 < 6  *
 3 < 6  3 > 6  * 3 < 6  * 3 < 6  * 3 < 6  * 3 < 6  * 3 < 6  * 3 < 6  * 3 < 6  3 >" 6  3 > 6  3 > 6  3 > 6  3 ># 6  * 3 < 6  * 3  < 6  * 3! < 6  * 3" < 6  * 3# < 6  * 3$ < 6  * 3% < 6  * 3& < 6  * 3' < 6  * 3( < 6  * 3) < 6  * 3* < 6  * 3+ < 6  * 3, < 6  *  3- < 6  *! 3. < 5 0 5/ =1 52 =3 54 =5 56 =7 58 =9 6 3; =:6 3= =<6 3? =>6 2  �L  isNeedShade playButtonEffectCb playButtonEffectjuntuandating 	downhome_huanggongdown.pnguphome_huanggong.png
class
image	nameButton_Palaceyanlian 
imageuphome_xiaochangyanlian.png	namebutton_yanlian	down"home_xiaochangyanliandown.pngheroTrial 	down"home_zhengzhantianxiadown.pnguphome_zhengzhantianxia.png
class
image	namezhanyi	fuku 	downhome_fukudown.pnguphome_fukuup.png
class
image	name	fuku	shop   	downhome_shangdiandown.pnguphome_shangdian.png
class
image	namebutton_shop                                           NewbieForLv
order  -   �̙���р͙��̙Ӏ��̙��Ԁ�̙����͙��̙���̙�����̙�朁��̙�昁�̙��̙�����	����͙��̙����̙�渁��̙�漁�̙��̽�����	��ā��̙��ā͙��̙Ł�̙���Ł"#͙��̙������	����͙��̙������	�����̙��̐���̙�搂͙��̙������	�����̙��̤���̙�椂 �����̙��ׂ͙��ׂ̙��̙��ׂ����	��ׂ ��ׂ͙����р����̙Ӏ�̙���Ԁ͙���������̙��̙�����̙��朁�̙��昁͙���̙���̙��������̙���̙��渁�̙��漁͙���̽���̙��ā�̙���ā����̙Ł͙����Ł����̙����̙��������̙����̙����͙���̐��̙��搂����̙����̙����͙���̤��̙��椂����͙���ׂ����ׂ̙�̙���ׂ��̙��ׂ��ׂ    
 
 � � � � � � � � � � � � � � � � ::==�����/�������

rrtt��������FF����//�
�
�
�
�
�
22��((**YY[[������b���$$b���..1����kkmm������������7799������������::<<��������MMNN����;;cddeeffgghhk�k���������BTNDIC �  