LJ]@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\ARENAWUSHUANGBATTLETHEME.lua�   	+  =  4  = 4  = +  = 4  = K  fiveHerosselectedJobselectedHerosallHerosselectedStage		

self   �  E-   9 B= 9B 9BL  �initHero	init	viewnewARENAWUSHUANGBATTLETHEME self  view  params  logic  �  *96   99 6 96  99 6  99 6	  9		9				6
  9

9



B5	 6 9)	  )
  )  )� B=
6 9)	  )
  )  )  B=BK  borderColorfillColor borderWidth	nameARENAWUSHUANGBATTLETHEMEc4fheight
widthActualDesignSize	rectcc	viewcreateRectUIManager����
self  +rect * �  Z�$4  =  6 6 99BH�9  9<FR�6 6 BH�9	  X�4  9  98
  X�9  98X�6 9	 9)
��9B 6	 9
9	 
 BFR�)  ) ) M	�'  &8  9+ BO�' )  &8  9+ B)  = 9  9' B 9' )  &8  9B A  9 6 99BK  
stagecompetitionArenaProxysetSelectedStagegetPositionXsetPositionXaureolegetChildByName	viewselectedJobsetBrightBtnJoballHerosinsert
tablecreateOneHeroSimpleisShowConfig_Heroid
heroslocalPlayerGameGlobal
pairsmyheros				self  [  k v    k v  tmpHero 
 
 
i  �	  ( ��A  9  B6  99  9' B5 6   9	 B=	B9  9' B=
 ' 6 9&9  9' B< ' 6 9&9  9' B< ' 6 9&9  9' B< ' 6 9&9  9' B< ' 6 9&9  9' B< )  ) ) M�6  9' 	 &	8 5	 6
   9 B
=
		4
 >
=
	BO�) ) ) M?�'  &9  9'	 
 &	
	B< '  &8  9' B 96 99 86	! 9	"	9	#	B'  &8  9'$ B 9%+ B6  9' 	 &	8 
 9' B5	' 6
   9& B
=
		4
 >
=
	BO�K    setSelectedStagesetVisibleImage_SelectplistTypeTextureResType	ccui
stagezhengbaConfig_UIPathloadTextureImage_StageNode_Stage
param  setSelectedJobBtnChariotCHARIOTBtnCounsellorCOUNSELLORBtnCavalrymanCAVALRYMANBtnArcherARCHERBtnPickmanPIKEMANConst_JobBtnJobBtnAllBtnJob0callBack  closeUIhandlerBtnClosegetChildByName	viewwidgetTouchExtentUIManagerinitBlackBack										









self  �N  i @ @ @i > � 
  Sx[9   X�K  ) ) ) M�'  &8  9'	 B 9+	 B'  &8  9'	 B 9+	 BO�'  &8  9' B 9+ B'  &8  9' B 9+ B6 9 9	 B9
  9' B 96 99 &B=    9  9 BK  selectedJobsetSelectedHeros
themewushuangConfig_LanguagesetStringText_Theme	viewgetBattleThemecompetitionArenaProxyGameGlobalsetTouchEnabledImage_StagesetVisibleImage_SelectgetChildByNameNode_StageselectedStage												





self  Tid  T  i strTheme 7 � 
 
 /Ik9   X�K  )  ) ) M	�'  &8  9+	 BO�'  &8  9+ B=  9  9' B 9'  &8  9B A  9 9	  BK  selectedStagesetSelectedHerosgetPositionXsetPositionXaureolegetChildByName	viewsetBrightBtnJobselectedJob															




self  0id  0
 
 
i  ^   z  9  B 9 B  X�+ X�+ L getCombatPowera  b   � 
0ox  9    B3 6 9  B4  = ) ) ) M	�8	 	 X
�9	 8
9

+ <
	O�4  = )  ) M�  X	�8	9			 X	�6	 9		9 8B	O�  9	 BK  initTableinsertjobselectedHerosidfiveHeros	sort
table getThemeHero 					self  1stage  1job  1heros +sort *

 
 
i   i  �   ]�	6  9 9 B4  6 9 BH�6
  9


 9

 	 B
 
 X
�6
 9

 	 B
FR�L insert
tablecheckForbidallHeros
pairsgetForbidInfocompetitionArenaProxyGameGlobalself  stage  job  forbidInfo herosArray   _ v        � K         � K         � K    T  �-   9    D  �cellSizeForTableself tableView  idx   T  �-   9    D  �tableCellAtIndexself tableView  idx   Q  �-   9   D  �numberOfCellsInTableViewself tableView   �  ]r�9    XT�9  9' B6 9 9 9B A=  9   96 9	B9   9
6 9B9   9 9B A9   9B9  99  B9   93 6 9B9   93 6 9B9   93 6 9B9   93 6 9B9   93 6 9B9   93 6 9B9   9B2  �K  reloadData!NUMBER_OF_CELLS_IN_TABLEVIEW TABLECELL_SIZE_AT_INDEX TABLECELL_SIZE_FOR_INDEX TABLECELL_TOUCHED SCROLLVIEW_SCRIPT_ZOOM SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildsetDelegategetPositionsetPositionTABLEVIEW_FILL_TOPDOWNsetVerticalFillOrder"SCROLLVIEW_DIRECTION_VERTICALsetDirectiongetContentSizecreateTableViewccImgTableContentgetChildByName	viewheroTableView							






self  ^ImgContent 	O V  (�-  9 -  9J �
widthheightITEMSIZE self  tableView  idx   � ;�� 9 B+    X� 9BX�6 9 9B ) ) ) M&�9	 
  

8	
	 	 X
�-
  
 9

B

 9
- 9"- 9 - 9	B 9

 B  9 
 	   BO�L ��setItemInfoaddChildheight
widthsetPositioncreateViewselectedHerosnewTableViewCellccremoveAllChildrendequeueCell
				

CharHeadNode2 NODESIZE self  <tableView  <idx  <cell 8node 7' ' 'i %heroData !node  V  �6  99   D selectedHeros	ceil	math
self  tableView   � 
 %Q�-   9   B-   9 + B-   9 + B9 98  X�-   9 + )	� B-   9 + BK  �setNameVisibleidmyherossetGrayVisiblesetMarkVisiblesetData							CharHeadNode2 self  &node  &info  &index  & {   	�6   9+  6 99BK  	nameARENAWUSHUANGBATTLETHEMEConfig_UIremoveUIUIManagerself  
     	�K  self   �  ' .p �6   ' B 6 ' B5 6 9)d )� B3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3$ =# 3& =% 2  �L   dispose closeUI setItemInfo numberOfCellsInTableView tableCellAtIndex cellSizeForTable initTable getThemeHero setSelectedHeros setSelectedJob setSelectedStage 	init initHero initBlackBack create 	ctor	sizecc 
width�height�app.uiLogic.CharHeadNode2requireARENAWUSHUANGBATTLETHEME
class	"?$YAi[vk�x������ǵ����������ARENAWUSHUANGBATTLETHEME +CharHeadNode2 (ITEMSIZE 'NODESIZE "  