LJO@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\VIPANDPAY2.lua]   6  ' B 9BL newapp.uiLogic.VIPANDPAYrequireself  tar  ¶ *T-   9 B==99  X9' =6 9	  X99 X9' =6  9	9	 9
'
 B' 6	 9		9		'
 B 9BL  À	initpnglocalTypeTextureResType	ccui"heroBodyBig/queenBodyBig_1003Image_meinvgetChildByNameaddLocalPicUIManagervipshieldForChargeConfig_Syspay	type
param	viewnewVIPANDPAY2 self  +view  +param  +logic & o  )(-  9  9B9K   ÀygetContentOffset_tableviewself table_view  cur_offset_x  g 	,6  96 9-  9B D  À	data	nums
table	ceil	mathself table_view  
 T  0-   9    D  ÀtableCellAtIndexself table_view  idx   -    4)¾ )XJ table_view  idx   ³ ! i{9    X9   9B2 `X]9  9' B6 9 96 9	 9	B9

 9	B9B A=  9   96 9B9   96 9B9   96 9	 9B
 9B A A9   9B9   9' B9  99  B9   93 6 9B9   93 6 9B9   93 6 9B9   93 6 9 B9   9B2  K  K  TABLECELL_SIZE_FOR_INDEX TABLECELL_SIZE_AT_INDEX !NUMBER_OF_CELLS_IN_TABLEVIEW SCROLLVIEW_SCRIPT_SCROLL registerScriptHandleraddChildscrollViewsetNamesetDelegategetPositionYgetPositionXpsetPositionTABLEVIEW_FILL_TOPDOWNsetVerticalFillOrder"SCROLLVIEW_DIRECTION_VERTICALsetDirectionheight
widthgetContentSize	sizecreateTableViewcctbgetChildByName	viewreloadData_tableview						












self  iback_sp X Í  3j: 9 B  X 9BX6 9 9B ) ) ) M  9	 		 	 X+  6	 	 9		' B		   9		    B	 9	
)  B	 9	 B	OáL addChildsetPositionsetPayNode2ui/home/PayNode2.luagetNodeFromLuaUIManager	datanewTableViewCellccremoveAllChildrendequeueCellèÜself  4table_view  4idx  4_cell 0     i node  µ 
­6  99  X6  94  =6  998 
  X6  998 	  X1-   9' B 96 ' B9B-   9'	 B 9
+ B-   9' B 9
+ B-   9' B 9
+ B-   9' B 9- BXC-   9' B 96 ' B9B-   9'	 B 9
+ B) -   9'	 B 96 96  	 9B6  998 !B!6 9&B-   9' B 9
+ B-   9' B 9
+ BK  ÀÀ	tianConfig_LanguagegetServerTime	ceil	mathzhoukashengyuyuanbaoImage_4setVisibletimeleftmeirizengsongdata.Config_LanguagerequiresetStringText_2getChildByNametwCardslocalPlayerGameGlobal Ð 80												








node extra cardType  totalDay ]- «  @Oè-   	   X 6   9  9  )    X ,6    9  6 9B K  X $-   	  X 6   9  9  )    X 6    9  6 9B K  X -   	  X 6    9 	 6
 9 9B 9B6 99B K  -    9  - 9- 89- B K  À ÀÀ
proId	datapay	nameVIPDETAIL_TWConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManagerbuyWeekCardTime	sytsConfig_LanguageaddMessageFloatMessagebuyMonthCardTimelocalPlayerGameGlobal	
type self idx  Ê' QÄV¥9  899  89  9  B
 9' B
 9' B
 9B
 9'	 B
 9
+ B	  X 6 99	 X,
 9' B
 96 ' B9B
 9' B
 9
+ B
 9' B
 9
+ B
 9' B
 9
+ B
 9' B
 9 BX<
 9' B
 96 ' B9B
 9' B
 9
+ B
 9' B
 96 96  9B6 99!B6 9&B
 9' B
 9
+ B
 9' B
 9
+ B
 9' B
 9
+ B
 9' B
 9
+ B
 9' B
 9' 6 9 9!B
 9'" B
 9 B
 9'# B
 96 9$ 6 ' B9%&BX	 X 6 99&	 X,
 9' B
 96 ' B9B
 9' B
 9
+ B
 9' B
 9
+ B
 9' B
 9
+ B
 9' B
 9 BX<
 9' B
 96 ' B9'B
 9' B
 9
+ B
 9' B
 96 96  9B6 99&!B6 9&B
 9' B
 9
+ B
 9' B
 9
+ B
 9' B
 9
+ B
 9' B
 9
+ B
 9' B
 9'( 6 9 9!B
 9'" B
 9 B
 9'# B
 96 9$ 6 ' B9%&BXf	 Xq3)  9	' B		 9	
	+ B	9	  8		9	 		* X	6	 	 9	+	', B	 	 X
D 9	' B		 9		', 6 9 9!B		 ) B	X	59	  8		9	 		- X	6	 	 9	+	'. B	 	 X
) 9	' B		 9		'. 6 9 9!B		 ) B	X	9	  8		9	 		/ X	6	 	 9	+	'0 B	 	 X
 9	' B		 9		'0 6 9 9!B		 ) B	 9	'" B		 9		 B	 9	'# B		 9		6 9$ 6 ' B9%&B	Xó		 Xñ+   9	' B		 9	
	+ B	 9	'	 B		 9	
	+ B	 9	' B		 9	
	+ B	 9	'1 B		 9	
	+ B	 9	' B		 9	
	+ B	 9	' B		 9	
	+ B	 9	' B		 9	
	+ B	+	 9
  8

9
2
	
  X
) 9
' B

 9


+ B
 9
' B

 9

'3 B
6
 9
4

 9
5
'6 ) B
 9' B 97
 B
 98
)* *
 B
 99
'3 BX
 6
 9

9
:


  X
6
; 6 99:B
H9  89< X	 9' B 9
+ BX
FRð)
  
 X
( 9
' B

 9


+ B
 9
' B

 9


+ B
 9
' B

 9

 B
 9
'1 B

 9


+ B
 9
' B

 9


+ B
 9
' B

 9

6 ' B9=B
 9
' B

 9


+ B
)
È 
 X
'> X
	)
È 
 X
)
ô
 X
'? X
'@  9
' B

 9

 6 9 9!B
 9
'" B

 9

 B
 9
'# B

 9

6 9$ 6 ' B9%&B
6 '
A B
 95* + + B 9	9' B	 9	B+  + B	 9	'C B		 9	7	 B	 9	86D 9E)] )a B A	6	D 9	F		 9	5	* 6D 9E)  ) B A		 9
G	B
 9' B 9H6D 9I 956D 9J 95	 
 B A A3K 6L  9M 9'C B5N =OB 9'C B 9P+ B2  K  setSwallowTouchescallBack  widgetTouchExtentUIManager SequenceRepeatForeverrunActionreverseMoveBypccImage_1	initapp.sprite.SkillAnicommon_yuanbaoda.pngcommon_yuanbaozhong.pngcommon_yuanbaoxiao.pngewaizengsong
proId
pairsdoubleChargeRewardsetNamesetPositionaddChildartText_uiNum31.pngcreateImageViewimfirstDoubleImage_2_Copycommon2_chengse.png3common2_zise.png2common2_lanse.pngcheckPngExistInPlist1 common2_zhouka.pngzhoukashengyubuyWeekCardTime	yuanyuan_head
priceText_1plistTypeTextureResType	ccuicommon_yueka.pngloadTexturexiangou	tianConfig_LanguagegetServerTime	ceil	mathyuekashengyuyuanbaoImage_4timeleftmeirizengsongdata.Config_LanguagerequiresetStringText_2buyMonthCardTimelocalPlayerGameGlobalsetVisibleImage_5stopAllActionstugetChildByNameeffect14removeChildByNamegetItemNamermb	type	data Ð 80<òÿ					










        !!!!!!!!""""""""#########%%%%%%%%%%%&&&&&&&&'''''''''''''''''''''''''(((((((())))))))++++++++,,,,,,,,-----------........////////////////00BCCCCCCCCDDDDDEEEEEEEFFFFFFFFFFFGGGHIIIIIJJJJJJJKKKKKKKKKKKLLLMNNNNNOOOOOOOPPPPPPPPPPPQQQTTTTTTTTUUUUUUUUUUUUUUUUVVXYYYYYYYYZZZZZZZZ[[[[[[[[\\\\\\\\]]]]]]]]^^^^^^^^________`aaaaabbbbbbbbccccccccdddddddeeeeeeeefffffgggggkkkkkllllllmmmmmnnnnnnnnollsssuuuuuuuuvvvvvvvvwwwwwwwwxxxxxxxxyyyyyyyy{{{{{{{{{{{||||||||}}}~~¢££££££££££¤¤¤¤¤¤¤¤¥¥self   node   idx   type price yuanbao yuanbaoStr  extra  showTimeLeft Úopath sðisDouble 9·im   _ v  effect44 Oaction $+res (cb      
ü+ L self   ·    ÿ6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 2  L   canClosed setPayNode2 tableCellAtIndex makeList create VIPANDPAY2
class9U:ûVþüÿÿVIPANDPAY2   