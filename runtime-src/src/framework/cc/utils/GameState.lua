LJU@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\framework\cc\utils\GameState.lua  '6  9  ) 6  9-  B A-   X+ X+ L ÀlensubstringencodeSign contents   É  U-  9   B- 9 - &B-  9 5 ==B-  &L ÀÀÀsh  md5encodejson crypto secretKey encodeSign values  s hash 
contents  ¸ 
@©6  9  6  9-  B B- 9 B6  B X6 ' B5	 - 9=
L 99- 9 - &B X6 ' B5 - 9=
L - 9 B6 	 B X6 '	 B5 - 9=
L 5 =L ÀÀ ÀÀvalues    -GameState.decode_() - invalid state data  ERROR_HASH_MISS_MATCH*GameState.decode_() - hash miss matchmd5sherrorCode   ERROR_INVALID_FILE_CONTENTS+GameState.decode_() - invalid contentsprintError
table	typedecodelensubstring		





encodeSign json GameState crypto secretKey fileContents  Acontents 
7j 3hash $s  $testHash values  · 		 )66    B X6 ' B+ L .   6   B X. 6   B X. -  5 - 9B=6  - B X+ X+ =B+ L  ÀencodefilenamegetGameStatePath 	name	initstring-GameState.init() - invalid eventListenerprintErrorfunction	type	eventListener stateFilename secretKey GameState eventListener_  *stateFilename_  *secretKey_  * Ö  	 O¾O$-   9   B 6 9  B  X
6 '   B- 5 -  9=D 6 9  B6 '	   B+  + -   X-  B  X-  B9  X- 5
 9=D 9+ X- 9 B 6  B X	6 ' B- 5 -  9=D - 5 ==6 9B=D  ÀÀ	ÀÀ	timeosencode 	name	load ERROR_INVALID_FILE_CONTENTS 	name	load$GameState.load() - invalid dataprintError
table	typedecodevalues 	name	load,GameState.load() - get values from "%s"readfileerrorCodeERROR_STATE_FILE_NOT_FOUND 	name	load+GameState.load() - file "%s" not foundprintInfoexistsiogetGameStatePath				 !""""#GameState eventListener secretKey isEncodedContents_ decode_ json filename Lcontents 8values 3encode 2d 
 Ê 
 ;u-  5  = 6 - B X+ X+ =B6  B X6 ' B+ L - 9B+ -   X	6	 9
 - 	 B A X- 9 B6  B X6	 9
  B 6 '  BL  ÀÀÀ(GameState.save() - update file "%s"printInfowritefileiogetGameStatePath4GameState.save() - listener return invalid dataprintError
tableencodestring	typevalues 	name	saveeventListener secretKey GameState encode_ json newValues  <values .filename !ret  s     6   9  6 9' ' B 6 9-  &  L  directorySeparator[\\/]+$writablePathdevice	gsubstringstateFilename  º   2± 4   )ÿÿ=  )þÿ= )ýÿ= 6 6 9' &B6 6 9' &B' '	 , 3
 3 3	 3
 =
 3
 =
 3
 =
 3
 =
 6
  
 X4
  7
 6
 6 9  X4  =
6
 9

= 
2  L  
State
utils getGameStatePath 	save 	load 	init   state.txt	=QP=
.json.cryptoPACKAGE_NAMEccrequireERROR_STATE_FILE_NOT_FOUNDERROR_HASH_MISS_MATCH ERROR_INVALID_FILE_CONTENTS						2M6sOuGameState 1crypto %json encodeSign stateFilename eventListener secretKey  isEncodedContents_ encode_ decode_   