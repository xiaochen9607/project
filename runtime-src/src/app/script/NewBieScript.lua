LJP@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\NewBieScript.lua�   q6   96 B6 9 9BK  
checknewBieProxyGameGlobalNewBieScriptremoveEventsEventManagerobjectg  param   � 	
  v6   96 6 96 ' B9-  B6 9 9	  BK   �#MODULE_HERO_heroUpdatePositionheroProxyvalidInstBattle!app.event.InstanceProxyEventrequireinstanceProxyGameGlobalNewBieScriptaddEventEventManagershown arr   �   2Fp3   3 6  9+  6 ' B99B 9B6	 9
 9 ) ) )
 6		 9		9		:		6
	 9

9

:

6	 99:6	 99:6	 99:6	 99:B2  �K  insBatSetuplocalPlayer send_modifyNewbieAndCallFunnewBieProxyGameGlobalbattleArrayAjust	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManager  
shown 1complete 0 �   2To3   6  9+  6 ' B99B9 9B 9	6
 9	 9B A  A99 9B6  9+	  5
 >
>
>
6
 9)  )  B>
5 = 5 =>
BK         点击出征
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnBattle	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManager com 1btn &pos x y size  �   �-   9   6 9 9)�B9> -     9  B -  B K   �  resetPositionuIdgetHeroByIdlocalPlayerGameGlobalinBattleSetuplogic step7  � 9c�6     9  +  6 ' B99B 3 9  9B 9	6
 99 	 9B A  A9 96
 9)d )d B6   9+	  5
 >
>
>
6
 9* * B>
5 =5 =>
B2  �K   �       
param  123callBack  showNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParentheroTableView 	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManagern������		




step7 logic /com .pos  x y size  �   �-   9   6 9 9)�B9> -     9  B -  B K   �  resetPositionuIdgetHeroByIdlocalPlayerGameGlobalinBattleSetuplogic step6  � 8b�6     9  +  6 ' B99B 3 9  9B 9	6
 99 	 9B A  A9 96
 9)d )d B6   9+	  5
 >
>
>
6
 9* * B>
5 =5 =>
B2  �K  �       
param  123callBack  showNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParentheroTableView 	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManagern�����		




step6 logic .com -pos x y size  #    
�-   B K    step5  � 	 �3   6  96 996 ' B99	+  5
   BK  � 
insIdchapterIdbatType 	hard 	nameREADYTOBATTLEdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager 	














step5 com  �  /_�-   9     9  ' B   9 B 96 9  9 B A  A99	6 9
)d )d B6  9+  5	 >	>	>	6
 9

*  *  B
>
	5
 - =
5 =
>
	BK   �         点击关卡
param  123callBack  showNewBieHelpUIManager	sizeyxgetPositionpccconvertToWorldSpacegetParentn1getChildByNamecurInstanceMenu����worldMapLogic step4 btn )pos x y size  �  1�6     9  +  6 ' B99B 3   9 ) +  B2  �K    scroll2City 	nameWORLDMAPdata.Config_UIrequiregetUILogicByNameUIManager	





step4 worldMapLogic 	com2  � 5m�6     9  +  6 ' B99B   9 ' B 9B 9	6
 9	 9B A  A99 9B3 6  	 9+
  5 >>>6
 9*  *  B>5 =5 =>BK  �       点击城池
param  123callBack  showNewBieHelp getContentSizeyxgetPositionpccconvertToWorldSpacegetParentButton_1getChildByName	nameWORLDMAPdata.Config_UIrequiregetUIByNameUIManager����step4 worldMap +btn 'pos x y size complete  #    
�-   B K    step3  �  +�6     9  +  6 ' B99B 3    X� BX�  9  + BK  �enterWorldMap 	nameHOMEUIdata.Config_UIrequiregetUILogicByNameUIManagerstep3 homeUI cb  �  	 $�4  5  > 5 > 6  96 996 ' B9	9
+  5 = -  =BK  �callBack	list showSkip	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�	name关平	talk�主公，我等来时发现北海城被一小股黄巾贼占据，主公宜速速发兵讨伐，如此一来北海必是主公囊中之物！ headId����	name我	talkG哈哈，能得到二位将军相助，我军必当如虎添翼！step2 arr  �  
 �6     9  6 9 9B 9B6 ' B99	+  4 -  >B K  �	nameACQHEROINFOUIdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagerhero2  � 

D�9 6 99  X�-  	  X�6  96 6 6 '	 B9	B- B-  	 X�0   - BK   �  �REMOVEapp.event.UIManagerEventrequireUIManagerNewBieScriptremoveEventEventManagerACQHEROINFOUIConfig_UI	nameindex step1c showNext object  param   �  0d�)  6  9 9)�B6  9 9)�B3 3 6  96 6	 6
	 '
 B
9

 B6  96 9
 9B
 9B6		 ' B	9		9		+
  4 >B2  �K  �	nameACQHEROINFOUIdata.Config_UIgetRunningScenegetInstanceDirectorcc
addUIREMOVEapp.event.UIManagerEventrequireUIManagerNewBieScriptaddEventEventManager  getHeroByIdlocalPlayerGameGlobalstep1c index /hero )hero2 #showNext "removed ! �  	 '�4  5  > 5 > 5 > 6  96 996 '	 B9
9+  5 = -  =BK  �callBack	list showSkip	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�	name关平	talk\关平常听父亲提及将军英姿，心中仰慕已久，还望将军收留在下。 headId�	name蔡文姬	talkG小女子久闻将军大名，若得以相随，此身无憾也！ headId�N	name香香	talk\主公您总算来了，营外有两名猛将特来投奔主公，还望主公接见。step1b arr  �  	 Xm�3   3 3 3 3 3 3 3 3 	 B	2  �K           $1=Rjq������step7 step6 step5 
step4 	step3 step2 step1c step1b step1  G    �6   9    9  B K  
checknewBieProxyGameGlobal � 	  $�
3   4 5 >5 >6  96 996 '	 B9
9+  5 == BK  callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�	name关平	talk5既然是战利品，不妨用于我军训练。 headId�N	name香香	talkS启禀主公，我军在此战中缴获了许多军械，不如加以利用。 																
com arr  � 
 "E�9 6 99  X�6  96 B6 9 9B6	  9
+  6 '	 B99 B 9 + B-  BK    scroll2CityWORLDMAPdata.Config_UIrequiregetUILogicByNameUIManagergetInstanceMaxCityinstanceProxyGameGlobalNewBieScriptremoveEventsEventManagerBATTLEREWARD2Config_UI	namestep11 object  #param  #maxCity  � 	 *�3   6  96 6 6 ' B9  B6  9+  6	 9
9B 9BK    closeIt	nameBATTLEREWARDConfig_UIgetUILogicByNameREMOVEapp.event.UIManagerEventrequireUIManagerNewBieScriptaddEventEventManager 											










step11 removed  �  6^�6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A99 9B6   9+	  5
 >
>
>
6 9*  *  B>
5 -  =5 =>
BK   �       
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParent
closegetChildByName	view	nameBATTLEREWARDdata.Config_UIrequiregetUILogicByNameUIManager����com logic ,btn 'pos x y size  �  !�3   3 6 9 9)  B2  �K   �canNotClickScreenForSecnewBieProxyGameGlobal  step11 com 
begin 	 �  )�9 6 ' B99  X�6  96 B-  BK    NewBieScriptremoveEventsEventManagerBATTLEREWARDdata.Config_UIrequire	namestep10 object  param   � 	 �3   6  96 6 6 ' B9  BK    ADDapp.event.UIManagerEventrequireUIManagerNewBieScriptaddEventEventManager 											step10 shown  0  �3     BK  � step10 com  � 	 #0�6  9 9  B6  9+  6 ' B99B6  9	6  9
96 ' B99+  5 5 == -  BK  �arrinsInfo 
insId	hard batType chapterId starNumBATTLERESULTUIsceneContextnewBieProxy
addUI	nameBATTLEUIdata.Config_UIrequireremoveUIUIManagerMODULE_INSTANCE_instBattleinstanceProxyGameGlobalstep9 arr  $ �  #;�9 6 ' B99  X�6 99 9+ B6  9	6
 B6 9 9-  ) ) ) )	  )
 ) ) ' BK     send_modifyNewbieAndCallFunNewBieScriptremoveEventsEventManagersetNewBieCanNotSelGroupsceneContextnewBieProxyGameGlobalTALKBOXdata.Config_UIrequire	namestep8 object  $param  $ �#E�6  99 95 B  X�6  99 9B	  X�6  96 B3	 6  9
6 6 6 '
 B9	 BK    REMOVEapp.event.UIManagerEventrequireUIManageraddEvent NewBieScriptremoveEventsEventManagercheckAllPlayersAliveLeft  ��������checkGroupsAreDeadsceneContextnewBieProxyGameGlobal step8 object  $param  $removed  �  	3�-   *  =  6  9    9  + B 6  9  9    9  - 9B -  ) = -    9  )RB K   � setMoraleguardingRadiusuIdgroupUseSkillsceneContextsetGuidingnewBieProxyGameGlobalhitValue���	taishici target zhaoyun  �  7h�	6     9  +  6 ' B99B 9 -  98 9B 9	6
 9	 9B A  A996
 9)F )F B6   9+	  5
 >
>
>
6
 9*  *  B>
5 - =5 =>
BK  ��       
param  123callBack  showNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParentuIdheadViewBoxDic	nameBATTLEUIdata.Config_UIrequiregetUILogicByNameUIManager����	target useSk logic -btn )pos x y size  "    	�-   B K  �com3  �  "�6   9    9  + B -   *  = 6   9  9    9  - 9B K   �uIdgroupUseSkillsceneContexthitValuesetGuidingnewBieProxyGameGlobal���	zhaoyun target  �  7h�	6     9  +  6 ' B99B 9 -  98 9B 9	6
 9	 9B A  A996
 9)F )F B6   9+	  5
 >
>
>
6
 9*  *  B>
5 - =5 =>
BK  ��       
param  123callBack  showNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParentuIdheadViewBoxDic	nameBATTLEUIdata.Config_UIrequiregetUILogicByNameUIManager����	target useSk logic -btn )pos x y size  "    	�-   B K  �com3  �%���M9 99	  XB�-   X?�6 99 99+ B  X5�6 99 X0�1  6 9 9	+ B3
 3 3 4 5 >6 	 96
 9

9

6 ' B99+  5 ==B6 99	 9)
 )�B6 99
 9 ) , + B2 �9	 X`�-  X]�6 99 99+ B  XS�6 99 XN�6  96 6 996 '
 B9B1 6 9 9	+ B3 3 3  4 5! >6 99	 9")
 '# )
 B6 99	 9")
 '# )
 B6 	 96
 9

9

6 ' B99+  5$ ==B6 99	 9)
 )�B6 99
 9 ) , + B2 �2  �K  ����  guardingRadiusmodifyGroupByPartyAttrib headId�N	name香香	talkk关平将军的战意值已满，就是现在，点击关平将军的头像，释放武将技能吧！   BATTLECONTROL_MORALEFULL!app.event.BattleControlEventNewBieScriptremoveEventEventManagercameraTogetGroupByPartyIdAndDefIdcallBack	list  	nameTALKBOXdata.Config_UIrequire
addUIUIManager headId�N	name香香	talk/点击蔡姐姐的头像，释放技能！   setGuidingguidinguIdgroupCheckCanUseSkillsceneContextnewBieProxyGameGlobalidtargetparams��!!!!!!!!!!!!!!!!""""""""$$$$$$$$$$$'''''''''''''''''''''))))))))))))*++++++0:ABBCEEEEEEEEEFFFFFFFFFHHHHHHHHHHHHHHHHIIIIIIIIKKKKKKKKKKKMMtaishiciUseSk taishici zhaoyun zhaoyunUseSk sender  �params  �target �useSk 'com3 &com2 %arr "zhaoyun 
useSk 49com3 8com2 7arr 4zhaoyun *
 �  4��n3   6  96 6 996 ' B9	  B6 99 9
) )�B6 99 9
) )�B+ + 3  9)	�B6  96	 6
 9

9

6 ' B9 B2  �K  �BATTLECONTROL_MORALEFULL!app.event.BattleControlEventsetMorale getGroupByPartyIdAndDefIdSTATE_ONDIEDapp.event.StateEventrequiresceneContextnewBieProxyGameGlobalNewBieScriptaddEventEventManager ijjjjlllllllllllllnnstep8 diedCallBack 3zhaoyun taishici zhaoyunUseSk taishiciUseSk com  �   )�6   9  9    9  )��B   9 B6  9 9+ B6  99 9+ B-  BK  �setNewBieCanNotSelGroupsetGuidingtouchCallBackgetGroupByUIdsceneContextnewBieProxyGameGlobalstep7 enemy  �  ?m�
6   9  9    9  ) )�B 6  99 99 B6  99 9)��B 9B 96	 9
	 9B A  A996	 9)d )d B6  9+	  5
 >
>
>
6	 9
*  *  B>
5 -  =5 =>
BK  �       点击敌人发动攻击
param  123callBack  showNewBieHelpUIManager	sizeyxgetPositionpccconvertToWorldSpacegetParentgetGroupByUIduIdsetSelectedGroupgetGroupByPartyIdAndDefIdsceneContextnewBieProxyGameGlobal����																					
step6 zhaoyun 	7enemy )pos x y size  �  ;i�6   9  9    9  )��B   9 B6  99 9) )�B 9B 96 9		 9
B A  A996 9)d )d B6  9+	  5
 >
>
>
6 9	*  *  B>
5 -  =5 =>
BK  �       点击选中部队
param  123callBack  showNewBieHelpUIManager	sizeyxgetPositionpccconvertToWorldSpacegetParentgetGroupByPartyIdAndDefIdtouchCallBackgetGroupByUIdsceneContextnewBieProxyGameGlobal����					




















step5 enemy 4zhaoyun )pos x y size  �  0T�6   9  9    9  )��B   9 B 96 9  9 B A  A9	9
6 9)d )d B6  9+  5	 >	>	>	6
 9

*  *  B
>
	5
 -  =
5 =
>
	BK  �       点击敌人发动攻击
param  123callBack  showNewBieHelpUIManager	sizeyxgetPositionpccconvertToWorldSpacegetParentgetGroupByUIdsceneContextnewBieProxyGameGlobal����step4 enemy )pos x y size  �   $�6   9  9    9  ) )�B 6  99 99 B-  BK  �uIdsetSelectedGroupgetGroupByPartyIdAndDefIdsceneContextnewBieProxyGameGlobalstep3 taishici 	
 � 6n�	6  99 9) )�B 9B 96 9
 9B A  A9	9
6 9)d )	d B6 	 9+
  5 >>>6 9*  *  B>5 -  =5 =>B6 	 96
 BK    NewBieScriptremoveEventsEventManager       点击选中部队
param  123callBack  showNewBieHelpUIManager	sizeyxgetPositionpccconvertToWorldSpacegetParentgetGroupByPartyIdAndDefIdsceneContextnewBieProxyGameGlobal����	step2 object  7param  7taishici 	.pos "x !y  size  � 	
  �3   6  96 6 996 ' B9	  BK  	�BATTLECONTROL_START!app.event.BattleControlEventrequiresceneContextnewBieProxyGameGlobalNewBieScriptaddEventEventManager step2 started  t   �6   96 B-  BK  
�NewBieScriptremoveEventsEventManagerstep1 object  	param  	 �   <���6   9    9  + B 3  3 3 3 3 3 3	 3
 3 3	 3
 6  9+  6 ' B99B  X�3 6  96 6  96 ' B9 B6  9 9B6  9 9)  ) ) BX�
 B2  �K  send_validInstBattlesend_getInstInfovalidInstBattle!app.event.InstanceProxyEventinstanceProxyNewBieScriptaddEventEventManager 	nameBATTLEFIELD1data.Config_UIrequiregetUIByNameUIManager           setGuidingnewBieProxyGameGlobal%>C��������������������������������������������������step11 5step10 4step9 3step8 2step7 1step6 0step5 /step4 .step3 -step2 ,step1 +ui 
!shown  �   	 �6     9  +  6 ' B99B 6  9    9  B K  
checknewBieProxyGameGlobal	nameHEROUIdata.Config_UIrequireremoveUIUIManager �  Gq�
6     9  +  6 ' B99B   9 B6   9+  6 ' B99B9 9	'
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
	BK   �       点击返回
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentButton_ChangeProjectNode_1getChildByName	viewHEROUIcloseIt	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManager����																							
step7 logic =logic 0btn 	'pos size  �  :\�6     9  +  6 ' B99B 9  9' B 9'	 B 9
B 96 9	 9B A  A 9B6   9+  5 9	>	9	>	>6	 9		*  *  B	>	5	 -
  =
	5
 =
	>	BK  �       点击返回
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentButton_ChangeProjectNode_1getChildByName	view	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManager����step6 logic 0btn 	'pos size  �  (�9 6 ' B99  X�6  96 B-  BK    NewBieScriptremoveEventsEventManagerNEWHEROGETEQUIPdata.Config_UIrequire	namestep5 object  param   �  5s�6   96 6 6 ' B9-  B6 9 9	)�B6 '
 B 9) 99B6 96 9
 9	)�B9=6 9) =6 9=6 9=6 9	 9
  BK    MODULE_HERO_pushEquipmentnumequslotPositionuIdheroUidheroProxy	rankjobgetSlotInfoapp.uiLogic.CommonHeroInfogetHeroByIdlocalPlayerGameGlobalREMOVEapp.event.UIManagerEventrequireUIManagerNewBieScriptaddEventEventManager			





removed arr  6hero $equ 	num  lv  iconType  costPrice   �  )�3   6 9 9  ) ) ) 6 9
 9)�B9)	 )
') B
K  �uIdgetHeroByIdlocalPlayer send_modifyNewbieAndCallFunnewBieProxyGameGlobal removed complete  �  6X�6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A 9B6   9+  5 9	>	9	>	>6	 9		*  *  B	>	5	 -
  =
	5
 =
	>	BK  �       点击穿装
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentactivegetChildByName
node1	nameNEWHEROGETEQUIPdata.Config_UIrequiregetUILogicByNameUIManager����com3 logic2 ,btn 'pos size  �   5p�-   4  =  -   6 -   9B9B=  6  9    9  )�B 6 ' B 9	) 9
 9 B6  9-	  9			 9		B	6
 ' B
9

9

+  5 = =====- , ) B
K   ��lv	costnumiconType
equip	hero 	slot	nameNEWHEROGETEQUIPdata.Config_UIgetParent	view
addUIUIManager	rankjobgetSlotInfoapp.uiLogic.CommonHeroInforequiregetHeroByIdlocalPlayerGameGlobalequValidgetCurrentHero
clonecurEquipValidlogic com2 hero #equ 	num  lv  iconType  costPrice   � @��+6     9  +  6 ' B99B 3 3 3 3	   9
 B 9' B 9' B 9B 96	 9		 9B A	  A	 9B6  
 9+  5 9>9>>6 9*  *  B>5 =5 =>B2  �K  �       点击这里
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentequip_1Image_1getChildByNamegetCurrentRightUI    	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManager����&'''''''''''(((((((((((()))**********************++step5 logic 6removed 5com3 4com2 3com 2equBtn 'pos size  �   $3�6     9  +  6 ' B99B 6   99  9B6 ' B9	9+  5 6
 9
 9)�B=9 =-  BK  �allHero _Activated_heroConfigsArray	hero 
indexinActiveNum getHeroByIdlocalPlayerGameGlobalHEROATTRIBUIgetParent	view
addUI	nameHEROUIdata.Config_UIrequiregetUILogicByNameUIManagerstep4 logic  �  ;W�6     9  +  6 ' B99B 9  9B 96	 9
9  9B A  A9 =9=6	 9)h)� B6   9+  5 9>9>>6	 9
*
 * B>5 -	  =	5	 =	>BK           点击赵云
param  123callBack  showNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParent_heroList_tableview	nameHEROUIdata.Config_UIrequiregetUILogicByNameUIManager������step3 logic 1pos #size  /  �
3     BK  � 		
step3 com  �  	 �6     9  6 996 ' B99, -  B K    	nameHEROUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep2  � ;b�
3   6  9+  6 ' B99B 9' B 9'	 B 9
B 96 9
 9B A  A6 9)d )d B6  9+  5	 9
>
	9
>
	>	6
 9

*  *  B
>
	5
 = 
5 =
>
	BK  �       点击武将
param  123callBack  yxshowNewBieHelp	sizegetPositionpccconvertToWorldSpacegetParentButton_HeroNodeMenugetChildByName	nameWORLDMAPUIdata.Config_UIrequiregetUIByNameUIManager ����																						
step2 com :view ,btn (pos size  �  	 �6     9  6 996 ' B99, -  B K    	nameHEROUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep2  � 8a�	3   6  9+  6 ' B99B9 9'	 B 9
B 96 9
 9B A  A6 9)d )d B6  9+  5	 9
>
	9
>
	>	6
 9

*  *  B
>
	5
 = 
5 =
>
	BK  �       点击武将
param  123callBack  yxshowNewBieHelp	sizegetPositionpccconvertToWorldSpacegetParentButton_HerogetChildByName	view	nameHOMEUIdata.Config_UIrequiregetUILogicByNameUIManager ����	step2 com 7homeUI 
-btn (pos size  �   _�t3   3 3 3 3 3 3 3 6 
 9	B
 9
B6	 	 9			B	9		9			 X� BX� B2  �K  HOMEUISCENEsceneNametblgetCurScenegetResourceManagerGameGlobal        EKWblmmmmmmmmmmmmmmmppprrttstep7 step6 step5 step4 step3 step2 step1 step0  �   �6   96 B6 9 9BK  
checknewBieProxyGameGlobalNewBieScriptremoveEventsEventManagerobjectg  param   � 	
  �6   96 6 96 ' B9-  B6 9 9	  BK   �#MODULE_HERO_heroUpdatePositionheroProxyvalidInstBattle!app.event.InstanceProxyEventrequireinstanceProxyGameGlobalNewBieScriptaddEventEventManagershown arr   �   2F�3   3 6  9+  6 ' B99B 9B6	 9
 9 ) ) )
 6		 9		9		:		6
	 9

9

:

6	 99:6	 99:6	 99:6	 99:B2  �K  insBatSetuplocalPlayer send_modifyNewbieAndCallFunnewBieProxyGameGlobalbattleArrayAjust	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManager  shown 1complete 0 �   2T�3   6  9+  6 ' B99B9 9B 9	6
 9	 9B A  A99 9B6  9+	  5
 >
>
>
6
 9)  )  B>
5 = 5 =>
BK         点击出征
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnBattle	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManager com 1btn &pos x y size  #    
�-   B K  �step7  �  
 �6     9  6 996 ' B99+  5	 -  B K  � 
insId�chapterIdbatType 	hard 	nameREADYTOBATTLEdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep5  �  /_�-   9     9  ' B   9 B 96 9  9 B A  A99	6 9
)d )d B6  9+  5	 >	>	>	6
 9

*  *  B
>
	5
 - =
5 =
>
	BK            点击关卡
param  123callBack  showNewBieHelpUIManager	sizeyxgetPositionpccconvertToWorldSpacegetParentn1getChildByNamecurInstanceMenu����worldMapLogic step4 btn )pos x y size  l  	,�
3   -   9) +   BK     scroll2City 							
worldMapLogic step4 scrolledFun  � -h�-   9     9  ' B   9 B 96 9  9 B A  A99	  9
 B3 6  9+	  5
 >
>
>
6 9*  *  B>
5 =5 =>
BK   �         点击城池
param  123callBack  showNewBieHelpUIManager getContentSizeyxgetPositionpccconvertToWorldSpacegetParentButton_2getChildByName	view����worldMapLogic step4 btn 'pos x y size complete  � 	 2�6     9  +  6 ' B99B 3   9 ) +  + B2  �K  �scroll2City 	nameWORLDMAPdata.Config_UIrequiregetUILogicByNameUIManagerstep4 worldMapLogic 
com2 	 #    
�-   B K    step1  � 	 0�6     9  +  6 ' B99B 3   9 ) +  + BK  �scroll2City 	nameWORLDMAPdata.Config_UIrequiregetUILogicByNameUIManagerstep1 worldMapLogic 	cb2  �   I�D6     9  +  6 ' B99B 3 3 3 3	 3
 
   X�  9 	 +
 BX� B2  �K  enterWorldMap     	nameHOMEUIdata.Config_UIrequiregetUILogicByNameUIManager6>??@@@@@@BBDDlogic step7 step5 step4 step1 cb  �    �6     9  6 B 6  9    9  B K  
checknewBieProxyGameGlobalNewBieScriptremoveEventsEventManager �   �6     9  6 6 6 ' B9-  B K   � EXITBATTLE_HANDLE_COMPLETEDapp.event.GameGlobalEventrequireGameGlobalNewBieScriptaddEventEventManagerstep8  � 	 #0�6  9 9  B6  9+  6 ' B99B6  9	6  9
96 ' B99+  5 5 == -  BK  �arrinsInfo 
insId�	hard batType chapterId starNumBATTLERESULTUIsceneContextnewBieProxy
addUI	nameBATTLEUIdata.Config_UIrequireremoveUIUIManagerMODULE_INSTANCE_instBattleinstanceProxyGameGlobalstep7 arr  $ � 	 3�6  99 9+ B6  96 B6  9 9-  ) ) ) )	  )
 )� ) ' BK     send_modifyNewbieAndCallFunNewBieScriptremoveEventsEventManagersetNewBieCanNotSelGroupsceneContextnewBieProxyGameGlobalstep6 object  param   � 	 .�
6   9  9    9  + B 3  6  96 6  996 '	 B9
  BK  �BATTLECONTROL_INS_ENDED!app.event.BattleControlEventrequireNewBieScriptaddEventEventManager setNewBieCanNotSelGroupsceneContextnewBieProxyGameGlobal													
step6 battleFinishCb 	 t   �6   96 B-  BK  �NewBieScriptremoveEventsEventManagerstep2 object  	param  	 �   /]�83   3 3 3 6  9+  6 '
 B99	B  X�3
 6  96	 6
 9

6 ' B9 B6 9 9B6 9 9)	  )
 )� BX� B2  �K  send_validInstBattlesend_getInstInfovalidInstBattle!app.event.InstanceProxyEventinstanceProxyGameGlobalNewBieScriptaddEventEventManager 	nameBATTLEFIELD1data.Config_UIrequiregetUIByNameUIManager    '++++++++++,,0222222222222333334444444446688step8 .step7 -step6 ,step2 +ui 
!shown  G    �6   9    9  B K  
checknewBieProxyGameGlobal �
 
Ob�:   X�6   96 996 ' B99+  5	 BK  6 9
 9  B6   96 996 ' B99B4 5 >5 6 99=>5 >5 6 99=>5 >5 6 99=>6   96 996 ' B99+  5 =-	  =	BK   �callBack	list  TALKBOX headId����	talkD既然香香答应了，那我们便赶紧去迎接曹植吧！ headId�N	name香香	talkt哼，这还差不多，不过…曹植也算是北方名士，主公若能得其相助，必当如虎添翼。 headId����	talkn啊！我说……我说曹植那个小白脸怎比得上我家神机妙算，机智聪明的香香呢？ headId�N	name香香	talk>（暴走）主公！你…在…说…什…么！！！ headId����	talkt哈哈，终于找到一个靠谱的军师了，香香那个小丫头嘛，还是老老实实当丫鬟好啦！localPlayer headId�	name曹植	talkb啊！久仰大名，将军若不嫌弃，在下愿投靠将军，鞠躬尽瘁死而后已！MODIFYNAMEremoveUI#MODULE_PLAYER_modifyPlayerNameloginProxy idrepeatName	nameMESSAGEBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager		





step3 arr  Parr > �   �6   9    9  -  )" ) ) 6  99B K    	namelocalPlayer send_modifyNewbieAndCallFunnewBieProxyGameGlobalstep2  �  �3   6  96 996 ' B99	+  5
 = BK  �callBack  	nameMODIFYNAMEdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager step2 cb  �   7�#3   3 3 4 5 >6  96 996	 '

 B99+	  5
 =
=
B2  �K  callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�	name曹植	talk;救命之恩没齿难忘，敢问恩公尊姓大名？   """"""""""""""""##step3 step2 step1 arr  �   	 �6     9  +  6 ' B99B 6  9    9  B K  
checknewBieProxyGameGlobal	nameHEROUIdata.Config_UIrequireremoveUIUIManager �  :\�6     9  +  6 ' B99B 9  9' B 9'	 B 9
B 96 9	 9B A  A 9B6   9+  5 9	>	9	>	>6	 9		*  *  B	>	5	 -
  =
	5
 =
	>	BK           返回
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentButton_ChangeProjectNode_1getChildByName	view	nameHEROUIdata.Config_UIrequiregetUILogicByNameUIManager����step5 logic 0btn 	'pos size  � 	 0�3   4 5 >5 >5 6 99=>6  96 9	9
6 ' B99+  5 == BK   �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId����	talkS女人的报复心真是很强啊，以后千万不能招惹这丫头了……	namelocalPlayerGameGlobal headId�	name曹植	talk…… headId�N	name香香	talkz以后你就是我军的第一奶妈…第一奶爸了，小伙子好好干吧，不要辜负组织对你的期望！ 		

step5 com arr  �  (�9 6 ' B99  X�6  96 B-  BK    NewBieScriptremoveEventsEventManagerACQHEROINFOUIdata.Config_UIrequire	namestep4 object  param   �
 +�
3  6  96 6 6 '	 B9 B6 9	 9
  )RBK    MODULE_HERO_heroCompositeheroProxyGameGlobalREMOVEapp.event.UIManagerEventrequireUIManagerNewBieScriptaddEventEventManager 							
step4 arr  removed  � 	 �3   6 9 9  ) ) ) )RBK  � send_modifyNewbieAndCallFunnewBieProxyGameGlobal step4 complete  �  ;W�6     9  +  6 ' B99B 9  9B 96	 9
9  9B A  A9 =9=6	 9)h)� B6   9+  5 9>9>>6	 9
*
 * B>5 -	  =	5	 =	>BK           点击曹植头像
param  123callBack  showNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParent_heroList_tableview	nameHEROUIdata.Config_UIrequiregetUILogicByNameUIManager������step3 logic 1pos #size  �  	 #�4  5  > 5 > 6  96 996 ' B9	9
+  5 = -  =BK   �callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�N	name香香	talkP将魂可通过酒馆抽取等方式获取，用于武将招募与升星！ headId�N	name香香	talk:小白脸赠予主公10个将魂，真是大方呢！com2 arr  � 
 &�3   3 6  96 996 ' B9	9
, 	 B2  �K  �	nameHEROUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager  step3 com2 com  � ;g�6   9+  6 ' B99B 9' B 9' B 9	B 9
6 9
 9B A  A6 9)d )d B6   9  5	 9
>
	9
>
	>	6
 9

*  *  B
>
	5
 -  =
5 =
>
	BK  �       点击武将
param  123callBack  yxshowNewBieHelp	sizegetPositionpccconvertToWorldSpacegetParentButton_HeroNodeMenugetChildByName	nameWORLDMAPUIdata.Config_UIrequiregetUIByNameUIManager����step2 newScene  <view -btn )pos size  �  	 �6     9  6 996 ' B99, -  B K    	nameHEROUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep2  � 8a�	3   6  9+  6 ' B99B9 9'	 B 9
B 96 9
 9B A  A6 9)d )d B6  9+  5	 9
>
	9
>
	>	6
 9

*  *  B
>
	5
 = 
5 =
>
	BK  �       点击武将
param  123callBack  yxshowNewBieHelp	sizegetPositionpccconvertToWorldSpacegetParentButton_HerogetChildByName	view	nameHOMEUIdata.Config_UIrequiregetUILogicByNameUIManager ����	step2 com 7homeUI 
-btn (pos size  � 
  M�U3   3 3 3 3 3 6  9B 9B6 	 9B9	9
 X� BX� B2  �K  HOMEUISCENEsceneNametblgetCurScenegetResourceManagerGameGlobal      %:BMNNNNNNNNNNNNNNNQQQSSUUstep5 step4 step3 step2 step1 step0  �   �6   96 B6 9 9BK  
checknewBieProxyGameGlobalNewBieScriptremoveEventsEventManagerobjectg  param   � 	
  �6   96 6 96 ' B9-  B6 9 9	  BK   �#MODULE_HERO_heroUpdatePositionheroProxyvalidInstBattle!app.event.InstanceProxyEventrequireinstanceProxyGameGlobalNewBieScriptaddEventEventManagershown arr   �   2F�3   3 6  9+  6 ' B99B 9B6	 9
 9 ) ) )
 6		 9		9		:		6
	 9

9

:

6	 99:6	 99:6	 99:6	 99:B2  �K  insBatSetuplocalPlayer send_modifyNewbieAndCallFunnewBieProxyGameGlobalbattleArrayAjust	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManager  
shown 1complete 0 �   2T�3   6  9+  6 ' B99B9 9B 9	6
 9	 9B A  A99 9B6  9+	  5
 >
>
>
6
 9)  )  B>
5 = 5 =>
BK         点击出征
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnBattle	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManager com 1btn &pos x y size  �   +�-     9   6 9 9)�B9B   X �-   9  6 9 9)�B9> -     9  B -  B K   �  resetPositioninBattleSetupuIdgetHeroByIdlocalPlayerGameGlobalcheckInBattleSetuplogic step7  � 9c�6     9  +  6 ' B99B 3 9  9B 9	6
 99 	 9B A  A9 96
 9)d )d B6   9+	  5
 >
>
>
6
 9* * B>
5 =5 =>
B2  �K   �       点击曹植
param  123callBack  showNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParentheroTableView 	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManagern������	













step7 logic /com .pos  x y size  �  	 !.�
4  5  > 5 > 5 > 5 > 5 6 99=> 6  9	6 9
96 ' B99+  5 = -  =BK    callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId����	talkb别闹了别闹了，讨伐黄巾贼寇在此一举，奶……曹植入阵，全军出发！	namelocalPlayerGameGlobal headId�	name曹植	talk…… headId�N	name香香	talkV请叫我军师大人！下次再敢叫我姑娘，本姑娘一定军法从事！ headId�	name曹植	talk5香香姑娘，不知在下何处得罪了…… headId�N	name香香	talk)将奶爸大人派遣到阵中吧！																	
step5 arr  � 	 �3   6  96 996 ' B99	+  5
   BK  � 
insIdchapterIdbatType 	hard 	nameREADYTOBATTLEdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager step5 com  �  /_�-   9     9  ' B   9 B 96 9  9 B A  A99	6 9
)d )d B6  9+  5	 >	>	>	6
 9

*  *  B
>
	5
 - =
5 =
>
	BK            点击关卡
param  123callBack  showNewBieHelpUIManager	sizeyxgetPositionpccconvertToWorldSpacegetParentn2getChildByNamecurInstanceMenu����worldMapLogic step4 btn )pos x y size  l  	,�
3   -   9) +   BK     scroll2City 							
worldMapLogic step4 scrolledFun  � -h�-   9     9  ' B   9 B 96 9  9 B A  A99	  9
 B3 6  9+	  5
 >
>
>
6 9*  *  B>
5 =5 =>
BK   �         点击城池
param  123callBack  showNewBieHelpUIManager getContentSizeyxgetPositionpccconvertToWorldSpacegetParentButton_2getChildByName	view����worldMapLogic step4 btn 'pos x y size complete  � 	 2�6     9  +  6 ' B99B 3   9 ) +  + B2  �K  �scroll2City 	nameWORLDMAPdata.Config_UIrequiregetUILogicByNameUIManagerstep4 worldMapLogic 
com2 	 �   C�U3   3 3 3 6  9+  6 '
 B99	B
  X� 9
 +	 BX� B2  �K  enterWorldMap	nameHOMEUIdata.Config_UIrequiregetUILogicByNameUIManager    '5LOOOOOOOOOOPPQQQQQQSSUUstep7 step5 step4 step3 logic 
 �  	 #�9 6 99  X
�6  96 B6 9 9BK  
checknewBieProxyGameGlobalNewBieScriptremoveEventsEventManagerBATTLEREWARD2Config_UI	nameobject  param   � 	  #�3   6  96 6 6 ' B9  B6  9+  6	 9
9B 9BK  closeIt	nameBATTLEREWARDConfig_UIgetUILogicByNameREMOVEapp.event.UIManagerEventrequireUIManagerNewBieScriptaddEventEventManager 											removed  �  6^�6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A99 9B6   9+	  5
 >
>
>
6 9*  *  B>
5 -  =5 =>
BK   �       
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParent
closegetChildByName	view	nameBATTLEREWARDdata.Config_UIrequiregetUILogicByNameUIManager����com logic ,btn 'pos x y size  �   �3   3 6 9 9)  B2  �K  canNotClickScreenForSecnewBieProxyGameGlobal  com 
begin 	 �  )�9 6 ' B99  X�6  96 B-  BK    NewBieScriptremoveEventsEventManagerBATTLEREWARDdata.Config_UIrequire	namestep13 object  param   � 	 �
3   6  96 6 6 ' B9  BK    ADDapp.event.UIManagerEventrequireUIManagerNewBieScriptaddEventEventManager 
step13 shown  �  *�6     9  +  6 ' B99B 3  BK   � 	nameBATTLERESULTUIdata.Config_UIrequiregetUILogicByNameUIManagerstep13 resultLogic com  � 	 #1�6  9 9  B6  9+  6 ' B99B6  9	6  9
96 ' B99+  5 5 == -  BK  �arrinsInfo 
insId	hard batType chapterId starNumBATTLERESULTUIsceneContextnewBieProxy
addUI	nameBATTLEUIdata.Config_UIrequireremoveUIUIManagerMODULE_INSTANCE_instBattleinstanceProxyGameGlobalstep12 arr  $ �  -�6   96 B6 9 9-  )	 ) ) )	  )
 ) ) ' BK     send_modifyNewbieAndCallFunnewBieProxyGameGlobalNewBieScriptremoveEventsEventManagerstep11 object  param   � 	
 (�3   6  96 6 996 ' B9	  BK  �BATTLECONTROL_INS_ENDED!app.event.BattleControlEventrequiresceneContextnewBieProxyGameGlobalNewBieScriptaddEventEventManager step11 battleFinishCb  t   �6   96 B-  BK  �NewBieScriptremoveEventsEventManagerstep2 object  	param  	 �   /`�T3   3 3 3 6  9+  6 '
 B99	B  X�3
 6  96	 6
 9

6 ' B9 B6 9 9B6 9 9)	  )
 ) BX� B2  �K  send_validInstBattlesend_getInstInfovalidInstBattle!app.event.InstanceProxyEventinstanceProxyGameGlobalNewBieScriptaddEventEventManager 	nameBATTLEFIELD22data.Config_UIrequiregetUIByNameUIManager    38AEEEEEEEEEEGGKMMMMMMMMMMMMNNNNNPPPPPPPPPRRTTstep13 .step12 -step11 ,step2 +ui 
!shown  �   �6   96 B6 9 9BK  
checknewBieProxyGameGlobalNewBieScriptremoveEventsEventManagerobjectg  param   � 	
  �6   96 6 96 ' B9-  B6 9 9	  BK   �#MODULE_HERO_heroUpdatePositionheroProxyvalidInstBattle!app.event.InstanceProxyEventrequireinstanceProxyGameGlobalNewBieScriptaddEventEventManagershown arr   �   2F�3   3 6  9+  6 ' B99B 9B6	 9
 9 )
 ) )
 6		 9		9		:		6
	 9

9

:

6	 99:6	 99:6	 99:6	 99:B2  �K  insBatSetuplocalPlayer send_modifyNewbieAndCallFunnewBieProxyGameGlobalbattleArrayAjust	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManager  
shown 1complete 0 �   2T�3   6  9+  6 ' B99B9 9B 9	6
 9	 9B A  A99 9B6  9+	  5
 >
>
>
6
 9)  )  B>
5 = 5 =>
BK         点击出征
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnBattle	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManager com 1btn &pos x y size  �  
 �6     9  6 996 ' B99+  5	 -  B K   � 
insId�chapterIdbatType 	hard 	nameREADYTOBATTLEdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep6  �  8j�
6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A996 9)d )d B6   9+	  5
 >
>
>
6 9*  *  B>
5 -  =5 =>
BK  �       点击关卡
param  123callBack  showNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParentn1getChildByNamecurInstanceMenu	nameWORLDMAPdata.Config_UIrequiregetUILogicByNameUIManager����
step5 worldMapLogic .btn )pos x y size  #    
�-   B K    step4  �  �3   6  9+  6 ' B99B 9  BK    moveToMaxCity	nameWORLDMAPUIdata.Config_UIrequiregetUILogicByNameUIManager step4 cb  � 7W�6     9  +  6 ' B99B   9  ' B   9 B 9	6
 9  9 B A  A6
 9)d )d B3 6   9+  5 9	>	9	>	>6	
 9		*  *  B	>	5	 =	5
 =
	>	BK  �       点击收复
param  123callBack  yxshowNewBieHelp 	sizegetPositionpccconvertToWorldSpacegetParentButton_ShoufugetChildByName	nameWORLDMAPUIdata.Config_UIrequiregetUIByNameUIManager����
step4 btn )pos size com  �  	 ,�4  5  > 5 > 5 6 99=> 5 > 6  96 9	9
6 ' B99+  5 = -  =BK  �callBack	list  TALKBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager headId�N	name香香	talkt主公，如果不知道接下来该攻击哪个城池的话，就点击收复按钮吧，不要忘记了哦！ headId����	talk我…………	namelocalPlayerGameGlobal headId�	name关平	talkb主公，我军应速往救援。全军听令，发兵晋…对了，晋阳该怎么走啊？ headId�'	name传令兵	talkz报！启禀主公，董卓帐下大将华雄大破诸侯联军，现已将联军从汜水关追赶至晋阳城下。		

step3 arr  �   L�`3   3 3 3 3 6  9+  6	 ' B	9			9	
	B
  X� 9	 +
 BX� B2  �K  enterWorldMap	nameHOMEUIdata.Config_UIrequiregetUILogicByNameUIManager     9FXZZZZZZZZZZ[[\\\\\\^^``step6 step5 step4 step3 step2 logic 
 G    �	6   9    9  B K  
checknewBieProxyGameGlobal �  	 "/�	6     9  6 B 4  5 > 5 > 5 > 5 > 5 > 6  9	6
 996 ' B99+  5 = -  =BK    callBack	list  	nameTALKBOXdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManager headId�	name曹植	talk8哼，大花痴，就知道偏袒关平………… headId�N	name香香	talk\既然如此，还请主公为关平将军的部队装备军械，帮助他进阶吧。 headId�	name曹植	talkS武将进阶之后，不但属性能得以提升，还可开启新的技能。 headId�	name曹植	talk\恭喜主公，这么多训练器材，若能用于我军武将，必能使其进阶。 headId�N	name香香	talkJ启禀主公，我军在晋阳城中缴获了不少训练器材哦！NewBieScriptremoveEventsEventManager		

step6 arr  � 	 �	3   6  96 6 6 ' B9  BK   � EXITBATTLE_HANDLE_COMPLETEDapp.event.GameGlobalEventrequireGameGlobalNewBieScriptaddEventEventManager step6 com  � 	 #0�	6  9 9  B6  9+  6 ' B99B6  9	6  9
96 ' B99+  5 5 == -  BK  �arrinsInfo 
insId	hard batType chapterId starNumBATTLERESULTUIsceneContextnewBieProxy
addUI	nameBATTLEUIdata.Config_UIrequireremoveUIUIManagerMODULE_INSTANCE_instBattleinstanceProxyGameGlobalstep5 arr  $ �  ,�	6   96 B6 9 9-  ) ) ) )	  )
 )� ) ' BK     send_modifyNewbieAndCallFunnewBieProxyGameGlobalNewBieScriptremoveEventsEventManagerstep4 object  param   � 	 -�	
6   9    9  + B 3  6  96 6  996 '	 B9
  BK  �BATTLECONTROL_INS_ENDED!app.event.BattleControlEventrequiresceneContextNewBieScriptaddEventEventManager setGuidingnewBieProxyGameGlobal
step4 battleFinishCb  #    
�	-   B K   step3  �.�	-   9 B3 6 9 *  BK   �  performWithDelayGlobalscheduler changeSpeed����logic step3 object  param  cb  � 7j�	6     9  +  6 ' B99B 3 9  9'	 B 9
B 96 9
 9B A  A99 9B6  	 9+
  5 >>>6 9*  *  B>5 =5 =>B2  �K  �       点击加速
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentbattlespeedgetChildByName	view 	nameBATTLEUIdata.Config_UIrequiregetUILogicByNameUIManager����




step3 logic -comSpd ,btn 'pos x y size  �   5�		6   9    9  + B 6   9  9    9  ) )�B 4 5 9 =>6  99 9 -  BK  �showTalkBubble headId�	talkb久闻华雄精通军阵，今日一见也不过如此。主公，让我们速战速决吧！uIdgetGroupByPartyIdAndDefIdsceneContextsetGuidingnewBieProxyGameGlobal	stepSpd zhaoyun arr 	 t   �	6   96 B-  BK    NewBieScriptremoveEventsEventManagerstep2 object  	param  	 � 	
  �	3   6  96 6 996 ' B9	  BK  �BATTLECONTROL_START!app.event.BattleControlEventrequiresceneContextnewBieProxyGameGlobalNewBieScriptaddEventEventManager step2 started  t   �	6   96 B-  BK  �NewBieScriptremoveEventsEventManagerstep1 object  	param  	 �   2z�	^3   3 3 3 3 3 3 6 	 9+
  6	 '
 B99B  X�3 6	 	 9		6 6 96	 ' B9 B	6	 9			 9		B	6	 9			 9		)  ) )� B	X� B2  �K  send_validInstBattlesend_getInstInfovalidInstBattle!app.event.InstanceProxyEventinstanceProxyGameGlobalNewBieScriptaddEventEventManager 	nameBATTLEFIELD13data.Config_UIrequiregetUIByNameUIManager       );EMOOOOOOOOOOPPTVVVVVVVVVVVVXXXXXZZZZZZZZZ\\^^step6 1step5 0step4 /step3 .stepSpd -step2 ,step1 +ui 
!shown  G    �	6   9    9  B K  
checknewBieProxyGameGlobal n   	�	3   6 9 9)   BK  canNotClickScreenForSecnewBieProxyGameGlobal ok  � 	 �	6  9 9  6  9 9)�B9B-  BK   �uIdgetHeroByIdlocalPlayer$MODULE_HERO_oneKeyPushEquipmentheroProxyGameGlobalstep7 rec   �  
 *�	-   4  =  -   6 -   9B9B=  6  9    9  - ) ) ) 6 9	 9)
�B9	B K   �  uIdgetHeroByIdlocalPlayer send_modifyNewbieAndCallFunnewBieProxyGameGlobalequValidgetCurrentHero
clonecurEquipValidlogic step6  � 9d�	6     9  +  6 ' B99B 3   9 B 9'	 B 9
B 96 9
 9B A  A 9B6   9+  5	 9
>
	9
>
	>	6
 9

*  *  B
>
	5
 =
5 =
>
	B2  �K  �       点击一键装备
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentButton_equip_oncegetChildByNamegetCurrentRightUI 	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManager����			





















step6 logic /com .equBtn 'pos size  �   $3�
6     9  +  6 ' B99B 6   99  9B6 ' B9	9+  5 6
 9
 9)�B=9 =-  BK  �allHero _Activated_heroConfigsArray	hero 
indexinActiveNum getHeroByIdlocalPlayerGameGlobalHEROATTRIBUIgetParent	view
addUI	nameHEROUIdata.Config_UIrequiregetUILogicByNameUIManagerstep4 logic  �  ;W�
6     9  +  6 ' B99B 9  9B 96	 9
9  9B A  A9 =9=6	 9)h)� B6   9+  5 9>9>>6	 9
*
 * B>5 -	  =	5	 =	>BK           点击赵云
param  123callBack  showNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParent_heroList_tableview	nameHEROUIdata.Config_UIrequiregetUILogicByNameUIManager������step3 logic 1pos #size  /  �

3     BK  � 		
step3 com  �  	 �
6     9  6 996 ' B99, -  B K    	nameHEROUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep2  � ;b�

3   6  9+  6 ' B99B 9' B 9'	 B 9
B 96 9
 9B A  A6 9)d )d B6  9+  5	 9
>
	9
>
	>	6
 9

*  *  B
>
	5
 = 
5 =
>
	BK  �       点击武将
param  123callBack  yxshowNewBieHelp	sizegetPositionpccconvertToWorldSpacegetParentButton_HeroNodeMenugetChildByName	nameWORLDMAPUIdata.Config_UIrequiregetUIByNameUIManager ����																						
step2 com :view ,btn (pos size  �  	 �
6     9  6 996 ' B99, -  B K    	nameHEROUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep2  � 8a�
	3   6  9+  6 ' B99B9 9'	 B 9
B 96 9
 9B A  A6 9)d )d B6  9+  5	 9
>
	9
>
	>	6
 9

*  *  B
>
	5
 = 
5 =
>
	BK  �       点击武将
param  123callBack  yxshowNewBieHelp	sizegetPositionpccconvertToWorldSpacegetParentButton_HerogetChildByName	view	nameHOMEUIdata.Config_UIrequiregetUILogicByNameUIManager ����	step2 com 7homeUI 
-btn (pos size  �   V�	E3   3 3 3 3 3 3 6 	 9B	 9	B6 
 9B9
9 X� BX� B2  �K  HOMEUISCENEsceneNametblgetCurScenegetResourceManagerGameGlobal       (3=>>>>>>>>>>>>>>>AAACCEEstep7 step6 step4 step3 step2 step1 step0  G    �
6   9    9  B K  
checknewBieProxyGameGlobal � 	  !.�
6     9  +  6 ' B99B 3  4 5 >5 >6   9	6
 996 ' B99+  5 == BK  callBack	list  TALKBOXsceneContextnewBieProxyGameGlobal
addUI headId�N	name香香	talk\光进阶可不够哦，关平将军若能升级一下技能，战力会更进一步。 headId�	name关平	talk;多谢主公，我的部队战力得以飞速提升。 	nameHERORANKUPSUCCESSdata.Config_UIrequireremoveUIUIManagercom arr  �  8c�
	6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A99 9B6   9+	  5
 9>
9>
>
6 9*  *  B>
5 -  =5 =>
BK   �       点击确定
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnConfirmgetChildByName	view	nameHERORANKUPSUCCESSdata.Config_UIrequiregetUILogicByNameUIManager����	step10 logic .btn )pos x y size  c   	�
6   9    9  + B -   B K    setGuidingnewBieProxyGameGlobalstep9  �
 9�

9 6 ' B99  X�6  96 6 6 '	 B9	B3
 6 9 9)  BK    canNotClickScreenForSecnewBieProxyGameGlobal ADDapp.event.UIManagerEventUIManagerNewBieScriptremoveEventEventManagerHERORANKUPSUCCESSdata.Config_UIrequire	name
step9 objectg  param  ok  �
&;�
3  6 9 9*  B6 9 9+ B6  96 6 6	 '	
 B9 B6 9 9  6 9 9)	�B9BK  �uIdgetHeroByIdlocalPlayerMODULE_HERO_heroUpRankheroProxyADDapp.event.UIManagerEventrequireUIManagerNewBieScriptaddEventEventManagersetGuidingcanNotClickScreenForSecnewBieProxyGameGlobal ���	step9 rec  'shown % �   %,�
6     9  +  6 ' B99B 6  9  6 9	 9
)�B9= 6  9    9  -  ) ) ) 6 9		 9
)
�B9B K     send_modifyNewbieAndCallFunnewBieProxyuIdgetHeroByIdlocalPlayerheroUidheroProxyGameGlobal	nameCOSTCONFIRMUIdata.Config_UIrequireremoveUIUIManagerstep8  �  8a�	6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A99 9B6   9+	  5
 9>
9>
>
6 9*  *  B>
5 -  =5 =>
BK   �       点击确定
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentconfirmgetChildByName	view	nameCOSTCONFIRMUIdata.Config_UIrequiregetUILogicByNameUIManager����	com3 logic .btn )pos x y size  � #E�
3   3 6 ' B6 9 9)�B9 896	  9
- 9 9B6 '	 B99+  5	 =	
 B2  �K     �  	nameCOSTCONFIRMUIdata.Config_UIgetParent	view
addUIUIManager	cost	rankgetHeroByIdlocalPlayerGameGlobaldata.Config_HeroQualityrequire  step8 logic com3 "com2 !cost  � 9d�
6     9  +  6 ' B99B 3   9 B 9'	 B 9
B 96 9
 9B A  A 9B6   9+  5	 9
>
	9
>
	>	6
 9

*  *  B
>
	5
 =
5 =
>
	B2  �K  �       点击进阶
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentButton_equip_oncegetChildByNamegetCurrentRightUI 	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManager����step8 logic /com .equBtn 'pos size  �   $3�6     9  +  6 ' B99B 6   99  9B6 ' B9	9+  5 6
 9
 9)�B=9 =-  BK  �allHero _Activated_heroConfigsArray	hero 
indexinActiveNum getHeroByIdlocalPlayerGameGlobalHEROATTRIBUIgetParent	view
addUI	nameHEROUIdata.Config_UIrequiregetUILogicByNameUIManagerstep7 logic  �   $V�
k3   3 3 3 6  9+  6 '
 B99	B  X�3
 6  96	 9		9		6
 ' B
9

9
	
,  BX� B2  �K  HEROUIsceneContextnewBieProxyGameGlobal
addUI 	nameHEROATTRIBUIdata.Config_UIrequiregetUIByNameUIManager    (2C]__________``egggggggggggggggiikkstep10 #step9 "step8 !step7  ui 
openNext  y   �-     9   -  9-  9+ B 6  :  B K   �NewBieScriptskillNumheroUId
lvlUplogic  �   3U�6     9  +  6 ' B99B 9  9' B 9	6
 9)  )  B A 9B3 6   9+  5	 9
>
	9
>
	>	6

 9

)  )  B
>
	5
 =
5 =
>
	B2  �K         点击技能
param  123callBack  yxshowNewBieHelp getContentSizepccconvertToWorldSpaceLvUp_ButtongetChildByName	view	nameHEROSKILLLVUPUIdata.Config_UIrequiregetUILogicByNameUIManagerlogic )btn $pos size com  �   )>�6     9  -  9 9B6 ' B99+  5 - =	-  	 9
B=6 '	 B6 -
  
 9


B
9

B8' -	 &	8=- B K   ��  
skillskidtonumberdata.Config_Hero	herogetCurrentHeroskillNum  	nameHEROSKILLLVUPUIdata.Config_UIrequiregetParent	view
addUIUIManagerattribLogic i step5  �  J��6     9  +  6 ' B99B   9 B 9' B 9'	 B)  9'
  &B 9'  &B 9B 96 9 9	B	 A  A 9B3 6  	 9+
  5 9>9>>6 9)  )  B>5 =5 =>B2  �K   �       点击技能
param  123callBack  yxshowNewBieHelp getContentSizepccconvertToWorldSpacegetParentskillimg_skill_box_Image_levelup_boxImage_1getChildByNamegetCurrentRightUI	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManagerstep5 attribLogic @node 5i 4skillImg (pos size com  �   $3�6     9  +  6 ' B99B 6   99  9B6 ' B9	9+  5 6
 9
 9)�B=9 =-  BK  �allHero _Activated_heroConfigsArray	hero 
indexinActiveNum getHeroByIdlocalPlayerGameGlobalHEROATTRIBUIgetParent	view
addUI	nameHEROUIdata.Config_UIrequiregetUILogicByNameUIManagerstep4 logic  �  ;W�6     9  +  6 ' B99B 9  9B 96	 9
9  9B A  A9 =9=6	 9)h)� B6   9+  5 9>9>>6	 9
*
 * B>5 -	  =	5	 =	>BK           点击赵云
param  123callBack  showNewBieHelp	sizeyxgetPositionpccconvertToWorldSpacegetParent_heroList_tableview	nameHEROUIdata.Config_UIrequiregetUILogicByNameUIManager������step3 logic 1pos #size  /  �3     BK  � 	

step3 com  �  	 �6     9  6 996 ' B99, -  B K    	nameHEROUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep2  � 7^�
3   6  9+  6 ' B99B 9' B 9	B 9
6 9
 9B A  A6 9)d )d B6  9+  5	 9
>
	9
>
	>	6
 9

*  *  B
>
	5
 = 
5 =
>
	BK  �       点击武将
param  123callBack  yxshowNewBieHelp	sizegetPositionpccconvertToWorldSpacegetParentButton_HerogetChildByName	nameHOMEUIdata.Config_UIrequiregetUIByNameUIManager ����																						
step2 com 6view 
,btn (pos size  �   I�J3   3 3 3 3 6  9+  6	 ' B	9			9	
	B  X� BX� B2  �K  	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManager     %+8CDDDDDDDDDDEEFFFHHJJstep5 step4 step3 step2 step1 logic 
	 �   	 �6     9  +  6 ' B99B 6  9    9  B K  
checknewBieProxyGameGlobal	nameHEROUIdata.Config_UIrequireremoveUIUIManager �  Gr�
6     9  +  6 ' B99B   9 B6   9+  6 ' B99B9 9	'
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
	BK   �       点击返回
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentButton_ChangeProjectNode_1getChildByName	viewHEROUIcloseIt	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManager����																							
step10 logic =logic 0btn 	'pos size  �  :\�6     9  +  6 ' B99B 9  9' B 9'	 B 9
B 96 9	 9B A  A 9B6   9+  5 9	>	9	>	>6	 9		*  *  B	>	5	 -
  =
	5
 =
	>	BK  �       点击返回
param  123callBack  yxshowNewBieHelpgetContentSizegetPositionpccconvertToWorldSpacegetParentButton_ChangeProjectNode_1getChildByName	view	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManager����step9 logic 0btn 	'pos size  �   �6     9  +  6 ' B99B -   B K  �	nameHEROSKILLLVUPUIdata.Config_UIrequireremoveUIUIManagerstep8  �  	 #B�6   9    9  )�B 9  6  9 9-    ) ) ) B6  9+  6 '	 B9
9B  X� 9B- BK   �  setHeroInfo	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManagerMODULE_HERO_heroUpSkillheroProxyuIdgetHeroByIdlocalPlayerGameGlobalarr step7 uid attribLogic  �
�3  6 9 9*   B2  �K  �canNotClickScreenForSecnewBieProxyGameGlobal ��̙����step7 arr  cb 	 �  	 (�6   9    9  )�B 9  6  9= 6  9) =6  9 9-  ) ) )   )	 )
 B	K     send_modifyNewbieAndCallFunnewBieProxycurrentMySkillPoscurrentMyUidheroProxyuIdgetHeroByIdlocalPlayerGameGlobalstep6 uid  �  3[�6     9  +  6 ' B99B 9  9' B 9	6
 9	 9B A  A 9B3 6   9+  5	 9
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
	BK  �       点击技能
param  123callBack  yxshowNewBieHelp getContentSizegetParentpccconvertToWorldSpaceLvUp_ButtongetChildByName	view	nameHEROSKILLLVUPUIdata.Config_UIrequiregetUILogicByNameUIManager
step6 logic )btn $pos 	size com  �   )>�6     9  -  9 9B6 ' B99+  5 - =	-  	 9
B=6 '	 B6 -
  
 9


B
9

B8' -	 &	8=- B K   ��  
skillskidtonumberdata.Config_Hero	herogetCurrentHeroskillNum  	nameHEROSKILLLVUPUIdata.Config_UIrequiregetParent	view
addUIUIManagerattribLogic i step5  �  6t�6     9  +  6 ' B99B   9 B 9' B 9'	 B)  9'
  &B 9'  &B 9B 96 9 9	B	 A  A 9B3  B2  �K  � getContentSizepccconvertToWorldSpacegetParentskillimg_skill_box_Image_levelup_boxImage_1getChildByNamegetCurrentRightUI	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManager
step5 attribLogic ,node !i  skillImg pos size com  �   $3�6     9  +  6 ' B99B 6   99  9B6 ' B9	9+  5 6
 9
 9)�B=9 =-  BK  �allHero _Activated_heroConfigsArray	hero 
indexinActiveNum getHeroByIdlocalPlayerGameGlobalHEROATTRIBUIgetParent	view
addUI	nameHEROUIdata.Config_UIrequiregetUILogicByNameUIManagerstep4 logic  #    
�-   B K  �step3  �  	 �6     9  6 996 ' B99, -  B K  �	nameHEROUIdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep2  �   w�l3   3 3 3 3 3 3 3 3 3		 6

 
 9

+  6 ' B99B

  X�	 BX� B2  �K  	nameHEROATTRIBUIdata.Config_UIrequiregetUILogicByNameUIManager          !6CPVZ]ffffffffffgghhhjjllstep10 step9 step8 step7 step6 step5 step4 step3 step2 step1 logic 
	 c   �6   96 BK  NewBieScriptremoveEventsEventManagerobjectg  param   � 	
  �6   96 6 96 ' B9-  B6 9 9	  BK   �#MODULE_HERO_heroUpdatePositionheroProxyvalidInstBattle!app.event.InstanceProxyEventrequireinstanceProxyGameGlobalNewBieScriptaddEventEventManagershown arr   �   2F�3   3 6  9+  6 ' B99B 9B6	 9
 9 ) ) )
 6		 9		9		:		6
	 9

9

:

6	 99:6	 99:6	 99:6	 99:B2  �K  insBatSetuplocalPlayer send_modifyNewbieAndCallFunnewBieProxyGameGlobalbattleArrayAjust	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManager  shown 1complete 0 �   2T�3   6  9+  6 ' B99B9 9B 9	6
 9	 9B A  A99 9B6  9+	  5
 >
>
>
6
 9)  )  B>
5 = 5 =>
BK         点击出征
param  123callBack  showNewBieHelpgetContentSizeyxgetPositionpccconvertToWorldSpacegetParentBtnBattle	nameREADYTOBATTLEdata.Config_UIrequiregetUILogicByNameUIManager com 1btn &pos x y size  �  
 �6     9  6 996 ' B99+  5	 -  B K   � 
insIdchapterIdbatType 	hard 	nameREADYTOBATTLEdata.Config_UIrequiresceneContextnewBieProxyGameGlobal
addUIUIManagerstep3  �  8b�6     9  +  6 ' B99B 9  9' B 9	B 9
6 9	 9B A  A6 9)d )d B6   9+  5 9	>	9	>	>6	 9		*  *  B	>	5	 -
  =
	5
 =
	>	BK  �       点击城池
param  123callBack  yxshowNewBieHelp	sizegetPositionpccconvertToWorldSpacegetParentn2getChildByNamecurInstanceMenu	nameWORLDMAPdata.Config_UIrequiregetUILogicByNameUIManager����step2 worldMapLogic .btn )pos size  �   #T�+3   3 3 6  9+  6 99B
  X� 9 BX�6  9+  6 9	9B 9
) +	 
 + B2  �K  scroll2CityWORLDMAPenterWorldMap	nameHOMEUIConfig_UIgetUILogicByNameUIManager   "$$$$$$$$%%&&&&&(((((((()))))))++step3 "step2 !step1  logic worldMapLogic  �   8q �4   7   6   5 = 6   3 > 6   3 > 6   3 > 6   3 > 6   3 > 6   3 >" 6   3	 > 6   3
 > 6   3 >	 6   3 >
 6   3 > 6   3 > 6   3 > 6   3 > 6   3 > 6   3 > 6   2  �L                     "	

orderNewBieScript     m � � ���rrt������""%zz|���''*������115������\\^�����  