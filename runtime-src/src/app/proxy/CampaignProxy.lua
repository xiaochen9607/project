LJP@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\proxy\CampaignProxy.lua�  \ ��U+ =  +  = 5 = +  = )  = )  = 5 = 4  =	 4  =
 +  = +  = )  = )  = 5 = ) = )  = )  = )  = )  = )  = )  = 4  = 5 = 4 5 >5 >5 >5 >5  >5! >= '# =" ) =$ )  =% '# =& '# =' )  =( 5* =) 5, =+ 5. =- 4 50 >51 >52 >53 >54 >55 >=/ )  =6 )  =7 )  =8 )  =9 )  =: 4  =; 4  =< 4  == )  => ) =? )  =@ '# =A '# =B 4  =C +  =D +  =E )  =F )  =G ) =H )��=I )��=J 4  =K 4  =L 4  =M )  =N )  =O )  =P )  =Q )  =R )  =S )  =T 5V =U 4  =W )  =X ) =Y )  =Z 4  =[ K  dimEliteFirstPassdimHardselectedDimdimMaxLeveldimEliteInfos  ������������������������dimBatInBatSetupdimEliteBuyTimesdimBuyTimesdimResetTimesdimEliteCurLeveldimCurLeveldimEliteRestTimesdimRestTimespassedClassicPointIdcur_bingshucur_duleNpcDatacur_duelBattleInstcur_duelBattleHeroIdvalidTimeStampfourSidesBuffLvbuyFixedNumarenaRankUpafterOpenBoxlastEnterBatInfoarenaShop_BoughtStatearenaShop_nextFreshTimearenaShop_refreshTimesarenaClearCdCostarenaInfo_opponentSeqarenaInfo_opponentsarenaInfo_atkSquadarenaInfo_defSquadarenaInfo_timesPurchasedarenaInfo_latestActionTimetimesReflesharenaInfo_timesLeftarenaInfo_rank  ��������  ��������  ��������  ��������  ��������  ��������arenaEnemyHeroState  ������������������������arenaEnemyHero  ������������������������arenaHeroState  ������������������������arenaHerodianfengTimesLeftexpeditionShop_BoughtState!expeditionShop_nextFreshTime expeditionShop_refreshTimesexpeditionEnemyLvexpeditionEnemyName  ��������  ��������  ��������  ��������  ��������  ��������expeditionEnemyHeroState  ������������������������expeditionEnemyHeroexpeditionHeroStateexpeditionRankresetTimesexpeditionScoreexpeditionBoxIsOpenexpeditionNextPointIdexpeditionLatestPointIdexpeditionLatestChapterId  ������������������������expeditionInBatSetupexpeditionTimesLeft"heroTrialsCurSelectDifficulty"heroTrialsLatestChapterIdHardheroTrialsLatestChapterIdheroTrialsBatStateHardheroTrialsBatState  ������������������������heroTrialInBatSetupheroTrialTimesLeftclassicBatBuyTimesclassicBatCurSelectId  ������������������������classicBatInBatSetupclassicBatStatemenuState		

  ##$$%%&&''''''''''''''**++,,--..//0011223355667799::;;==??@@AABBCCDDFFHHIIJJKKLLMMNNOOPPQQRRSSTTUself  � G  #Z-   9 BL  �newCampaignProxy self  proxy  � 	  ^6   9  6 ' B95 =BK  
param  getArenaReportInfoapp.event.CampaignEventrequiresendEventEventManagerself  arr   � 
3Uc:	  X�6   96 99) 9  B6 9 99  B* =	 6
  9  6 ' B9BX�6 9 9B 9B6  9 -  99+  5	 BK  � id'	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorccresetArenaCoolTimeapp.event.CampaignEventrequiresendEventEventManagerarenaInfo_latestActionTimemodifyGoldlocalPlayerGameGlobalarenaClearCdCostresetArenastatisticsConfig_LanguagesetOnPurchaseTalkingDataManager��ֹ								









uiConfig self  4arr  4curScene )
 �   X�p:	  XN�6  9 9:B4  = 6  9:' + B)  ) M,�6 	 98
' + B4  6		 :B	=	6		 :B	=	
6		 :B	=	:	=	6		 :B	=	6		 :B	=	6		 :B	=	:	=	6	 9		9  B	:		=	O�9  = 6  9  6 '	 B95 =BX�6  96 9BK  doNotFreshFrequentlyConfig_LanguageaddMessageFloatMessage
param  refreshArenaPlayerapp.event.CampaignEventrequiresendEventEventManagertimesRefleshfactioninsert
tableheroInfoscombatPowerlv
defId	nameuId	typetonumber	rank,;
splitStringUtilarenaInfo_opponentssetGoldlocalPlayerGameGlobal							
self  Yarr  Yos >- - -i +o $opponent # � 
>h�:	  X(�6  99:!)   X	�6  96 99)  B6  9 9:B:=	 9
  =
 6  9  6 '	 B95 =BX�6 9 9B 9B6  9 -  99+  5	 BK  � id'	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc
param  buyArenaTimesapp.event.CampaignEventrequiresendEventEventManagerarenaInfo_timesPurchasedarenaInfo_timesLeftsetGold
arenastatisticsConfig_LanguagesetOnPurchaseTalkingDataManager	goldlocalPlayerGameGlobal						

uiConfig self  ?arr  ?price 	"curScene +
 � 	  �6   9  6 ' B95 =BK  
param  getArenaRankapp.event.CampaignEventrequiresendEventEventManagerself  arr   � 
"D�:	  X�6   9  6 ' B95 =BK  6 9 9	B 9
B6  9 -  99+  5	 BK  � id	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc
param  modifyArenaAtkSetupapp.event.CampaignEventrequiresendEventEventManageruiConfig self  #arr  #curScene  � 
"D�:	  X�6   9  6 ' B95 =BK  6 9 9	B 9
B6  9 -  99+  5	 BK  � id	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc
param  modifyArenaDefSetupapp.event.CampaignEventrequiresendEventEventManageruiConfig self  #arr  #curScene  �  `��&:	  XS�:=  := := := := 6  9:' + B= 6  9:' + B=	 6  9:	'
 + B4  = )  ) M,�6 	 98
' + B4  6	 :B	=	6	 :B	=	6	 :B	=	:	=	6	 :B	=	6	 :B	=	6	 :B	=	:	=	6	 9		9  B	:		=	O�6  9  6 ' B9BK  getArenaInfoapp.event.CampaignEventrequiresendEventEventManagerfactioninsert
tableheroInfoscombatPowerlv
defId	nameuId	typetonumber	rankarenaInfo_opponents;arenaInfo_atkSquad,
splitStringUtilarenaInfo_defSquadarenaInfo_timesPurchasedarenaInfo_latestActionTimetimesReflesharenaInfo_timesLeftarenaInfo_rank     !!$$$$$$$$$&self  aarr  aos %2- - -i +o $opponent # �   ,�
6  9 ) ' B6  9 ) )  B6  9 ) ' B6  9 ) ' B  9  + BK   MODULE_CAMPAIGN_arenaBattle-1insert
table
self  arr   � :���e:  Xv�6  9 9B 9B6  9+  6 '
 B99	B:	 X�6  9
 -  99	+	  5
 6   9 B=
BK  :	 X�6  9
 -  99	+	  5
 BK  :	 X�6  9
 -  99	+	  5
 BK  :	 X�6  9
 -  99	+	  5
 BK  :	 X�6  9
 -  99	+	  5
 B4  = K  :	 X�6  9 9B 9B6  9
 -	  9		9			+
  5 BK  K  :
  X�:	 X�+  = X�4  = 9 :=9 :=9 :=9 ) =9 ) =5 4 5 >5 >5  >5! >5" >5# >5$ 4 5% >5& >5' >5( >5) >5* >4 :>:	>:
>:>:>:>4 :	>	:	>	:	>	:	>	:	>	:	>	9	 9		)
 ) ) M
9�8+ X�6,  9-8'. B6 '/ B 908:::B<4 891>892><8+ X�6,  9-8'. B6 '/ B 908:::B<4 891>892><O
�6
3 9
4
4 :>:>:>:>:>:>=5
6
3 9
4
4 :>:>:>:>:>:>=6
6
3 9
4
4 :>:>:>:>:>:>=7
6
3 9
4
4 :>:>:>:>:>:>=8
  9
9 :: B
K  �enterBattlearenaEnemyHeroStatearenaEnemyHeroarenaHeroStatearenaHerocampaignGameGlobalmoralehpcreateOneHeroByStrapp.proxy.vo.Hero,
splitStringUtil-1  ��������  ��������  ��������  ��������  ��������  ��������  ������������������������  ��������  ��������  ��������  ��������  ��������  ��������  ������������������������batType
insIdlastEnterBatInfo	ranklastRank	goldarenaRankUp idpvpServerErrorarenaInfo_defSquad id7 id4 id3 id2	fun1send_getArenaInfohandler id1MESSAGEBOX
addUI	nameREADYTOBATTLEdata.Config_UIrequireremoveUIUIManagergetRunningScenegetInstanceDirectorcc������������������������ !!!""""""""""#%%%&&&&&&&&&&')))**********+---..........//022233333333444444444457;;;;;;===??@@@AAABBBFFFGGGIJJJJJJJJJJJJJKLLLLLLLLLLLLLMMMMMMMMMMMMMNNNNNNNNNNNNNOOQQQQRRRSSSSSSTTTTTTTTTTTUUUUUUUUWWWXXXXXXYYYYYYYYYYYZZZZZZZZQ________________````````````````aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbddddddeuiConfig self  �arr  �isBatReport  �curScene ncurScene bheros '�herosState �enemyHeros �enemyHerosState �hh �eh �batType �: : :i 8tmp 	tmp  � 	  �6   9  6 ' B95 =BK  
param  refreshFourSidesWarShopapp.event.CampaignEventrequiresendEventEventManagerself  arr   � 	  �6   9  6 ' B95 =BK  
param  refreshArenaShopapp.event.CampaignEventrequiresendEventEventManagerself  arr   � 	 !�:  X�  9  BK  6  9  6 ' B95 =BK  
param  buyArenaShopItemapp.event.CampaignEventrequiresendEventEventManagersend_getArenaShopself  arr   � 	 !�:  X�  9  BK  6  9  6 ' B95 =BK  
param  buyFourSidesWarShopItemapp.event.CampaignEventrequiresendEventEventManagersend_getFourSidesWarShopself  arr   � 	 
  �:=  := := 6  9  6 ' B95 =	BK  
param  getArenaShopapp.event.CampaignEventrequiresendEventEventManagerarenaShop_BoughtStatearenaShop_nextFreshTimearenaShop_refreshTimesself  arr   � 	 
  �:=  := := 6  9  6 ' B95 =	BK  
param  getFourSidesWarShopapp.event.CampaignEventrequiresendEventEventManagerexpeditionShop_BoughtState!expeditionShop_nextFreshTime expeditionShop_refreshTimesself  arr   �  Fp�:=  := 4 :>:>:>:	>:
>:>4  = 4  = ) ) ) ) M"�8 X�6 
 98' B9	 6
 '	 B

 9


8:::B
<
	9	 4
 9 89>
9 89>
<
	 O�6  9  6 '
 B9BK  getFourSidesWarEnemyapp.event.CampaignEventsendEventEventManagermoralehpcreateOneHeroByStrapp.proxy.vo.Herorequire,
splitStringUtil-1expeditionEnemyHeroStateexpeditionEnemyHeroexpeditionEnemyLvexpeditionEnemyName		

self  Garr  Geh 5j 0# # #i !tmp 	 � 	 $2�
:	  X�6   9  6 ' B95 =BX�:	 X	�6  96 '	 B9
BX�6  96 '	 B9BK  	czsbwbxdata.Config_LanguageaddMessageFloatMessagearr  openFourSidesWarBoxapp.event.CampaignEventrequiresendEventEventManager����
self  %arr  % �  g��":=  := := := := := :	= 4  = : X�6	  9
:' + B)  ) M�6	 	 9
8
' + B9 :	4
 :>
:>
<
	O�:= 9  	  X�6 6 ' B A H�9	 X�9=  FR�6 ' B9  89 89  X�9 	 X�6 6 ' B A H�99	  	 X�9=  X�FR�6  9  6 '	 B9BK  getFourSidesWarInfoapp.event.CampaignEventsendEventEventManagerinstanceidneedChapterId$data.Config_FourSidesWarChapterrequire
pairsexpeditionBoxIsOpen_,
splitStringUtilexpeditionHeroStatefourSidesBuffLv
curLvcurNameexpeditionRankresetTimesexpeditionLatestPointIdexpeditionLatestChapterId ����			






!!!!!!!!!"self  harr  hheroInfos   i heroInfo   k v  points !
 
 
k v   �    %&�6     9  6 9 9B 9B96 ' B9	9
B 6     9  6 9 9B 9B96 ' B99
B K  EXPEDITIONPOINTUI	nameWORLDWARUIdata.Config_UIrequireuiLayergetRunningScenegetInstanceDirectorcc
addUIUIManager L   �3   6  9  BK  returnHomeGameGlobal com  �1l�:6  9 9 B6 9 ) B6 9 9B 9B:  X�3	 6
  9 -	  9		9		+
  5 =B2  �K  6  9  6 '
 B95	 =	BK  �
param  fourSidesWarBattleapp.event.CampaignEventrequiresendEventEventManager	fun1 id	nameMESSAGEBOX
addUIUIManager getRunningScenegetInstanceDirectorccremove
tablesetArmyFoodlocalPlayerGameGlobal	





uiConfig self  2arr  2armyFood 0curScene returnToIns  �    %&�6     9  6 9 9B 9B96 ' B9	9
B 6     9  6 9 9B 9B96 ' B99
B K  CLASSICBATSELECTUI	nameWORLDWARUIdata.Config_UIrequireuiLayergetRunningScenegetInstanceDirectorcc
addUIUIManager L   �3   6  9  BK  returnHomeGameGlobal com  �3u�:	  X�6  9 9 B6 9 ) B6 9 9B 9B: X�3	 6
  9	 -
  9

9

+  5 =B2  �K  6  9  6	 ' B	9		5
 =
BK  �
param  classicBattleapp.event.CampaignEventrequiresendEventEventManager	fun1 id	nameMESSAGEBOX
addUIUIManager getRunningScenegetInstanceDirectorccremove
tablesetArmyFoodlocalPlayerGameGlobal 	

uiConfig self  4arr  4star  4armyFood 2curScene returnToIns  �    %&�6     9  6 9 9B 9B96 ' B9	9
B 6     9  6 9 9B 9B96 ' B99
B K  HEROTRIALUI	nameWORLDWARUIdata.Config_UIrequireuiLayergetRunningScenegetInstanceDirectorcc
addUIUIManager L   �3   6  9  BK  returnHomeGameGlobal com  �+���a:6  9 9 B6 9 ) B:
= 6 9 9B 9	B3
 :  X�6  9 -	  9		9		+
  5 =B2  �K  9 99 99 99 9'	 	  X
�'	 '
 	 &

8

 8


  X
�'
 	 &

8

 4  <
'
 	 &

8

 8

9


  X
�'
 	 &

8

 8

4  =
'
 	 &

8

 8

4 5 =>=
6
 9

' 	 &8 89B
+ ) 
 ) M�' 	 &8 8989 X�' 	 &8 8989 X�' 	 &8 898=+ X�O� X�6 9' 	 &8 89' 	 &8 89  5 ==B6 ' 	 &B89 6 9 B+ )  ) M�8 X� X�+ O�+   X�6 ' 	 &B6 9 B)  ) M�89! X�89"X�O�
  X�	 X�9#  X� =# =$ 9 	  X�9$   X�=# 6%  9&  6 '' B9(5) =*BK  �
param  heroTrialsBattleapp.event.CampaignEventsendEventEventManagerheroTrialsLatestChapterId"heroTrialsLatestChapterIdHardidneedChapterinstance"data.Config_HeroTrialsChapterrequire  insert	nums 	star insheroTrialsBatState	Hard	star
insIdchapterId	hardlastEnterBatInfo	fun1 id	nameMESSAGEBOX
addUIUIManager getRunningScenegetInstanceDirectorccheroTrialTimesLeftremove
tablesetArmyFoodlocalPlayerGameGlobal   !!"###&&&&&&&&&&&&&''''''''((((((())))))))))+++++++++,....//////////11111111112222222245.99::::::::::::::::::::=======>>>>?@@@@AAAAAB@EFFGGGGGHHHHIIIIJJJJKKLIQQSSTTTTUUWZZZ[[[[\```````````auiConfig self  �arr  �armyFood �curScene �returnToIns �hard �chapterId �insId �star �difficultyStr �len 2�found �     i curChatperInstance <GtotalIns CisLastIns B  l next 6chapterConf totalChapter 	 	 	j  `    	�6   ' B   9  ' B K  	fukuswitchToapp.utils.SwitchScenerequire �P��"6  9 9B 9B:	  X�6  9 -  99+  5	 B2 9�:	 X�)  )  6	 9
 96	 99B 3 6  9	 -
  9

9

+  5 ==B2  �K  : X�6  9 -  99+  5	 B2  �K  := 6	 9
 9:B  9 :BK  K  �enterBattlesetArmyFoodvalidTimeStamp id
	fun2
param idZ classicBatInBatSetupcampaigngetCostArmyFoodlocalPlayerGameGlobal idlevelNotEnough	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc��������	
!!!!"uiConfig self  Parr  PcurScene 	GbatPower cost openCharge 
 � 
1S�6  9 9B 9B:	  X�6  9 -  99+  5	 BK  : X�6  9 -  99+  5		 BK  :=
 6 9 9:B  9 :BK  �enterBattlesetArmyFoodlocalPlayerGameGlobalvalidTimeStamp id
 idlevelNotEnough	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc����			









uiConfig self  2arr  2curScene 	) `    	�6   ' B   9  ' B K  	fukuswitchToapp.utils.SwitchScenerequire �P��#6  9 9B 9B:	  X�6  9 -  99+  5	 B2 9�:	 X�)  )  6	 9
 96	 99B 3 6  9	 -
  9

9

+  5 ==B2  �K  : X�6  9 -  99+  5	 B2  �K  := 6	 9
 9:B  9 :BK  K  �enterBattlesetArmyFoodvalidTimeStamp id
	fun2
param idZ classicBatInBatSetupcampaigngetCostArmyFoodlocalPlayerGameGlobal idlevelNotEnough	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc��������
  !!!!!!""""#uiConfig self  Parr  PcurScene 	GbatPower cost openCharge 
 O   �-     9   - B K   � startInstanceScriptscene batStr  � 		e�	6     9  B 6  ' B   9  -  - - - + - B - = 3 6  9  *   B2  �K  ����
���repalceSceneGameGlobal isBattleReportcreateapp.scenes.BattleScenerequire
clearUIManager����		batType chapterId insId hard items isBatReport batStr scene entered 	 � 9���A  X�6  99B 6  B 6  9 ' B:6 :=9	 9
9	 99	 99	 96 9
 9B
 9B+	  	  X
�6
 ' B
8	
	 X
�6
 ' B
8	
	 X
�6
 ' B
8	
	 X
�6
 ' B
8	
	 X
�6
 ' B
8	
	 X
�4	  6
 8

9

=
	6
 9

9


 X
�6
 8	
4
   X �6  9 ' + B6  9  B)  ) M�6  9!
 6  9 
 B6  98'" + B AO�3# 9	6 '$ B9%6 '$ B'&  &86 '' B6  99(' B4  6  9)+      B 9*B6+  9,  B6+  9- B6.  9/B6  90B 91B6  90B 92B6  90B 93B6  90B 91B6  90B 946  90B9596B6.  97 98 +   + B2  �K  	name
addUIBATTLESCENEsceneNametblsetCurScenepurgeCachedDataUseEngineretainConstTexInMemoryshowTexCacheInfogetResourceManagerremoveNodeFromCacheUIManagerremoveDuplicateItemscombineTableTableUtilgetPreloadResgetBattleInforesapp.utils.StringUtilBATTLEFIELDLOADINGdata.Config_UI _insert	maxn,Config_InstanceDatadimConfig_GameDatabattleIdConfig_DuelInstbattleFieldIddata.Config_ArenaInst!data.Config_FourSidesWarInstdata.Config_HeroTrialsInstdata.Config_ClassicPointdata.Config_InstanceDatarequiregetRunningScenegetInstanceDirectorccbatType	hard
insIdchapterIdlastEnterBatInfolastPvpBattleStrGameGlobal@
splitStringUtiluncompress	_bufconcat
table 

                -.////0000000111222222344444444444455555566666::::;;;;;;;<<<<<<<=======>>>>>>>?????????????@@@@@@@@@@AAself  �itemStr  �batStr  �isBatReport  �tmpTotalStrArr chapterId �insId �hard �batType �curScene �insInfo �items -�tmp 	len   i loadComplete fbattleFieldId econf abattleFieldConf ZbattleFieldResArr 	Qarr PbattleRes D � 
"D�:	  X�6   9  6 ' B95 =BK  6 9 9	B 9
B6  9 -  99+  5	 BK  � id	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc
param  upFourSidesWarPositionapp.event.CampaignEventrequiresendEventEventManageruiConfig self  #arr  #curScene  � 
"D�:	  X�6   9  6 ' B95 =BK  6 9 9	B 9
B6  9 -  99+  5	 BK  � id	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc
param  upClassicPositionapp.event.CampaignEventrequiresendEventEventManageruiConfig self  #arr  #curScene  � 
"D�:	  X�6   9  6 ' B95 =BK  6 9 9	B 9
B6  9 -  99+  5	 BK  � id	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc
param  upHeroTrialsPositionapp.event.CampaignEventrequiresendEventEventManageruiConfig self  #arr  #curScene  � 
 4J�:	  X(�9   =  6 99:!)   X	�6  96 99)  B6 9 9	:B:=
 6  9  6 '	 B95 =BX�6  96 ' B9BK  	czsbdata.Config_Language.luaaddMessageFloatMessage
param  app.event.CampaignEventrequiresendEventEventManagerfourSidesBuffLvsetGoldresetFourSidesstatisticsConfig_LanguagesetOnPurchaseTalkingDataManager	goldlocalPlayerGameGlobalresetTimes												self  5arr  5price  �  -j�9  6 ' B	  X�9 6 ' B  	 X�)  L 8
  X�89  X�)  L ) 89 ) M�8
9

8
	
9


 X
�8
9

8
	
9

L
 O�)  L 	star
insIdins&data.Config_HeroTrialsChapterHardheroTrialsBatStateHard"data.Config_HeroTrialsChapterrequireheroTrialsBatState self  .type  .chapterId  .ins  .state ,conf )  i  �  H��9  6 ' B	  X�9 6 ' B )  X�)��L 8
  X	�89
  X�89 	 X�89:L ) 89 ) M�8	9		8		+
 89
  X�) 89 ) M	�8989	 X�+
 X�O�
 X�L	 O�8989 8L 
insIdinstanceins&data.Config_HeroTrialsChapterHardheroTrialsBatStateHard"data.Config_HeroTrialsChapterrequireheroTrialsBatState 																






self  Itype  IchapterId  Istate Gconf D!  i insId found 	
 
 
k  �  "���B4  =  := := := := 9 9 	  X�9 : X�6	  9
  6 '	 B95 =BK   )  ) M��6 
 98' B6	 :B	4
  <
	8
	6 	 B=
5
 : X&�6  9:' + B) ) ) M�8  X�8	 X�) >
X�8  X�8	 X�) >
X�8  X�8	 X�) >
O�8	=
8	4  =)  : X"�6  9:' B)  ) M�6  98' B6 :B6 :B6 :B8	95 ===< O�8	=8	4 :
>:
>:
>= ) ) ) M�8
	 X� X�8	9 ) <O�O�=  6	  9
  6 '
 B95	! =	BK    canGetStarstarTotalhaveGetReward	star
insId  _insgotStar,     chapterIdtonumber|
splitStringUtil
param  getHeroTrialsInfoapp.event.CampaignEventrequiresendEventEventManager-1heroTrialsBatStateHardgetHeroTrialsInfoTypeheroTrialsBatState"heroTrialsLatestChapterIdHardheroTrialsBuyTimeRestheroTrialsLatestChapterIdheroTrialTimesLeft
state
 		

      !!!""""""##'')))*+++,,,,,,----......///00011122222223-77999999999::::;;;;;;<<<<:@AAAAAAAAAAABself  �arr  �state �len �� � �i tmp ychapterId vgotstar ntmp 
  i starTotal !?insData 	  j tmpData insId star haveGetReward   i 
 � 	  ,�9    X�)  L )  6 9  BH�9 FR�L timesLeft
pairsclassicBatStateself  t 	  k v       
�) L self   0   
�9  L heroTrialTimesLeftself   1   
�9  L expeditionTimesLeftself   /   
�9  L dianfengTimesLeftself   +   
�9  L duelTimesLeftself   ,   
�9  L dreamTimesLeftself   '   
�9  L jinyiLeftself   �  #+�6  999	  X�6  999	  X�6  999	  X
�6  999	  X�)  )  J X�6  999) J K  freeReset	shop
elitenormal
towerloginProxyGameGlobal self  $ �  # s�� 4  =  6  9:' + B6 :B= 6  9:' + B)  ) M�6 
 98' + B9	  :
5 :=	:=
:=:=<
	O�6  9:' +	 B= := 6  9:' +	 B= := 6  9:' +	 B= := := :
= := 6 99:=:= 6  9:	' +	 B)  ) M�9	 8
+ <
	O�6  9  6	 ' B	9	 	5
! ="
BK  
param  getCampaignInfoapp.event.CampaignEventrequiresendEventEventManagerpassedClassicPointIdwangzheLeftrestTimeshuangjinnormalProxyGameGlobaljinyiLeftdreamTimesLeftduelTimesLeftarenaInfo_timesLeftexpeditionInBatSetupexpeditionTimesLeftheroTrialInBatSetupheroTrialTimesLeftclassicBatInBatSetuplatestStageIdtimesLeftisOpenid  _,tonumberclassicBatBuyTimes|
splitStringUtilclassicBatState				






 self  tarr  tclassicData 
jall _  i tmp tmpPointId ?  i  e   �6  999  X�)  L restTimeshuangjinnormalProxyGameGlobalself  	 �  �6  99	  X�9   X�)  L X�6  99L K  wangzheLeftleftTimeswangZheProxyGameGlobal self   �   6�=  6 ' B 96 96 9B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinish(MODULE_CAMPAIGN_openFourSidesWarBoxMODULE_CAMPAIGNmsgTypecreateapp.control.MsgrequireafterOpenBoxself  afterOpenBox  msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish(MODULE_CAMPAIGN_getFourSidesWarInfoMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  �   /U�9  =6 ' B 96 96 9B 9 B 9 B6	  9
 9	 B  9 B 9B6	 9 9 6	   9 B	4
 >
BK  handlersendMsggameSocketfinishaddStringvalidTimeStampgetBattleMd5StringGameGlobaladdInt"MODULE_CAMPAIGN_classicBattleMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequire	starlastEnterBatInfo				


self  0insId  0star  0batStr  0msg # �   7p�9  =6 ' B 96	 9		6
 9

B9  =	 9
 B	 9
 B	 9
 B	 9
 B6	 	 9

 9 B 	 9
 B	 9B6	 9	 9
 6   9 B AK  handlersendMsggameSocketfinishaddStringvalidTimeStampgetBattleMd5StringGameGlobaladdInt%MODULE_CAMPAIGN_heroTrialsBattleMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequire	starlastEnterBatInfo				



self  8hard  8chapterId  8insId  8star  8batStr  8msg + �   $7�	9  ) =9  =9  )  =6 ' B 96 96 9	B 9
 B 9B6 9 9 6 	  9
	 B AK  handlersendMsggameSocketGameGlobalfinishaddInt'MODULE_CAMPAIGN_validClassicBattleMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequire	hard
insIdbatTypelastEnterBatInfo	self  %id  %msg  �   -V�9  ) =9  =9  =9  =6 ' B 96 9	6 9
B 9 B 9 B 9 B 9B6 9 9 6	   9
 B	 AK  handlersendMsggameSocketGameGlobalfinishaddInt&MODULE_CAMPAIGN_validTrialsBattleMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequire	hard
insIdchapterIdbatTypelastEnterBatInfo			









self  .hard  .chapterId  .insId  .msg  �   'I�	9  ) =9  =9  =6 ' B 96 96 9	B 9
 B 9
 B 9B6 9 9 6 
  9	 B AK  handlersendMsggameSocketGameGlobalfinishaddInt&MODULE_CAMPAIGN_validFourSidesWarMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequire
insIdchapterIdbatTypelastEnterBatInfo	self  (chapterId  (insId  (msg  � 
  BP�
6  ' B 96 96 9B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 9
B6 9 9 6   9	 B AK  handlersendMsggameSocketfinishheroTrialInBatSetupcampaignGameGlobaladdInt)MODULE_CAMPAIGN_upHeroTrialsPositionMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequire										
self  Cmsg 8 � 
  BP�
6  ' B 96 96 9B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 9
B6 9 9 6   9	 B AK  handlersendMsggameSocketfinishclassicBatInBatSetupcampaignGameGlobaladdInt&MODULE_CAMPAIGN_upClassicPositionMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequire										
self  Cmsg 8 � 
  BP�
6  ' B 96 96 9B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 9
B6 9 9 6   9	 B AK  handlersendMsggameSocketfinishexpeditionInBatSetupcampaignGameGlobaladdInt+MODULE_CAMPAIGN_upFourSidesWarPositionMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequire										
self  Cmsg 8 �   2�=  6 ' B 96 96 9B 9 B 9B6	 9
 9 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt&MODULE_CAMPAIGN_getHeroTrialsInfoMODULE_CAMPAIGNmsgTypecreateapp.control.MsgrequiregetHeroTrialsInfoTypeself  type  msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish$MODULE_CAMPAIGN_getCampaignInfoMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish(MODULE_CAMPAIGN_getFourSidesWarInfoMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish)MODULE_CAMPAIGN_getFourSidesWarEnemyMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  �   5g�9  =6 ' B 96 96	 9		B 9	 B 9	 B 9	 B 9		 B6
  9	 9
 B7  9	6	 B 9B6
 9 9	 6
   9 B
 AK  handlersendMsggameSocketfinishbatStrvalidTimeStampgetBattleMd5StringGameGlobaladdStringaddInt'MODULE_CAMPAIGN_fourSidesWarBattleMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequire	starlastEnterBatInfo			









self  6chapterId  6insId  6star  6result  6msg ) � 
  &�	6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish(MODULE_CAMPAIGN_getFourSidesWarShopMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�	6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish,MODULE_CAMPAIGN_refreshFourSidesWarShopMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  �   0�	6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt,MODULE_CAMPAIGN_buyFourSidesWarShopItemMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  pos  msg  � 
  &�	6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish!MODULE_CAMPAIGN_getArenaInfoMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  �   +k�		9  9 86 ' B 96	 9		6
 9

B	 99
	B	 99

B	 99
B	 99
 B	 9B6 9	 9
 6   9 B AK  handlersendMsggameSocketGameGlobalfinisharenaInfo_rankuId	type	rankaddInt MODULE_CAMPAIGN_arenaBattleMODULE_CAMPAIGNmsgTypecreateapp.control.MsgrequirearenaInfo_opponentSeqarenaInfo_opponents	self  ,enemyRank  ,type  ,enemyUId  ,myRank  ,opponent (msg 
 � 
  BP�	
6  ' B 96 96 9B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 9
B6 9 9 6   9	 B AK  handlersendMsggameSocketfinisharenaInfo_atkSquadcampaignGameGlobaladdInt(MODULE_CAMPAIGN_modifyArenaAtkSetupMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequire										
self  Cmsg 8 � 
  BP�	
6  ' B 96 96 9B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 9
B6 9 9 6   9	 B AK  handlersendMsggameSocketfinisharenaInfo_defSquadcampaignGameGlobaladdInt(MODULE_CAMPAIGN_modifyArenaDefSetupMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequire										
self  Cmsg 8 � 
  &�	6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish!MODULE_CAMPAIGN_getArenaShopMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�	6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish%MODULE_CAMPAIGN_refreshArenaShopMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  �   0�	6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt%MODULE_CAMPAIGN_buyArenaShopItemMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  pos  msg  � 
  &�	6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish!MODULE_CAMPAIGN_getArenaRankMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�	6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish'MODULE_CAMPAIGN_refreshArenaPlayerMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�	6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish"MODULE_CAMPAIGN_buyArenaTimesMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�	6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish'MODULE_CAMPAIGN_resetArenaCoolTimeMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�	6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish#MODULE_CAMPAIGN_resetFourSidesMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  � 
  &�	6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish'MODULE_CAMPAIGN_getArenaReportInfoMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  �   /�	6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt%MODULE_CAMPAIGN_playerBackReportMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  id  msg  �   $J�	6  ' B 96 96 9B 9 B 9 B 9 B 9B6 9	 9
 6	   9 B	 AK  handlersendMsggameSocketGameGlobalfinishaddInt(MODULE_CAMPAIGN_acqHeroTrialsRewardMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  %type  %chapter  %star  %msg  � 	 $�	:	  X�6   9  6 ' B95 =BX�6  96	 9
BK  	czsbConfig_LanguageaddMessageFloatMessage
param  acqHeroTrialsRewardapp.event.CampaignEventrequiresendEventEventManagerself  arr   h    �
6     9  6 9B K  saodangchenggongConfig_LanguageaddMessageFloatMessage �	 0���
1:  X�2 ��6  9 ) B:6 9 9 B:= 6 9 9:B6 9 9:B: X�6	  9
:' B6  BH�6	 9			 9		 B	FR�: X�6	  9
:' B6  BH�6	 9			 9		 B	FR�6 9' 6 9' :' :	&	>3 6  96 9	 9B	 9B6 99+	  5
" 6 9 9!=#
B6  96 9	 9B	 9B6$ '
% B9&9+	  5
' :=(
:=)
 B6*  9+  6$ '
, B9-5	. =/	BK  K  
param  trialsMopupapp.event.CampaignEventsendEventEventManager
heros
items isShowACQUIREITEMSSIMPLEdata.Config_UIrequire	type  heroTrialbatTypeConfig_GameData	nameEXTRAAWARDConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManager PLAYEREXPConst_genItemType_	ITEMConst_ItemTypeaddOneHeroByStr;acqResource
pairs,
splitStringUtilsetPlayerExpsetPlayerLvheroTrialTimesLeftsetArmyFoodlocalPlayerGameGlobalremove
table


$$$$$$$$$$$(*********************------------------.....-000000000001self  �arr  �armyFood �arr1 	 	 	k v  arr1 	 	 	k v  cb 9 �   $M�
6  ' B 96 96 9B 9 B 9 B 9 B 9B6 9	 9
 6	   9 B	 AK  handlersendMsggameSocketGameGlobalfinishaddInt MODULE_CAMPAIGN_trialsMopupMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  %type  %chapterId  %insId  %msg  �  @o�
:	  X6�) 9  89 ) M�9  8989 X�9  898)	 =	O�6  96 9	 9B	 9	B6
 99+	  5
 :=
:=
B6  9  6 '
 B95	 =	BX�6  96 9BK  	czsbConfig_LanguageaddMessageFloatMessage
param  acqHeroTrialsFirstRewardapp.event.CampaignEventrequiresendEventEventManager
heros
items  	nameACQUIREITEMSSIMPLEConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerhaveGetReward
insIdins
state





self  Aarr  AchapterId  AinsId  A
  i  �   'P�
6  ' B 96 96 9B 9 B 9 B 9 B 9B6 9	 9
 6	   9 B	4
 >
>
BK  handlersendMsggameSocketGameGlobalfinishaddInt-MODULE_CAMPAIGN_acqHeroTrialsFirstRewardMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  (type  (chapterId  (insId  (msg  � 
 7M�
:	  X-�6  99:!)   X	�6  96 99)  B6  9 9:B:=	 :=
 6  96 9B6  9  6 '	 B95 =BX�6  96 9BK  	czsb
param  buyTrialsTimesapp.event.CampaignEventrequiresendEventEventManager	gmcgaddMessageFloatMessageheroTrialTimesLeftheroTrialsBuyTimeRestsetGoldtrialsTimesstatisticsConfig_LanguagesetOnPurchaseTalkingDataManager	goldlocalPlayerGameGlobal						











self  8arr  8price 	' � 
  &�
6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish#MODULE_CAMPAIGN_buyTrialsTimesMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  � 
 -H�
:	  X)�9  8) =9  = 6  9  6 '	 B95 =	B6
 99:!)   X	�6  96 99) 	 B6
 9 9:BK  setGoldclassicTimesstatisticsConfig_LanguagesetOnPurchaseTalkingDataManager	goldlocalPlayerGameGlobal
param  buyClassicTimesapp.event.CampaignEventrequiresendEventEventManagerclassicBatBuyTimestimesLeftclassicBatState





self  .arr  .id  .price  �   1�
6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B4 >BK  handlersendMsggameSocketGameGlobalfinishaddInt$MODULE_CAMPAIGN_buyClassicTimesMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  id  msg  �   ,M�
:=  4  = )  ) M�6  98	'
 + B6 99	 5
 :=
:=	
:=

6 :89=
BO�6  9  6 ' B95 =BK  
param  getDuelInfoapp.event.CampaignEventrequiresendEventEventManager
npcIdheroIdConfig_NpcDatachallengedmaxOpenIdleftId  insert
table,
splitStringUtilduelInfoduelRefreshTimesself  -arr  -  i tmp  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish MODULE_CAMPAIGN_getDuelInfoMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequire









self  msg  �  O��+  :	  X�6   96 9BK  ) 9  ) M	�9 89 X�9 8X�O�:=:=4  =6	  )  ) M�6	
 9		94 >B	O�)  ) M�6	 	 9		8' B	9
6 :	B4 6 :	B>:	><
O�6  9  6	 ' B	9		5
 =
BK  
param  getDuelInstapp.event.CampaignEventrequiresendEventEventManagertonumber,
splitStringUtilinsert
tableConfig_DuelInstinstInfochallengedmaxOpenIdleftIdduelInfo	czsbConfig_LanguageaddMessageFloatMessage 	self  Parr  PheroId  PcurInfo N
 
 
i allInstNum .  i 
  i tmp  �   5�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B4 >BK  handlersendMsggameSocketGameGlobalfinishaddInt MODULE_CAMPAIGN_getDuelInstMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequire										



self  heroId  msg  � 
 9G�:  X�6   96 9BK  6  96 9 9B 9	B6
 ' B99+  5 :	=	:	=	B6 9 9:B6 9 9:B6  9  6
 ' B95 =BK  
param  duelMopupapp.event.CampaignEventsendEventEventManagersetPlayerExpsetPlayerLvlocalPlayerGameGlobal
heros
items  	nameACQUIREITEMSSIMPLEdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager	czsbConfig_LanguageaddMessageFloatMessageself  :arr  : �    @�6  ' B 96 96 9B 9 B 9 B 9B6 9	 9
 6 
  9 B AK  handlersendMsggameSocketGameGlobalfinishaddIntMODULE_CAMPAIGN_duelMopupMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  !heroId  !instId  !msg  �  <]�:  X�6   96 9BK  6 9 9:B:= 4  = )  ) M�6	  9
8	'
 + B6 99	 5
 :=
:=
:=
6 :89=
BO�6  9  6 ' B95 =BK  
param  refreshDuelapp.event.CampaignEventrequiresendEventEventManager
npcIdheroIdConfig_NpcDatachallengedmaxOpenIdleftId  insert
table,
splitStringUtilduelInfoduelRefreshTimessetGoldlocalPlayerGameGlobal	czsbConfig_LanguageaddMessageFloatMessage							















self  =arr  =  i tmp  � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinish MODULE_CAMPAIGN_refreshDuelMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  msg  � 
#E�6  9 9B 9B:  X�6  9 -  99+  5	 BK  :=	 6
 9 9:B  9 :BK  �enterBattlesetArmyFoodlocalPlayerGameGlobalvalidTimeStamp id
	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc	uiConfig self  $arr  $curScene 	 �   R��9  )	 =9  =9  )  == = 4  =  X�6  9	 '
 +	 B= ) 9  ) M�9 89 X�6 
 9	9 898:' + B= X�O�6 ' B 96 96 9B 9 B 9 B 9 B 9B6 9 9 6	   9 B	 AK  handlersendMsggameSocketGameGlobalfinishaddStringaddInt$MODULE_CAMPAIGN_validDuelBattleMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequire_instInfocur_duleNpcDataleftIdduelInfo,
splitStringUtilcur_bingshucur_duelBattleInstcur_duelBattleHeroId	hard
insIdbatTypelastEnterBatInfo	self  SheroId  SinsId  SbingshuStr  Sids   i msg  �    %&�6     9  6 9 9B 9B96 ' B9	9
B 6     9  6 9 9B 9B96 ' B99
B K  HEROVSHERO	nameWORLDWARUIdata.Config_UIrequireuiLayergetRunningScenegetInstanceDirectorcc
addUIUIManager L   �3   6  9  BK  returnHomeGameGlobal com  �>y� :6  9 9 B6 9 9B 9B:  X�3 6  9	 -	  9	
	9		+
  5 =B2  �K  6  9 9:	+  +	 B6 9 ) B6 9 ) B6  9  6 '
 B95	 =	BK  �
param  duelBattleapp.event.CampaignEventrequiresendEventEventManagerremove
tableacqResource	fun1 id	nameMESSAGEBOX
addUIUIManager getRunningScenegetInstanceDirectorccsetArmyFoodlocalPlayerGameGlobal uiConfig self  ?arr  ?armyFood =curScene /returnToIns  �   (Z�6  ' B 96 96	 9		B 99	 B 9	 B 9	 B 9	 B 9	B6
 9 9	 6
   9 B
 AK  handlersendMsggameSocketGameGlobalfinishaddStringcur_duelBattleHeroIdaddIntMODULE_CAMPAIGN_duelBattleMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  )star  )batStr  )insId  )chapterId  )msg  �  *���5:  X�6   96 9BK  4  6 9 9:+  + B)  ) M��4  4  =4  =6	 
 9
8' B)	 
 ) M	
�98<6 9 98BO	�6		 	 9	
	 8' B	:
	
 X
�)
 	 ) M
�98	<6 9 96 ' B98	BO
�6
 9

  B

8


 X
�
8


 X
@�4
  4  =
4  =
6	  9
8' B: X�)  ) M
�9
8<6 9 98BO�6	  9
8' B: X�)  ) M�9
8<6 9 96 ' B98BO�' =
6 9 
 BO}6  96 9 9B 9B6 99+  5	! 6
 9

9
 
=
"	=#	B6$  9%  6 '	& B9'5( =)BK  
param  fourSidesMopupapp.event.CampaignEventsendEventEventManagerresultInfosmopType  expeditionbatTypeConfig_GameData	nameMOPUPRESULTUIConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagercommon_baoxiangjiangli.pngheadImginsert
table	HEROapp.const.Const_ItemTyperequire;,
splitStringUtil
heros
itemsacqResourcelocalPlayerGameGlobal	czsbConfig_LanguageaddMessageFloatMessage		

   !!!!"""######!'''''''((())))***++++++++++)../////3333333333333333333333444444444445self  �arr  �resultInfos �� � �i �tmp �items 
w  j 	heros b  j tmp1 ?items 4  j 	heros   j  �   4�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddInt#MODULE_CAMPAIGN_fourSidesMopupMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself  buyCard  msg  �   C�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 
  9 B4	 >	>	BK  handlersendMsggameSocketGameGlobalfinishaddInt!MODULE_CAMPAIGN_classicMopupMODULE_CAMPAIGNmsgTypecreateapp.control.Msgrequireself   classicId   pointId   msg  h    �6     9  6 9B K  saodangchenggongConfig_LanguageaddMessageFloatMessage � (s��":  X�2 n�:  X�6  9:' B6  BH�6
 9


 9

	 B
FR�:  X�6  9:' B6  BH�6
 9


 9
	
	 B
FR�6 9 9
:B6 9 9:B6 9 9:B9 8:	=6 9' 6 9' :'	 :
&
3 6  96	 9			 9		B		 9		B	6
 ' B
9

9

+  5 = :=! B6"  9#	  6
 '$ B
9
%
5& ='BK  K  
param  classicMopupapp.event.CampaignEventsendEventEventManager
heros
items isShow	nameACQUIREITEMSSIMPLEdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager PLAYEREXPConst_genItemType_	ITEMConst_ItemTypetimesLeftclassicBatStatesetArmyFoodsetPlayerExpsetPlayerLvaddOneHeroByStr;acqResourcelocalPlayerGameGlobal
pairs,
splitStringUtil


!!!!!!!!!!!"self  sarr  sclassicId  spointId  sarr1 	 	 	k v  arr1 	 	 	k v  items ($cb # � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinishMODULE_DIM_getDimInfoMODULE_DIMmsgTypecreateapp.control.Msgrequireself  msg  �   ;`�:=  := := := := := := : X�6  9	:'
 B)  ) M�6 	 9	8
' + B9 :	:
<
	9 :	:
<
	O�:	= :
= 6  9  6 ' B95 =BK  arr  getDimInfoapp.event.CampaignEventrequiresendEventEventManagerdimRankdimMaxLeveldimEliteFirstPassdimEliteInfos_,
splitStringUtildimEliteBuyTimesdimBuyTimesdimResetTimesdimEliteCurLeveldimCurLeveldimEliteRestTimesdimRestTimes						




self  <arr  <tmp   i t  �   ,?�	6  ' B 96 96 9B 99 B 96 9	9
B9 =9 6 99=9 9 = 9B6 9 9 6 	  9
 B AK  handlersendMsggameSocketfinish	harddimConfig_GameDatabatType
insIdlastEnterBatInfoselectedDimcampaignGameGlobaldimHardaddIntMODULE_DIM_validDimBattleMODULE_DIMmsgTypecreateapp.control.Msgrequire	self  -id  -msg " � 
5W�6  9 9B 9B:	  X�6  9 -  99+  5	 BK  :	 X�6	  9
6 9BK  : X�6  9 -  99+  5	 BK  :=   9 :BK  �enterBattlevalidTimeStamp id
powerNotEnouthConfig_LanguageaddMessageFloatMessage idlevelNotEnough	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc��������			uiConfig self  6arr  6curScene 	- �   3V�
6  ' B 96 96 9B 99 B 96 9	9
B 9 B9 =6  9 9	 B  9 B 9B6 9 9 6	   9 B	 AK  handlersendMsggameSocketfinishaddStringvalidTimeStampgetBattleMd5String	starlastEnterBatInfoselectedDimcampaignGameGlobaldimHardaddIntMODULE_DIM_dimBattleMODULE_DIMmsgTypecreateapp.control.Msgrequire										
self  4id  4star  4batStr  4msg ) �    %&�6     9  6 9 9B 9B96 ' B9	9
B 6     9  6 9 9B 9B96 ' B99
B K  TOWERCHALLENGE	nameWORLDWARUIdata.Config_UIrequireuiLayergetRunningScenegetInstanceDirectorcc
addUIUIManager L   �3   6  9  BK  returnHomeGameGlobal com  �%U�6  9 9B 9B:  X�3 6  9 -  99+	  5
	 =

B2  �K  6  9  6 '	 B95 =BK  �
param  dimBattleapp.event.CampaignEventrequiresendEventEventManager	fun1 id	nameMESSAGEBOX
addUIUIManager getRunningScenegetInstanceDirectorcc
uiConfig self  &arr  &curScene 	returnToIns  �   1�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B4 >BK  handlersendMsggameSocketGameGlobalfinishaddIntMODULE_DIM_openDimBoxMODULE_DIMmsgTypecreateapp.control.Msgrequireself  id  msg  �  .A�	:  X�6   96 9BK  = 6  96 9 9	B 9
B6 '	 B99+  5	 :
=
	:
=
	B6  9  6 '	 B95 =BK  
param  openDimBoxapp.event.CampaignEventsendEventEventManager
heros
items  	nameACQUIREITEMSSIMPLEdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagerdimCurLevel	czsbConfig_LanguageaddMessageFloatMessage	self  /arr  /id  / �   "=�6  ' B 96 96 9B 9 B 9 B 9B6 9	 9
 6 
  9 B4	 >	BK  handlersendMsggameSocketGameGlobalfinishaddIntMODULE_DIM_dimNormalMopupMODULE_DIMmsgTypecreateapp.control.Msgrequireself  #id  #types  #msg  � 	  �6   9  6 ' B95 =BK  
param  dimNormalMopupapp.event.CampaignEventrequiresendEventEventManagerself  arr   �   /�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B AK  handlersendMsggameSocketGameGlobalfinishaddIntMODULE_DIM_dimEliteMopupMODULE_DIMmsgTypecreateapp.control.Msgrequireself  id  msg  � 
 /=�
:  X�6   96 9BK  := 6  96 9 9	B 9
B6 ' B99+  5 :	=	:	=	B6  9  6 ' B95 =BK  
param  dimEliteMopupapp.event.CampaignEventsendEventEventManager
heros
items  	nameACQUIREITEMSSIMPLEdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagerdimEliteRestTimes	czsbConfig_LanguageaddMessageFloatMessage											
self  0arr  0 � 
  &�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B AK  handlersendMsggameSocketGameGlobalfinishMODULE_DIM_dimRankMODULE_DIMmsgTypecreateapp.control.Msgrequireself  msg  � 	  �6   9  6 ' B95 =BK  
param  dimRankapp.event.CampaignEventrequiresendEventEventManagerself  arr   � 
  BP�
6  ' B 96 96 9B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 96 99	:B 9
B6 9 9 6   9	 B AK  handlersendMsggameSocketfinishdimBatInBatSetupcampaignGameGlobaladdIntMODULE_DIM_upDimPositionMODULE_DIMmsgTypecreateapp.control.Msgrequire										
self  Cmsg 8 � 
"D�:	  X�6   9  6 ' B95 =BK  6 9 9	B 9
B6  9 -  99+  5	 BK  � id	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorcc
param  upDimPositionapp.event.CampaignEventrequiresendEventEventManageruiConfig self  #arr  #curScene  �   3�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B4 >BK  handlersendMsggameSocketGameGlobalfinishaddIntMODULE_DIM_buyDimTimesMODULE_DIMmsgTypecreateapp.control.Msgrequireself  type  msg  � 
 )>�:  X�6   96 9BK  6 9 9:B	  X�:= 9  = X�:=	 9
  =
 6  9  6 '	 B95 =BK  
param  buyDimTimesapp.event.CampaignEventrequiresendEventEventManagerdimBuyTimesdimRestTimesdimEliteBuyTimesdimEliteRestTimessetGoldlocalPlayerGameGlobal	czsbConfig_LanguageaddMessageFloatMessage

self  *arr  *type  * � 
  )�6  ' B 96 96 9B 9B6 9 9	 6
   9	 B4 6 >BK  	typehandlersendMsggameSocketGameGlobalfinishMODULE_DIM_resetDimMODULE_DIMmsgTypecreateapp.control.Msgrequireself  msg  � 
 *?�:	  X�6  9 9:B)  = 6  9  6 '	 B95	 =
BX�:	 X�6  96 9BK  X�6  96 9BK  K  	czsbcanNotResetConfig_LanguageaddMessageFloatMessage
param  resetDimapp.event.CampaignEventrequiresendEventEventManagerdimCurLevelsetGoldlocalPlayerGameGlobal����						
self  +arr  +type  + �   1�6  ' B 96 96 9B 9 B 9B6 9	 9
 6 	  9
 B4 >BK  handlersendMsggameSocketGameGlobalfinishaddInt$MODULE_DIM_acqDimFirstWinRewardMODULE_DIMmsgTypecreateapp.control.Msgrequireself  id  msg  �  0C�	:  X�6   96 9BK  6  96 9 9B 9	B6
 '	 B99+  5	 :
=
	:
=
	B9 ) <6  9  6
 '	 B95 =BK  
param  acqDimFirstWinRewardapp.event.CampaignEventsendEventEventManagerdimEliteFirstPass
heros
items  	nameACQUIREITEMSSIMPLEdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager	czsbConfig_LanguageaddMessageFloatMessage	self  1arr  1id  1 W   	"�6    BH�+  < FR�K  
pairsself  
  k v   �&  � �� �6   ' B 6 ' B3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 3' =& 3) =( 3+ =* 3- =, 3/ =. 31 =0 33 =2 35 =4 37 =6 39 =8 3; =: 3= =< 3? => 3A =@ 3C =B 3E =D 3G =F 3I =H 3K =J 3M =L 3O =N 3Q =P 3S =R 3T =R 3V =U 3X =W 3Y =L 3[ =Z 3] =\ 3_ =^ 3a =` 3c =b 3e =d 3g =f 3i =h 3k =j 3m =l 3o =n 3q =p 3s =r 3u =t 3w =v 3x =b 3z =y 3| ={ 3~ =} 3� = 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3� =� 3 =� 2  �L   dispose $MODULE_DIM_acqDimFirstWinReward send_acqDimFirstWinReward MODULE_DIM_resetDim send_resetDim MODULE_DIM_buyDimTimes send_buyDimTimes MODULE_DIM_upDimPosition send_upDimPosition MODULE_DIM_dimRank send_dimRank MODULE_DIM_dimEliteMopup send_dimEliteMopup MODULE_DIM_dimNormalMopup send_dimNormalMopup MODULE_DIM_openDimBox send_openDimBox MODULE_DIM_dimBattle send_dimBattle MODULE_DIM_validDimBattle send_validDimBattle MODULE_DIM_getDimInfo send_getDimInfo !MODULE_CAMPAIGN_classicMopup send_classicMopup send_fourSidesMopup #MODULE_CAMPAIGN_fourSidesMopup send_duelBattle MODULE_CAMPAIGN_duelBattle send_validDuelBattle $MODULE_CAMPAIGN_validDuelBattle send_refreshDuel  MODULE_CAMPAIGN_refreshDuel send_duelMopup MODULE_CAMPAIGN_duelMopup send_getDuelInst  MODULE_CAMPAIGN_getDuelInst send_getDuelInfo  MODULE_CAMPAIGN_getDuelInfo send_buyClassicTimes $MODULE_CAMPAIGN_buyClassicTimes send_buyTrialsTimes #MODULE_CAMPAIGN_buyTrialsTimes "send_acqHeroTrialsFirstReward -MODULE_CAMPAIGN_acqHeroTrialsFirstReward send_trialsMopup  MODULE_CAMPAIGN_trialsMopup (MODULE_CAMPAIGN_acqHeroTrialsReward send_acqHeroTrialsReward send_playerBackReport send_getArenaReportInfo send_resetFourSides send_resetArenaCoolTime send_buyArenaTimes send_refreshArenaPlayer send_getArenaRank send_buyArenaShopItem send_refreshArenaShop send_getArenaShop send_modifyArenaDefSetup send_modifyArenaAtkSetup send_arenaBattle send_getArenaInfo !send_buyFourSidesWarShopItem !send_refreshFourSidesWarShop send_getFourSidesWarShop send_fourSidesWarBattle send_getFourSidesWarEnemy  send_getCampaignInfo send_getHeroTrialsInfo  send_upFourSidesWarPosition send_upClassicPosition send_upHeroTrialsPosition send_validFourSidesWar send_validTrialsBattle send_validClassicBattle send_heroTrialsBattle send_classicBattle send_getFourSidesWarInfo send_openFourSidesWarBox getWangZheRestTimes getHuangjinRestTimes $MODULE_CAMPAIGN_getCampaignInfo  getJinyiLeft getDreamLeft  getDianfengTimesLeft getExpeditionTimesLeft getHeroTrialTimesLeft getTowerTimesLeft getClassicTimesLeft &MODULE_CAMPAIGN_getHeroTrialsInfo getHeroTrialsLatestIns getHeroTrialsInsStar #MODULE_CAMPAIGN_resetFourSides )MODULE_CAMPAIGN_upHeroTrialsPosition &MODULE_CAMPAIGN_upClassicPosition +MODULE_CAMPAIGN_upFourSidesWarPosition enterBattle &MODULE_CAMPAIGN_validTrialsBattle &MODULE_CAMPAIGN_validFourSidesWar 'MODULE_CAMPAIGN_validClassicBattle %MODULE_CAMPAIGN_heroTrialsBattle "MODULE_CAMPAIGN_classicBattle 'MODULE_CAMPAIGN_fourSidesWarBattle (MODULE_CAMPAIGN_getFourSidesWarInfo (MODULE_CAMPAIGN_openFourSidesWarBox )MODULE_CAMPAIGN_getFourSidesWarEnemy (MODULE_CAMPAIGN_getFourSidesWarShop !MODULE_CAMPAIGN_getArenaShop ,MODULE_CAMPAIGN_buyFourSidesWarShopItem %MODULE_CAMPAIGN_buyArenaShopItem %MODULE_CAMPAIGN_refreshArenaShop ,MODULE_CAMPAIGN_refreshFourSidesWarShop  MODULE_CAMPAIGN_arenaBattle %MODULE_CAMPAIGN_playerBackReport !MODULE_CAMPAIGN_getArenaInfo (MODULE_CAMPAIGN_modifyArenaDefSetup (MODULE_CAMPAIGN_modifyArenaAtkSetup !MODULE_CAMPAIGN_getArenaRank "MODULE_CAMPAIGN_buyArenaTimes 'MODULE_CAMPAIGN_refreshArenaPlayer 'MODULE_CAMPAIGN_resetArenaCoolTime 'MODULE_CAMPAIGN_getArenaReportInfo create 	ctordata.Config_UIrequireCampaignProxy
class      X  ] Z b ^ o c � p � � � � � � � � � � � � Z� ][`^hapiyq�z��������	�k
�l����	�
"0#=1Z>�[����������������������������	�
%1&;2G=RH]Sd^ieoktp�u������������������������������������ �2:3H<PI`Rearfxs�z�����������������2;3r=xs�{�������������!(#3)95<:H>PIWRfXlhzm�|������CampaignProxy �uiConfig �  