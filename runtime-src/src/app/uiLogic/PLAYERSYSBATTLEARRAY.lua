LJY@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\PLAYERSYSBATTLEARRAY.luaî  
 +  =  4  = 4  = +  = 4  = +  = +  = +  = +  = )  =	 K  helpArrIdhelpNextSkillLvhelpNextSkillIdhelpSkillLvhelpSkillIdcellListselectedhelpArraybattleArrayOpen	view		

self   Ù 
	 #_9 :996 996 	 B4 >:	>	:	>	:	>	:	>	:	>	><6 9 9+	 B-   9BK  ÀupdateHelpArrayupdateBattleArraytostringhelpAttrylocalPlayerGameGlobalheroListbattleIdarrlogic target  $param  $arr "power !battleId  heroList    %
6   9-  9B  X-   9BK  ÀupdateHelpArray	viewcheckObjIsNullGameGlobal
logic target  param   ¶ nß&9 :+ 6 6 99BH6
 8
	
9

6 89
 X
6
 9

9

<
+ XFRð  X6 96 99 B6	  9
:'	 +
 B6  BH	6	  9

 ' + B6 9 9::BF	R	ð6 9 9+	 B-  6 99=-   9B-  9 9B6 ' B 9*	  +
 + B	 9+
  + B	 9'
 B-  9	 9'
 B	 9
 BK  ÀaddChildText_318_CopygetChildByName	view
eff22setName	initcreateapp.sprite.SkillAnirequirereloadData_tableviewbattleArrayOpenupdateBattleArraysubItemNum_,
splitStringUtilinsert
tablearmyTypeIdConfig_ArmyLevelbattleAttrylocalPlayerGameGlobal
pairsarrìlogic target  oparam  oarr mbattleArrayId lhadNew k  k v  itemTab  E  k v  item icon & ³ .b5-   9 B=6  96 6 96	 ' B	9		3
	 B6  96 6 96	 ' B	9	
	3
 B6  96 6 96	 ' B	9		3
 B 9B2  L  ÀinitUI armyLvUp updateArmyHeroInfo setArmyHeroInfoapp.event.LoginProxyEventrequireloginProxyGameGlobaladdEventEventManager	viewnew233344PLAYERSYSBATTLEARRAY self  /view  /param  /logic * ®  	 ,K6   9    9  B   9  B 6  9  6 ' B99	+  5 -  9
=
-  9=BK   ÀhelpArray  battleArrayOpen	namePLAYERSYSBATTLEARRAYATTRdata.Config_UIrequire
addUIUIManagergetRunningScenegetInstanceDirectorccself curScene 	 g   O6   9    9  -  9B K   Àselectedsend_armyLvUploginProxyGameGlobalself    *2E6  99  X6  99= 6  99=   9 B6  99	  9
' B5 3 =B6  99	  9
' B5 3 =B2  K     Button_27_CopycallBack   Button_29getChildByName	viewwidgetTouchExtentUIManagerupdateTableListhelpAttryhelpArraybattleArrayOpenbattleAttrylocalPlayerGameGlobal		









self  + <   g6   L Config_ArmyConditiontable_view   o  )j-  9  9B9K   ÀxgetContentOffset_tableviewself table_view  cur_offset_x  T  n-   9    D  ÀtableCellAtIndexself table_view  idx   Y   q-   9    BK   ÀtableCellTouchedself tableView  cell   -    u) )} J table_view  idx   ê % {¬S(9    X9   9B2 r9  9' B 9B 9B9=9= 9	+ B6
 9 96
 99
9B A=  9   96
 9B9   96
 9B9   96
 9)
  )  B A9   9B 99  B9   93 6	
 9		B9   93 6	
 9		B9   93 6	
 9		B9   93 6	
 9		B9   93 6	
 9	 	B9   9!B9"9   9B  9# 9	  9
  
 9
$
)  B
 A2  K  K  cellAtIndextableCellTouchedxgetContentOffsetTABLECELL_SIZE_FOR_INDEX TABLECELL_TOUCHED TABLECELL_SIZE_AT_INDEX SCROLLVIEW_SCRIPT_SCROLL !NUMBER_OF_CELLS_IN_TABLEVIEW registerScriptHandleraddChildsetDelegatepsetPositionTABLEVIEW_FILL_TOPDOWNsetVerticalFillOrder$SCROLLVIEW_DIRECTION_HORIZONTALsetDirection	sizecreateTableViewccsetSwallowTouchesheight
widthgetContentSizegetPositionImage_624getChildByName	viewreloadData_tableview			

   """$$$"%%%%%&&&&'''''''''((self  {bg mposX jposY  jsize gcur_offset_x X   U| 9 ' B9 9  X 9 ' B 9+ B 9 ' B 9' ) BK  9   X 9	9  B  X 9 ' B 9 '	 B 9'	
 )
 B 9 '	 B 9+	 B9 =  9 ' B 9+ B 9 ' B 9' ) B  9 B  9 BK  updateBattleArrayupdateHelpArraycommon2_shangdianbiao.pngcellAtIndexcommon2_shangdianbiao1.pngloadTextureImage_1setVisibleImage_602idselectediconLogicgetChildByName					

self  Vtable_view  Vcell  Vnode QpreCell preNode  ý
  )®& 9 B  X 9BX6 9 9B  + 4  )  ) 9	 		 )
 M6 9 889<6 9 889 X9 8Oð6 9	
 9
B6	 9				 9		 B	6
 9

  B

 X
6
 8

9

6 9	9
 X
6
 8

9

6 96 9	9B
 X
6
 8

9


	 X
6
 8

9

9  
 X
+ )
  9 6  B8  X9 6  B8:  X9 6  B8:
 9' B  X 9' B6 ' B 95 == =!=
"B9# 9$' B9# 9%)< )2 B 9&9#B= 9'  X  9(   BL tableCellTouchedselectedaddChildsetPositionsetName	viewhelpPowercurArrayIdidisOpen  create)app.uiLogic.PLAYERSYSBATTLEARRAYITEMrequireremoveChildByNameiconLogicgetChildByNametostringhelpArrayneedArmyNumneedPower
heros	numsneedHeroNum
levelneedLvConfig_ArmyConditionindexof
tablegetHerosCombatPowerget5StrongestHerolocalPlayerGameGlobalarmyTypeIdConfig_ArmyLevelbattleArrayOpennewTableViewCellccremoveAllChildrendequeueCell	
    !"""#####%self  table_view  idx  _cell index isOpen openList curArrayId   i heros qtotalAbility khelpPower (CiconLogic *    Ç-     9   B -   9    9  B -     9  B K   ÀupdateBattleArrayreloadData_tableviewupdateHelpArrayself  ó  	  4Ð6   9    9  B   9  B 6  9  6 ' B99	+  5 -  9
=-  9=- =-  9=BK   ÀÀbattleArrayOpencallBackbattleIdselectedteamInfo  helpArray	namePLAYERSYSBATTLEARRAYSELECTdata.Config_UIrequire
addUIUIManagergetRunningScenegetInstanceDirectorccself cb curScene 	 ó  	  4ß6   9    9  B   9  B 6  9  6 ' B99	+  5 -  9
=-  9=- =-  9=BK   ÀÀbattleArrayOpencallBackbattleIdselectedteamInfo  helpArray	namePLAYERSYSBATTLEARRAYSELECTdata.Config_UIrequire
addUIUIManagergetRunningScenegetInstanceDirectorccself cb curScene 	     ¹-     9   + B -    9   + B -    9  B K  ÀÀ ÀupdateEffectsetVisiblenode node2 self  Û  Æ6   -  B 	   X 6  9    9  B X 6    9  6 9B K  ÀbattleCanNotLvUpConfig_LanguageaddMessageFloatMessagesend_updateArmyHeroInfologinProxyGameGlobaltonumbera  È! VÕº9   9' B 9+ B6 99  X6 99= 6 99	= 9 6
 9 B8  X4  4 :>:>:>:>:>6 9 9 B9   9' B 9+	 B3 ) ) )	 M8
  X8
  X3 9' 
 &B 9' B 9+ B 9' 
 &B 9' B6  9 9' 
 &B 9' B5 3 =, * ,  9' 
 &B A
XL 9' 
 &B 9' B 9+ B 9' 
 &B 9' B6  9' B 9+ B 9* B 9' B 9)  )öÿB 9' 
 &B 9 B6 '  B 9! 8
+ B6  9 9'" B5$ 3# =BOz:  X)  )  6	% 6& B	X7:9' X3)  6& 8  X6& 89': X6& 89(6& 8  X6& 89': X9( X	 X X6& 89)X	  X9( X9*)d  X9)ERÇ'	+ 6
& 8

 
 X6
& 8

9
*
 
 X6
& 8

9	*
=,  9
'- B

 9
.
	 B
'
+ '+ 	 X6/ 6& BH	9'9  X9*	 X)
 9)FRõX6& 8  X6& 89
*)d 	 X'
+ '+  9'0 B 9.
 B)  6& 8  X6& 89(  X6& 89( 9'1 B 9. '2  &B#)d  X)d  9'3 B 94 B 9'5 B 9. B	+ X266  976& 898'9 + B6 ': B 9;+  ::B:=<:== :=> 6? :8 B9@9A 9'B B 9.6C 9D6E 9F6G :89H B&BX=4  6/ 6& BH9'9  X9*	 X66  976& 9)898'9 + B FRì6 ': B 9;+  :)  B)  =<6? :8 B9@9A 9'B B 9.6C 9D6E 9F6G :89H B&B
+ X266  976& 898'9 + B6 ': B 9;+  ::B:=<:=I :=J 6? :8 B9@9A 9'K B 9.6C 9D6E 9F6G :89H B&BX 9'K B 9.'L B6  9 9'M B5O 3N =B6 9 9PB6Q  B	 X	 9'R B 9+ BX 9'R B 9+ B6  9 9'S B5U 3T =B2  K     Button_zhuZhenUpImage_tishitonumbercheckBattleArrayChange   Button_27Text_309_Copy_0_Copy_0helpNextSkillLvhelpNextSkillId	descConfig_HeroSkillformatstringbattleArrayAllHeroConfig_LanguageText_309_Copy_0
note1permanentIncAttrConfig_SkillUpgradehelpSkillLvhelpSkillIdlvcreate1app.script.skill.pmtIncAttrType.PmtSkillBase_skills
splitStringUtilText_214_CopysetPercentLoadingBar_3/Text_307_CopyText_309_Copy
pairssetStringText_309helpArrId0
levelid
powerarmyTypeIdConfig_ArmyHeroPoweripairs   QualitysetDataapp.uiLogic.CharHeadNode2requireaddChildsetPositionsetNamesetScalesetCascadeOpacityEnabled ui/common/CharHeadNode2.luagetNodeFromCachecallBack   widgetTouchExtentUIManager	headremoveChildByNameImage_546_CopyNode_75_1_Copy_ Node_197getHerosByUIdsselectedtostringhelpAttryhelpArraybattleArrayOpenbattleAttrylocalPlayerGameGlobalsetVisibleNode_148getChildByName	viewþÿÿÿµæÌ³Æÿ³æÌÌ³ÿ È											





    !!!!"""""##########$$$$$$$$$%%%%%%%%((%++++,----..../00000000000000001111111111111111111222235555555556--;<<<<<<<<<===?@@@@@@@@ABCCDDDDEEEEEEEFGDDIKKKKKLLLLMOOOPQTTTTTTTTUVWWWWWWWWWXXXZZZZZZZZZZZ[[\\\\]]]]]]]]^^^^^^^^__`````````aaaaaaaaabbccddeeeeeeefffffffffffffffffffhiiiijjjjjjjkkkkkkkkkkkiinnnnnnnnnoopppppppqqqqqqqqqqqqqqqqqqttuuuuuuuuuvvvvvvvvvwwxxyyzzzzzzz{{{{{{{{{{{{{{{{{{{}}}}}}}}self  Önode2 ÐtmpList ºuIds ¬heros ¦node ¡cb   i head V/heroPower 4helpArrId : : :i 7v  7beforePower 2helpArrLv 5ÏnextLv ¹nextId ¸  k 	v  	nextHelpId $power percentage ôskill (script 	note1 skill <  k v  script note1 	skill (script 	note1 a +#b  # B   Ö9  9   X+ X+ L 
levela  	b  	 ð	 )à!  9  B  X 9BX6 9 9B  6 9)þ )ÿ )} )	ÿ B-  9	 X6 9X	6	 -  989
 X6 96  9- 89'	 +
 B6 ' B 9+	  :
:B:=6 :8	 B994 -	 8		9	
	>	-	 8		9		>	6	 9		6
 9

6 :89 B
&	
	>	)	 )
 ) M	,6 9 9B 9'  B 9!) B 9"'#  &B 9$ )
 B 9%* * B 9& B 9'8B 9( BO	ÔL  ÀÀaddChildsetStringsetColorsetAnchorPointsetPosition	textsetNamesetFontSizesimhei.ttfsetFontName	Text	ccui	descConfig_HeroSkillformatstringbattleArrayAllHeroConfig_Language
power
note1permanentIncAttrConfig_SkillUpgradelvcreate1app.script.skill.pmtIncAttrType.PmtSkillBaserequire_skills
splitStringUtil
levelConfig_ArmyHeroPower
gray1Const_colorDatahelpArrIdc4bnewTableViewCellccremoveAllChildrendequeueCell ¬<ÿ				


 self armyHelpArr table_view  idx  _cell index xcolor qskill Xscript 	Onote1 	FcellList 1- - -i +text &       K          K          K    -    )# )J tableView  idx   E   (-     D ÀtableCellAtIndex tableView  idx   5   -   L ÀarmyHelpArr tableView   º   u"  X ! !"L X! L K   viewHeight  cellHeight  cellCount  cellCountShown  cellIndex  locationindex  tableTotalHeight   0ª»ÏZ4  6  6 BH	99	 	 X6 9
  BFRõ3 6 9  B 9'	 B 9
B 9B9=9= 9+	 B3 6 9	 96
 9

99B
 A= 9 	 96
 9

B9 	 96
 9

B9 	 9)
  )  B9 	 9B	 99
 B9 	 93
 6 9B9 	 93
 6 9 B9 	 93
! 6 9"B9 	 93
# 6 9$B9 	 93
% 6 9&B9 	 93
' 6 9(B9 	 9)B3* ) 6	 9
+ 8	
	 	 X
6	 9
+ 8	
	9	,	 	 X
6	 9
+ 8	
	9	,	 	)	 	 X	) 	 9  9-B9)#  )  ) B	9
 
 9
.
6 9/)  	 B+ B
2  K  psetContentOffsetgetViewSize
levelhelpArrId reloadData!NUMBER_OF_CELLS_IN_TABLEVIEW TABLECELL_SIZE_AT_INDEX TABLECELL_SIZE_FOR_INDEX TABLECELL_TOUCHED SCROLLVIEW_SCRIPT_ZOOM SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildsetDelegatesetPositionTABLEVIEW_FILL_TOPDOWNsetVerticalFillOrder"SCROLLVIEW_DIRECTION_VERTICALsetDirection	sizecreateTableViewccheroTableView setSwallowTouchesheight
widthgetContentSizeremoveAllChildrenImage_1175getChildByName	sort insert
tableselectedarmyTypeIdConfig_ArmyHeroPower
pairs	




23333333333344444455555566666677779999;;;;;;;<<<<<<<=======>>>@@@>AAACCCADDDFFFDGGGGOPQQQQQQQQQQQRRRRRTTTUWWWWWWWWWWWWXXXXXXXXXXZZself  «node  «armyHelpArr ©  k 	v  	sort bg 	size tableCellAtIndex 	calculateTableCellOffsetByCellIdx T-level ,offsety   ]   °-     9   + B -    9   + B K  ÀÀsetVisiblenode2 node  Ä
  #:ª
9   9' B9   9' B 9+ B 9+ B  9  B6  9 9'	 B5
 3	 =B2  K  callBack   Button_54widgetTouchExtentUIManagerupdateAttrListsetVisibleNode_148Node_197getChildByName	view		

self  $node node2  Î   L×µ)  6  9 BX6 899  X ER÷)  ' '   X6 8  X6 89  X6 89	  X6 6 BH
9
	9 
 X
9
		
 X
9	9	XFRôX6 8  X6 896 89 X6 899	  9
' B 9 B9	  9
' B 9 B)   X6 89X6 899	  9
'	 B6 '	 B	 9
 '  ' &+ B)   X	©6	 8		9	6	 	 9		6 89' + B	6
 ' B

 9

+  :	:	B
:	=
4  =
9
4 9 >=9
4 9  >=6! :	8
 B9"9#6! :	8
 B9"'$ )  9%  X9%  X'% 9%XA9&  X9&  X'& 9&X89'  X9'  X'' 9'X/9(  X9(  X'( 9(X&9)  X9)  X') 9)X9*  X9*  X'* 9*X9+  X9+  X'+ 9+X9,  X9,  X', 9,'- &$ X9. 
  X9	  9
'/ B 960 8'1  &BX	9	  9
'/ B 9'$ B9	  9
'2 B 963 9465 :	896 B AX	9		 	 9	
	'2 B		 9		60 97B	9		 	 9	
	'/ B		 9		60 98B	  X	¶6	 	 9		6 89' + B	6
 ' B

 9

+  :	:	B
:	=
4  =
9
4 9. >=9
4 99 >=6! :	8
 B9"9#6! :	8
 B9"'$ )  9%  X9%  X'% 9%XA9&  X9&  X'& 9&X89'  X9'  X'' 9'X/9(  X9(  X'( 9(X&9)  X9)  X') 9)X9*  X9*  X'* 9*X9+  X9+  X'+ 9+X9,  X9,  X', 9,'- &$ X!9. 
  X9	  9
': B 960 8'1  &B9	  9
'; B 963 9465 :	896 B AX-9	  9
': B 9'$ B9	  9
'; B 963 9465 :	896 B AX	9		 	 9	
	'; B		 9		60 97B	9		 	 9	
	': B		 9		'$ B	6	< 9	=		 9	>	 B	9
	 
 9


'? B

 9

	 '@  &B
)
  6 6 BH99  X

FRù	 X'
 X%  X#9	  9
'A B 9B'C B6D 9E 9'F ) B 9G'C B9	  9
'A B 9H B 9I)n )- BX9	  9
'J B 9B'C B9	  9
'A B 9B'K BK  
eff64Image_122_CopysetPositionaddChildsetName common_kezhuangbeitishi.pngImageView	ccuitipremoveChildByNameButton_27_Copy/%Text_309_Copy_0_Copy_1_Copy_CopygetItemNumByIdlocalPlayerGameGlobalText_309_Copy_0_Copy_1Text_318helpSkillLv
maxLvbattleArrayAttr	descConfig_HeroSkillformatstring Text_309_Copy_0_Copy_1_Copy+Config_LanguageText_318_CopyhelpSkillId%criDmgToughRatetoughValuecriValuedodgeValuehitValue
maxHpdefatk
note1permanentIncAttrConfig_SkillUpgradehelpNextSkillLvallSkillLvshelpNextSkillIdallSkillsmelv1app.script.skill.pmtIncAttrType.PmtSkillBase_rankUp1
splitStringUtilneedItemNum_03_createsrc/app/uiLogic/ICON.luarequireProjectNode_73needItemIdText_309_Copy_1_CopysetStringText_309_Copy_1getChildByName	viewid
pairsarmylevel--selectedarmyTypeIdConfig_ArmyLevelbattleArrayOpenipairs È	
  !!!!###%%%%%&&&&&&&&&&&&'(()))*********+++++++++,,--...../////000000011111123444444566777777899::::::;<<======>??@@@@@@ABBCCCCCCDEEFFFFFFGHHIIIIIIJKKKKNNNNNOOOOOOOOOOOOOOQQQQQQQQQSSSSSSSSSSSSSSSSSUUUUUUUUUUVVVVVVVVVVXXYYYYYYYYYZZZZZZZZZ[[\\]]]]]^^^^^_______``````abccccccdeeffffffghhiiiiiijkkllllllmnnoooooopqqrrrrrrsttuuuuuuvwwxxxxxxyzzzz|||||}}}}}}}}}}}}}~~~~~~~~~~~~~~~~~self  ØbattleArrayId Ö
 
 
i v  armylevel 
ÈnextLv ÇnextId Æ  k 
v  
cosumeId 3ÿicon ñcosumeIcon åcosumeNum äskill script 	note1 ~skillAttr xattr wattrNum vskill ¬script 	£note1 skillAttr attr attrNum myCosumeNum  Tlevel G  k v  tip  p   Ñ9    X9   9B+  =  +  = K  	viewremoveFromParent_tableviewself       	ÚK  self      R Þ6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  L   
close dispose updateBattleArray updateEffect updateAttrList updateHelpArray tableCellAtIndex tableCellTouched updateTableList initUI create 	ctorPLAYERSYSBATTLEARRAY
class     D  R E { S  | ¹  Nº ©O´ªPµYQ]Z^^PLAYERSYSBATTLEARRAY   