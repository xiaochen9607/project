LJN@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\PLAYERSYS.lua�   U]+  =  +  = ) = 4
 5 6 9999	=
>5 6 9999	=
>5 6 9999	=
>5 6 9999	=
>5 6 9999	=
>5 6 9999	=
>5 6 9999	=
>5 6 9999	=
>5 6 9999	=
>	= 4  = 4  = K  curLogicsleftTableheroStar 
logicJIANGXINGMAINUI	nameheroStarnodePathui/home/JiangXingMainpicplayerSys_jiangxing.pngtheTitle 
logicPLAYERSYSTHETITLE	nametheTitlenodePathui/home/PlayerSysTheTitlepicplayerSys_juewei.pngbattleArray 
logicPLAYERSYSBATTLEARRAY	namebattleArraynodePath!ui/home/PlayerSysBattleArraypicplayerSys_zhenfa.pngjobAdvance 
logicPLAYERSYSJOBADVANCENODE	namejobAdvancenodePath$ui/home/PlayerSysJobAdvanceNodepicplayerSys_bingzhong.pngrefineSoul 
logicPLAYERSYSREFINESOUL	namelianhunnodePath ui/home/PlayerSysRefineSoulpicplayerSys_lianhun.pngzhangu 
logicPLAYERSYSZHANGU	namezhangunodePathui/home/PlayerSysZhangupiczhangu.png
equip 
logicPLAYERSYSEQUIP	name
equipnodePathui/home/PlayerSysEquippicplayerSys_zhuangbei.pngsaddle 
logicPLAYERSYSSADDLE	namesaddlenodePathui/home/PlayerSysSaddlepicplayerSys_zuoqi1.pngopenLvlv	treaopenLvsnewBieConfig_GameData 
logicPLAYERSYSTREASURE	nametreasurenodePathui/home/PlayerSysTreasurepicplayerSys_fabao.pngleftTableOrilastSelectbutton	view								







self  V {    6     9  +  6 ' B99B K  	namePLAYERSYSdata.Config_UIrequireremoveUIUIManager �B�-   9 B=3  9' B6 ' B 9	 5
	 =

B=6  99	6
 9

6 99 6 99 6 996 99B
5 6 9)  )  )  )� B=6 9)  )  )  )  B=B	 9B2  �L  �	initborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRectUIManagercallBack  createapp.uiLogic.COMMONBAKrequirecommonBakLogicProjectNode_1getChildByName 	viewnew����
		PLAYERSYS self  Cview  Cparam  Clogic >cb <commonBak 8rect 3 � 	H)::6  9 9  B-   .  -  -  X�6  9 9+ BK  ��updateHeroGemsupdateGemsInfolocalPlayerGameGlobalsendTotal total target  param  site equip  � B�&)  )  6   9  6 96 '
 B93	 B6 9 9	B6
  BH �6	
  B	H� 6 6 6  B89B6 6 6  B89B X�6 9 9  BFR�FR�  9 B  9 ) B2  �K  
touchmakeListsend_unloadStoneStoneTypesConfig_EquipSkills	dataConfig_Itemtonumber
pairsgetUsedGemslocalPlayer unloadStoneapp.event.HeroProxyEventrequireheroProxyGameGlobaladdEventEventManagerself  Ctotal AsendTotal @gemTab /# # #k  v     m n   6  f-  9 L  �cellNumself table_view   T  k-   9    D  �tableCellAtIndexself table_view  idx   A   o*  * J ϙ��������̙�table_view  idx   �	 * ��?56 9 9B=  ) 9  ) M!�6 999 89 X�9 89 X�6	 9
9 9 8BX�6 99)   X�6	 9
9 9 8BO�9  = 9   X�9  9B2 Z�XW�9  9' B 9B 9)d B 9+ B 9B9=9=6 9 96 99
9B A= 9  96 9B9  96 9 )
  )  B A9  9)
 B9  9!B 9"9 B9  9#3$ 6	 9	%	B9  9#3& 6	 9	'	B9  9#3( 6	 9	)	B9  9B2  �K  K  TABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW registerScriptHandleraddChildsetDelegatepsetPosition"SCROLLVIEW_DIRECTION_VERTICALsetDirection	sizecreateTableViewccheight
widthgetContentSizesetSwallowTouchessetLocalZOrdergetPositionImage_BggetChildByName	viewreloadData_tableviewcellNummountIdleftTableinsert
tablesaddle	nameopenLv
levelleftTableOriplayerSysTipslocalPlayerGameGlobalplayerSys!!!!!!!!!"""""####$$$$''')))',,,...,0002220333355self  �" " "i  bg 2RposX OposY  Osize D �  !��u! 9 B  X� 9BX�6 9 9B 9 !6 9 99	 89
)	 B 9*	  *
  B 9'	
 B6  9	 5
 6   9 B=
4 >=
B9	 896 99 X� 9+	 B 9+	 B9 9	 898  X-�6 9 9'	 )
 B	 9'
 B	 9
 B	 9)
Z )Z B)  X�6 9	 9'
 ) B
 9' B9 
 9 B
 9)x ) B 9	 B9   X�  9 9	  BL lastSelect	viewaddChildtip common_kezhuangbeitishi.png	nameplayerSyssetSwallowTouchessetVisible
levellocalPlayerGameGlobalopenLv
paramcallBack  
touchhandlerwidgetTouchExtentUIManagersetNamesetPositionpicleftTablecreateImageView	ccuicellNumnewTableViewCellccremoveAllChildrendequeueCell����̙��					



 self  �table_view  �idx  �_cell ~index pim 	gtip 5&tip  �  y��"9  9  X�9  99  X�9  9 9B4  =  9  9' B6  99 89	B 9
9  9'	 B 9B A9  9 B 9' B9  6 ' 9 89&B 9 B=9  9 89=9  99 9 !B6  9 B  X� 9' B9  99 !B6 ' B 9*  +	 +
 B 9+	  +
 B 9'	 B 9
*	 *
 B  X� 9	 B= K  	initapp.sprite.SkillAni
eff74checkObjIsNullGameGloballastSelectcellNumcellAtIndex_tableview	namecreateapp.uiLogic.requiresetNameaddChildgetPositionNode_PosgetChildByNamesetPositionnodePathleftTablegetNodeFromLuaUIManagerchildNoderemoveChildByName	viewdispose
logiccurLogicsԛ����̙��					!"self  zindex  zview ]lastNode -0curNode icon 	     	�K  self   �  	 '�9  9  X�9  99  X�9  9 9B4  =  6 9 9B6  9  B9  9BK  commonBakLogicremoveEventsEventManagerplayerSysTipslocalPlayerGameGlobaldispose
logiccurLogics					




self    �   1 �6   ' B 3 = 6 ' B 9B3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 2  �L   dispose layout 
touch tableCellAtIndex makeList 	init createsrc.app.sprite.Shadersrequire 	ctorPLAYERSYS
class%>&t?�u����ɽ��PLAYERSYS shader   