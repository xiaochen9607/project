LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\framework\cc\ui\UIPageView.luaD    %6   9  B L  newClippingRegionNodedisplaynode  <  W-   9   D  ÀonTouch_self event   È  =NH4  =  9  X	6 9)  )  6 96 9B= 9	  X) = 9  X) =
 9  X)  = 9  X)  = 9  X5 = 9  X+ =   9 9 B  9 + B  9 6 93 B2  K   NODE_TOUCH_EVENTaddNodeEventListenersetTouchEnabledsetClippingRegion
bCirc top bottom 	left 
right paddingpadding_rowSpacerowSpace_columnSpacecolumnSpace_row	row_columncolumn_height
widthdisplay	rectccviewRectviewRect_items_



self  >params  > ë 	'Ue
-  9 B9 99 9!9 9!9 9  "!9 #9 99 9	!9 9
!9 9  "!9 # 9  BL  ÀsetContentSize	row_rowSpace_bottomtopheightcolumn_columnSpace_
right	leftpadding_
widthviewRect_new	UIPageViewItem self  (item $itemW itemH  K   {6  99  BL  items_insert
tableself  item   à 
  C+  6  9 BX X ERû  XL    X6 99  B  9 9 BL  curPageIdx_reloadremove
tableitems_ipairs
self  item  itemIdx   i v   P   ª4  =    9 9 BL  curPageIdx_reloaditems_self   6   ¼=  L  touchListenerself  listener      U¥Ì*, 4  =  6 9 BX 9	B	ERû  9 B  9 B )  XL  )   X)  ) M
  9  B 
 9+ B6 9	9
   B
  9
  BOí  X)  X) X X = 9  8 9+ B9  8 99 99 9B6 9 BX 9	B	ERûL  releaseyxviewRect_setPositioncurPageIdx_addChildinsert
tablesetVisiblecreatePage_getPageCountremoveAllChildrenretainitems_ipairspages_


      !!!!""""!%%%%&&&%%)self  Vidx  Vpage TpageCount  T  i v    i 0  i v   Ñ 	  8c)   X  9  B XL  9  X  XL    X  9   B  9   BX9 9 8 9+ B9 8 9+ B9 8 99 99 9	B=   9
 5 BL   	namepageChangenotifyListener_yxviewRect_setPositionsetVisiblepages_scrollPagePosresetPagePoscurPageIdx_getPageCount					





self  9pageIdx  9bSmooth  9bLeftToRight  9 s   ©6  96 99 B9 9 "#D 	row_column_items_	nums
table	ceil	mathself   )   
¶9  L curPageIdx_self   +   Ä=  L  
bCircself  bCirc   ¨  iÍÌ#6  9B+  9 9 " " , 9 99 9!9 9!9	 9	 	 	"	!9 #9 9
9 9!9 9!9 9	 	 	"	!9 #+ ) 9	 )
 M6) 9 ) M.9 8   X+ X' 9 B 96 9* * B A 99 9 9	 " " !9 9
9 9! 9 "!"! BOÒ  XXOÊ
 9BL setTagsetPositionpccsetAnchorPointaddChilditems_rowSpace_bottomtopheightcolumnSpace_
right	leftpadding_
widthviewRect_column_	row_newNodedisplayÿ¸							
    "self  jpageNo  jpage fitem ebeginIdx _itemW ^itemH  ^bBreak ?7 7 7row 5/ / /column - ë  	 :ñ  X9    9 6 999	B A9=9=6 9 6 99	9
B C rectContainsPointheight
widthyxpccconvertToWorldSpaceviewRect_self  event  rect  viewRect  Û   8Hú9  X  9  B  X6 ' B+ L 9  X  9 B+ = X9  X+ = 9	9
!=   9 9 BX9  X9   X  9 BX  9 B  9  B+ L onClick_resetPages_scrollAuto
endedscroll
prevXx
speed
movedbDrag_stopAllTransition*UIPageView - touch didn't in viewRectprintInfoisTouchInViewRect_
began	name			


self  9event  9 º   #
9  9 8 9B9 9 XK    9 B  9 9 BK  gotoPagedisablePagexviewRect_getPositioncurPageIdx_pages_				
self  x y   ô  SÃ®19  +  9 9+  9  !9   X	,	 )
  
 X
	 !	X
  	  X
6
 9

 B
6 9	 B
 X
	 X
 X
  X
	 X
 6 9
 B9	 8			 9		B	)
  ) M
)   X  		X  !		$	 X 9 8  X
 9+ B 9		 9 9
BO
äK  ysetPositionsetVisiblegetPositionabs	math
bCircpages_
widthviewRect_curPageIdx_ 	


 !!#$%'(()++,,----......1self  Tpos  TbLeftToRight  TpageIdx Rpage QpageWidth Odis Ncount LdisL disR  disABS !&x !  i  Ú  1-   9   -    -    - $  	   X-  -  =  -   9B-   95 BK   ÀÀ 	namepageChangenotifyListener_disablePagecurPageIdx_ self dis count pageIdx 	 ß \Öé<9  +  9 9+  9  !9   X	,	 )
  
 X
	 !	X
  	  X
6
 9

 B
6 9	 B
 X
	 X
 X
  X
	 X
 6 9
 B9	 9		"
)  ) M)   X X  $	 X 9 8  X 9+ B6	 9
 5 
 =BOå6	 9
9 9  85 
 =3 =B2  K  onComplete  	time³æÌ³æÌþy  	time³æÌ³æÌþy moveBytransitionsetVisiblexabs	math
bCircpages_
widthviewRect_curPageIdx_ 	


   !!#$&''(**++,,,,----..-11111122;;1<<self  ]pos  ]bLeftToRight  ]pageIdx [page ZpageWidth Xdis Wcount UdisL disR  disABS !/x -movedis ,  i   	  $§6  9 BX6 9 BERúK  stopTargettransitionpages_ipairsself    i v   ª   :­	9  +  6 9 BX9   X
 9+ BER÷K  setVisiblepages_ipairscurPageIdx_	self  pageIdx page 
 
 
i v   ã  	u­¸(4  +  9    X9   X)  +  	  XK  Xa	 X6 9 + B6 9 9  9	 8	BXR	 X49  9 8 9B9 9 X	  9 +
 B   X+ 6 9	 
 B6 9	 9
  9 8

BX16 9	 +
 B6 9	 9
  9 8

B6 9	   9
 + B
 AX  9 + B   X+ 6 9  B6 9 9  9	 8	B6 9 
  9 + B A  9  	 BK  scrollLCRPagesgetNextPagexviewRect_getPositioncurPageIdx_insert
tablepages_ 	

 """""#######$$$$$$$$'''''(self  vdis  vthreePages tcount spage kposX -posY  - Â  <|â, :::
 9 B	   
 9  B9 9!  X6 
 B X
 9  B
 9B  X
 9+ B9 9    X
 9  B
 9B  X
 9+ BK  setVisibleisVisibleboolean	type
widthviewRect_setPositiongetPosition					self  =threePages  =dis  =posX ;posY  ;pageL :page 9pageR 8 ´   -   -   9+ B=  -     9  B -     9  5 B K   À 	namepageChangenotifyListener_disablePagegetNextPageIndexcurPageIdx_self  t   
©-     9   B -     9  5 B K   À 	namepageChangenotifyListener_disablePageself  ´   ¶-   -   9+ B=  -     9  B -     9  5 B K   À 	namepageChangenotifyListener_disablePagegetNextPageIndexcurPageIdx_self  t   
À-     9   B -     9  5 B K   À 	namepageChangenotifyListener_disablePageself  Ú	 «ÿK9  9 8  9 + B  9 + B+  9B9 9!9 99	 9		 	9	 9		9
 9

!	
	9
  

 	
  X2 X	
 X, 9 9  X9 )
  X9 )   X9   X) 
 X+ X 9 9  X9  )
  X9   9	 B  X9   X) 
 X+ )   X*  X6
 9 5 ==3 =B6
 9 5 9 9==BX>6
 9 5 9 9==3 =B  X16
 9 5 =	=BX)  X6
 9 5 =	=3 =B6
 9 5 9 9==BX6
 9 5 9 9==3 =B  X6
 9 5 ==B2  K  K   	time³æÌ³æÌþ  	time³æÌ³æÌþ 	time³æÌ³æÌþ  	time³æÌ³æÌþ 	time³æÌ³æÌþ  	time³æÌ³æÌþ 	time³æÌ³æÌþonComplete y 	time³æÌ³æÌþmoveTotransitiongetPageCount
bCirc
speed
widthxviewRect_getPositiongetNextPagecurPageIdx_pages_ 					$$%%%%&&&&%&(((())))--(..////00/244555566;;5<<<<====<=????@@@@DD?EEFFFFGGFKKself  «page §pageL £pageR bChange posX posY  dis pageRX pageLX count  ¥  iÀÌ$, 9  99 9!9 9!9 9  "!9 #9  99 9!9 9	!9
 9  "!9 #5 ==+  ) 9 ) M/9
  9

9  9 

9 9!

"	!

 	9
 "!

=
)
 9 ) M
9  99 9  9  " =  9   B  X 	9 " X
O
è  X
XOÑ  XK  9 9 "9  "   9 5	 9
 8

=
	=	BK  itemIdx	itemitems_ 	nameclickednotifyListener_curPageIdx_isTouchInViewRect_xy  	row_rowSpace_bottomtopheightcolumn_columnSpace_
right	leftpadding_
widthviewRect_
!!!"""#!$self  jevent  jitemW hitemH  hitemRect !GclickIdx F0 0 0row .  column  }   ò9    XK  = 9 =9   BK  curPageIdx_pageIdxpageViewtouchListenerself  event      +ü9    XK  9    X9   )  XK    9  B9  8L getNextPageIndexpages_				self  bRight  pos  ¤  29   +    X9  X9  9   X $	 X L 
bCirccurPageIdx_pages_ 			
self  bRight  count pos    9 = ¡6   ' B 6 ' 3 B3 =3 =3
 =	3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3  =3" =!3$ =#3& =%3( ='3* =)3, =+3. =-30 =/32 =134 =336 =538 =72  L  getNextPageIndex getNextPage notifyListener_ onClick_ scrollAuto scrollLCRPages scroll disablePage stopAllTransition scrollPagePos resetPagePos resetPages_ onTouch_ isTouchInViewRect_ createPage_ setCirculatory getCurPageIdx getPageCount gotoPage reload onTouch removeAllItems removeItem addItem newItem 	ctor UIPageView
class.UIPageViewItemimport# # # % % * % Z H o e  {   ° ª À ¼ ö Ì +)86HDoLxqz¤ß®%é+'6-`8}bÊðÌúòü
  UIPageViewItem :UIPageView 6  