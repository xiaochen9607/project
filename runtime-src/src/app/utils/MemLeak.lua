LJJ@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\utils\MemLeak.luaÀ   /K9    X9   X  9 ' BK  4  4  =4  =4  =)  9    X=  ) X9   X= ) =   9 B  9	 B  9 '
  ' 6	 9		B	 AK  	timeos time: cache stage: searchGlobesearchRegistrynowCachemarkedUserdatamarkedFunctionmarkedTable,You had two caches, please differ them!printsmemCache2memCache1		self  0markedMap #stage  b  
.	  X9  L X	 X9 L K  memCache2memCache1self  index   |   6+  =  +  = +  = 4  = 4  = K  parentsValuerelationnowCachememCache2memCache1self    +>  9   B  X  9 '  BK  )  9-   BH FRý9-   BH FRý9-   BH FRý  9 ' 	 BK   Àobject count: markedFunctionmarkedTableerror index!printsgetCacheByIndex	





pairs self  ,index  ,marked 'count 	tb1   k v    k v    k v   ñ ½Y:  9  ) B  X  9 ' BK    9  ) B  X  9 ' BK    9 ' B)  4  99999	9
-   BH8  X  9   B  9	    	   B FRì-   BH8  X  9   B  9	    	   B FRì-  
 BH8	  X  9   B  9	    	   B FRì  9 '
  B  9 ' B  9 ' B-   BH  9   BFRù  9 ' B  9 B  9 B  9 BK   ÀclearCacheflushOutputprintRelationparents list: 
object count: findDiffersParentsprintResultmarkedUserdatamarkedFunctionmarkedTable
new objects list: you don't have cache2you don't have cache1printsgetCacheByIndex				
 $$$$%%%&&&&&'''''''''($$,,,,,----////000011111003333555666777:pairs self  marked1 marked2 count udiffers ttb1 rtb2  rfunc1 pfunc2  puser1 nuser2  n  k v    k v    k v  $  key value   ¨   !:,	 )
  ) M
88	8  X 	 X8	X 	 X8	X 	 X
<	  9       	 BO
æK  findDiffersParents		

self  "differs  "tb  "func  "user  "key  "value  "parents  parentKey parentValue    i   	<¨  9   B  X  9 '  BK    9 '  B)  -  9BH  9	   B	 FRø-  9BH  9	   B	 FRø-  9BH  9	   B	 FRø  9 '  BK   Àobject count: markedUserdatamarkedFunctionprintResultmarkedTableshow cache index: error index!printsgetCacheByIndex				




		pairs self  =index  =marked 8count *	 	 	k v  	 	 	k v  	 	 	k v   Í   ?Ã
  X9   X9  X	9  X9  X9  X+ L K  memCache2memCache1parentsValuerelationnowCache
self  object  varType  parent  desc   è 	4±Ï+  9   X	  9 
    B  X+ L 9X X9X X9-  	 B-  
 B8	 	 X
4
 >
5 >>
><X
	:
	
 
>
	:
	
  <
+ L +
 L
 À  markedUserdatauserdatamarkedFunctionfunctionmarkedTablefilter
tablenowCache		

tostring self  5object  5varType  5parent  5desc  5marked 3markedMap 2keyString parentString tb parents parents 
   Ní
-   B  X  9  	 
 BX X  9  	 
 BX X  9  	 
 BK  ÀsearchUserdatauserdatasearchFunctionfunctionsearchTable
table
type self  object  parent  desc  varType  1   ù'  L self  object  fixdesc  ¢  A¨ÿ  9   B  &  9  '	 
  B  XK  6 9 B  X  9 	 
 ' B+  -  	 BH
- 
 B  X
 X X- 
 B X  9 
  '	 B'
   9    BF
R
âK   ÀÀÀ[value]
[key]numberstring[metatable]searchObjectgetmetatable
debug
tableisMarkedfixTableDescpairs type tostring self  Bobject  Bparent  Bdesc  Bfixdesc =meta ,keytype 	#  key value     
76  9 B-  ' 99BL Àlinedefinedshort_src:[%s:%d]getinfo
debugstringFormat self  func  info fixdesc  Ö  'c  9   B  &  9  '	 
  B  XK  ) U6 9 	 B  XX X' 
  9    B XìK  searchObject[upvalue]getupvalue
debugfunctionisMarkedfixFunctionDesc		
self  (func  (parent  (desc  (fixdesc #i name value   8   $±'  L self  object  desc  fixdesc  ¦   Q·
  9    B  &  9  '	 
  B  XK  6 9 B  X  9 	 
 ' BK  [metatable]searchObjectgetmetatable
debuguserdataisMarkedfixUserdataDesc
self   object   parent   desc   fixdesc meta 	 R   Ã  9  6 ' B AK  
countcollectgarbageprintsself   Á   Ç  9  ' 6 ' B A  9  6 ' B A  9  ' 6 ' B AK  after collect: collect
countcollectgarbagebefore collect: printsself   M   Í  9  6 )  ' BK  [globe]_GsearchTableself   y   
Ñ6  9B  9  )  ' BK  [registry]searchTablegetregistry
debugself  registry  ó TÖ'  ) -  ' G A) M-   G	 A  X'   - 
 B'	 &	Oò ' &9  9 BK  ÀÀ
writeoutput
	#select tostring self   outStr   i temp  e   	à  X  9  ' BK  = K  outputerror output!printsself  
output  
 9   è9   9BK  
closeoutputself   9   ì9   9BK  
flushoutputself   Î   ð	::::'  ) 	 )
 M
  9  8B8'  &Oö-  '
      B  9	  B	K  Àprints/object:%s	desc:%s	type:%s	ref:%s	parent:%s	intoRelation	stringFormat self  !key  !value  !ref varType  parents  desc  str2   i 	str1  |  
;û	9  8  X) <X <K  parentsValue	self  object  parent  parentsValue 	value  ð  F9    9 ' B-   BH	  9 '
  &

'  BFRö  9 ' BK   À
value count:parent:value count list:printsparentsValuepairs self  parentsValue   k v   |   &6  6 9 ' B A   9  BK  setOutputw	openioassertself  filename  file  E     9   BK  createOutfileself  filename   ë  G KÛ ¤6   6 6 6 6 6 95 4  =4  =	6
 9=3 =3 =3 =3 =3 =3 =3 =3 =3 =3  =3" =!3$ =#3& =%3( ='3* =)3, =+3. =-30 =/32 =134 =336 =538 =73: =93< =;3> ==3@ =?3B =A3D =C3F =E2  L  	init createOutfile printRelation intoRelation printResult flushOutput closeOutput setOutput prints searchRegistry searchGlobe memCollect memCount searchUserdata fixUserdataDesc searchFunction fixFunctionDesc searchTable fixTableDesc searchObject isMarked filter showCache findDiffersParents differCache markedCount clearCache getCacheByIndex cacheMemoryoutputstdoutioparentsValuerelation  formatstringtostringselect	type
print
pairs               ,  4 . < 6 W >  Y ¦  Á ¨ Í Ã ë Ï ÷ í ý ù ÿ /51A7ECKGOMTQ^Vf`jhnlyp{pairs Jprint Itype Hselect Gtostring FstringFormat DMemLeak <  