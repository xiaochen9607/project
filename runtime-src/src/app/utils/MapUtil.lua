LJJ@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\utils\MapUtil.luaM  6  9	  X 6  9L tileHeightMapUtilţ˙˙˙self   R  6  9	  X 6 L _tileWidthtileWidthMapUtilţ˙˙˙self   R   6  =6  =K  tileHeighttileWidthMapUtilself  tW  tH     /$4  6   9 '	 B) )  )	 M"4  )  ) M6 8B  X) 6 9 6 9 B  B Oî6 9 6 9 B  BOŢL 	maxninsert
tabletonumber,
splitStringUtil										
self  0arrayStr  0col  0row  0_mapArray .arr (index '# # #i !tempArr    j num  ő  d6'  ) )  ) M)
  ) M
 8	8' &O
úOő6 9 )	 6
 9

 B

 
B L lensubstring,											
self  arr  col  row  arrayStr index   i 
  j    	NĄF)  )  6  96  9,
 6 9#B"  6 9#B"  !"	 !"
 6 9	 B6 9
 B " X6 9#B 6 9#B X !6 9#B !6 9#B 6 96   9 B!BL getModpccabs
floor	mathtileHeighttileWidthMapUtil			


self  Opx  Opy  Oxtile Mytile LtileWidth JtileHeight Hcx Gcy  Grx  Gry  Gp F ÷ 
 Nf  6  9"6  9 6   9 B6  9"  6  9"6 9 	 D pcctileHeightgetModtileWidthMapUtil					self  tx  ty  tileCenter 
xPixel 

yPixel  ˝   -[s6  9 B4  )  ) M#89  X6 
 98:8:B4	  <	8	9
>
	8	9
>
	8	8
:

>
	X	6 
 98989B<OÝL ygetCellPointMapUtilx	maxn
table			




self  .arr  .len )arr2 ($ $ $i "tmp  ż   -[6  9 B4  )  ) M#89  X6 
 98:8:B4	  <	8	9
>
	8	9
>
	8	8
:

>
	X	6 
 98989B<OÝL ygetPixelPointMapUtilx	maxn
table			




self  .arr  .len )arr2 ($ $ $i "tmp  ă  /w6  9 B*  ) , )	 
 ) M	!6 9 6 98989B A )    X6 9 6 98989B A   X  O	ß8	
 J	 yxppGetDistancecc	maxn
tableţŮÄ			











self  0p  0arr  0p2  0len +min *minIndex )dis (dis2  (" " "i   á  TŤ6  9 B*  ) )  ) M6
 
 9

 8	B

 X
 	 Oő8 J disForTileMapUtil	maxn
tableţŮÄ	self  p  arr  len min minIndex   i 
dis     'Tš )  XL 6  9)  )  B)  ) M6 	 9)
  B88	9		=	8	9		=	8	9
=
	8	9
=
	9	=	9	=	OčL yxrandomBattleRandompcc			

self  (arr  (tmp   i index p  b   
É6  9) 6 9 B A8L 	maxn
tablerandom	mathself  arr   ş   DÍ
6  9 B+ )  ) M8	9		9
	
 X	8	9		9
	
 X	+ XOóL yx	maxn
table	self  p  arr  len found   i  ň 
 $RŘ8  X+ L 88  X+ L 88  X+ L 
  X)  ) M8	9	 		 X	8	9			 X	+	 L	 Oő+ L yxself  %map  %x  %y  %extBlock  %  i 
    4í6   9 	 B6   9	 9
9 D yxisWalkablegetCellPointMapUtilself  map  x  y  extBlock  tp  Ż   ,ań8  X+ L 88  X+ L '  9 
  X
9   	 &	8
  X+ L 
  X)  ) M8
	9


 X
8
	9


 X
+
 L
 Oő+ L yx_checkRepeat,		self  -map  -x  -y  -extBlock  -char    i 
 	 !  Ś-  X+   X+ '  4  = 9    &4  <9    &8+ =9    &8)  =4  4  4  4  6 9 6 9  B A6 9 6 9  B A)  ) Mb4  6 9 B)   XQUP 86 9	 B 	 X&)  9 9
 9&8  X9 9
 9&89  X9 9
 9&89  9  9
9      B
 X  9  9
9   )  B	 6  BX
6 9  B6 9  BERô 
 X­ 
 XŞXX¨ +   
 X 
 XXO+  =  X6 9	 ) BL ipairsgetOneNodeAroundyxremove	getnpccinsert
table	stepvisited_checkRepeat,	
       "#$$$$$$(())*****,self  §map  §x  §y  §fourDir  §dis  §extBlock  §includeSrcPoint  §needToCheckWalkable  §moveCost  §posNumber  §char totalAroundNodes listNode tmp aroundNodes c c ci anode MinitStep $3  _ 
v  
 >   Â 	 X)  L ) L  self  val   ä 

WŚĐ-  
  X-  -   XN- 9   -  &4  <- 9   -  &8+ =- 9   -  &8-  =-   X"6  9-    B X6 9- 6 9- B 6 9	  	 B AX- 9   -  &8* =X6 9- 6 9- B 6 9	  	 B AK  ŔŔ ŔŔŔŔ	Ŕpcc	maxninsert
tableisWalkableMapUtil	stepvisited_checkRepeatž									
dis curStep self char needToCheckWalkable map aroundNodes checkX1  XcheckY1  X é	 ŁŽĆQ  X	+ 4	  ,
 '  3 6  9 B!
 6  9 
   B  X 
  B6  9 B!
 6  9 
   B  X 
  B 6  9 B 
 6  9 
   B  X 
  B 6  9 B 
 6  9 
   B  X 
  B X@
  6  9 
   B  X 
  B
  6  9 
   B  X 
  B
 6  9 
   B  X 
  B
 6  9 
   B  X 
  B2  L	 isRepeatgetModMapUtil ,ţ˙˙˙!!!!!!"##########$$$$))))))))*++++++++++,,,,111111112333333333344447789::::::::::;;;;>?@@@@@@@@@@AAAADEFFFFFFFFFFGGGGJKLLLLLLLLLLMMMMPPself  ¤map  ¤x  ¤y  ¤fourDir  ¤extBlock  ¤needToCheckWalkable  ¤curStep  ¤dis  ¤aroundNodes checkX checkY  char cb    'V  X'  L 9
  X9' 9&L ' 6 9 B' )  ) M	 8
9

' 89&	 X		 
 &
	Oó	  X'  L 	maxn
table y,xnil 


self  (tab  (split len str   i  ´  A{Š*  9 9   X9 9  X	6  99B	  X  +  6  99	B X6  99	B	 X6 96 99
9!

BB X6 96 99
9!

BB 6 99 9	 !	B L 	ceilabs
floor	mathygetModMapUtilx 															##############$$$$$$$$$$$$&&&&&&&&&&&(((((())self  Bcurrent  Btarget  Bfirst @second ?disY -disX +    -Ö	8  XK  88  XK  8<6  +  =K  
Astar
CUtil	self  map  x  y  value     Kâ4	 5  >5 >5 >5 >5 >5 >5 >5 >4	 5 >5	 >5
 >5 >5 >5 >5 >5 >4  ) 4  9	=	9	=	 X	U	+	  6
 
 9

9B
	
  X
	 X
	 4
  98	: =
98	: =
6 9 
 B
 X	ßL insert
tablegetModMapUtilyx  ˙˙˙˙             ˙˙˙˙    ˙˙˙˙   ţ˙˙˙   ˙˙˙˙           ˙˙˙˙  ˙˙˙˙   ˙˙˙˙˙˙˙˙   ţ˙˙˙ 	
self  Lpos  Ldir  Ldis  Lodd :even )tiles (i 'curPos &direction tmpPos  Ů  B4	 5  >5 >5 >5 >5 >5 >5 >5 >4	 5 >5	 >5
 >5 >5 >5 >5 >5 >4  9=9=)  )	 M+  6  99B	  X X 98: =98: =OęL getModMapUtilyx  ˙˙˙˙             ˙˙˙˙    ˙˙˙˙   ţ˙˙˙   ˙˙˙˙           ˙˙˙˙  ˙˙˙˙   ˙˙˙˙˙˙˙˙   ţ˙˙˙ 	

self  Cpos  Cdir  Cdis  Codd 1even  tile   i direction  Ť  9 99 9!!6	 9		  B	6
 
 9

6 9 	6 9 #B
5 
8L 
  pi
roundMathUtil
atan2	mathyx	

self  curPos  tarPos  x2 y2 myPointX myPointY dx dy angle tmp_dir tmpArr dir  ç  CŹ4	 5  >5 >5 >5 >5 >5 >5 >5 >4	 5 >5	 >5
 >5 >5 >5 >5 >5 >+  6  99	B	  X X ) 6 	 BH
9: 9 X9: 9 X
 XF
R
đL x
pairsygetModMapUtil  ˙˙˙˙             ˙˙˙˙    ˙˙˙˙   ţ˙˙˙   ˙˙˙˙           ˙˙˙˙  ˙˙˙˙   ˙˙˙˙˙˙˙˙   ţ˙˙˙ 							self  DcurPos  DtarPos  Dodd 2even !direction  dir   k v   Ĺ  zÔČ(4	 5  >5 >5 >5 >5 >5 >5 >5 >4	 5 >5	 >5
 >5 >5 >5 >5 >5 >+  6 	 99
)  B	  X X 4  	  X	) 5	 8
:

9 

=
	8
:

9 

=
	>	5	 8
:

9 

=
	8
:

9 

=
	>		 X	) 5	 8
:

9 

=
	8
:

9 

=
	>	4	  )
 ) ) M
6 9	 8B4  )  X6  98 B 6  9	  B	 O
çL	 combineTableTableUtilgetPosByDirAndDisinsert
table      xygetModMapUtil  ˙˙˙˙             ˙˙˙˙    ˙˙˙˙   ţ˙˙˙   ˙˙˙˙           ˙˙˙˙  ˙˙˙˙   ˙˙˙˙˙˙˙˙   ţ˙˙˙ 	







     !"""########$$$$$$$'self  {pos  {dir  {dis  {odd ieven Xdirection Wtiles Kd Jgroup ,  i tmp     hó6   999B6   999	B6   99	9
B6  	 9
   D checkIsThroughByPixelyxgetPixelPointMapUtilself  current  target  thirdTile  currentPos targetPos thirdTilePos  ý   Cű6  999B6  999B6  999B6  999	B6 	 99
9B6 
 999B4	  
  ) M
  ) M6  9  6  9  B A  X	6 9		 6
 9  B AOčO
ăL	 pccinsert
tablecheckIsThroughByPixelgetPixelPointMapUtilymaxxmin	math				













	self  Dp1  Dp2  Dx1 >x2 9y1 4y2 /px1 )px2 #list "  x   y  ť  66  996 9 !9B6  996 9  9B6  999	6
 9


 
 	
	B6  99	9
6 9 !

B6  9
    B6	  9		    B	
 X

	 L
 pIsSegmentIntersecttileHeightytileWidthMapUtilxpccself  7current  7target  7thirdTile  7leftPos 
-rightPos 	$upPos 	downPos 	horizontal vertical     h6   999B6   999	B6   99	9
B6  	 9
   D !checkIsThroughForAreaByPixelyxgetPixelPointMapUtilself  current  target  thirdTile  currentPos targetPos thirdTilePos  Ś   2Ą6  996 9!9B6  996 9 9B6  999	6
 9

 	
	B6  99	9
6 9!

B6  9
    B6	  9		    B	
 X

	 L
 pIsSegmentIntersecttileHeightytileWidthMapUtilxpccself  3current  3target  3thirdTile  3leftPos 	*rightPos "upPos downPos horizontal vertical  â   QŤ6   999B6   999	B6   9	 
  D $checkIntersectWithBorderByPixelyxgetPixelPointMapUtilself  current  target  mapSize  currentPos targetPos    ?ˇ9 9 !9 9 !"99!99	!	" " X+ L 9 9  X	99 X+ L X+ L 99!9 9	 !	#6 9
  

B6	 9		   B	!
	!"

)  
 X
+
 L
 X
+
 L
 K  tan	mathyx			self  @p1  @p2  @r  @alpha1  @alpha2  @tmp 0tan1 tanUp tanDown  ë   ĺÔ%6  9)  )  B6  9)  9B6  999	B6  99	)
  B99		 X99		 X6  99
)  D X6  99
9D 99		 X99		 X6  9)
  9D X6  99
9D , 6  9    B 6  9    B	 6  9    B
 6  9    B 99 X	9)   X99 XL 99 X	9
)   X9
9 XL
 99 X	9)   X99 XL 99 X	9	)   X9	9 XL	 6  9)  )  D pGetIntersectPointyx
widthheightpcc					!!!!!!!!!!!!"$$$$$self  current  target  mapSize  A B C D AB 'YBC  YCD  YDA  Y   L {÷ ů6   ' B 4   7  6  )˙˙= 6  )˙˙= 6   ' B 6  3 = 6  3 = 6  3	 = 6  3 =
 6  3 = 6  3 = 6  3 = 6  3 = 6  3 = 6  3 = 6  3 = 6  3 = 6  3 = 6  3 = 6  3! =  6  3# =" 6  3% =$ 6  3' =& 6  3) =( 6  3+ =* 6  3- =, 6  3/ =. 6  31 =0 6  33 =2 6  35 =4 6  37 =6 6  39 =8 6  3; =: 6  3= =< 6  3? => 6  3A =@ 6  3C =B 6  3E =D 6  3G =F 6  3I =H 6  3K =J K   $checkIntersectWithBorderByPixel pointInSector checkIntersectWithBorder !checkIsThroughForAreaByPixel checkIsThroughForArea checkIsThroughByPixel getThroughList checkIsThrough getRow3ColNTilesByDir getDirByTilePos getDirByPixPos getOnePosByDisAndDis getPosByDirAndDis setWalkable disForTile pathToString getOneNodeAround getMod getAroundsNode isRepeat pixIsWalkable isWalkable checkPointInArray getRandomPoint shufflePoints getMinDistancePointForTile getMinDistancePoint getPixelPoints getCellPoints getPixelPoint getCellPoint getStrByArr getArrByStr setTileSize  app.utils.MathUtiltileWidthtileHeightMapUtilapp.utils.StringUtilrequire                       $ 3 $ 6 A 6 F ^ F f r f s  s     Š  Ť ˇ Ť š Ç š É Ë É Í × Í Ř ě Ř í đ í ń ń ?BEBFFŚŠÓŠÖßÖâ˙â*,E,HpHsxs{{ĄŠĄŤŻŤˇĎˇÔůÔů  