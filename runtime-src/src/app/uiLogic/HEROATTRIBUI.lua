LJQ@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\HEROATTRIBUI.luaò Pd4  =  4  = 4  = ) = 4  = + = )  = )  = )  = )  =	 4  =
 4  = 4  = 4  = 4  = + = 4 4  >4  >= -  9= +  = 4  = 4  = 4 6 9)Î )B>6 9)k)B>6 9)Î )B>6 9)k)B ?  = 5 = )  = )  = K  
ÀcostNeed12costNeed10      skillChangeLvpccequipPosshowAnimationfirstTimeForYuandelayShceduler
EQUIPtabStateeffectsExpNodeIsVisibleexpItemIconsexpItemUseNumexpItemHaveNumcanCombinecanEquipcurSkillNumtickTimeinactiveNumcurHeroIndexisSliding
powercurNodeIndexsecondNodefirstNodechangePos	À		

ST_TABSTATE self  Q Õ	 (Ý<;-   9 B=9=9=)  =9
  X9=) =9
  X99 =X) 9 ) M989		 X=XOø9	99
9 9B< 99B6 ' B 9	 9'
 B5 6	  9B	=	B=)  6 996 ' B9999 X
 9' B 9 + B X 9' B 9 + B6 99)J  X	 9'! B 9 + BX 9'! B 9 + B 9'" B 9 + B 9'# B 9 + B 9'$ B 9 + B 9%B 9&B 9'BL  À	initinitEventlayoutTalent_CopyShenqiTalentZhuanjingsetVisibleJiban_Buttonlv
jibanopenLvsnewBiedata.Config_GameData
levellocalPlayerGameGlobalcallBack  closeIthandlerProjectNode_1getChildByNamecreateapp.uiLogic.COMMONBAKrequirecommonBakLogicgetCurAbilitygetCombatPoweruId
power	hero
indexcurHeroIndexinActiveNuminactiveNumallHerocloseCb	viewnew

            !!!!!!!!""$$$$$$$$&&&&&&'''''''''))))))))111111112222222233333333444555666:HEROATTRIBUI self  view  param  logic 	 	 	i n &W c   	z  9  ' B  9  ' BK  secondNodefirstNodecreateHeroNodeself  
     ª6     9  6 9 9B 9B6 ' B99	+  5 6
 9=B K  str height
widthÔequipIntroConfig_GameData	nameSIGNINTROdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager     ¶6     9  6 9 9B 9B6 ' B99	+  5 6
 9=B K  str height
widthÔjibanIntroConfig_GameData	nameSIGNINTROdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager ã '«áj+    X6  9' B 9*  )	B*  == 9  9)d B 9 B9= 	 X&9 6  9'
 B 9 9	B					 9
B


B 9B= 9+	 B 9)	b B=	 9	 B9=  X6  9' B 9* )	õ B 9)c B= 9 B9= 9' B  X6  9' B 9* )	õ B 9)c B= 9 B9= 9' B3  X$6  9' B 9* )	õ B 9)c B= 9 B9= 9' B3 6  9 9	' B	5
 =
B X6  9' B 9* )	õ B 9)c B= 9 B9= 9' B X6  9' B 9* )	õ B 9)c B=  9 B9= 9'  B! X6  9'" B 9* )	õ B 9)c B=! 9 B9= 9'! B# X6  9'$ B 9* )	õ B 9)c B=# 9 B9= 9'# B% X6  9'& B 9* )	õ B 9)c B=% 9 B9= 9'% B2  L  ui/heroui/HeroAwakeNode.lua
awake ui/heroui/HeroZhuanjing.luaZhuanJingui/heroui/HeroTupo.luaheroTupoheroShenqiui/heroui/Shenqi.luashenqiui/heroui/HeroTalent.luaheroTalentcallBack  wenhaogetChildByNamewidgetTouchExtent ui/heroui/HeroJiBan.luaheroJiBan ui/heroui/HeroTreasure.luajibanNodesetName)res/ui/heroui/HeroAttribRight_UI.luarightUIsetVisiblegetPositionYgetPositionX*res/ui/heroui/HeroAttribDetail_UI.luadetailUI
indexaddChildsetLocalZOrder_original_posXsetPosition)res/ui/heroui/HeroArttribLeft_UI.luagetNodeFromCacheUIManagerleftUI Ø(ø		
 ""#####$$$$$%%%%&''''(()))),../////0000011112333344555589999999999;;<<<<<=====>>>>?@@@@AABBBBDDEEEEEFFFFFGGGGHIIIIJJKKKKMMNNNNNOOOOOPPPPQRRRRSSTTTTVVWWWWWXXXXXYYYYZ[[[[\\]]]]__`````aaaaabbbbcddddeeffffiiself  ¬csbType  ¬node  ¬ui ªleftUI leftUI %detailUI  rightUI 'jibanNode cbIntroduce  heroJiBan cbIntroduce 
heroTalent heroShenqi heroTupo ZhuanJing awake  "    ë'K  'self  nodeStr        Â+  L   ß:þ¿`9  9'  B=  9  9' B= 9   9)xB9  9' B= 9  9' B= 9  9' B= 9  9'
 B=	 9  9' B= 9  9' B= 9  9' B= 4 9 >9 >9 >9	 >9 >9 >9 >.  6  9B9  9' B 9 B9  9' B 9B 9 B9  9' B 9) B9  9' B 9 B9  9' B 9B 9 B9  9' B 9) B9  9' B 9 B9  9' B 9B 9 B9  9' B 9) B9	  9' B 9 B9	  9' B 9B 9 B9	  9' B 9) B9  9' B 9 B9  9' B 9B 9 B9  9' B 9) B9  9' B 9 B9  9' B 9B 9 B9  9' B 9) B9  9' B 9 B9  9' B 9B 9 B9  9' B 9) B  9 B9  9' B= 6  99 +  5 3 =B9  9)B9  9+ B9  9'  B 9!B 9)°B6# 9$B=" 9"  9%6& 9')	  )
  9(9)B A9"  9*6& 9+*	 *
 B A9"  9,	 9-B A9"  9.)  B6# 9$B=/ 9/  9%6& 9')	  )
  9(9)B A9/  9*6& 9+*	 *
 B A9/  9,	 9-B A9/  9.)  B9  909/ B6# 9$B=1 91  9%6& 9')	  )
  9(9)B A91  9*6& 9+)	  )
  B A91  9,)  )  B91  9.)  B9/  9091 B91 ) =26# 9$B=3 93  9%6& 9')	  )
  9(9)B A93  9*6& 9+)	  )
  B A93  9,)  )  B93  9.)  B9/  9093 B93 ) =293  94+ B  95 B  96 B68   99 B A =7 K  getCurrentHero
cloneformerHerosetInitHeroInfoinitNodesetVisiblesecondNode
indexfirstNodeaddChildspriteFgsetOpacitygetPositionsetPositionpsetAnchorPointheight
width	rectccsetTextureRectnewSpritedisplayspriteBggetContentSizeImage_ContentsetSwallowTouchescallBack   widgetTouchExtentUIManagerImage_SwallowTouchsetArrowStatesetPositionYsetLineHeightgetVirtualRenderersetFontSizeText_TitlegetAttriFontSizeMultiVersionUIHelper
awakeawake_ButtonZhuanjingZhuanJing_ButtonTalent_CopyHeroTupo_ButtonShenqiShenqi_ButtonTalentTalent_ButtonJiban_ButtonEquip_ButtonsetLocalZOrderButton_RightgetChildByName	viewButton_Leftÿ





         !!!!!!!!!""""""""""""#########$$$$$$$$$%%%%%%%%%%%%&&&&&&&&&((())))))++++++//+00000111112222233344446666777777777778888888889999999:::::;;;;<<<<<<<<<<<=========>>>>>>>?????CCCCCHHHHIIIIIIIIIIIJJJJJJJJJKKKKKKLLLLLMMMMMOOOQQQQRRRRRRRRRRRSSSSSSSSSTTTTTTUUUUUVVVVVXXXZZZZZ]]]^^^______`btnList self  ÿfontSize P¯Image_Content ó¼ImgContentSize ¹ Å  : ñÿ=-   9   9     X -     9  ' -  9 B -   9  9     X -     9  ' -  9B -     9  ' -  9 B -     9  ' -  9B -     9  -  9 -   9B A -   9    9  '	 B 6
 9 9B 96 -  -  9B6
 99B 96 -  -  9B6
 99B 96 -  -  9B6
 99B6
 9 9B 9B 9   B6  9-  95 6 -	  -
  9

B=5  =!B6  9-  9"5# 6 -	  -
  9

B=5$ =!B6  9-  9%5& 6 -	  -
  9

B=5' =!B6  9-  9(5) 6 -	  -
  9

B=5* =!B6  9-  9+5, 6 -	  -
  9

B=5- =!B6  9-  9.5/ 6 -	  -
  9

B=50 =!B6  9-  9152 6 -	  -
  9

B=53 =!B6  9-  9455 6 -	  -
  9

B=56 =!B6  9-  9758 6 -	  -
  9

B=59 =!BK   À  awake_Button  awake_Button  ZhuanJing_Button  ZhuanJing_Button  HeroTupo_Button  HeroTupo_Button  Shenqi_Button  Shenqi_Button  Talent_Button  Talent_Button  Jiban_Button  Jiban_Button  Equip_Button  Equip_Button  Button_Right  Button_Right
param  Button_LeftcallBack  wigetTouchedButton_LeftwidgetTouchExtentUIManager+addEventListenerWithSceneGraphPrioritygetEventDispatchergetInstanceDirectorEVENT_TOUCH_ENDEDonTouchEndedEVENT_TOUCH_MOVEDonTouchMovedEVENT_TOUCH_BEGANHandleronTouchBeganhandlerregisterScriptHandlercreateEventListenerTouchOneByOneccImage_ContentgetChildByName	viewgetCurrentHerosetHeroInfodetailUIsecondNodecreateNodeByCsbTypeleftUIfirstNode										!!!!!!""""""##!))))))******++)------......//-111111222222331555555666666775999999::::::;;9=self Image_Content 7»listener ¶ à!:øM  9  ' B-  9=   9   9 B9 B3 9   X6 9	 *  B= X6 9
9 B B2  K  
ÀunscheduleGlobalperformWithDelayGlobalschedulerdelayShceduler getCurrentNodesetNodeVisible
EQUIPtabStateEquip_ButtonsetButtonStateµæÌ³æýDFFFGGGGGGGJJJJKKMMST_TABSTATE self  "cb  þ  !)Ç9  9   X9  9+ BX9  9+ B9  9   X9  9+ BX9  9+ BK  Button_RightallHerosetVisibleButton_LeftinactiveNumcurHeroIndex					self  " q   ì-     9   B   9  B -     9  B K   ÀsetHeroInfoupdategetCurrentHeroself     ð-     9   B   9  B -   + = -     9  B K   ÀsetHeroInfoupdateBackupdategetCurrentHeroself  h  õ-  9= -   9BK   ÀsetHeroInfoarrskillChangeLvself target  	arr  	  
:g9 -   9B9 = 9+ B-   9B-   9-  	 9B9 B6 '	 B 9
* + +	 B 9+  +	 B 96 96	 9		B 9' B-  9 9 BK   ÀaddChild	vieweffectAnisetNamecycxdisplaysetPosition	initcreateapp.sprite.SkillAnirequire
awakegetCurrentNodecreateAwakesetHeroInfoupdateHeroAwakeheroAwarkLvgetCurrentHeroarrì							



self target  ;param  ;arr 9hero 5effect  ¶ -×Ô:6   99 6 96  99 6  99 6	  9		9				6
  9

9



B5	 6 9)	ÿ )
ÿ )ÿ )2 B=
6 9)	  )
  )  )  B=B6  9  6 96 '	 B96 
  9 B A6  9  6 96 '	 B96 
  9 B A6  9  6 96 '	 B96 
  9 B A6  9  6 96 '	 B96 
  9 B A6  9  6 96 '	 B96 
  9 B A6  9  6 96 '	 B96 
  9 B A6  9  6 96 '	 B96 
  9  B A6  9  6 96 '	 B9!6 
  9" B A3# 3$ 3% 6  9  6	 9	&	6
 '' B
9
(
 B6  9  6	 9		6
 ' B
9
)
 B6  9  6	 9		6
 ' B
9
*
 B3+ 6  9	  6
 9

6 ' B9, B2  K  upLevelAwaken heroUpSkillOneKeyartifactUpgrademopupInst!app.event.InstanceProxyEventinstanceProxy   unloadEquipmentCallBackunloadEquipmentheroCompositeCallBackheroCompositeOneKeyEquiponeKeyPushEquipmentshowEquippushEquipmenshowHeroBreakResultUIheroBreakshowStarUpResultUIheroUpStarrec_upHeroLvUseItemupHeroLvUseItemfinishHeroRankUphandlerheroUpRankapp.event.HeroProxyEventrequireheroProxyGameGlobaladdEventEventManagerborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcc	viewcreateRectUIManagerüÿÿÿ
															 $%%%%%%%%%%%%''''''''''''))))))))))))8999999999999::self  Ørect *®refeshInfo y5refeshInfo1 4refeshInfo2 3heroAwake % g   
  9  B 9B  9 BK  setHeroInfoupdategetCurrentHeroself   Þ 	 "99 :	  X9 )ÿÿ=9 99 +  <9 99 )ÿÿ<' =   9	 , 9
 BX6  96 ' B9BK  	czsbdata.Config_LanguagerequireaddMessageFloatMessagemyCurTypesetHeroInfoEQUIP1tabStateequipYuan
myIdx
equipmyHeroheroUIdmyEquiparr







self  #target  #arr  # c  	£9  	  X9 L X9 L K  secondNodefirstNodecurNodeIndexself  
 C   «  9  B9L rightUIgetCurrentNodeself   B   ¯  9  B9L leftUIgetCurrentNodeself   D   ³  9  B9L detailUIgetCurrentNodeself   E   ·  9  B9L jibanNodegetCurrentNodeself   E   º  9  B9L heroJiBangetCurrentNodeself   F   ½  9  B9L heroTalentgetCurrentNodeself   D   À  9  B9L heroTupogetCurrentNodeself   <   Ä9  9 8L curHeroIndexallHeroself   ø	   ÀÑÇ6 9 9' B A =  6 9 9' B A = 6 9 9' B A = 6 9 9'
 B A =	 6 9 9' B A = 6 9 9' B A = 6 9 9' B A = 6 9 9' B A = 6 9 9' B A = 6 9 9' B A = 6 9 9' B A = +  = 4 4 9  >6 ' B9>>4 9 >6 ' B9>>4 9 >6 ' B9>>4 9	 >6 ' B9
>>4 9 >6 ' B9>>4 9 >6 ' B9>>4 9 >6 ' B9>>4 9 >6 ' B9>>4 9 >6 ' B9>>	4 9 >6 ' B9>>
4 9 >6 ' B9>>= K  moraledata.Config_LanguagerequirecurAbilityTdodgeValuecurDodgeValuecriValuecurCriValuehitValuecurHitValuetoughValuecurToughValuemoveSpdcurMoveSpdatkDiscurAtkDismoraleIncSpdcurMoraleIncSpdatkSpdcurAtkSpd
maxHp
curHpdefcurDefatkgetAttribValue
floor	mathcurAtk								







self  Áhero  Á ¹ H´Êãq  X  9  B   X  9 B 9 9  X  9 ' 9 B9 9  X  9 ' 9 B+ 4  + 6 	 96
 '	 B
9
8

9

' + B6 
 BH 9 B  X6 9 + B+ X6 9 + BFRì  X9 
 9' B
 9' B
 9+ BX9 
 9' B
 9' B
 9+ B6 9
 9 B  X	9 
 9' B
 9' B
 9+ BX9 
 9' B
 9' B
 9+ B6 9
 94 >B  X	9 
 9' B
 9' B
 9+ BX9 
 9' B
 9' B
 9+ B96	 9		9	 	9	!	9			 X
9 
 9'" B
 9+ BX	9 
 9'" B
 9+ B6 99#6	 9		9	 	9	$	9			 X
9 
 9' B
 9+ BX	9 
 9' B
 9+ B6% 9	
8	9&)	
 	 X96	 9		9	 	9	'	9			 X
9 
 9' B
 9+ BX	9 
 9' B
 9+ B6% 9	
8	9&)	 	 X596	 9		9	 	9	(	9			 X-9 
 9'( B
 9+ B6 9
 9) B  X	9 
 9'( B
 9' B
 9+ BX9 
 9'( B
 9' B
 9+ BX	9 
 9'( B
 9+ B)  -	  :			 9	*	B	)
 -   ) M
-  8 9+B  X-  8 9, !	BO
ð=-   9
. 9/ B
  9
0 91  B
  9
2 93 B
  9
4 95 B
  9
6 9! B
  9
7 98 B
  9
9 9: B
  9
; 9 B
6
< 
 9
=
9 9'> B5A 6?   9@ B=B5C >>=DB
6
< 
 9
=
95 9'E B5F 6?   9@ B=B5G >>=DB
K    Touched_detailUI  Image_1
param  Touched_leftUIcallBack  heroNodeTouchedhandlerhero_boxwidgetTouchExtentUIManagersetLeftInfoheroTupocreateHeroTupoheroShenqicreateHeroShenqicreateHeroTalentdetailUIsetDetailInforightUIsetRightInfojibanNodecreateHeroToEquipYuanheroJiBancreateHeroToHeroYuantishiYuansetPositionYisVisiblegetPositionYcheckCanAwake
awake	tuposhowPotentialConfig_Heroshenqi
levelTalentheroTalentopenLvsnewBieConfig_GameDatalvTalent_CopycheckCanTupo
tishiShenqicheckShenQiLvUplocalPlayerGameGlobalsetVisibletishi2Jiban_ButtongetChildByName	viewinsert
tableactiveHeroYuanValid
pairs,heroYuaniddata.Config_Herorequire
splitStringUtilsecondNodecreateNodeByCsbTypeleftUIfirstNodegetCurrentNodegetCurrentHero					%%%%%%%%&&&&&&&&&&&&&&(((((((((((((*********++++++++++++++-------------666666667777777777999999999<<<<<<<<<<==========?????????BBBBBBBBBBBBBBBCCCCCCCCCCGGGGGGGGGJJJJJJJJJJJJJJJKKKKKKKKKLLLLLLLLMMMMMMMMMMMMMMOOOOOOOOOOOOOPRRRRRRRRRTUUUUUVVVVVWWWWWWWXXXXXXXYV_`````aaaaaabbbbbcccccdddddeeeeefffffggggghhhhhhhhhiiiiijjjjhmmmmmmmmmnnnnnoooomqbtnList self  µnode  µhero  µcurtype  µequipNomal  heroYuan1 heroYuanIsOk tmpYuan   _ v  tmpNum kbeginPosY f  i  Ý   *Z6     9  6 9 9B 9B6 99+  5	 -  =
- =- 6 9
 9-  B!=- 9=- =- 	 9'
 B=B K  À  ÀÀÀ	texttalentLvgetChildByName	icon	infocanLevelUpShenqi	needgetItemNumByIdlocalPlayerGameGlobalitemIditemId1  	nameWANNENGConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerid2 SUIPIANSHENQI need2 self iconMat3 iconMat2    +D-   9   :  	   X 6    9  6 96 - 89&B X -   9   :  	  X 	6  9    9 	 - 9
- B X -   9   :  	  X 6    9  6 9B K   ÀÀ	zybzuIdsend_artifactUpgradeheroProxyGameGlobalneedHeroLvConfig_artiFactLvxyyxdjConfig_LanguageaddMessageFloatMessagecanLevelUpShenqi self nextLevel hero id1  ù+!v	³Ð	ÕÏ9  -  9 X2 ,  X  9 B  9' B 96 989' 9	6	
 9		&	B 9' B  X6 9 9B  9 B 9' B6  9 ' 9	&	6	 9		9		'
 B 9)  )` B6 989+  	  X* X		 X* X	 X* X*  9'	 B6 ' B 9	 +
 + B	 9+
  + B	 9)
} )} B	 9'
 B	 9)
 B	 9 )
ÿÿB	 9
 B6! 989"4  )	 6
# 

 ) M	6$ 9% 6# 89&BO	ø)	 )
 ) M	µ9'88 9'(  &B 9') B 9'* B  X 9'* B'+  ', &6-  9. B X'+ )Ý', & 9'/ B  X)6 90 9B  91'2 B 93) B 9'/ B6  94 B 9 B 9566 97)ÿ ) ) B A 9)( )( B)  )   X068 99':  &B 9 B 9)# )# B 9'* B 9'; B 9<+ B 9'= B 9'> B 986
 9?&B8 9<+ BX 9'; B 9<+ B 9'= B 9 B 9@ ) B 9<+ B6  9A 5D 6B   9C B=E4 >>>>>=FBO	K 9	GB	 9
HB
 9'I B 96
 9I'J 6K 9L9I	  X)  B&B 9'M B 96
 9M'J 6K 9L9M	  X)  B&B 9'N B 96
 9O'J 9O	  X)  &B 9'P B 96
 9Q'J 9Q	  X)  &B 9'R B 96
 9R'J 6K 9L9S	  X)  B&B 9'T B 96
 9T'J 6K 9L
 X)  B&B 9') ) &B 9') ) &B 9') ) &B 9'U B 9'V B 9'W B 9<+ B 9<+ B 9<+ B 9<+ B9	 9	 6X   X6X  6X 89Y6 989Z6 '[ B 9 5\ >+ B6 '[ B 9 5] >+ B9	 6X  )  )  ) 6X 8  X6X 89^6X 89_X )  )  )ÿÿ9`   X'6X 9	89^)   X  9a  BX6 ' B 9* + + B 9+  + B 9 B 9)  )r B 9 ) B+ =` )   X 9<+ BX 9<+ B 9'b B 9<+ B 9'c B 9<+ B 9'c B 96- 9d 9e B'f  &B 9'b B 9<+ B 9'c B 9<+ B 9'c B 96- 9d 9e B'f  &B6- 9d 9e B X
 9'c B 956g 9hBX
 9'c B 956g 9iB) )   X06- 9d 9e B X
 9'c B 956g 9hBX 9'c B 956g 9iB)  9<+ B 9<+ B 9<+ B3j 6  9A 5k =EB4  =l 9l >3m 6  9A 9' n B5o =EB	 X 9'n B 9p+ B 9'n B 9q+ B 9'n B 9r6
 9sBX% 9'n B 9p+ B 9'n B 9q+ B 9'n B 9r6
 9tB)   X	 9'n B 9r6
 9uB2  K  K  
ÀÀ	tupojinjie
maxLvsetTitleTextsetTouchEnabledsetBright  submit canLevelUpShenqi   red
greenConst_colorData/getItemNumByIdlocalPlayertalentLvImage_19shenqiAnimationupdateBackmaterialNumfragNum      app.uiLogic.ICONbreakLvItemitemIdConfig_artiFactLvText_94Image_221Image_137zhanli
maxHphptoughValue
toughcriValuecridef
floor	math:atkgetArtiFactCombatPowergetAllArtiFactAddAttr
paramcallBack  wuHunLvUphandlerwidgetTouchExtentloadTexturejkqlvsetVisibleb#newGraySpritedisplayc3bccsetColorfontStokesetFontSizesimhei.ttfsetFontName	Text	infocheckPngExistInPlistGameGlobal	.pngicons_skill	gray	iconwwuHunLvneedArtifactLvinsert
tableConfig_artiFactOpenSkillartifactSkillConfig_HerosetLocalZOrdersetScale	initapp.sprite.SkillAnirequireeffectAniremoveChildByName	typesetPositionpnglocalTypeTextureResTypeshenqi/shenqiaddLocalPicUIManagersetNameaddChildcreateImageView	ccuishenqijieConfig_LanguageshenqiLv  idConfig_artiFactsetString	namegetChildByNamegetCurrentHeroSHENQItabStateìþÿÿÿ																     !!!!!""""####$$$$%%%%''''()))))*******),,,,--.//////00001111112222444455555556666888899::::::;;;;<<<<====>>>>>????@@@@@@@@@AAAAACDDDEEEEEEFFFFGGGGGHHHHIIIIIIIIJJJJJJJJKKKKKKKLMMMMMOOOOOOOOPPPPPPPPQQQQQRRRRTTTTTTTTTTTTTTTTTT,WWWXXXYYYYYYYYYYYYYYYYYYZZZZZZZZZZZZZZZZZZ[[[[[[[[[[[[[[[\\\\\\\\\\\\\\\]]]]]]]]]]]]]]]]]]^^^^^^^^^^^^^^^^^``````aaaaaabbbbbbccccddddeeeeffffgggghhhhiiiikkllllllmmoooppppqqqqqqqqqqrrrrrrrrrrttuuvwxyyyyzzz{{{{}~        ¡¡¡¡¡¡¡¡¡¡£££££££££¤¦¦¦§§§§§§§§¨¨¨¨¨¨¨¨¨¨ªªªªªªªªª«­­­­®®®®¯¯¯¯²³³³³³³³¶¶··ÀÁÁÁÁÁÁÁÁÁÁÂÂÃÃÃÃÃÃÃÃÄÄÄÄÄÄÄÄÅÅÅÅÅÅÅÅÅÅÇÇÇÇÇÇÇÇÈÈÈÈÈÈÈÈÉÉÉÉÉÉÉÉÉÊÊÊËËËËËËËËËÏÏST_TABSTATE SUIPIANSHENQI self  ³node  ³hero  ³img !effectType %íeffectId ìeffect ÒartifactSkill ´wuHunLvCondition ³	 	 	i ¶ ¶ ¶i ´lv ²skill ±skillNode «icon §path text tip ,^im 	)attr Yêpower çiconMat1 küiconMat2 öiconMat3 ðsuipian1 ìsuipian2 èsuipian3 ädd Òid1 Çid2 ÃnextLevel ­maxLevel «need2 ªneed1 ©canLevelUp ¨effect22 'cb1 ¨cb M    ":§6   ' B   9  *  + + B   9 +  + B-   9  B  9 )üÿ)p B  9 )	 B-  9) BK  ÀÀsetLocalZOrdersetPositionaddChild	initcreateapp.sprite.SkillAnirequireúnode shenqi effect22 
 B   ´ -     9   )
 B K  ÀsetLocalZOrder      shenqi   M¦¥ 9 ' B3 6 9 9*  )8B6 9 9*  *	 B6 9 9*	 B6 9	 9*
 )8B6 9
 9* ) B6	 9			 9		3	 B	6
 9

 *  B
=

  9
6 9 96 9 9  B 6 9 9  	 B A A
2  K  
SpawnSequencerunActionperformWithDelayGlobalschedulershenqiSche CallFuncDelayTimeScaleTocreateRotateTocc shenqigetChildByNameÿµæÌ³¦þµæÌ³¦ÿçÌ³³æÿ	






self  Nnode  Nshenqi Ibo Haction1 Aaction2 :action3 4action4 -action5 &action6   Â   B¸6   96	 9			 9		B		 9		B	6
 9

9

+  5	 =
====6   9 B=BK  cbsetHeroInfohandlertipskillId	herolv
index  	nameWUHUNLVUPConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerself  i  lv  hero  skill  tip   ¾   "Þ-     9   B -    9  B -    9  ' B   9  + B K  À  setTouchEnabledactivegetChildByNamesetHeroInforemoveFromParenticon self node  n²Î-   9 9:B-  9B6 9 9' - ' &) B 9- - B-  9	 B6
 ' B 9*  + + B 9+  + B 9- - B 9' B 9)ÿÿB-  9	 B 9* B 9)( B6 9 93 B 96 9
 96 9 96 9 96 9 9* ) B A6 9 9* B A B A2  K  ÀÀ ÀÀFadeInScaleToEaseBackIn
SpawnSequencerunAction CallFuncccsetOpacitysetScalesetLocalZOrdereffectsetName	initapp.sprite.SkillAnirequireaddChildsetPosition	.pngicons_talentTypecreateImageView	ccuiremoveAllChildrenarrsetMaxTalentIndexÒµæÌ³çÌ³³æÌþ					




hero t skillId x y self node target  oarr  oicon Zeffect Gfunc %" Æ   ó6   9    9  -  9B -    9  ' B   9  + B K    setTouchEnabledactivegetChildByNameuIdsend_activateHeroTalentheroProxyGameGlobalhero node  â
 #¹æ!6   9  6 -  B 8     X 2 ¬6   9  6 -  B 8  9  - 9  X 6    9  6 96  9-   89&B 2 6   9  6 -  B 8  9  - 9  X 6    9  6 9	6  9-   89&B 2 z6 
   9  6 ' B9- + B    Xk3  - 6  9:- 8 X`) - )   X) - 	 X6  96 9 9B 9B6 ' B99+  5 '	 
 &	
	=	-	 9		=	= BX=- 	 X6  96 9 9B 9B6 ' B99+  5  '	 
 &	
	=	-	 9		=	= BX6  96 9 9B 9B6 ' B99+  5" '	! 
 &	
	=	-	 9		=	= BX  BK  K  K  K  ÀÀÀ  talentUp  talentUp1	fun2param1id  talentUp2	nameMESSAGEBOXdata.Config_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerheroTalentCost SILVERapp.const.Const_CostTyperequirecheckResourceEnoughGameGlobalneedHeroStar	starherolevelneedConfig_LanguageaddMessageFloatMessagelvtonumberheroTalentLimitConfig_GameData 													
!
visibleFromId hero silver node curNum i need10 need12 callback LjneedCurNum 	^ Õ   	 6     9  6 9 9B 9B6 99+  5	 -  =
B K  	hero  	nameHEROTALENTINFOConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManager                    hero  *+f
Õ	»ß9  -  9 X2 û  X  9 B 9 6 9896 989 )   X   X 6 9		B)  6	 9	
	6 9: B				 X		6	 9	
	6 9: B			 		 
	 9' B 9' 	
 X) X
 ' &) B) 9  X9)   X6  96 989' B) 9) M
6  98' + B: Oö  ) Mª * *  9'  &B6 889	  X 9' ) BX 9' ) B* )(   9' B 9' B886  9! 9"'#  ' &) B 9$  B 9%' B 9& B6' '( B 9"* + + B 9)+  + B 9$  B 9%' B 9*)ÿÿB 9& B6 889	  X!6+  9, 4 5- ==.>6/ 90B: 9'1  &B 9263 948'5 6 9	96#B&BX 9'1  &B 926 897B68  99 9'1  &B A 9'1  &B 9:6;  9<6= :B AOV 9'> B 9?+ B)  ,  9'@ B 92)  B 9'A B 92)  B ) M6 88  X2  * *  9'  &B6 889	  X 9' ) BX 9' ) B* )(  88 9' B 9' B6B 9C'D '#  ' &B 9E* * B 9& B 9%' B 9$  B6 889	  X!6+  9, 4 5F ==.>6/ 90B: 9'1  &B 9263 948'5 6 9	9!6#!!B&BX 9'1  &B 926 897B68  99 9'1   & B A 9'1  &B 9:6;  9<6= 9GB A	  Xï6 989H, 6I 9J 9K B )  )  )   6! 9"8!"!9!L!6"M 6$N -% 8$%$9$O$B"!" X!"6!I 9!J!#! 9!K!-$ B! !6! 9!!:!!8!!! X!6! 9!!:!!8!!!!X!6!I 9!J!#! 9!K!-$ B!!  6!I 9!J!#! 9!K!-$ B! ! 6! 9"8!"!9!L!6"M 6$N -% 8$%$9$O$B"!" X!"6!I 9!J!#! 9!K!-$ B! !!6" 9"":""8"""! X!6! 9!!:!!8!!!!X!6!I 9!J!#! 9!K!-$ B!!  6!I 9!J!#! 9!K!-$ B!  ! 6! 9!!:!!8!!! X!+ X!+ 6! 9!!:!!8!# 9!'$@ B!#! 9!2! $ '%P 6& 9&&:&&8&&&$&$B!# 9!'$A B!#! 9!2!$ B! X!Q6!' '#( B!#! 9!"!*$	 +% +& B!$! 9")!+%  +& B"$! 9"$!% & B"$! 9"%!'% B"$ 9"&%! B"$ 9"'%> B"$" 9"?"+% B"3"Q 6#R %# 9#S#&  6'I 9'T'6(' '*U B(9(V()" B#6#8 %# 9#W#( 9&')> B&5'Y 3(X =(Z'B#% 9#'&> B#%# 9#[#+& B#% 9#'&@ B#%# 9#:#6&; (& 9&<&6)= 9)\)B& A#X!# 9!'$@ B!#! 9!:!6$; &$ 9$<$6'= 9']'B$ A!2 2 2 Ox~ 9'> B 9^B  X	 9'> B 9[+ BX 9'> B 9[+ B68  9W 9'_ B5a 3` =ZB6' 'b B 9" 9'c B5d 6 989H>+ B 9'. B 9'e 	 ' &) B2  K  K  
ÀÀÀheroui_talenName   	soulapp.uiLogic.ICON   	infoisBrightequipNumInvalidequipNumValidsetTouchEnabledcallBack   widgetTouchExtentactivateHeroTalentapp.event.HeroProxyEventheroProxyaddEventEventManager /	dataConfig_ItemtonumbershowPotentialgetItemNumByIdlocalPlayerGameGlobalneedSoulwhiteGray  setAnchorPoint#newGraySpritedisplaygoldcostsoulcostsetBrightactiveConst_colorDataconvertHexToRGBDisplayObjectUtilsetColorfontStokeUIManager	name
value+	attrConfig_LanguagesetStringattTYPE_NOTYPEConst_Skilllv  getSkIncAttrValueHeroAttribUpdatersetLocalZOrder	initapp.sprite.SkillAnirequireaddChildsetNamesetPositionicons_talentTypecreateImageView	ccui
icon1effectremoveChildByNameheroui_potent2.pngheroui_potent1.pngeffectTypeConfig_HeroSkillt_,talentBuff
splitStringUtilevolveLv	.pngcommon2_talentBgloadTexturebggetChildByNameheroTalentCostConfig_GameData	ceil
floor	mathtalentLvtalentIdidConfig_HerotalentSkillgetCurrentHeroTALENTtabState ³æÌÌïÍ³ææÌñÒÿÐ				



      !!!!!!#####$$$&&&&''''()**********+++++,,,,----/////////0000011111222233334444777777888888888888899999999999999999999;;;;;;;;;;;;==========>>>>>>>>>>>>>>>AAAAAAAABCDDDDDDDDEEEEEEEEFFFFFGGGGGHJKLLMMMMMMNNNNNNOOOOOOQQQQQRRRTUVVVVWWWWXXXXXXXXYYYYYZZZZ[[[[\\\\\^^^^^^_____________````````````````````bbbbbbbbbbbbddddddddddeeeeeeeeeeeeeeeffgggghiiiiiijlmoppppppppppppqqqqqqqrrrrrrssssssuuuuuuuwxxxxxxxzzzzzzzzzzzz{{{{{{{{{{{{{||||||~~~~~~~©ªªªªªªªªªªªª««««««««ÌÌ«ÍÍÍÍÍÍÍÍÎÎÎÎÎÎÎÎÎÎÎÎÎÎÐÐÐÐÐÐÐÐÐÐÐÐÐÑÒÒFÕÕÕÕÕÕÕÕÕÖÖÖÖÖÖÖÖÖØØØØØØØØÚÚÚÚÚÚÚÚÚÚÚÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÞÞÞÞÞÞÞÞÞÞÞÞßßST_TABSTATE SUIPIAN10 SUIPIAN12 self  node  hero  curTalentMaxId ócurHeroTalent ïcurHeroTalentLv ëtmpNum ãvisibleFromId ßindex ÞvisibleIndex Êquo Ératio ¸tmp   i 	« « «i ©x ¦y  ¦t  skillId skillLv icon 
xeffect btype )j Câflag ásilver  á  i x 
ûy  ût õskillId àskillLv ßim Ïtype %soulId ?êsoul ésilver  écurNum ãactualNum âneed10 áneed12 àneedAdd ßeffect Grefresh , @   ©	-     9   B K  ÀremoveFromParent_Text_1  ü Ë	  X) 6  9 9B 9'	 B 9	 B 9	 B 96	 9			B 9
)	  )
 B 9)	  *
  B 9	 B6  9	 B3 6 9	 96
 9


 9

*  6 9)  )
 B A
6 9 96 9 9*  6 9)  )
 B A6 9 9*  B A6 9 9 B A
 9 B
 9 B6 9
 96 9 9* ) B6 9 9* B6 9 9* ) B A 9	 B	2  K  DelayTimeScaleToaddChildrunActionCallFuncFadeOut
SpawnpMoveBySequence fontStokeUIManagersetColorsetAnchorPointsetPosition#VERTICAL_TEXT_ALIGNMENT_CENTERccsetTextVerticalAlignmentsetStringsetFontSizesimhei.ttfsetFontNamecreate	Text	ccuiÿµæÌ³¦þçÌ³³æÌþµæÌ³æý					




self  node  str  color  size  _Text_1 	xcom %Saction ,'action !   AaÐ	-      X-    9   ' B 1   *   - 9)  X*  6 ' B 9  + + B.  -   9+  + B-   9' B-  9-  B-   9	)  ) B- 9)  X-   9
) B-   9	* * BK  ÀÀsetScalesetPositionaddChildsetName	initcreateapp.sprite.SkillAnirequirejieModellongEffectremoveChildByNameöÔ®ÜÖÃë£áÇÂÎ	effect leftUI infos effectId 7   	 "3µ
-   )    X -    9   - ' -  &6  96 9B) B X -    9   - -  6  96 :B) B K  À ÀequipNumValidConst_colorDataconvertHexToRGBDisplayObjectUtil+createTextinc self sprite  ê! g	Çü»	 9 ' B 9 ' B 9+ B 9 ' B 96 9'	 6
	 9
8

9

&
B6  9 B9)   X& 9+	 B9)  X 9+	 B 9'	 6
 9

9

B 9 '	 B 96	 9		'
 &	
	BX 9'	 6
 9

9

B 9 '	 B  X	 9+
 B3 9)	  	 X B
 9 ' B
 9' 9' &6 99B9)	 )
 ) M	)6  9 B9 X 9 '  &B 9+ BX
 9 '  &B 9+ B 9 '  &B 9 ) BO	×9	 9
 B
&	
	 9
 '! B

 9

	 B
9
)  
 X
" 9
 '! B

 9
"
B
9
#
 9 '! B 9$B 9 '% B 9+ B 9 '% B 9&!
  BX
 9
 '% B
 
 X 9
 '% B

 9

+ B
 9
 '! B

 9
'
6(  9)6* '+ B9,8B A
6
- 
 9
.
 9 '/ B'0 9
&6 991'2 B
 9
 '/ B

 9
3
* B
 9
'4 9,' &6 99B
 9
 '5 B

 9

66 97 98'9 B A  A
 9
 ': B

 9

66 97 98'; B A  A
 9
 '< B

 9

66 97 98'= B A  A
 9
>B
 9 '? B 96@  9A
 B A 9 'B B 9 'C B  X6* 'D B 9E* + + B 9F+  + B 9G'C B 9H B 9&)d )úÿB 9 'I B
  X 9JB)  ) M	89K  X 9L8BO÷6-  9M9N 9O8'P ) +   BX 6-  9M9N 9O8'P ) B  9H B6Q  9RB 9&6S 9T9U9VB A 9G'I B9N 9O8 9>B X3 9>B9N 9O8!9N 9O 9>B< 9W6S 9X 9E6S 9Y 9E6S 9Z 9E3[ B A A A9\   X6* '] B 9EB=\ 9\  9^  9>B A2 9_)   XU 9 '` B 9+ B66 9a9_B9_	 X)  9 'b B 9'c  ' &6 99B) ) ) M 9 'd  &B 9e'f BOõ)  ) M!6* 'D B 9E* + + B 9F+  + B 9G'f B 93* B 9 'd  &B 9H BOßX 9 '` B 9+ B2  K  effectJobremoveChildByNameNode_posheroui_juexingImage_di	ceilNode_awakeheroAwarkLvimageStringRollapp.uiLogic.STRINGROLLstringLogic CallFunc
SpawnSequencerunActionyxpccgetTotalAbilityOffsetMultiVersionUIHelperuiNum3uId
powercreateImageStringremoveChild
isNumgetChildrenFightValueaddChildsetName	initcreateapp.sprite.SkillAniFightEffectImage_261getHeroFoodCostGameGlobal	foodgetCombatPower
maxHptong_txtdefzhi_txtatkgetAttribValue
floor	mathwu_txtheroui_wujiangsetScalepnglocalTypeheroBody/heroBody_hero_imgaddLocalPicUIManagerqualityapp.const.Const_colorDatarequireconvertHexToRGBDisplayObjectUtilsetColorsetPosition	shengetPosition
widthgetContentSizehero_name_txtgetQualityLv	name	starstarNumstarBig	.pngcountryheroui_ccountry_type longEffectcommon_jinsewenli.png 15plistTypeTextureResType	ccuicommon2_jinsewenli.pngloadTexturejieModelgetShenJiangInfoConfig_GameDatashowPotentialidConfig_Hero 
zizhiConfig_LanguagesetStringhero_name_txt_CopysetVisiblepotentialhero_boxgetChildByName(´ÿÒ 
 ÿ				






)++++,,99999999999999;====>>>>>>>>???????????AAAAAAAAAACCCCCCCCCCC=EEEEEFFFFFFFFGGGGHHHHHHHHIIIIIIIJJJJJJJJKKKKKKKKKKKLLLLLLMMMMMMMMRRRRRRRRRRRRRRRRTTTTTTTTTTTTTTTUUUUUUUUVVVVVVVVVVWWWWWWWWWWWWWWXXXXXXXXXXXXXXYYYYYYYYYYYYYYZZZ[[[[[[[[[[[[\\\\^^^^^^_________`````aaaabbbbcccccffffgghhhiiiijjjjkkkkinnnnnnnnnnnnppppppppppqqqqrrrrssssssssssttttwwwwwwwwxxxxxxxyyyyyyzzzzzzzzzzzzzzzzzzself  ÈleftUI  Èhero  ÈheroBox ÃpotentialImg ¿infos §effect .ùcreateLongEffect òstarPath Ý* * *i (name .«width posX posY  batPower imgFight effect46 sprite Üchildren 
 
 
i posOffset 'inc +nodeAwake 4PcolorIndex 	GawakeNum E  i 
" " "i  effectJob 	 ½    Ì 6     9  6 96 96 999	9
B A K  lvheroLvUpopenLvsnewBieConfig_GameData	jjkfConfig_LanguageformatstringaddMessageFloatMessage                ¿    × 6     9  6 96 96 999	9
B A K  lvheroRankUpopenLvsnewBieConfig_GameData	jjkfConfig_LanguageformatstringaddMessageFloatMessage                ç   6     9  6 9 9B 9B6 ' B99	+  5
 -  =B K  	hero  	nameCHARIOTUIdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagerhero  ª$#mÛ÷Ú
®9  -  9 X2 T  X  9 B + 96 99 X6 - BH6	 9			 9		 B	)
  
	 X	6	 9		9		6
	 9


9

9

9


	 X	+ XFRé  X	 9' B 9+ BX 9' B 9+ B 9' B 9' B96 9 X96 9 X	 9'	 B 9+	 BX 9'	 B 9+	 B 9)	c B  9 	 
 B6	  9	 B6 '	 B	 99
+ + B
 9+  + B
 9'  B
 9!*  B6" 9#9
$ 9%8

 B
 9'& B
 9' B'( 9	)9
'* &  X	9	+ 	 X
	6	, 9+B		 X	 9	-B		  9	'. B		 9	/	 60 9192B	 9	'3 B		 9
4	6 '5 B' 9&8B
	 9
6	67  986 '9 B9)8B A
6
 ': B

 9
;
 B

#)  )  
 )  )  6< 9=89>6, 6? - 89@B X6 9 9- B #)d  X!X6 9 9- B  X#6< 9=89>6, 6? - 89@B X6 9 9- B #)d  X!X6 9 9- B  X#)d  X)d )d  X)d )d  X)d  9'A B 9'B B 9'C B9D)  X 9'E B 94
 'F  &B 9G B 9G B 9G BX 9'E B 946H 9IB 9G)d B 9G)d B 9G)d B  9J   B  9K   B  9L   B 9'M B6	 9
9996 99 X	6N  9O 5Q 3P =RBX6N  9O 5U 6S   9T B=R5V >>=WB 9'X B6	 9
99Y96 99 X	6N  9O 5[ 3Z =RBX6N  9O 5\ 6S   9T B=R5] >>=WB+ ) ) ) M9^8	 X+ Oú X/ 9'_ B 9/'` 60 9192B 9'X B6 ' B 9* + + B 9+  + B 9'a B 9'X B 9' B 9b)9 )9 BX 9'_ B 9/'c 60 9192B 9'd B6N  9O 5e 6S    9!T B=R5f >>4 >>>
>=WB 9'g B6N  9O 5h 6S !  9"T B=R5i >>=WB6N  9O 5k 3j =RB96 9 X96 9 X 9l+ BX 9l+ B2  K  K  
À	ÀÀÀsetTouchEnabled     Button_StarAdd  Button_add_star  Button_StarUp  Button_levelup_starheroui_yijianzhuangbei.pngsetPositione97heroui_yijianjinjie.pngImage_1761equValid  Button_OneKeyEquip     heroRankUpButton_equip_once
param  Button_LevelUp  heroNodeTouchedhandlercallBack   widgetTouchExtentUIManagerButton_levelupsetExpNodesetEquipInfosetSkillInfoymxConfig_LanguagesetPercent/starPercent	starLoadingBar_star2LoadingBar_star1LoadingBar_star	dataConfig_ItemshowPotentialidConfig_HerogetStarUpSoulInfoapp.uiLogic.CommonHeroInfoapp.const.Const_colorDataconvertHexToRGBDisplayObjectUtilsetColordata.Config_LanguagesetStringjobtxtplistTypeTextureResType	ccuiloadTexturejobimggetZhuanJingIcontonumberbingZhongId	.pngqualityheroui_pinzhijobaddChildhero_img
indexeffectsinsert
tablesetScaleeffectJobsetName	init
dipancreateapp.sprite.SkillAnirequiregetShenJiangInfosetHeroLvInfosetLocalZOrderImage_wenhaoCOUNSELLORARCHERConst_Jobjobhero_bgImage_1setVisible
tishigetChildByNameheroLvUpopenLvsnewBieConfig_GameDatagetItemNumById
pairs
levellocalPlayerGameGloballvgetCurrentHero
EQUIPtabStateÍ³ææÌÿ È						





     """""#########$$$$$%%%%&&&&'''''''(((((((()))))**********++++-----------////000000000011111111111133333334456789::::::::::::;;;;;;;;;<<<==???????AACCEEEEEEEEEEEEFFFFFFFFFGGGHHJJJJJJJLLNNQQQRTTTUWWWX[[[[\\\\]]]]^^^^___________````aaaabbbbbdddddddddeeeeffffggggjjjjjlllllnnnnnppppqqqqqqqqqqrrrrrrrrrtttttuuuuuvvvvt{{{{||||||||||}}}}}}}}}     ¡¡¡¡¡¢¢¢¢ ¦¦¦¦¦¨¨¦©©©©©©©©©©ªªªªª¬¬¬¬®®ST_TABSTATE bookId SUIPIAN10 SUIPIAN12 self  ÛrightUI  Ûhero  ÛshowTip Í	  _ v  rootNode .heroBg infos )èeffectJob 	ßpathjob !¾jobName ¡currentNum totalNum  percent percent1 percent2 actualNum ÿneed10 þneed12 ýprogressBar Z£progressBar1 progressBar2 Button_LevelUp D×Button_OneKeyEquip &±canRankUp #  i effect97  Button_StarUp &DButton_StarAdd , Ü 	  #6   96 9 9B 9B6 99+  5	 = 
=BK  	hero	type  	nameEQUIPINFOConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagertype  hero   ÅI¼öW9  -  9 X2 5  X  9 B 3 ) ) ) M)
 9'  &B6	 	 9		 5 =	4 >>=
B	 9	' B		 9		' B	 	 X
 9	' B		 9		' B	)	 )
 ) M	 9'  &B 9' B 9'  &B 9' BO	ë	  X	 9	' B		 9		' 6 99B	X		 X	 9	' B		 9		' 6 99B	X	 9	' B		 9		' 6 99B	9	8			 X	ã9	8		
	  X	ß 9	' B		 9		B	 9	' B		 9		' B		 9		+ B	 9	' B		 9		' B		 9		+ B	 9	' B		 9		' B		 9		+ B	 9	'  B		 9		989!B	 9	'" B		 9		989#B	 9	'$ B		 9		989$B	 9	'$ B		 9	%	6&  9'6( ') B'* 989+&8B A	6	( ', B		 9	-	 9' B5. 989/>B		 9
0	+ B
9
18


 X
29
18



  X
. 9
'2 B

 9

63 94 95918:918:) B A
6
( '6 B

 9
-
* + + B

 97
' B
 98
+  + B 9' B 99
 BX
 9
'2 B

 9

' B
9
8


 9
:
B
4  6;  9<
 '= B )  ) M4  6;  9<8'> B  9'  &B 96? :8B 9'  &B 9:BOáX	Þ6	3 9	4		 9	@	 B	 	 X
z 9	' B		 9		B	 9	'2 B		 9		' B	 9	'$ B		 9		' B	 9	'  B		 9		)  B	 9	'" B		 9		)  B	 9	' B		 9		' B		 9		+ B	 9	' B		 9		' B		 9		+ B	 9	' B		 9		' B		 9		+ B	6	( ', B		 9	-	 9' B5A +  + B		 9
0	+ B
6
B 9
C

 9
-
* * B

 9D
B 9' B 9E6B 9F 9-6B 9G 9-
  B A AX	\ 9	' B		 9		B	 9	'2 B		 9		' B	 9	'$ B		 9		' B	 9	'  B		 9		)  B	 9	'" B		 9		)  B	 9	' B		 9		' B		 9		+ B	 9	' B		 9		' B		 9		+ B	 9	' B		 9		' B		 9		+ B	6	( ', B		 9	-	 9' B5H +  + B		 9
0	+ B
O×}K  K  
À  NSequenceRepeatForeverrunActionreverseScaleBycc  NequipValidConfig_Language_,
splitStringUtilgetEquipAttriaddChild	initsetNameapp.sprite.SkillAnigetYuanInfolocalPlayerGameGlobalText_102equipYuansetTipEnabledid   createapp.uiLogic.ICONqualityequipLv_app.const.Const_colorDatarequireconvertHexToRGBDisplayObjectUtilsetColor	name	rankjielvjikongtukezhuangbeisetVisiblejiahaostopAllActions
equipcommon_qi.pngcommon_zhuang.pngplistTypeTextureResType	ccuicommon_wu.pngloadTexturewuasetStringatremoveChildByNameeffect13	icon
paramcallBack  widgetTouchExtentUIManager	nodegetChildByName getCurrentHero
JIBANtabStateþÿÿÿ¤çÌ³³æÌþµæÌ³Æÿ	            !!!!!!!!!!""""""""""##########$$$$$$$$$$$$$$$$$$$$%%%%%%%%%%%%%%%&&&&''''''''((((((((((((((((((()))))))))****+++++,,,,,,,,,........1111123333333444456666666777777777777888888888849;;;;;;;;<<<<<<<========>>>>>>>>????????@@@@@@@@AAAAAAAAAAAABBBBBBBBBBBBCCCCCCCCCCCCDDDDDDDDDDDDDEEEEFFFFFFFGGGHHHHHHHHHHHHHHHHHHHHJJJJJJJKKKKKKKKLLLLLLLLMMMMMMMMNNNNNNNNOOOOOOOOOOOOPPPPPPPPPPPPQQQQQQQQQQQQRRRRRRRRRRRRRSSSSWST_TABSTATE self  ¼jibanNode  ¼hero  ¼cb ®ª ª ªi ¨curNode ¢   j iconLogic °reffect13 (attrStr +tmpAttr *
     j tt logic !action action1 logic l ¨ ¿ã 9 ' B 9' -  989&B 9 ' B 96 9
 9	B A  A 9 '
 B 96 9
 9B A  A 9 ' B 96 9
 9B A  A 9 ' B 96 9'  9	' B	 A A 9 ' B 96 9'  9	' B	 A A 9 ' B 96 9'  9	' B	 A A 9 ' B 96 9'  9	' B	 A A 9 ' B 96 9'  9	' B		 	B' &B 9 ' B 96 9'  9	' B		 	B' &BK  ÀcriDmgToughRatebaoshangkang%criDmgRatezhanlidodgeValuehphitValueprovisiontoughValuedefcriValuegetAttribValue	%.2fformatstringackgetSrcIntemou_txtgetSrcCmdtong_txtgetSrcForce
floor	mathwu_txt	Descid	    setStringherointrogetChildByNameÈ															CONFIG_HEROS self  detailUI  hero   ¨  U®²)  6   96 ' B:B-   9B 96 9-  	 9B A  A9	6
 9!9 6 ' B 9- 9B- 9:8::)   X6
 	 9-
 9

 ' 6 9:B&     )  )Z * B- 9 	 X6 9-	 9		B- +  =- 	 9-
 BK  À ÀÀgetCurAbilityabScheduleId1unscheduleGlobalscheduler	ceil	math+	viewmoveFontAnicurAbilityTchangePospopapp.utils.QueueyrightShiftPxUIManagerxgetPositionpccconvertToWorldSpacegetParentapp.const.Const_colorDatarequireconvertHexToRGBDisplayObjectUtil<àÿ 



















progressBar self hero fontSize Tcolor Lpos >positionX :positionY 8curA 0expName +  ;éþöT 9 ' B 9 ' B96 99 X6 99= 9 ' B 99B 9 '	 B96
   X96 '	 B9 89#)	d 	 X	)d  9	 B	X 9)	d B9  XF+  =  9 '	 B  X"6 ' B 9*	 +
 + B6 99	 9
8	
	
 B	 9+
  + B	 9)

 )  B	 9
 B	 9'
 B 9B	 9B9
 9 ' B
 96 9 9 B"  9!B A A9" 	  X2 á4 4 6$ 9% 9
&'' B
 A >6 '
( B9'>>4 6$ 9% 9
&') B
 A >6 '
( B9)>>4 6$ 9% 9
&'* B
 A >6 '
( B9*>>4 6$ 9% 9
&'+ B
 A >6 '
( B9+>>4 6$ 9% 9
&', B
 A >6 '
( B9->>4 6$ 9% 9
&'. B
 A >6 '
( B9.>>4 6$ 9% 9
&'/ B
 A >6 '
( B9/>>4 6$ 9% 9
&'0 B
 A >6 '
( B90>>4 6$ 9% 9
&'1 B
 A >6 '
( B91>>	4 6$ 9% 9
&'2 B
 A >6 '
( B92>>
4 6$ 9% 9
&'3 B
 A >6 '
( B93>>=# 94 
  X59# 
  X295   X/) + =5  9#  )	 M94 8
:9# 8
: X6 996 4 >
94 8
: 9# 8
: >BOè37 96  )	  	 X	98   X69 9:
 * B=8 2  K  K  scheduleGlobalschedulerabScheduleId1 changePosheroLvUpFlagcurAbilityTdodgeValuecriValuehitValuetoughValuemoveSpdatkDismoralemoraleIncSpdatkSpd
maxHpdefdata.Config_LanguageatkgetAttribValue
floor	mathheroAbilityTisEndedgetPositionYgetPositionXpcc
widthgetContentSizegetPercentsetNameaddChildsetPosition	init
indexeffectsinsert
tablecreateapp.sprite.SkillAni	percshowExpEffectsetPercentdata.Config_HeroLvrequireexpConfig_HeroLvhero_progress_barsetStringhero_level_txt
levellocalPlayerGameGloballvhero_bgImage_1getChildByNameÈÖþÿÿÿ÷ÑðúáõülµæÌ³æþ




###$&&'''''''''''''''((((((((((((((()))))))))))))))***************+++++++++++++++,,,,,,,,,,,,,,,---------------...............///////////////00000000000000011111111111111233333333345566666777777779999999999999996MNNNNNOOOPPPPPPTT$self  érightUI  éhero  érootNode äheroBg àprogressBar ÊcurExp maxExp 
percent effect75 !pct width1 startPos Ê.  i cb       Û+  L   ç  »ô%-   9 B XK  - + =- 9  X6 9- 9B- +  =6 9 9- B)   X&- 96 99	 X- 9
	  X-  9- ) - B-  9- - BXU-  9- - B6  96 9BXH- 9
)   X&- 96 99	 X- 9
	  X-  9- ) - B-  9- - BX*-  9- - B6  96 9BX- 9  X6  96 9 9B 9B6 ' B99+  5 6 -
 - 9B=BK  À À
ÀÀÀcallBack  setHeroInfohandler	nameGETEXPBOOKdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagerhaveGetExpBookheroCanNotLvUpConfig_LanguageaddMessageFloatMessageuseExpItemuseExpItemNoSendMsgtotalExpNum
levellvgetItemNumByIdlocalPlayerGameGlobalunscheduleGlobalschedulerretryScheduleIdisEndedisVisible 									






                         %NodeExp self itemId hero iconLogic touch   ·	  ¢È¢'-   -  9  =  -   ) = -   9   )
   X 	-   9   )   X -   )
 = X -   9   )   X 	-   9   )   X -   )2 = X -   9   )   X -   )d = 6  9    9  - B 6 9 9- B)   X>- 96 99 X$-  9   X-   9- -  9 - B-  -  9-  9  =XH-   9-   - B-  -  9  =X;-  9	  X6
 9-  9	B-  +  =	6  96 9BX(-  9	  X6
 9-  9	B-  +  =	6  96 9 9B 9B6 ' B99+  5 6 -
  -  9B=B-  + =K      haveGetExpBookcallBack  setHeroInfohandler	nameGETEXPBOOKdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagerheroCanNotLvUpConfig_LanguageaddMessageFloatMessageunscheduleGlobalschedulerretryScheduleIdtotalExpNumuseExpItemNoSendMsg
levellvgetItemNumByIdlocalPlayerGameGlobalexpFactortickExp			   #########################$$$'self itemId hero iconLogic restNum 3p ú  *Ê	-   9   	   X -   9  
   X 6  9  -  9B -   +  = -   )  = -   6 9- * B= K   ÀscheduleGlobaltickExpunscheduleGlobalschedulerretryScheduleIdisEndedµæÌ³¦þ	self callBack  ³\;-   9 B X2 - )  =- ) =- + =3 3 6 9 *  B2  K  K  À À
ÀÀÀperformWithDelayGlobalscheduler  haveGetExpBookisEndedtotalExpNumisVisibleµæÌ³¦þ/9:::::;;NodeExp self itemId hero iconLogic touch  callBack cb gsc       ÖK   ç  »Ú&-   9 B XK  - + =- 9  X6 9- 9B- +  =6 9 9- B)   X&- 96 99	 X- 9
	  X-  9- ) - B-  9- - BXU-  9- - B6  96 9BXH- 9
)   X&- 96 99	 X- 9
	  X-  9- ) - B-  9- - BX*-  9- - B6  96 9BX- 9  X6  96 9 9B 9B6 ' B99+  5 6 -
 - 9B=BK  À À
ÀÀÀcallBack  setHeroInfohandler	nameGETEXPBOOKdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagerhaveGetExpBookheroCanNotLvUpConfig_LanguageaddMessageFloatMessageuseExpItemuseExpItemNoSendMsgtotalExpNum
levellvgetItemNumByIdlocalPlayerGameGlobalunscheduleGlobalschedulerretryScheduleIdisEndedisVisible 									






    !!!!!!!!!!!!!!!!!!!!!!!!!&NodeExp self itemId hero iconLogic touch   ®	 % ¬Í· 9 ' B9  X 9+ BX 9+ B 9B X2 n6 ' B 9 ' B6  9		 +
  5 3
 =B 9+	 B4  = ) ) ) MR'
 	 &

8

6 ' B8
)   X2F6 9 9
 B4  6 9>>
> 9 ' 	 &B 9 ' 	 &B 9 ' B6 ' B 9  + B 9+ B9 <
9 <	9  X6  9	 5 3 =5  3 =5" 3! =+  )2 +  5$ 3# =B
2
 O®2  K  K              useItemHeroexpItemIconssetTipEnabledcreateapp.uiLogic.ICON	iconitemIcon_	ITEMConst_ItemTypegetItemNumByIdlocalPlayerGameGlobaldata.Config_ItemEXPITEMwidgetsetSwallowTouchescallBack   widgetTouchExtentUIManagerexpItemBox!app.const.Const_speItemDefIdrequireisVisiblesetVisibleExpNodeIsVisibleNodeExpgetChildByName          !!!!!!!!!""""##$$%%%&&&&&LLM³³&µ··self  rightUI  hero  NodeExp speItemIds kexpItemBox gS S Si QitemId LitemConf HuseNum GhaveNum 	>itemInfoArrg =iconView 2iconView1 
(iconLogic 	 ¬   46  9 9 B9 8 9 BK  
upNumexpItemIconsgetItemNumByIdlocalPlayerGameGlobalself  itemId  haveNum iconLogic   
  I
9  8  9 B  XK  
  X 9) + B6 9 9	  9 B9 	 BK  uIdgetCurrentHerosend_upHeroLvUseItemheroProxyGameGlobalplayAnisetHeroInfoexpItemUseNum											
self  useItemId  iconLogic  totalUseNum    ?ªz+ 6   9' B
  X 9) +	 B9 8  X
9 6 9	 9
 B<9 8 XK    9 B6	 '	
 B86 9
B"	9
 9	 B XK  9 !<9 8  X)  9  <  9 B 9' B 9' B6	 ' B 9*  + + B6 99   9 B98 B 9B 96 999 B A 9!+  + B 9" B+ =# 9
 X+ 6	 ' B 9* + + B6 99   9 B98 B 9!+  + B 9" B 96 999 B A 9$B=% + =& 9'  9'( B 9)B9'  9'* B 9)B  9+ B9'  9'( B 9)B X!6	 ' B 9* + + B 9)2 )& B 9!+  + B9'  9'( B 9" B 9,* ) B9'  9'* B 9)B X!6	 ' B 9* + + B 9)2 )& B 9!+  + B9'  9'* B 9" B 9,* ) B6   9'- BX  9 B 9' B 9' B96 99. X6 99.= 9'/ B 909B 9'1 B962   X936	 '4 B9893#)d  X)d  95 BX 95)d B9#  XF+  =#  9'6 B  X"6	 ' B 9* + + B6 99 98 B 9!+  + B 9" B 9)
 )  B 97'6 B 98B 9B9 9'6 B 96 9 99B"	 
 9:B A A6 9 9;  B  9<  B  X6 9= 9>BK  checkForHeroLvGuidenewBieProxyreLoadExpItemsubItemNumgetPositionYgetPositionXgetPercentsetName	percsetPercentdata.Config_HeroLvexpConfig_HeroLvhero_progress_barsetStringhero_level_txt
levelsound/heroleveup.mp3setScalesetHeroInfoShenqiisVisibleTalent	viewheroLvUpFlaguseItemHeroupdateshowExpEffectaddChild	initheight
widthpccsetPositiongetContentSize
indexgetCurrentNodeeffectsinsert
tablecreateapp.sprite.SkillAnihero_bgImage_1getChildByNamegetCurrentRightUIexpItemUseNumaddExplv	datatonumberdata.Config_ItemrequiregetCurrentHerogetItemNumByIdlocalPlayerGameGlobalexpItemHaveNumplayAnisound/read.mp3playEffectSoundManagerÚìêçÌ³³æ¬ÿÈÖþÿÿÿ÷Ñðúáõül		         !!!!!!!!!!"""##########$$$$$%%%%&&'''()))))))))**********+++++,,,,..........///0113333333344444444555==========>>>>>>>>>?????@@@@@AAAAAAAAABBBBBDDDDDDDDDDEEEEEEEEEFFFFFGGGGGHHHHHHHHHIIIIIKKKKKKMMMNNNNOOOOQQQQQQRRRRTTTTTTTTUUUUVVVVVWXXXXXXXYYZZZZ[[[[[]]]]___``aaaaaabbbbbbbbbcccccccdddddeeeefffffggggiiijjjjkkkkkkkkkkkkkkkkkkkkkpppppppqqqqwwxxxxxzself  «useItemId  «useNum  «iconLogic  «bUpgrade ©haveNum hero itemConf oneExp addExp oldHeroLv useValid üoldUseNum ôright_hero_box ãeffect13 	Úhero_size Íeffect22 "isVisible2 +fisVisible3 ^effect21 effect21 +rightUI !rootNode heroBg {progressBar ecurExp maxExp 
percent effect75 !pct width1  ¾  7  9  B 9B9::::::	)
  
 X
	  9
  B

 9

5 ==B
)
  
 X
6
 9


 9

 	 B
  9
	  B
	  X
6

 
 9

6 9B
  9
 B
4
  =
 4
  =
 K  expItemHaveNumexpItemUseNumsetHeroInfoitemNotEnoughConfig_LanguageaddMessageFloatMessagereLoadExpItemupdateItemNumlocalPlayerGameGlobalexplv  arrupdategetCurrentHeroüÿÿÿ			








self  8target  8param  8arr 0re /heroCurLv .heroCurExp -subItemId ,subItemNum +leftItemNum * 8   Ã-     9   B K    setHeroInfoself    'QÂ3   6  96 9 9B 9B6 ' B9	9
+  5 - =- =- -	 9		8	'	 -
 &	
	8	=- == ,
 ) B
K   ÀÀÀ   cb
maxSp
skillskid	heroskillNum  	nameHEROSKILLLVUPUIdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager self i hero CONFIG_HEROS INT_MAXSP cb1 & À  BjÖ+  *  ) ) ) M-  9 8)   X-  9 8-  9 X+  6 -  9 889 X6 -  9 889Oá   X6  96 ' B9 + B  X6 9	 9
-  9BX6  96 9BK    	dqdjConfig_LanguageaddMessageFloatMessageuIdsend_heroUpSkillOneKeyheroProxySILVERapp.const.Const_CostTyperequirecheckResourceEnoughGameGlobal	costConfig_HeroSkillLvlvskillLvsþzhero hasMax AleastCost @     i  é  .Ô3   6  9- 9 9B6 ' B99+  5	 = 
BK  À À	fun2 idconfirmOnekey	nameMESSAGEBOXdata.Config_UIrequiregetParent	view
addUIUIManager hero self confirmOneKey  Ç
$¤®°G 9 ' B 9 ' B) ) ) Ms+	  9
 '  &B
9 X989 X X	  9 
  +  + BX  9 
  +  B= +	 X  9 
  +  B3	 6
  9
 9 
'  &B5 =B9 8)   X46 ' B 9*  + + B 9+  + B
 9 
' B 9 B 9)% )% B6
  9
 9 
' B6 9' 9 8&) 6 9)% )
 )  ) * B9 )  <2 O3 6 9 9 B  X	 9 '	! B 9"+	 BX 9 '	! B 9"+	 B6
  9 9	 '! B	5
# =
B2  K  ÀÀ  setVisibleButton_OneKeySkillsisPrivilegelocalPlayerGameGlobal 
greenConst_colorData+dengji1Config_LanguagemoveFontAnisetPositionaddChildnum_txt	initcreateapp.sprite.SkillAnirequireskillChangeLvcallBack  skillimg_widgetTouchExtentUIManager curSkillNumsetSkillDetailInfolvskillLvsqualityskill_box_Image_levelup_boxImage_1getChildByNameàÿ									                      !!!"<???????@@@@@@@@@BBBBBBBBEEEEEEEEEEGGCONFIG_HEROS INT_MAXSP self  ¥rightUI  ¥hero  ¥flashPos  ¥skillNode 	t t ti qvalid pskillBox jcb %Eeffect47 +oneKeySkill .$     úK  self  node   û  .©6   ' B   9  *  + + B   9 +  + B  9 ' B  9 )# )# B-   9  BK  ÀaddChildsetPositione47setName	initcreateapp.sprite.SkillAnirequirenode effect47 
 À'ºÂ/-  6  9	B8'  &898' 	 '
 &
6	 	 9		 B	 	 X	'   X	=6		 9	
		 9		 6	 99B	 9
' B

 9

B
 9
' B

 9

	 B
	 9
	)# )# B
9

 X
@6
	 9



 9

' 6	 99B
 9'  &B 9
 B
 9
' B
 9
)L )L BX	#6	 9		'  &B	 9
' B

 9

B
 9
' B

 9

	 B
	 9
	)# )# B
 9
'  &B

 9

B
9		 X		 9	'  &B		 9		B	 X	& 9	*  B	6	 9			 9		* ) B	6
 9


 9

3 B
 9 6 9! 96 9" 9* B6 9# 9	 B
 B A 9	$B	 9
'% B

 9
&
 B
2  K  ÀsetStringnum_txtgetNameEaseBackInDelayTimeSequencerunAction CallFuncScaleToccsetScale#newGraySpritedisplayjiahaosetNameskillimg_heroui_jiahaokeshengji.pnglvsetPositionaddChildremoveAllChildren
childgetChildByNameplistTypeTextureResTypecreateImageView	ccuiicons_skill1001.pngcheckPngExistInPlistGameGlobal	.pngicons_skillskillLvsskidtonumber³æÌÌóÿÿ							







    !!!!!!!"""")"*********************---........//CONFIG_HEROS self  »node  »hero  »isValid  »pos  »flashPos  »skillNum 
±skillLv ¯path «im 3im1  im action 6cf temp 
 ô  &<6   ' B   9  *  + + B   9 +  + B  9 ' B  9 )# )# B-   9  B  9 * B6	  9
' BK  Àsound/talentleveup.mp3playEffectSoundManagersetScaleaddChildsetPositioneffect13setName	initcreateapp.sprite.SkillAnirequireÚÍ³ææÌÙÿicon_Node effect13 
 õ  	#G-      X'   - ' &  6  9  B  X'  -   9B-    9  + B -    9  )
 B -    9  *  B K  ÀÀÀsetScalesetOpacitysetCascadeOpacityEnabledremoveAllChildrenicons_training1.pngcheckPngExistInPlistGameGlobal	.pngicons_training³æÌÌóÿ					




iconItem iconType icon_Node path  8   Ò-     9   B K    setHeroInfoself    $ bÚ-     9   ' 6 99B 6  - 98  9  - 9+  )	  X  '	  &X  '
  &6  96 6 	 B8' - &8' B6 9 96 '	 B:8' :	&	' '	 B 9)K )	K B 96 9)
Ý )Ç )½ B A 9)´ B 9' B 96 9 B 96 9!B-   9" B-  + =#K     isBackaddChild#VERTICAL_TEXT_ALIGNMENT_CENTERTEXT_ALIGNMENT_CENTERsetTextHorizontalAlignment	textsetNamesetRotationSkewYc3bccsetColorsetPosition20simhei.ttf
data.Config_Languagerequirecreate	Text_attributetonumberConfig_HeroEquPolicy
splitStringUtil000	rankjobidConfig_HeroplistTypeTextureResType	ccuiheroui_quan.pngloadTexture













iconItem hero i type Urank Sid RattriStr 8text ) â  	 'ñ-     9   ' - ' &6 99B -     9  ' B -   + = K    isBack	textremoveChildByNameplistTypeTextureResType	ccui	.pngicons_trainingloadTextureiconItem iconType  F   ÷ -     9   + B K  
 setTouchEnabled      icon_Node  F   ÷ -     9   + B K  
 setTouchEnabled      icon_Node   	 #¡Ì--   4  =  -   6 - 9B=  3  - 9	  X)6  96 9 9	B 9
B6 ' B99+  5 - =- =- =- -	 8	== - =- =- =-	 =,
 ) B
X]6 9 9* )# )  )  )n )	  )
  B	6 9 93 B6 9 9* )# )  )	n )
F )  )  B	6 9 9* )# )	  )
´ )ºÿ)  )  B	6 9 93 B6 9 9*	 )
# )  )n )ÿ)  )  B	-
 	 96
 9


 9

6 9 93  B   6 9! 9) B   6 9 93" B A
	 AK   ÀÀÀÀÀÀÀÀÀÀÀ DelayTime SequencerunAction  CallFunccreateOrbitCameralv	costnumiconTypecbequipStatus	slot
equip	hero  	nameNEWHEROGETEQUIPdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagerstatus equValid
clonecurEquipValidµæÌ³¦þ				








































"############$$$$$$$$$$$$%%%%)%************+++++++++++++++++++++++++++++++++-self hero iconItem equ i equipStatus iconType num costPrice lv icon_Node cb action1 9Qaction2 Kaction3 ?action4 3action5 -action6 !  (U§·¾Í 9 ' B-  989 9)  <  XÚ+ 5 +  )  )	 )
 ) M	Ñ6 ' B 9 9	9
B 9'  &B6 9 9' ) B6 9 9' ) B6 9 9' ) B 9 B 9 B 9' B 9' B 9)# )# B 9)% ) B 99 8B 9 B 9'  &B 9 '  &B 9 ' B 9 ' B'  ' &6  9 B  X'  9 6 99B6  9!'"  &B 9'# B 9 B 9)K )K B)  =$ 9%8	  X{'$  &8  X'&  &+ < '$  &+ < 9$  =$ ) =+ < 9'+ B  X'&  &8 
 X'  ' &6  9 B  X'  9(B 9)B'&  &8  X  6* 9+ 9* ) B6* 9, 9* B6* 9- 9 B6* 9. 9  ! B6* 9/  9!B6* 90! 93"1 B6 * 9 0 "  9  3#2 B 6!* 9!3!#! 9!!$ %  & ' B!$ 9"4%! B"'"& # &"#"+# <#" XÀ'$  &+ < + + <) =6 95 96 B X_ 9'+ B97 XA 9'+ B6 9 9'8 ) B 99* *  B 9 B 9)+ ) ! B 9': B6 9; 96< 9=6!> 9!?!" B' @ )! B 9  B 9) + )!! B 9' A B 9B6 C "  9 D 6#E 9#F#B  AXf9 99 98 < 9'+ B 9' 6 99B  9G  BXO97 XA6 9 9'8 ) B 99* *  B 9 B 9)+ ) ! B 9': B6 9; 96< 9=6!> 9!?!" B' @ )! B 9  B 9' A B 9) + )!! B 9B6 C "  9 D 6#E 9#F#B  A 9'+  BX 9'H 6 99B 9'+ B3I 6J  9K 5L =MB 9N+ B2 2 O	/~2  9 'O B 9'P B9 98)  X&9 989$  	 X6 'Q B 9* +	 +
 B 9R+	  +
 B 9'	P B 9)	9 )
9 B 9 '	O B 9	 B  9S  	 B  9T  	 B2  K  ÀsetStarUpButtonStatsetRankUpButtonStat	initapp.sprite.SkillAnie97Button_equip_oncesetSwallowTouchescallBack  widgetTouchExtentUIManager heroui_weijihuoy.pnganimationequipNumInvalidConst_colorDataconvertHexToRGBDisplayObjectUtilsetColortxtsimhei.ttflvopenConfig_Languageformatstring	TextimsetScalecommon_wenzidi1.pnglvgetItemNumByIdlocalPlayerrunActionSequence  CallFuncDelayTime
SpawnEaseBackInOutFadeInScaleToccstopAllActionsremoveAllChildrensetVisibleshowAnimationequValidequiped	gray#newGraySpritedisplayplistTypeTextureResTypeloadTexturecheckPngExistInPlistGameGlobal	.pngicons_trainingequipPossetPositionstatus	backsetNameaddChildheroui_kejihuo.pngicons_training1.pngcommon_kongtu.pngcreateImageView	ccuiequip_removeChildByName	rankjobgetSlotInfoapp.uiLogic.CommonHeroInforequire  uIdcanEquipidImage_1getChildByNameçÌ³³æÌþµæÌ³¦þÙÇÂë×§ÿµæÌ³Öÿ				








!!!!!!!""""""####$$$$%%%%%&&(((())))))*****,,,,,---..//222233333333444455555556888999<<<<<<=>>>>>>>??????@@@@@@BBBBBBBCCCCCCDDDDLDMMMMXMYYYYYYYYYZZZZ[[[[[\^^^^^_``aabbbbbbcceeeefffgggghhhhhhhiiiiijjjjkkkkkllllmmmmmmmmmmmmmnnnnoooooppppqqqqqqqqqquuuuuuuvvvvwwwwwwwxxxxy{{{|||||||}}}}}~~~~»¼¼¼¼¼¼¼½½½½½½	¾ÁÁÁÁÁÁÁÁÂÂÂÂÂÂÂÂÂÂÂÂÂÃÃÃÃÃÃÃÃÃÄÄÄÄÄÆÆÆÆÇÇÇÇÇÈÈÈÈÈÈÈÈËËËËËÌÌÌÌÌÍÍCONFIG_HEROS self  ¨rightUI  ¨hero  ¨equipLayer £heroConf  canRankUp ØequipStatus ×i ÖtempTime ÕÒ Ò Òi Ïequ 	Ånum  Ålv  ÅiconType  ÅcostPrice  ÅnewNode1 ¸newNode2 ±newNode3 ªicon_Node /ûiconItem ÷iconItem_txt ópath ïim Úpath :action1 7action2 1action3 +action4 $action5 action6 action0 sq 		numOwned °im 5txt im 89txt touch 'effect97 - ½	 "'  X  9  B   X  9 B 9 )  X)  9' B 9' B6 ' B86 9	 9
-	  9
8	
	9		B 6 9	8	96	 6 - 89B		 X6 9	
 9
- B 6 9	8	96	 6 - 89B		 X6 9	
 9
- B 
 9' B9 X19)	 	 X-
 9+ B
 9+ B6 '
 B
 9* + + B 9	+  + B	 9	 B	 9	' B	4	   9
B
=	=
	 9
6  9!)? )  B A
X
 9+ B
 9+ BK  ÀÀÀpccsetPositiongetPositionyxsetNameaddChild	initcreateapp.sprite.SkillAnisetBrightsetTouchEnabled	souleffectremoveChildByName	dataConfig_ItemtonumbershowPotentialConfig_HeroneedSoulidgetItemNumByIdlocalPlayerGameGlobaldata.Config_HeroStarrequireButton_levelup_starImage_1getChildByName	stargetCurrentRightUIgetCurrentHeroê								



 !!!!!"""""""""$$$$%%%%'CONFIG_HEROS SUIPIAN10 SUIPIAN12 self  rightUI  hero  star button uconf qsoulOwned 	hactualNum geffect BPos_    C·  X  9  B   X  9 B  9' B 9' B+ ) ) ) M9
8
	
	
  X
+ Oú X 9'	 B 9'	 6
	 9


9

BX 9'	 B 9'	 6
	 9


9

B 9'	 B
  X 9'	 BK  removeChildByNamebuttonEffectheroui_yijianzhuangbei.pngplistTypeTextureResType	ccuiheroui_yijianjinjie.pngloadTextureImage_1761equValidButton_equip_onceImage_1getChildByNamegetCurrentRightUIgetCurrentHero 	




self  DrightUI  Dhero  DrightBg 3rankUpButton /canRankUp .  i  Ï  
%<Õ6   ' B   9  *  + + B   9 ' B  9 +  + B-   9  B  9 -   9B-   9	BBK  ÀgetPositionYgetPositionXsetPositionaddChild	initshinningBordersetNamecreateapp.sprite.SkillAnirequireÔnode shinningBorder 
  JÐ 9 *  B 9) B6 9 9* ) B6 9 9* B6 9 93 B2  K   CallFuncFadeIncreateScaleToccsetOpacitysetScaleÍ³ææÌÙÿçÌ³³æÌþµæÌ³¦þself  node  action1 action2 action3  ê  F¿ß6   9 ' B+ )  ) M:6	  	 9		8' B	:
	6 
 B6  B X+ X)6 
 B
 6 ' B8
6 9 9	
 B6 :	B X9

  X6 9
B  X6 9
B	  X+ X  9 
 9
B OÆL checkEquipComposeStatusassembleItemgetItemNumByIdlocalPlayerGameGlobaldata.Config_Itemrequiretonumber_,
splitStringUtilþÿÿÿ	
self  Gequip_id  GassembleItem  G_need_list @composeEnable ?; ; ;i 9_tab 3resource_id 2_equip_data  own_num  ­  #Sý6  9 9*  * * * B6  9 9*  ) ) )	 B6  9 9  B 96  9
 9 B AK  RepeatForeverrunActionSequencecreateScaleToccÿµæÌ³Æÿself  $node  $actionScale 
back 	actionSeq 
 ð  (;6  ' B 9*  + + B 9+  + B 9)'B 9' B  9 B 9'	 B 9
 B 9) )Þ B= K  setPositionaddChildhero_boxgetChildByNamegetCurrentLeftUIeffect15setNamesetGlobalZOrder	initcreateapp.sprite.SkillAnirequireÞself  )effect15 
      ®K      *µ-     9   B -     9  B 6  9  9  - 98  6  9' 9	 '
 &BK     	.mp3idsound/model/recruit_playEffectSoundManagerheroUid
heroslocalPlayerGameGlobalsetHeroInfocardAnimationself param hero 	  	 %A´3   6  96 9 9B 9B6 ' B9	9
+  5 - 9=-  9== B-  9 9- B-  +  =K   ÀÀÀformerHeroRankremoveChild	viewcbformerHero  heroUid	nameHERORANKUPSUCCESSdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager 						


self param rect finishCb $ É =Û3  9  B6  9  6 6	 ' B	9		B6 ' B989	6
 9 9 B  9 B  9 B  9 B)  = 4    9 B 9'	 B) ) )	 M`6 ' B 9
 99 B,  9' 
 &B 9B  9' 
 &B 9B  9' B 9B  9' B 9B '  ' &6
  9 B  X' 6 9  9! 6 9"9#B 9$  B 9% B6& 9' 4 >6( 9)  B>6( 9)  B ? BO 3* 6 
 9+9, 6( 9-6 9.9/6 9.906 9.9/6 9.90B52 6( 91)  )  )  )  B=36( 91)  )  )  )  B=4 B 9	5+ B	 9	6* B	6	7 	 9	8	+  )  *    9 B 9'9 B A	3	: 6
; 9
<
	 ) B
2  K  performWithDelayGlobalscheduler Button_equip_onceflyFlyItemssetLocalZOrdersetTouchSwallowEnabledborderColorfillColor borderWidthc4fheight
widthActualDesignSize	rect	viewcreateRect pccinsert
tableaddChildsetPositionplistTypeTextureResTypecreateImageView	ccuiicons_training1.pngcheckPngExistInPlist	.pngicons_traininghero_bggetPositionYgetPositionXequip_jobgetSlotInfoapp.uiLogic.CommonHeroInfoImage_1getChildByNamegetCurrentRightUIndxskillUpdatesetRankUpButtonStatsetHeroInfomodifySilverlocalPlayerGameGlobal	cost	rankdata.Config_HeroQualityREMOVEapp.event.UIManagerEventrequireUIManagerremoveEventEventManagergetCurrentHeroÀþÿÿÿ¾çÌ³³æÌþ		
!""""""""""""""""""""""""""""""""""""""""""####$$$$%%%%%%%%%%%%%%%%12222233self  Ütarget  Üparam  Ühero Øcost Èicons ¶rightBg ¯a a ai _equ 
Unum  Ulv  UiconType  UstartPx TstartPy  TendPx  TendPy  Tpath (,imageTmp disable Jrect * cb     )Ä6   9  9  -  98  6  9' 9 ' &B-  9	B-  9
BK  À ÀsetHeroInfocardAnimation	.mp3idsound/model/recruit_playEffectSoundManageruId
heroslocalPlayerGameGlobalhero self hero  á   EÂ  9  B3 6  96 9
 9B
 9B6	 '	 B	9	
	9		+
  5 9=9 ==B+  = 2  K  cbformerHeroheroUid  uId	nameHEROTUPOSUCCESSdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManager getCurrentHeroself  !target  !param  !hero cb     )á6   9  9  -  98  6  9' 9 ' &B-  9	B-  9
BK  À ÀsetHeroInfocardAnimation	.mp3idsound/model/recruit_playEffectSoundManageruId
heroslocalPlayerGameGlobalhero self hero  ¹  lºÐ   9  B)  9 )    X9 )   X6 9 9-  9	8	9B X6 '	 B9
896 9 9-  9	8	9	 B9 )   X6 9 9- 9	 B9 )   X6 9 9- 9	 B6 9 96 '
	 B9	
8	9 B3 6  96	 9			 9		B		 9		B	6
 ' B
9

9

+  5 9=9 ==B+  =   9   9	 B	 A2  K  ÀÀÀgetCurrentRightUIsetStarUpButtonStatcbformerHeroheroUid  uId	nameHEROSTARUPSUCCESSdata.Config_UIgetRunningScenegetInstanceDirectorcc
addUIUIManager 	costmodifySilversubItemNum	soul	stardata.Config_HeroStarrequireneedSoulidgetItemNumByIdlocalPlayerGameGlobalcostNeed12costNeed10getCurrentHero										



  CONFIG_HEROS SUIPIAN12 SUIPIAN10 self  mtarget  mparam  mhero icost1 hcb F" ¬ +Sû9 6 ' B99  X"6  9-  6 6 '	 B9B)  ) ) ) M-  	 9	B9
8-  98 X -  	 9
  BOíK   ÀequipUpAnicurEquipValidequValidgetCurrentHeroREMOVEapp.event.UIManagerEventUIManagerremoveEventEventManagerHEROGETEQUIPUIdata.Config_UIrequire	nameself target  ,param  ,m   i  ¿ 7gò9 	  X26 9 999B6 999899	) <  9
 B 9' B 9' 9	&B  9 B 9B  9 B3 6  9  6	 6
 ' B
9

 B2  K  REMOVEapp.event.UIManagerEventrequireUIManageraddEventEventManager setHeroInfoupdategetCurrentHeroequip_Image_1getChildByNamegetCurrentRightUIslotPositionequValidheroUid
herosnumequsubItemNumlocalPlayerGameGlobalresultself  8target  8params  8equipNode !removed 
 é  66   ' B   9  *  + + B   9 +  + B  9 -  :B-  9  BK  	ÀaddChildsetPosition	initcreateapp.sprite.SkillAnirequireàicons equipLayer effect16 
 ]   ¢-     9   ' - &B K  	ÀÀ16removeChildByNameequipLayer slot  È	 %÷4  6  ' B 9 6 96	 9		B,   9	 B		 9		' B		 9
	'	  &B

 9


B

 	 9
	'	  &B

 9

B

 4
 '  ' &>
6 9  B ?  
 6
 
 9

' B
6  ' B 9
 :B	 9	
 B
 9
+ B
 9
)  B
 9
* B
 9
'  &B
 9
:B
 9
6 9 96 9 9B6 9 96 9  93! B6 9" 9* ) B6 9# 9* B A6 9 9) B6 9  93$ B A A2  K   FadeInScaleTo CallFunc
SpawnDelayTimeSequencerunActionsetPosition16setNamesetScalesetOpacitysetCascadeOpacityEnabledaddChildcreatesrc.app.uiLogic.ICONui/common/Icon.luagetNodeFromLuaUIManagerpcc_13_getPositionYgetPositionXequip_Image_1getChildByNamegetCurrentRightUI	rankjob	herogetSlotInfoapp.uiLogic.CommonHeroInforequireÀàÿçÌ³³æÌþµæÌ³æþ					







self  slot  tick  icons equ num  lv  startPx startPy  equipLayer |node &Vicon N µ 	  'G¨+  9  
  X)   9 B9 ) M  9 B98)   X9   X XOò+  =    9   9 B  9 B BK  getCurrentRightUIsetSkillInfoskillLvsgetCurrentHerocurSkillNumRank

self  (flashPos &
  i  Ü   -Cð6     9  6 ' B9-  + B    X K  -  - := -  - := 6    9  '	 B -  6 -  9B A =
 -  + = 6   9    9  - 9B K  À ÀÀÀuIdsend_heroUpStarheroProxyheroLvUpFlaggetCurrentHero
cloneformerHerosound/getstar.mp3playEffectSoundManagercostNeed12costNeed10SILVERapp.const.Const_CostTyperequirecheckResourceEnoughGameGlobal			






cost self extra hero  9     9  + BK  setVisibletarget   9     9  + BK  setVisibletarget   9   ©  9  + BK  setVisibletarget   9   ¯  9  + BK  setVisibletarget   L   ¶-   9     9  )ð#B K  ÀsetLocalZOrderleftUInode  Ô bÊ¸*    X	9  =   9 	 
 BXï XZ6  9'	 B+ ) ) )	 M98
	 X+ Oú X36 '		 B9
8  X6 	 96
 9

B2 Î6 '		 B9
899 = 6   9
 B
 A = + = 6 
 96 ' B9 + B  X	¯6 9
 99BX¨4  = 6 9	B= 9 98)   X+ = 6 9	 99
BX  X¾6 '! B 9"	 B: :	 	 X2 9#)	 	 X6$ 
 9%6& 9' 9(B 9)B6 '* B9+9,+  5- B2 o6 9.9/6	0 9	1	9	2	9	3	9	4		 X6 
 96 95 9660 91929394B A2 W6 '
7 B9	#		8	93	8  X
_)
 )   X)
 :	 X6$  9%6& 9' 9(B 9)B6 '* B9+9,+  5: '9 
 &=;=<9,===	>BXP:	 X6$  9%6& 9' 9(B 9)B6 '* B9+9,+  5@ '? 
 &=;=<9,===	>BX16$  9%6& 9' 9(B 9)B6 '* B9+9,+  5B 'A 
 &=;=<9,===	>BX
6
$ 
 9
%
6& 9' 9(B 9)B6 '* B9C9,+  5D ==	EB
2ÓF X6$  9%6	& 9	'		 9	(	B		 9	)	B	6
 '* B
9
G
9
,
+  5H =I6J   9K B=E, ) B
XµL XQ9M 9NB9O 9NB9O 9P+	 B6& 9Q 9R6	& 9	S		 9	R	3T B	6
& 9
U

 9
R
6& 9V 9R 6& 9W9O9X9M 9YB A A A
6& 9S 9R3Z B A9M	 9[
 B6& 9\	 9R6
& 9
V

 9
R
 6& 9W9M9X9O 9YB A A
 A9O
 9[ BXb] X`9M 9NB9O 9NB9M 9P+	 B9M 9^)	'B6& 9Q 9R6	& 9	S		 9	R	3_ B	6
& 9
U

 9
R
6& 9V 9R 6& 9W9O9X9O 9YB A A A
6& 9S 9R3` B A9O	 9[
 B6& 9Q	 9R6
& 9
\

 9
R
6& 9V 9R 6& 9W9M9X9M 9YB A A A
6& 9S 9R3a B A9M
 9[ B2  K  K  K  K  K     setLocalZOrderTouched_detailUIEaseSineOutrunAction getPositionY_original_posXpMoveToEaseSineIn CallFunccreateSequencesetVisibledetailUIstopAllActionsleftUITouched_leftUIsetHeroInfohandler	hero  GETHEROSOULUIButton_StarAddcallBack  COSTCONFIRMUI  newStarUp  newStarUp1	fun2param2param1id  newStarUp2 data.Config_HeroStarformat	jjkflvstarUpopenLvsnewBieConfig_GameData
levellocalPlayer idk	nameMESSAGEBOXdata.Config_UIgetRunningScenegetInstanceDirectorcc
addUIUIManager	stargetStarUpSoulInfoapp.uiLogic.CommonHeroInfoButton_StarUpsend_pushEquipmentOncecanEquipcurEquipValiduIdsend_heroUpRankheroProxySILVERapp.const.Const_CostTypecheckResourceEnoughGameGlobalheroLvUpFlaggetCurrentHero
cloneformerHerocurSkillNumcurSkillNumRank	costrankFullConfig_LanguageaddMessageFloatMessage	rankdata.Config_HeroQualityrequireequValidsound/training.mp3playEffectSoundManagerButton_OneKeyEquipsetExpNodeExpNodeIsVisibleButton_LevelUpµæÌ³¦þ 




    !!!!!!""######%'')))))))******+----.................../22222222223333333333333347777777CDDEFFFGIIIJJJJJJJJJJJJJJJJJJJJJJJJJJJJKKKLLLLLLLLLLLLLLLLLLLLLLLLLLLLNNNNNNNNNNNNNNNNNNNNNNNNNNNOQQQQQQQQQQQQQQQQQQQQQRTTVVVVVVVVVVVVVVVVVVVVVVVVVVVVWWXXXXYYYYZZZZZ[[[[\\\\^\____```````````````_bbbbdb[fffffgggghhhhhhhhhhhhhhhgjjjjjjkkllllmmmmnnnnnoooooppppqqqqsqttttuuuuuuuuuuuuuuutwwwwywp{{{{{||||||||}}}}}}}}}}}}}}}|~~~~~|+/4self  þsender  þnode  þhero  þextra  þaniTime ücanRankUp S  i cost currentNum ;¶totalNum  ¶cost ?wcallBack vneedCurNum ]actionLeft ÆactionDetail actionDetail ?)actionLeft $ ä	 
! £Ì¾%  9  B 9' B 9' B X  9 BX X  9 BX X  9	 ' B  9
   9 B-  99 9	 8	BXy X  9	 ' B  9
   9 B-  99 9	 8	BXg X  9	 ' B  9
   9 B-  99 9	 8	BXU X  9	 ' B  9
   9 B-  99 9	 8	BXC X  9 B9)  X6  96 9BK    9	 ' B  9
   9 B-  99 9	 8	BX# X  9	 ' B  9
   9 B-  99 9	 8	BX X  9	 ' B  9
   9 B-  9 9 9	 8	BK  
À
AWAKEawake_ButtonZHUANJINGZhuanJing_ButtonHEROTUPO	xywxConfig_LanguageaddMessageFloatMessage	stargetCurrentHeroHeroTupo_ButtonSHENQIShenqi_ButtonTALENTTalent_Button
EQUIPEquip_ButtoncurHeroIndexallHero
JIBANgetCurrentNodesetNodeVisiblesetButtonStateJiban_ButtonturnToLeftButton_RightturnToRightButton_LeftImage_261hero_boxgetChildByNamegetCurrentLeftUI												

            !!""""###########%ST_TABSTATE self  ¤sender  ¤leftUi  Ã 	 âåR9   X9  9+ B9  X9 9+ B9  X9 9+ B9  X9 9+ B9  X9 9+ B9  X9 9+ B9  X9 9+ B9  X9 9+ B=	 -  9
 X9   X  9 '   B9  9+ B  9 9  BX-  9 X9  X  9 '  B9 9+ B  9 9 BXr-  9 X9  X  9 '  B9 9+ B  9 9 BX[-  9 X9  X  9 '  B9 9+ B  9 9 BXD-  9 X9  X  9 '  B9 9+ B  9 9 BX--  9 X9  X  9 '  B9 9+ B  9 9 BX-  9 X9  X  9 '  B9 9+ B  9 9 BK  
ÀcreateAwake
AWAKEcreateZhuanJingZHUANJINGcreateHeroTupoHEROTUPOcreateHeroShenqishenqiSHENQIcreateHeroTalentTALENTcreateHeroToHeroYuan
JIBANsetRightInfocreateNodeByCsbType
EQUIPtabState
awakeZhuanJingheroTupoheroShenqiheroTalentheroJiBanjibanNodesetVisiblerightUI


      !!!!"""$$$$$&&&&&''''''////00022222444445555557777888:::::<<<<<======>>>>???AAAAACCCCCDDDDDDEEEEFFFGGGGGIIIIIJJJJJJKKKKLLLMMMMMOOOOOPPPPPRST_TABSTATE self  ãnode  ãstate  ãhero  ã Ú   ?¸6   9B A H6 9 9
B
) ) B X
 9 BFRðK  setColor
Text_getNamesubstringgetChildren
pairsself  node  color    k v   l   
Ï-     9   - B -     9  B K   ÀÀsetHeroInfoupdateZhuanJingBtnsself hero  À 
 Bó6   96 9 9B 9B6 99+  5	 -	  =	
= =-	 =	-	 =	BK  ÀÀÀcallback	herocolumnrowheroBingZhongId  	nameHEROZHUANJINGLVUPConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerheroBingZhongId hero cb Row  Column      2¶6   96 9 9B 9B6 99+  5		 = 
	9
=
	=	BK  lvheroIdidskillId  	nameZHUANJINGTIPSConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerskillId  hero  skillLv   Ü1*P	ÏñÀÉ6  9)ÿ )÷ ) )ÿ B6  9) ) ) )ÿ B6  96 989' B4  4  4  6 
 BH6	 6
  B896	 6
  B896 9  B6 9  BFRè3 9	 	 9		' B	9
 
 9

' B
9, 6
  B	  XY9  9' B 9+ B9  9' B 9+ B6 	 9	B A H 9+ B 9+ B 9' B  X 9' B 9)  B  9   BFRã6 
 9
B A H 9+ B 9+ B 9' B  X 9' B 9)  B  9   BFRãXY9  9' B 9+ B9  9' B 9+ B6 6
  B896 9  6!  B A3" 	 X	 
 X	 X
 	 6  9B A H 9+ B 9+ B  9   BFRñ6  9B A H 9+ B 9+ B 9' B  X 9' B 9)  B  9   BFRã6 6
  B89#6$ 9%B	 X)  X) ) M\ 9'&  &B 9+ B 9''  &B 9+ B 9''  &B 9+ B  9  9''  &B B+   X 9''  &B 9' B 9 B X 9''  &B 9' B 9)
 B)
 6(  9) 9''   & B5* =+4 >>=,BO¤) ) M7 9'&  &B 9+ B 9''  &B 9+ B 9''  &B 9+ B  9  9''  &B B 9''  &B 9' B 9)  BOÉXK) ) ) MG 9'&  &B 9+ B 9''  &B 9+ B 9''  &B 9+ B 9''  &B 9' B 9)
 B  9  9''  &B B6(  9) 9''  &B5- =+4 >>=,BO¹3. , 6 6 BH96
 :B X9#	 X9X96
 :B X9#	 X9FRç4 >>4 >>6
 :B6
 :B)  6
  B	  X6
 :B X6 6
  B89 X6
 :B 6
 :B 6 6
  B8  X6 6
  B89#) ) ) M%	 9	''  &B
 9
''  &B 9'/ B 90'1 : '!2 &!6 3 9 4 9 5 B 9'/ B 90'1 : '!2 &!6 3 9 4 9 5 B	 Xr 9'6 B  Xl4 >>) ) ) Me6!
 6#	 6$
 8& B$8#$#9#7#B!8" $" 9""'%6 B"$" 9"0"'%8 6&9 8&!&9&&''2 &%'%6&3 9&4&9&5&B"6"
 8$ B"" X"#)" " X"-"  $" 9":"8% '% 9%%'(6 B%'% 9%;%B%'% 9%<%B% A"X"-"  $" 9"="8% '% 9%%'(6 B%'% 9%;%B%'% 9%<%B% A"X"-"  $" 9"="8% '% 9%%'(6 B%'% 9%;%B%'% 9%<%B% A"6"( $" 9")"8% '% 9%%'(> B%5&? =+&4' >!'>'6( 8) 8()(9(@(>('=',&B"O	 Xr 9'6 B  Xl4 >>) ) ) Me6!
 6#	 6$
 8& B$8#$#9#A#B!8" $" 9""'%6 B"$" 9"0"'%8 6&9 8&!&9&&''2 &%'%6&3 9&4&9&5&B"6"
 8$ B"" X"#)"2 " X"-"  $" 9":"8% '% 9%%'(6 B%'% 9%;%B%'% 9%<%B% A"X"-"  $" 9"="8% '% 9%%'(6 B%'% 9%;%B%'% 9%<%B% A"X"-"  $" 9"="8% '% 9%%'(6 B%'% 9%;%B%'% 9%<%B% A"6"( $" 9")"8% '% 9%%'(> B%5&B =+&4' >!'>'6( 8) 8()(9(@(>('=',&B"O 9'C B 9:  & B 9'C B 9:  & BOÛ~9  9'D B 9EB9  9' B 9EB9  9' B 9FB  X;6G 'H B 9I* + + B 9J+  + B9  9'D B 9K B 9L'M B6G 'H B 9I* + + B 9J+  + B9  9' B 9K B 9N)+ )4 B 9L'O B2  K  Àeffect2setPositioneffectsetNameaddChild	initcreateapp.sprite.SkillAnirequireisVisibleremoveAllChildrenNode_38Text_1_Copy  skill2skillLv  Image_474	graygetSpritegetVirtualRendererrestoreConfig_HeroSkillicons_skillskill1Image_371_Copy_CopyplistTypeTextureResType	ccui	.pngheroui_bingzhongloadTextureImage_370_Copy_Copy   
paramcallBack  widgetTouchExtentUIManagerbtn_gonghzongButton_jiantou	modf	mathlv tostringindexofteamIdConfig_SoldierMasteryLvsetTextColorsetStringText_2_CopysetTouchEnabledsetBrightgetChildrenButton_31_CopysetVisibleButton_31bingZhongIdNode_xian_rightNode_xian_leftgetChildByNameZhuanJingNode insert
table	name	icontonumberConfig_SoldierMastery
pairs_soldierMasteryIdidConfig_Hero
splitStringUtilc4bcc &<
ÒÐ						





      !!!!!!!!#####&&&&&&''''(((())))))********,,,,,&&-/////////0000000001111112222222677899::;<>>>>>>????@@@@AAAAA>>CCCCCCDDDDEEEEFFFFFFGGGGGGGGIIIIICCLLLLLLMMMMNOOPRRRSSSSTTTTTTTTTTUUUUUUUUUUVVVVVVVVVVWWWWWWWWWWXYYYZZZZZZZZZZZZZZ[[]]]]]]]]]]]]]]^aaaaaaaaaaaaaaaaSccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhhhhhcikkkkllllllllllmmmmmmmmmmnnnnnnnnnnooooooooooooooppppppppppqqqqqqqqqqqqqqqqkxy{{{{|||||||||}}}~~~~~~~~~{{ ¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤§§§§§§§§¨¨¨©©©©ªªªªªªªª«««««««««««««««««¬¬¬¬¬­­­®®®®®®®®®®®®®®®®°°°°°°°°°°°°°°°±³³³³³³³³³³³³³³³µµµµµµµµµµµµµµµµµµµµ©¸¸¸¸¸¸¸¸¸¸¹¹¹¹¹¹¹¹¹¹»»»»»»»»¼¼¼¼¼¼¼¼½½½½½½½½½½¾¾¾¾¾¾¾¾¾¿¿¿¿¿ÀÀÀÀÀÀÀÀÀÁÁÁÁÂÂÂÂÂÂÂÂÂÃÃÃÃÃÄÄÄÄÄÄÄÄÄÅÅÅÅÅÆÆÆÆÉÉshader self  Ðhero  ÐyellowColor ÈgrayColor ÁbingZhongIdTab 	¸bingZhongIconTab ·bingzhongNameTab ¶bingZhongTypeTab µ  k v  bingZhongIconId bingzhongName 
cb leftNode rightNode heroBingZhongId currentBtnNode anotherBtnNode    k v  "  k v  teamId 6Áindex ºshowZhuanJingLvUp ¹  k v    k v  lv #òRow îColumn  î
] ] ]i [tmpColumn )268 8 8i 6;H H Hi FskillTips HÔlvId1 ÓlvId2  Ó  k v  lvidTab1 ³lvidTab2 ®teamId «anotherTeamId ¨curlv §*¦ ¦ ¦i ¤btn1 btn2 btnTab 'if f fi dskillId \btnTab hif f fi dskillId \effect 2effect2       K   g   6   9    9  -  9B K  ÀuIdsend_upLevelAwakenheroProxyGameGlobalhero  × %Àþ    X-  9 9' BXz  Xp+   '  ' &6  9	 B X' )Ý' &6	  9
'	 B	 9'
 B	 96
 6  B8

9

B	 9'
 B	 9
 6 99B  X	 9'
 B	 96
 
 9

-   B
6 9&

BX	 9'
 B	 96
 
 9

-   B
 A	 96
 9

6 96 9 B
 A	  X) 	 9'
! B	 9
 B-  9	 9"
 B	 9#'
 BX $ X-  9 9' BK   ÀÀoutsetNameaddChildCurLvTextcycxdisplaypccsetPositionawakeSkillConfig_LanguagegetSkillDescCurDesplistTypeTextureResType	ccuiloadTextureCurSkill	nametonumberConfig_HeroSkillsetStringSkillNamegetChildByName ui/common/ShowSkillInfo.luagetNodeFromLuaUIManagercheckPngExistInPlistGameGlobal	.pngicons_skill
beganskillInforemoveChildByName	view
ended 



 self hero type  i  lv  needDes  skill np inode Y î&&oÃâÀ9  -  9 X2 »9)  X6  96 9B-  9=    9  9	B-  9 B2 ¥3
 6  9	 9'
 B5 =B3  9' B 9+ B6  9
 9' B5	 =	B)  )  6 6	 BH
96 989 X99 X9F
R
ò6  8  X6  896 9	8	9 X6  89) )  )	   X
6
 8

9
6
 8

9
 9
' B

 9

' B
 X
_6
  8

9
9	 
6! 9" 9# B 9'$ B 9%#	B 9'& B 9' '( 	 &B	 X, 9'& B 9)6* 9+B6, '- B 9.* + + B 9/+  + B 9' B 90 B 91' B 9263 94)? )  B AX< 9'& B 9)6* 95B 9' B 9+ BX
*6
! 9
"

 9
#
 B
 9'$ B 9%)d B 9'& B 9'	 '( 	 &B 9'& B 9)6* 9+B 9' B 9+ B	 X
2  K  6
, '6 B

 9
.
 9'7 B'8  '9 	 &B
)
 ) ) M
¸ 9':  &B+  	  X	 X	 9'; B 9''< BX5 9'; B 9'6 89B6 8X(	 X 9'; B 9'6 9=B 9' B 9+ B 9' B 9>+ BX6 8 9'; B 9'6 89B  X]6?  9@9A'B + B) ) ) M1 9'C  &B 9D+ B 8  X6?  9@ 8'9 + B 9'C  &B 9'6 :8'E :&BX
 9'C  &B 9D+ BOÏ9F  X- 9'G B 9D+ B6?  9@9F'9 + B 9'G B 9'6!  9H ::B AX) ) ) M 9'C  &B 9D+ BOõO
H3
I 6 989JK Xé6?  9@6 989J'L + B6M  B4  ) 6  BHÔN XXÓ6?  9@ 'O + B:6?  9@:'B + B 9'P  &B 9'6Q 9R6 9S B A'T 6?  9@:'9 + B:'U &6!  9V B X'T )Ý'U & 9'W  &B 9'X B 9Y 6Z 9[9\B+ 	 X+ 6  9 9'] B5^ =
5_ =`5a =
5b 6 ? "  9 @ :#'$9 +% B :  > 6 ? "  9 @ :#'$9 +% B :  > >=`5c =
5 d = `+   )!
 +"  5#e =
#5$f =$`#B
 9'g B 9'6?  9@:' 9 +! B:B9 X-  9h 9'X B 9iB 9jB A 9'P  &B 9)6* 95BX--  9k 9'X B 9iB 9jB A 9'P  &B 9)6* 9lB 9'P  &B 9'6m 6?  9@: '!9 +" B:89nB FR*2  K  K  K  
ÀÀ	nameConfig_HeroSkill
greenrestoregetSpritegetVirtualRenderer	grayText_lv  out    
moved    
began  
param  
ended  Image_kuangplistTypeTextureResType	ccuiloadTextureImage_skillNode_skillcheckPngExistInPlist	.pngicons_skillheroAwakeOpenformatstringText_skill|	dump;-1heroAwaken getSkillDescText_att1singleSkillTotalAttr+setVisibleText_att,singleTotalAttr
splitStringUtilsetTouchEnabled
maxLv0Text_awarkLv
Node__3_	iconsrc.app.uiLogic.ICONredpccsetPositionsetNameaddChild	initcreateapp.sprite.SkillAnirequire	oranConst_colorDatasetColor/setStringText_persetPercentLoadingBar_1getItemNumByIdlocalPlayerGameGlobalcostItemNumeffectremoveChildByNameitemIdheroAwarkLvlvshowPotentialidConfig_HeropotentialConfig_HeroAwaken
pairs  setBrightButton_awake callBack  Button_addgetChildByNamewidgetTouchExtentUIManager getParentsetNodeVisible
EQUIPcanNotAwakeConfig_LanguageaddMessageFloatMessage	star
AWAKEtabState Èê	 !""###$$$&&&&&&&&''((()*++++++,,,,,,,,,-----------../////////11111111122222333333334444555555555777777777888888889;;;;;;<<<<<<<<===========>>>>>>>>>????????CCDDFFFFFFFFFFFFFFFGGGGHHHHHHIJJKKLLLLLLLLLNNNNNNNNNNOOPRRSSSSSSSSSTTTTTTTTUUUUUUUUUWWXXXXXXXXXX[[\\\\\\\]]]]^^^^^^^^^^____````````aaaaaaaaaaaaaaaacccccccccc]fffgggggggghhhhhhhiiiiiiiiiiiiiijllllmmmmmmmmmmlG ¡¡¡¡¡¡¡¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¦¦¦¦¦¦¦¦¦¦¦§§§§§§§¨¨¨¨ªªªªªª«««««««««««­®®¯±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±²²²²²²²²²²²²²²²³³³´´´´´´´´´´´´´´µµµµµµµµµµµµ··············¸¸¸¸¸¸¸¸¸¸¸¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹½ÀÀ	ST_TABSTATE shader self  Ânode  Âhero  ÂaddCosume £heroAwake curId nextId   k v  type "ÞitemId ÝcostItemNum ÜnextCon [myCurItemNum Seffect (myCurItemNum 2$:¹ ¹ ¹i ·attNode ±conf °skillList KU2 2 2j 0skill skill -  j 
cb ñheroAwakeSkillList ßskillList Ûindex Ú× × ×k Ôv  ÔtmpList 
Êlv ÉtmpSkilllList Âpath ¨skillBox needDes  l   
Ò-     9   - B -     9  B K   ÀÀsetHeroInfoupdateZhuanJingBtnsself hero  ñ   $-×-   9   )J   X 	6    9  6 9)J &B K  6    9  6 9 9	B 9
B6 99+  5 -  =- =B K  ÀÀcallBack	hero  	nameHEROSELECTZHUANJINGConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerherolevelneedConfig_LanguageaddMessageFloatMessagelvhero cb  é  !'Þ6   -  9B 	   X 6    9  6 9B K  6    9  6 9	 9
B 9B6 99+  5 -  =B K  À	hero  	nameHEROZHUANJINGATTRIConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerhaveNotZhuanJingConfig_LanguageaddMessageFloatMessagebingZhongIdtonumber hero    #,å6   -  9B 	   X 6    9  6 9B K  6    9  6 9	 9
B 9B6 99+  5 -  =- =B K  ÀÀcallBack	hero  	nameHEROZHUANJINGCHUANCHENGConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerhaveNotZhuanJingConfig_LanguageaddMessageFloatMessagebingZhongIdtonumber hero cb  ¥ 7Ë*9  -  9 X2 0= 93  B3 3 3 6 
 9	 9
' B5 =B6 
 9	 9
' B5 =B
 9
' B
 9+ B6 
 9	 9
' B5 =B2  K  K  
À  Button_1setVisibleButton_1_Copy  Button_31_CopycallBack  Button_31getChildByNamewidgetTouchExtentUIManager    uIdZhuanJingNodeZHUANJINGtabState
 """"""""""$$$$$$$$$$''''''''))))))))))**ST_TABSTATE self  7node  7hero  7heroUId 	.cb -addSelectUI *addAttributeUI )zhuanJingInherit ( Í U°ä  9  B  X 9BX6 9 9B  -  9 X+ X+ 6  96 9	B  X6 9
6  9-	  -
 8

- 8B6 	 9'
 B
 9' B
 9 B
 9' B
 9 B)  X	
 9' B
 9' ) B
 9 B
 9)  )  BL  À	ÀsetPositionaddChildcommon2_zhongtaiyang.pngloadTextureImage_1setColorsetStringText_1getChildByName ui/heroui/TupoSkillNode.luagetNodeFromLuaUIManagergetSkillDescGameGlobal
greenwhiteGrayConst_colorDataconvertHexToRGBDisplayObjectUtilevolveLvnewTableViewCellccremoveAllChildrendequeueCell						

hero skillIds skillLvs table_view  Vidx  V_cell Rindex Emeet >color 8strDesc +node & 3   -   L ÀskillIds table_view   F   )-     D 
ÀtableCellAtIndex table_view  idx   .    ) )^J table_view  idx   ' Yü¤-     9   ' B   9  ' B -     9   ' B   9  ' B 6  ' B   9  - 9	+ + B   9
 ' B  9 +  + B-   9 ' B 9  B6 ' B 9- 9	+ + B 9
' B 9+  + B-   9 ' B 9 B) - 9) M&-   9 '	 
 &	
	B 9+	 B-   9 '	 
 &	
	B 9-	 9		)
 B-   9 '	 
 &	
	B 9-	 9		)
 BOÚ- 9 ) ) M-   9 '	 
 &	
	B 9+	 B-   9 '	 
 &	
	B 9-	 9		)
 BOç) - 9) M&-   9 '	 
 &	
	B 9+	 B-   9 '	 
 &	
	B 9-	 9		)
 B-   9 '	 
 &	
	B 9-	 9		)
 BOÚ- 9 ) ) M-   9 '	 
 &	
	B 9+	 B-   9 '	 
 &	
	B 9-	 9		)
 BOç6  96 - 989' B+  - 9	 X5 X	6  9- 98' B +  - 9 8  X- 9 8 X
6  9- 9 8'	 B ) ) ) Mj8	 	 X
6	 	 9		8'  B	-
  
 9
 
'!  &B

 9
"
6# :	8'$ :	&B
X	-	  	 9	 	'!  &B		 9	"	' B	  X	&8	 	 X
6	 	 9		8'  B	-
  
 9
 
'%  &B

 9
"
6# :	8'$ :	&B
X	(-	  	 9	 	'%  &B		 9	"	' B	X	-	  	 9	 	'& B		 9	"	6# 9'B	-	  	 9	 	'( B		 9	"	' B	-	  	 9	 	') B		 9	"	' B	O6  96 -	 9		8	9*'	 B5+ ) - 9)	 M:6  98
'  + B: >:6  98
'  + B: >Oé-  	 9 '
, B	 9"6
# 9
-
:'. &

B+  - 9 8  X	 :6	 	 9		- 9 8'  + B	:		 	>:6	 	 9		- 9 8'  + B	:		 	>  X-  
 9 '/ B
 9"6# 9-:'. &BX	-  
 9 '/ B
 9"' B6 
 96 - 9890' B6	 	 9		6 - 9891' B	3
2 -   9 '3 B 94B 95+ B- 67 98 967 99)h) B A=6- 96 9:67 9;B- 96 9<67 9=B- 96 9>)  )  B- 96 9?B- 96 9
'@ B 9- 96B- 96 9A3B 67 9CB- 96 9A3D 67 9EB- 96 9A3F 67 9GB- 96 9HB- 9	 X-  9 'I B 9J6# 9KBX- 9)  X-  9 'I B 9J6# 9LBX
-  9 'I B 9J6# 9MB-  9 'N B 9+ B- 9O)Z  XM6 - 989P)  XE- 9)  X@-  9 'N B 9+ B-  9 'Q B 9+ B-  9 'R B 9+ B-  9 'S B 9+ B-  9 'T B 9+ B-  9 'U B 9+ B-  9 'I B 9J6# 9VB6 - 989P)  X- 9)  X
- 96 9W67 9X)  )öÿB A2  K  ÀÀÀ ÀÀpsetContentOffset
yuLanText_PerLoadingBarButton_Add	iconImage_603showPotentiallvText_458	tupojinjieshiLiansetTitleTextButton_TuporeloadDataTABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW registerScriptHandlerscrollViewsetDelegatesetPositionTABLEVIEW_FILL_TOPDOWNsetVerticalFillOrder"SCROLLVIEW_DIRECTION_VERTICALsetDirection	sizeTableViewcc_tableviewsetSwallowTouchesremoveAllChildrenImage_223 superHeroLvsuperHeroIdText_R4%tfsxjcText_L4    talentBuffText_R3Text_R1
maxLvText_R2Text_R+Config_LanguagesetStringText_L_,  
atk_0
def_0maxHp_0evolveLv|superHeroAttributeidConfig_Hero
splitStringUtilImage_YImage_YXstarMidDiImage_ZstarMidloadTexturesetVisibleImage_ZXstarNumaddChild	initsetName
dipancreateapp.sprite.SkillAnirequireicon22Image_179_Copyicon11removeChildByNameImage_179getChildByName È










           !!!!!!!!!!!!!$$$$$$$$$$%&&&&'')))))))))+,,,,,,,,,,,,----------////00011111122222222222222222444444444446677788888899999999999999999;;;;;;;;;;;<>>>>>>>>>>?????????@@@@@@@@@/DDDDDDDDDDEFFFFFGGGGGGGGGGGHHHHHHHHHHHFJJJJJJJJJJJJJJNOOOOOOPQQQQQQQQQQQQQQRRRRRRRRRRRRRRTTUUUUUUUUUUUUUUUWWWWWWWWWZZZZZZZZZZ[[[[[[[[[[uvvvvvwwwxxxxzzzzzzzzzzzz{{{{{{{|||||||}}}}}}}~~~~~             ¡¡¡¡¡¡¡¡¡¡¤¤node2 infos1 infos hero self node icon1 àicon2 Ä' ' 'i %+  i ' ' 'i %+  i attrs #curAttris nextAttris k k ki itmp 	tmp 'tmp DõcurTalent ô  i nextTalent &ÉskillIds GskillLvs 
øtableCellAtIndex ÷bg ò Ô   ®6     9  6 9 9B 9B6 99+  5	 -  =
B K  	hero  	nameSHENJIANGINFOConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerhero     )¿6   9  9  -  98  6  9' 9 ' &B-  9	B-  9
BK   ÀsetHeroInfocardAnimation	.mp3idsound/model/recruit_playEffectSoundManageruId
heroslocalPlayerGameGlobalhero self hero  Á   $Ô-   6 -   9B A =  6  9    9  - 9- B K      uIdsend_heroBreakheroProxyGameGlobalgetCurrentHero
cloneformerHeroself hero needNum  Ï #wÅ+-   9   )   X 6    9  6 9B 2 i6  -  98  9    X 2-   9 	 )   X 6    9  6 9
9B 2 V-  -   X 3  6  9- 9 9B6 ' B99+  5 = BX =6    9  6 9 96 )zu89B A X /-   9 	 )
   X 6    9  6 9B 2  K  -   9 	 	   X -  6 -  9B A = -    9  -  B X -  6 -  9B A = 6  9     9 ! -  9"- B K  K  K  À	À ÀuIdsend_heroBreakheroProxyGameGlobalshowTuPoShiLiangetCurrentHero
cloneformerHero
maxLvConfig_Itemformat	xxbz	fun2 idconfirmTupo	nameMESSAGEBOXdata.Config_UIrequiregetParent	view
addUIUIManager unopenwushuangevolveLv-1costPromotionidConfig_Hero	xywxConfig_LanguageaddMessageFloatMessage	star
        !!!!!!!!+hero curNum needNum self confirmTupo & ê   $%6   9  9  : :    X6   9  9  : : :  	   X 6    9  6 9 9B 9B6	 9
9B X 6    9  6 9B K  sjywwkqConfig_LanguageaddMessageFloatMessage	nameSANJUNYANWUUIConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManageractivityValidloginProxyGameGlobal ï4©Ñö9  -  9 X2 !6 989)
   X9)   X96 99	9
9 X-  9=    9  9B-  9 B  9  9B9 B2 ú  X  9 B  9' B6  9 +  9		 	B6  9 B3  B3 6 9
 9)zuB6	 9
8	
	9		9

 
8	
	 	 X
 9
' B

 9

#	B
 9
' B

 9

 ' 	 &B
X
 9
' B

 9

)  B
 9
' B

 9

6  9!B
6
" '# B

 9
$
 9'% B'& B
9
)Z 
 X
6
 98

9

) 
 X
9
) 
 X
 9
'% B

 9
'
+ B
3
( 3) 9	 X;6 989	 X59)Z  X1 9'* B 9'+ B 9'% B 9'+ B 9'+ B 9'+ B 9' B 9'+ B 9' B 9'+ B 9', B 9-)  BX0 9'* B 9'+ B 9'% B 9'+ B 9'+ B 9'+ B 9' B 9'+ B 9' B 9'+ B 9', B 9-) B3. 6/  90 9', B51 =2B6/  90 9'+ B53 =2B2  K  K  K  
À  callBack  widgetTouchExtentUIManager setPositionXButton_TupoButton_AddImage_603  setVisible3_30074_1	iconcreatesrc.app.uiLogic.ICONrequire
maxLvConfig_Language/setStringText_PersetPercentLoadingBar	costgetItemNumByIdlocalPlayerGameGlobal  evolveLvgetShenJiangInfoProjectNode_91getChildByNamegetCurrentHeroheroTalentcreateHeroTalentgetParentsetNodeVisible
EQUIP	tupoopenLvsnewBieConfig_GameDatalv	starshowPotentialidConfig_HeroHEROTUPOtabStateÈ
                                     	 	 	 	 	 	 	 	 
                        ¶ · · º » » » » » » ¼ ¼ ¼ ¼ ¼ ¼ ¼ ½ ½ ¾ ¾ ¾ ¾ ¾ ¾ ¾ ¾ ¾ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ ¿ Á Á Á Á Á Á Á Á Â Â Â Â Â Â Â Â Â Ä Ä Ä Ä Ä Ä Ä Ä Ä Ä Ä Å Å Å Å Å Å Å Å Å Å Å Å Å Å Å Æ Æ Æ Æ Æ Æ Æ Æ Î ú û û û û û û û û û û û û û ü ü ü ü ü ü ü ü ý ý ý ý ý ý ý ý þ þ þ þ þ þ þ þ ÿ ÿ ÿ ÿ ÿ ÿ ÿ ÿ          
 ST_TABSTATE self  ¨node  ¨hero  ¨node2 9ïinfos çinfos1 âsetNode2 átupo ÞcurNum ØneedNum Ñcb Ktupo1 add o Ø 	  "6   96 9 9B 9B6 99+  5	 =
BK  	hero  	nameHEROTUPOSHILIANConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerself  hero   Ö 	  "6   96 9 9B 9B6 99+  5	 =
BK  	hero  	nameSHENJIANGINFOConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerself  hero   ²  	 Qe9   9+ B9   9+ B9  9+ B9  9+ B9  9+ B9  9+ B9  9+ B9  9+ B9  9+ B9  9+ B9  9+ B9  9+ B9  9+ B9  9+ B8  9+ B8  9+ BK  awake_ButtonZhuanJing_ButtonHeroTupo_ButtonShenqi_ButtonTalent_ButtonEquip_ButtonsetBrightsetTouchEnabledJiban_Button					




self  RstrButton  R Ý  
 "Y¥ 9 B 9	 9B A 9B6 9)  )	  9
9B6 9	 
 B  X	 9B=	 + L + L beginPointrectContainsPointheight
width	rectccgetContentSizegetLocationconvertToNodeSpacegetCurrentTarget

self  #touch  #event  #target point size rect  (    ²K  self  touch  event   û   6¶ 9B=  6 99  99 9!B)P  XK  9  99 9 X  9 BX  9 BK  turnToLeftturnToRightbeginPointxabs	mathgetLocationendPoint


self  touch  event   í 	 jÄ&+ =  9 9+ B9 999B9 9+ B9 999B9 9 9B<9	6
 9999	 X9 -  9 X-  9=   9 ' B6 996
 9999	 X9 -  9 X-  9=   9 ' B6 989)  X9	6
 9999	 X9 -  9 X-  9=   9 ' B  9  9  BK  
ÀsetNodeVisible
AWAKE
awakeshowPotentialidConfig_HeroSHENQIshenqi
levellocalPlayerGameGlobalEquip_ButtonsetButtonState
EQUIPTALENTtabStateheroTalentopenLvsnewBieConfig_GameDatalvgetCombatPoweruId
powerdetailUI_original_posXsetPositionXsetVisibleleftUIExpNodeIsVisible   !!!!$$$$$$&ST_TABSTATE self  knextNode  knextHero  k Ý 
  7í) 9  8 ) M6  99	  8		8		B  X9  88 9BOð9  4  <K  removeFromParentcheckObjIsNullGameGlobaleffectsself  index    i  ¸  9£	  9  + B-  + =-  9 9+ B-   9-  9B-  - =-  -  9 =-   9BK   ÀsetArrowStatecurHeroIndexcurNodeIndexclearEffectssetSwallowTouchesImage_SwallowTouchisSlidingsetVisible	self nextIndex target  ! Ë à÷;9    X6  99  B  X9   9B+  =  9  X2 q9 9   X2 l+ = 9  9+ B, 9	 	  X9
 9 ) X9 9
 )  9B6 9	 9B A  99	9
!	
			9
B  9 	 9
 9  8

B  9 9	 9
 
 
8	
	B  9 	 9
 9  8

B 9+	 B6 9 96	 9			 9		* 6 99)  B A	6
 9


 9

3 B
 A	 9
 B6 9	 9*
 6 99)  B A
 9 B2  K  K  K  runAction CallFuncMoveBycreateSequencesetVisiblesetHeroInfogetCurAbilityallHeroinitNodeStatey
widthxsetPositiongetPositionpccgetContentSizesecondNodefirstNodecurNodeIndexsetSwallowTouchesImage_SwallowTouchinactiveNumcurHeroIndexisSlidingremoveFromParentcheckObjIsNullGameGlobaleffect15ÿ




        !!!!!!!(((((((())))****++++++++++++,,,,5,*8888999999999999::::;;self  curNode #cnextNode  cnextIndex  ccontentSize Vposition Paction :actionNext  ¸  9á  9  + B-  + =-   9-  9B-  - =-  -  9 =-  9 9+ B-   9BK   ÀsetArrowStatesetSwallowTouchesImage_SwallowTouchcurHeroIndexcurNodeIndexclearEffectsisSlidingsetVisibleself nextIndex target  ! É âµ:9    X6  99  B  X9   9B+  =  9  X2 s9 9   X2 n+ = 9  9+ B, 9	 	  X9
 9 ) X9 9
 )  9B6 9	 9B A  99	9
 	
			9
B  9 	 9
 9  8

B  9 9	 9
 
 
8	
	B  9 	 9
 9  8

B 9+	 B6 9 96	 9			 9		* 6 99 )  B A	6
 9


 9

3 B
 A	 9
 B6 9	 9*
 6 99 )  B A
 9 B2  K  K  K  runAction CallFuncMoveBycreateSequencesetVisiblesetHeroInfogetCurAbilityinitNodeStatey
widthxsetPositiongetPositionpccgetContentSizesecondNodefirstNodecurNodeIndexsetSwallowTouchesImage_SwallowTouchallHerocurHeroIndexisSlidingremoveFromParentcheckObjIsNullGameGlobaleffect15ÿ




        !!!!!!!(((((((())))****+++++++++++++,,,,4,*777788888888888889999::self  curNode #enextNode  enextIndex  econtentSize Xposition Raction ;actionNext  ã  ;Cñ6   9+  6 ' B99B
  X6   9+  6 ' B99B 9*  B6 9+  =	6   9
9  9B6 ' B99B9   X9 9  X9 99 9BX9 BK  paramscallbackcloseCbHEROATTRIBUIgetParent	viewremoveUI	fraglocalPlayerGameGlobaldelaySelect	nameHEROUIdata.Config_UIrequiregetUILogicByNameUIManagerÿ

self  < 4     9  B+ L closeItself   Í   6   99 ' B6   99  9' B9 BK  Image_SwallowTouchBackImage1getChildByNamescaleXToFullScreenImage_Title	viewalignLeftUIManagerself     
 Jç6   96 9
 9B
 9B6	 9		9		+
  4 > >>>>-  9	>BK   ÀfirstTimeForYuan	nameHEROYUANConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerself hero  otherHero  yuan  yuanLv  node   ?   ó -     9   + B K  	ÀsetVisible      curNode  R÷æn9  -  9 X2 ð4  6 ' B 99B 4  6 6 BH9
	9
 X
	 XFRø) ) ) M6	 '	 B	9	
	'
  9'  &B 9' B 99 8B+ )  6 9BHM8  XXK:89 XD+ :6 '	 B9	6 9
) ) ) M 9'  &B 9' BOõ) ) ) M 9'  &B 9+ BOõ: ) ) M6 9' B 9'  &B 9 B 9)
 * B 9' BOèXFR± 9' B 989B 9' B 9 6!  9"	 B A  X!6# 9$6# 9%'& &6' 9( 9)89) B 9'* B 9  &B 9'+ B 9', BX#6# '-  &86# 9%'& &6' 9( 9)89 B 9'* B 9  &B 9'+ B 9', B) ) ) M 9'  &B 9 BOõ 9'+ B 9 6!  9"
 B A 9'* B 9 6!  9"
 B A 9'. B 9 B89/4  60  91 '2 + B 6 '3 B 94 9'5 B + + B)  4  ) ) ) M 9'5  &B 9+ BOõ)  ) MA866 9B X: 6' 9( 978B  X 94 9'5  &B6' 9( 978B+ + B68 99 5: 6' 9( 978B>BX 94 9'5  &B8+ + B68 99 5; 8>BO¿ ) ) M 9'5  &B 9+ BOõ3< 6=  9> 9'? B5@ =A4 >>8>>>=BBO|~9C :
 XI) ) ) ME 9	'  &B		 9
D	+ B
	 9
E	) B
	 9
F	* B
	 9
	+ B
	 9
G	6H 9I 9J6H 9K 9JB6H 9L 9J3M B6H 9N 9J6H 9O 9J6H 9P 9J* ) B* B6H 9Q 9J* B A A A
2	 O»9C + >2  K  K  
ÀFadeInScaleToEaseInOut
Spawn CallFuncDelayTimecreateSequenceccrunActionsetScalesetOpacitysetCascadeOpacityEnabledfirstTimeForYuan
paramcallBack  Button_1widgetTouchExtentUIManager       insert
tablegetHeroByIdtonumber	nodesetDataapp.uiLogic.HeroHeadSimple,
splitStringUtilheroStrinactive	chineffectdengjigetHeroYuanAttrlocalPlayerGameGlobal:xyf
chin1Config_LanguageconvertHexToRGBDisplayObjectUtilsetColorsetString	namesetNamesetPositionaddChild#common_wujiaoxing.pngnewGraySpritedisplay	grayremoveChildByNamesequipLv_2Const_colorDatayijihuoheroYuantishiYuansetVisible
tishipjgetChildByName#BDBDBDweijihuoapp.const.Const_colorDataneedHeroConfig_EquipmentYuan
pairsidgetYuanByHeroIdapp.const.Const_YuanInforequire
JIBANtabStateàÿñú¨¸ÑðúýµæÌ³¦þÙÇÂë×þ				



		    !!""""##########"%%%%&&&&&&&&&&%((((())))**********+++++,,,,(.11111111122222222222233444444555555556666666666777777777999999999::::::::;;;;;;;;;;<<<<<<<<>>>>??????????>AAAAAAAAAAAABBBBBBBBBBBBDDDDDDDDEEFGGGGGGGGHHHIIIIIIIIIIJKLLLLMMMMMMMMMMLOOOOPPPPPPQRRRRRRRRSSSSSSSSSSSSSSSSSTTTTTTTTTTTTTVVVVVVVVVVVVWWWWWWWO[[[[\\\\\\\\\\[`aaaaaaaaaaaaaaaaaaccccddddeeeeeeffffgggghhhhiiiijjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjdmmmnnST_TABSTATE self  ÷node  ÷hero  ÷heroYuan ïequipYuan 	æ	 	 	_ v    i wordColor ÿwordColor1 þcurNode øflag 
îyuanLv íP P P_ Mv  M  i 
  i 
  i starGray str1 4str2 str1 str2   j 
str -tmp head pos wotherHero v  n 
B B Bm @D  n 
cb F F Fi DcurNode =  	 3ù) ) ) M
9   8	 X+ L Oö+ L treasure self  hero  page    i 	        K         Û  K    &    Ý  -   B K   À   callBack  ­ Okã    X-   9' BXF  X=6  9' B 9' B 9	6
 9 9-  -	  	B A 9-   9' -	 &	B 9B-   9'	 -
 &	
	B 9BB-   9 B 9' B 9)'BX  X-   9' BK      outsetLocalZOrdersetNameaddChildgetPositionYgetPositionXtsetPositiongetItemAttrlocalPlayerGameGlobalsetStringCurDesgetChildByNameui/common/ShowTreaInfo.luagetNodeFromLuaUIManager
begantreasureInforemoveChildByName
endedàÅ¬					

node page i type  Pnode1 7 .èÍÅ -6  ' B 9-   -  + + B 9' - &B 9)d B 9+  + B-  9 B 9-  9	'
 -	 &	B 9B A6 9 9' -   -  ' &) B 9' - &B 9)d B 9-  9	'	 -
 &	
	B 9B A-  9 B- 9 Xj- 9  Xf- 9:-  X` 9)2 B 9* B6 9 9* ) B6 9 9* B 9)2 B 9* B6 9 9* )	 B6 9 9*	 B6 9	 93
 B   X6 9
 93 B 
 96 9 96 9 96 9 9 B B B A
 96 9 96 9 9 B B A- 4	  =	3  6!  9"- 	 9	'
# - &

B5$ =%5	& =	'5	( =%	5
) =
'	5
* =%
5+ ='
+  )
 +  5, =%5- ='B
2  K  	ÀÀ À  out    
moved    
began  
param  
endedcallBack  
touchwidgetTouchExtentUIManager EaseBackIn
SpawnSequencerunAction  CallFuncFadeInScaleToccsetScalesetOpacitycurTreasurePosselectTreaAnin	namezi.pngheroui_ImageView	ccuigetPositiontgetChildByNamesetPositionaddChild	initsetLocalZOrder	iconsetNamecreateapp.sprite.SkillAnirequireµæÌ³æÿÿ						



+,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,--page i node self callBack  éicon Úname /«action1 9Qaction2 Kaction3 <action4 6action5 0cb 1  8   ¤!-     9   B K    setHeroInfoself   R|!-   + =  -  
   X G-     9  - - B   X ?-    9  ' B   9  6 9B -    9  ' B   9  6 9	B 6 
 ' B   9  *  + + -  B   9 3 + B  9 -  9' B 9B A  9 ' B  9 6 999B-  9  BX -     9  B K     À   setHeroInfoaddChildactiveTreasureheroAttrlZorderConfig_GameDatasetLocalZOrderJIHUOSHUXINGANIsetNamegetPositionsetPosition 	initcreateapp.sprite.SkillAnirequire
greenConst_colorDatasetColoryjhConfig_LanguagesetStringText_ActivatedgetChildByNamecheckCurPageTreauseselectTreaAni

self treasurePos hero page node effect -  Ú 'b!   X-   9 B2 -  9' - &B 9+ B-  9' - &B-  9' - &B3 -  B2  K  K          	name	iconremoveChildByNamesetVisiblengetChildByNamesetHeroInfoself node i hero page actived treasurePos  'refreshInfo " ® 
(X!#-   4  =  -   - = -   + = 3  6  96 9 9B 9	B6
 99+  5 = -  -	  	=- =-  9 =BK   ÀÀ	ÀÀ
ÀselectPos	heroposcb  	nameHEROTREASUREGETConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManager selectTreaAniselectTreaPagecurTreasurePos!"""""""""""""""""""""""""""""#self page node i hero actived getTreasurecCb  «
  Íº!!-      .   -   )   X K  -   )   X r)  ) ) M n-  9 '  &B 9- -  88:- -	  8	8:B-  9 '  &B 9- -  88:B-  9 '  &B 9-   B6  9- 	 9 '
  &

B A X0-  9 '  &B 9- -  88:- -	  8	8:B-  9 '  &B 9- -  88:B-  9 '  &B 9-   BO -   	  X  )  ) ) M -  9'  &B6  9- 	 9 '
  &

B A X-  9'  &BO ä-   )   X '-  9 	    X#6 
 9  - 9	B -  +  =	 -    9  - - - -  B -    9   ' B   9  + B -    9   ' B   9  + B K  À  ÀÀÀ	nextsetTouchEnabled	lastcreateHeroToEquipYuanunscheduleGlobalschedulerturnPageremoveChildByName	namecheckObjIsNullGameGlobalsetOpacitysetRotationSkewYsetPosition	icongetChildByNameþ
															












!tick node treaAniConf self hero typeEquip page o o oi mt  i    ÁÜ!*-      .   -  )   X K  -   )   X Â-   )   X ¾-   	  X C-    9   - - - -  B -    9  ' B   9  + B -    9  ' B   9  + B )  ) ) M $-  9'  &B 9B6  9- 	 9'
	  &

B A X-  9'	  &B 9BO Ü)  ) ) M t-  9'  &B 9
- -  88:- -	  		8	8:B-  9'  &B 9- -  88:B-  9'  &B 9-  B6  9- 	 9'
	  &

B A X3-  9'	  &B 9
- -  88:- -	  		8	8:B-  9'	  &B 9- -  88:B-  9'	  &B 9-  BO -   )   X n-  9     Xj)  ) ) M L-  9'  &B 9
- 	 9'
  &

B	 9B A-  9'  &B 9)  B6  9- 	 9'
	  &

B A X-  9'	  &B 9
- 	 9'
  &

B	 9B A-  9'	  &B 9)  BO ´6  9  - 9B -  +  = -    9  ' B   9  + B -    9  ' B   9  + B K   ÀÀÀÀ unscheduleGlobalschedulerngetPositiontturnPage1setOpacitysetRotationSkewYsetPosition	namecheckObjIsNullGameGlobalsetLocalZOrder	icon	nextsetTouchEnabled	lastgetChildByNamecreateHeroToEquipYuanÈþ									




             !!!!!!!!!!!!!!!!!!!!"""""""""""%%%%%&&&'''''''''(((((((((*tick1 tick self node hero typeEquip page treaAniConf 2% % %i #'u u ui sM M Mi K Ú !ßÔ"/-   9 ' B 9+ B-   9 ' B 9+ B-   9' B+   X) 6  ) M+6 89-   X#6 89- 9	 X6
 	 96
 9

 &

B-  	 9 '
 B	 9+
 B-  	 9 '
 B	 9+
 BK  XOÕ) ) ) M$-   9 '	 
 &	
	B 9	B6  9-	  	 9	 	'  &B	 A X-   9 '	 
 &	
	B 9	BOÜ- 9  X- 6 9- * B=6 ' B 9* + + B 9' B 9+ B 9)d B 9+  + B 9-   9 '	 B 9B A-   9 B  X5- 9   X- 6 9- * B= 6 ' B 9* + + B 9+ B 9' B 9)d B 9+  + B 9-   9 '	 B 9B A-   9 BK  ÀÀ ÀÀ	ÀturnPage1addChildgetPosition
node1setPosition	initsetRewindPlaysetNamecreateapp.sprite.SkillAnirequirescheduleGlobalschedulerturnPage	namecheckObjIsNullGameGlobalsetLocalZOrder	iconxyyxdjConfig_LanguageaddMessageFloatMessagelvneedPlayerLv	pageConfig_HeroTreasureeffect135removeChildByName	nextsetTouchEnabled	lastgetChildByNameÈµæÌ³æýÎ				







           !!!!!##$$$$%%%%%%%'''''''''(((())))****+++++,,,,,,,,,,,-----/node page hero self animation animation1 type  àflag Ç, , ,i *needLv 
 $% % %i #effect135 8!effect135 7! ¾U	¢  ·9  -  9 X2 9 
  X9 +  =  9'	 B 9+	 B6  9 9	' B	5
	 3 =

B)  = ) - ) M99
 	 8


 X
9
 	8


 X
9
 	8


 X
9
 	8

	
 X
=	 )
 6  ) M
6 89	 X
96 89 X9  = X
O
ð9
 	
 X
)
 =
 XOÇ9 	 X) =  9'	 B 9+	 B 9'	 B 9+	 B  X9 	  X 9'	 B 9+	 B	 X 9'	 B 9+	 B  9 	 
 B X 9'	 B 96	 9		B 9'	 B 96	 9		BX 9'	 B 96	 9		B 9'	 B 96	 9		B 9'	 B 96	 
8	
	9				'
  &	
	B) ) ) M¸ 9
'! 	 &B

 9

+ B
 9
"'# 	 &B
 9
"'$ 	 &B
3
% 9  	8  X6& 9' 9(')   	'* &) B 9+ 9', 	 &B 9-B A 9. B 9/* )  B 90'# 	 &B 91)2 B62 93 94  	B  XR65 96'7   	'* &B 9+ 98B99)  B 9/* )  B6: 9;5< 5= =>B 90'? 	 &B 9/* )  B 9. B6@  9A 'B  B 9C)  B 9D6E 9F 9(6E 9G 9(6E 9H 9(* )F B6E 9H 9(* )  B A A A3I 6  9 9'J 	 &B5K =
BX
 B2
 2	 OH)  ) 3L 3	M 3
N 6  9 9' B5O =

5P =QB6  9 9' B5R =

5S =QB+  =T 2  K  K  
ÀÀÀselectTreaAni  	next  
param  	last       
touch FadeToSequenceRepeatForeverccrunActionsetOpacityCUSTOM_OUTLINE_WHITEaddFilterFilterUtilfiu_outlineColor  ¼øð¼¸ÿ¼øð¼¸ÿ¼øð¼¸ÿ shaderNameoutlineShaderu_radiusüÓÆÍÄÁú	frag$res/Shaders/example_outline.fshu_thresholdencode	json
widthgetContentSize#heroui_newFilteredSpritedisplaytreasureActivablelocalPlayerGameGlobalsetLocalZOrdersetNamesetAnchorPointaddChildgetPositiontsetPositiontu.pngheroui_createImageView	ccui 	name	iconremoveChildByNamen%addPerText_Effectredwjh
greenConst_colorDatasetColoryjhConfig_LanguagesetStringText_ActivatedcheckCurPageTreause	nextsetVisible	lastneedPlayerLvlv	pageConfig_HeroTreasuretreasuredefaultPagecallBack   widgetTouchExtentUIManagersetSwallowTouchesImage_1getChildByNameselectTreaPageEQUIP1tabState Èÿ ÿ                                                                                            !  $ $ $ % % ' ' ' ' ' ' ' ' ( ( ( ( ( ( ( ( ) ) * , , - - - - - - - - / / 0 0 0 0 0 0 0 0 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 5 6 6 6 6 6 6 6 6 6 6 9 9 9 9 9 9 9 9 9 : : : : : : : : : < < < < < < < < < < < < < < > > > > ? ? ? ? ? ? ? ? ? ? @ @ @ @ @ @ A A A A A A o q q q q q q q s s s s s s s s s s s s t t t t t t t t t t t t u u u u v v v v v w w w w w w x x x x z z z z z z z z z z { { { { { { { { { | | | | | | | | | } } } } } ~ ~ ~   ~                                                      ¯ ° ° ° ° ° ° ° ° ° ° ° ° ° ² ² ³ ³ > µ ¶ Ø 34444444444445555555555556677 ST_TABSTATE MAX_PAGES treaAniConf self  ¢node  ¢hero  ¢typeEquip  ¢page  ¢showAni  ¢%: : :i 8!  j ¹ ¹ ¹i ¶actived icon fi 2Iaa 5showInfo 6tick  tick1 animation animation1 cb  ¬  1èõ¼"E9 9999 9	'  &B	  X
9
 
 X
	 9
	' B

 9
	
+ B
 9
' 9 &B

 9

' B

 9
	
+ B
=  9
'
 B

 9

' B
 9
'
 B

 9

' B
 9
' B

 9
	
+ B
 9
' B

 9

)èB
 X
6
 ' B

 9

* + + B

 9
' B
 9
+  + B 9'
 B 9
 B
  X
n 9
'
 B

 9

B
 9
'
 B

 9

' B

 9
	
+ B
 9
'
 B

 9

' B

 9
	
+ B
 9
'
 B

 9

' B

 9
	
+ B
6
 ' B

 9

 9'
 B5 >+  + B

 9
+ B 9' B 9+ B 9' B 9+ B 9' B 9 + B 9' B 9 + B 9'! B 9+ B 9'! B 9 + BX
6
" 9
#

 9
$
 B
 
 X 9
'
 B

 9

B
 9
'
 B

 9

' B

 9
	
+ B
 9
'
 B

 9

' B

 9
	
+ B
 9
'
 B

 9

' B

 9
	
+ B
6
 ' B

 9

 9'
 B5% +  + B

 9
+ B6& 9' 9* * B6& 9' 9* * B 9'
 B 9(6& 9) 96& 9* 9  B A A 9'+ B 9,6 '- B9.B 9' B 9+ B 9' B 9+ B 9' B 9 + B 9' B 9 + B 9'! B 9+ B 9'! B 9 + BX
l 9
'
 B

 9

B
 9
'
 B

 9

' B

 9
	
+ B
 9
'
 B

 9

' B

 9
	
+ B
 9
'
 B

 9

' B

 9
	
+ B
6
 ' B

 9

 9'
 B5/ +  + B

 9
+ B 9' B 9+ B 9' B 9+ B 9'! B 9+ B 9' B 9 + B 9' B 9 + B 9'! B 9 + B  9
0     B
K  setRightCard  Ñchuanzhuangdata.Config_LanguagesetTitleTextbt1SequenceRepeatForeverrunActionScaleTocc  ÑequipValidlocalPlayerGameGlobalunloadsetTouchEnabledbt3setBrightbt2setTipEnabled   app.uiLogic.ICONkongtukezhuangbeijiahaostopAllActionsaddChild	initsetNamecreateapp.sprite.SkillAnirequiresetLocalZOrdertexiaoeffect77effect74removeChildByNameProjectNode_12setVisibleselectedcurSelectedIcon	icongetChildByName
equipisYuani	hero	nodeÆçÌ³³æÌþµæÌ³Æÿ														        !!!!!!!!"""""""""$$$$$$$$%%%%%%%&&&&&&&&&&&&''''''''''''(((((((((((()))))))))))))****+++++++,,,,,,,-------------------...........////////000000001111111122222222333333334444444446666666777777777777888888888888999999999999:::::::::::::;;;;<<<<<<<<========>>>>>>>>????????@@@@@@@@AAAAAAAADDDDDDDEself  éflag  éflag1  éinfos  énode çhero æi åisYuan äequip ãcurNode Ýeffect77 Glogic L4logic u`action Uaction1 Nlogic 4 Ð   "#-   - 9- 8=  -   - = -   - = 6  9    9  - 9- B K   ÀÀÀuIdsend_unloadEquipmentheroProxyGameGlobal
myIdxmyHero
equipmyEquipself hero i    6#6   96 9 9B 9B6 99+  5		 = 
	=	=	-
  9

=
	BK   ÀposmyCurType	node	hero	type  	nameEQUIPINFOConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerself type  hero  curNode    
 BWÈ#   X 6  96 9 9B 9B6 99	+  5 -  9
-	 8	=
- 9=- 9=- 9=BX6  96 9 9B 9B6 99	+  5 -  9
-	 8	=
- 9=- 9=- 9=BK  ÀÀ À  EQUIPRANKUP	nodemyCurNode	heromyCurHero	typemyCurType  
equip	nameEQUIPLVUPConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerlvhero i self type1  C í Fäñ#V 9 ' B 9+ B 9' B 9 ' B 9' B 9 ' B 9' B 9 '	 B 9' B=
 = = 3 6  9 9	 ' B	5
 =
B 9 '	 B 9B  X	 9 '	 B 9+	 BX 9 '	 B 9+	 B 9 '	 B 9'	 B3 6 	 9 9
 ' B
5 =4 >>>=B  X 	 
  B) ) )	 M$ 9 ' 
 &B 9' B 9 ' 
 &B 9' B 9 ' 
 &B 96  96 9B AOÜ9 8  X9 8
  X9!8  X9!8
  X	 9 '
" B	 96
# 9
$

 9
%
9!8:9!8:) B
 AX	 9 '
" B	 9'
 B6& '	' B	 9(*
 + + B
 9)'* B
 9++  + B
 9, B
 9- 9 ' B 9.B 9 ' B 9/BB
 9 ' B
 9+ B9 8
 90B4	  6
1 
 9
2
 '3 B
	
 )
 	 ) M
4  61  928	'4 B  9 '  &B 965 :8B 9 '  &B 9:BO
á
	 	
 X
C 9
 ' ) &B

 9

65 '6  &8B
 9
 ' ) &B

 9

6  96 97B A
6
5 '6  '8 &8



  X
 9
 ' ) &B

 9

65 '6  '8 &8B
 9
 ' ) &B

 9

6  96 97B A
 9
 ' B

 9

9 89B
 9
 ' B

 9

6  96& '9 B': 9 89;&8B A
 9
 ' B

 9

9 89<B
 9
 '	 B

 9

9 89=B
3
> 6  9 9 '? B5@ =
5A =B6  9 9 'B B5C =
5D =BX0	 9 '
" B	 9'
 B6# 9$	 9E
 B  X 	 9 '
" B	 9'
 B	 9 '
 B	 9'
 B	 9 '
 B	 9)
  B	 9 '
	 B	 9)
  B2  K  equipValid  	rank  bt3  lv  bt2 	ranklvqualityequipLv_app.const.Const_colorData_1
huisewjhConfig_Language_,
splitStringUtilgetEquipAttrigetPositionYgetPositionXsetPositionaddChild	initeffect93setNamecreateapp.sprite.SkillAnirequiregetYuanInfolocalPlayerGameGlobalText_79equipYuan
equipyijihuoConst_colorDataconvertHexToRGBDisplayObjectUtilsetColoraat
param  bt1 setTouchEnabledisBrightcallBack  unloadwidgetTouchExtentUIManager myCurTypemyCurHeromyCurNodejiejisetString	nameeffct93removeChildByNamesetVisibletexiaogetChildByNameþÿÿÿúàÿ               """"""""########$$$$$$$$$$$$$$$$$$$$&&&&&&&&((((((((())))*****++++,,,,,,,,,,,,,,,,,,,--------/////011111112222344444445555555555556666666666288899999999999999:::::::::::::::;;;;;;;;<<<<<<<<<<<<<<<===============@@@@@@@@@@AAAAAAAAAAAAAAAAAAAABBBBBBBBBBCCCCCCCCCCJKKKKKKKKKKKKLLLLLLLLLLLLLNNNNNNNNOOOOOOOOPPPPPPPPQQQQQQQQRRRRRRRRSSSSSSSSVVself  åcurNode  åi  åhero  åflag1  åunloadEquip )¼cb -% % %j #effect13 YéattrStr -¼tmpAttr »
     j tt rankAndLv     V^Û#$9    X6 99  B+  =  6  9B9   X6 99 B+  = 9   X6 99 B+  = 9   X6 99 B+  = 9   X6 99 B+  = 9	   X6 99	 B+  =	 9
   X6 99
 B+  =
 6  9  B9  9B9   X9  9B+  = K  stringLogicdisposecommonBakLogicremoveEventsEventManagerturnPage1turnPageshenqiScheabScheduleId1retryScheduleIdspSchedulerremoveNodeFromCacheUIManagerunscheduleGlobalschedulerdelayShceduler


   !!!!""$self  W «  ¶âñ $6   ' B 6 ' B 9B6 ' B)  ) )pu)ou)qu4 6	 9		*  * B	>	6	 9		*  * B	 ?	 5	 5
	 5
 4 5 >5 >5 >5 >>4 5 >5 >5 >5 >>4 5 >5 >5 >5 >>4  3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 3' =& 3) =( 3+ =* 3- =, 3/ =. 31 =0 33 =2 35 =4 37 =6 39 =8 3; =: 3= =< 3? => 3A =@ 3C =B 3E =D 3G =F 3I =H 3K =J 3M =L 3O =N 3Q =P 3S =R 3U =T 3W =V 3Y =X 3[ =Z 3] =\ 3_ =^ 3a =` 3c =b 3e =d 3g =f 3i =h 3k =j 3m =l 3o =n 3q =p 3s =r 3u =t 3w =v 3y =x 3{ =z 3} =| 3 =~ 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3¡ =  3£ =¢ 3¥ =¤ 3§ =¦ 3© =¨ 3« =ª 3­ =¬ 3¯ =® 3± =° 3³ =² 3µ =´ 2  L   dispose setRightCard equipYuanCallBack createHeroToEquipYuan checkCurPageTreause createHeroToHeroYuan layout canClosed closeIt turnToLeft turnToRight clearEffects initNodeState onTouchEnded onTouchMoved onTouchBegan setButtonState showTupo showTuPoShiLian createHeroTupo createZhuanJing createAwake updateZhuanJingBtns setTextColor setNodeVisible wigetTouched heroNodeTouched skillUpdate equipUpAni showEquip showStarUpResultUI showHeroBreakResultUI finishHeroRankUp cardAnimation animation checkEquipComposeStatus trainningAnimation setRankUpButtonStat setStarUpButtonStat setEquipInfo setSkillDetailInfo 
setSp setSkillInfo rec_upHeroLvUseItem useExpItemNoSendMsg useExpItem reLoadExpItem setExpNode setHeroLvInfo setDetailInfo setJibanNodeInfo setRightInfo setLeftInfo createText createHeroTalent wuHunLvUp shenqiAnimation createHeroShenqi setHeroInfo getCurAbility getCurrentHero getCurrentHeroTupo getCurrentHeroTalentNode getCurrentHeroJiBanNode getCurrentJiBanNode getCurrentDetailUI getCurrentLeftUI getCurrentRightUI getCurrentNode unloadEquipmentCallBack OneKeyEquip initEvent setArrowState setInitHeroInfo 	init createHeroNode createNodeByCsbType initNode  	ctor   Òðú¨ëã¸#Îÿÿÿîÿÿÿ  û¨¸½áÕÞ®×óöÑðúÂ«à©¸½õñæÝÿÿÿ   òì£áõ§©¸½õÑÌ®×êÿÿÿ  ×ÇÂêÚ¤áõQ×Ç¼×ÇÂêÜÒðú¨ë£ÊÝÿÿÿ  J©¸½õ±çI¥ÿÿÿþÿÿÿ  û¨¸½áÕÊ×ÇÂëöÑðúÂ«Å©¸½õñöùÿÿÿ   µ×ÇÂëÎÎÜú¨¸Ü®¨¸Úüÿÿÿ  ×ÇÂêÎ¤áõQ×Ç×ÇÂêÐ¤áõQ×Ç²ùÿÿÿ   ÀÞÜúØ]©¸½õñôÿÿÿÿ  û¨¸½áÕÄ×ÇÂëÎöÑðúÂ«Á©¸½õñÿþÿÿÿ   ÀÎ®×¥®½Æ¸½ÜÑð¸þÿÿÿ  ×ÇÂêÊ¤áõQ×Ç×ÇÂêÍ¤áõQ×Ç¢ûÿÿÿ   TALENTTALENTZHUANJINGZHUANJING
EQUIP
EQUIPHEROTUPOHEROTUPOSHENQISHENQI
JIBAN
JIBANEQUIP1EQUIP1
AWAKE
AWAKE  ±ê²ê³ê´êpccdata.Config_Herocreatesrc.app.sprite.ShadersrequireHEROATTRIBUI
class³æÌÌù«×ÇÂÎ©¸½ú¨À                	 
                                               :  w < ~ z ê  ë vÅxÒÇÔ)#-+1/5397<:?=B@FDaGÔc¤Õ·¥º¸»ºX»Za
tcÊvÍ.w0z¶	¾´		Ï	·	Ý	Ð	û	ß	
ý	

A

O
B
p
P

r
¦

´
¨
<¸
c>·e¾¸ÀJuKv£°¥´²Â¶êÄôí2÷o5~q÷ù:<ÚÿÛHEROATTRIBUI ßshader ÙCONFIG_HEROS ÖINT_MAXSP ÕMAX_PAGES ÔSUIPIAN12 ÓSUIPIAN10 ÒSUIPIANSHENQI ÑtabPos ÄbookId ÃST_TABSTATE ÂtreaAniConf £btnList ¢  