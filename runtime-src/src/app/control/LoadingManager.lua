LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\control\LoadingManager.lua   4  =  + = +  = +  = +  = ) = + = +  = )  = ) =	 ) =
 K  indexKeymaxTryTimestryTimesloadingTickerrealLoadmaxItemWhenStartLoadcurLoadingItemprogressCallBackallCompletedCallBackloading	list		

self   ´ *-   9 B6 6 <6 =6  7 L  ÀindexKey&globalLoadingManagerQueueIndexKeyglobalLoadingManagerQueuenewLoadingManager self  ins 	    &6  6 BH9  X+ L FRù+ L loadingglobalLoadingManagerQueue
pairsself    k v   Ó 	  5!
+  6  6 BH XFRü  X 999BK  allCompletedCallBackprogressCallBackstartLoadglobalLoadingManagerQueue
pairs
self  foundOne   k v   g   ,4  7  ) 7 K  &globalLoadingManagerQueueIndexKeyglobalLoadingManagerQueueself   ,   0  9  BK  
resetself   Õ   3
4  =  +  = +  = + = + = 9   X6 9 +  <+  = K  globalLoadingManagerQueueindexKeyrealLoadloadingprogressCallBackallCompletedCallBack	list		
self   Ï  '>9  	  X)d L 6 99 B9  #)   X)  )d  X)d 6 9'  D 	%.2fformatstring	list	maxn
tablemaxItemWhenStartLoad self  per  ß	  # ËGH6  ' B, + 6 	 BH
~6  9 ' B ::6  ' B 9 X+  9  B9	6  '
 B6  B8
  X`9'  ' &6 9 9B 9 ' 6  ' B9' 6  ' B9&B  XE+ XC9 X  9  BX;9 X9 X  9  B96 9 9B 9B 9  B  X"+ X 9! X  9"  B96  9 ' B:' &6 9 9B 9B 9  B  X+ F
R
L addPnlPNLgetTextureForKeygetTextureCacheDirector	pathaddPngJPGPNGaddMp3MP3DOWNRIGHTapp.const.Const_Dir	IDLEapp.const.Const_Action_getAnimationgetInstanceAnimationCachecc	.pngspriteTexture/modelNametonumberdata.Config_SpriteDataidaddSpriteSPR$app.const.Const_LoadingItemType.
splitStringUtil
pairsapp.utils.StringUtilrequire	
!!!!!!!!!!!!""$%&&&''''())))))***@@@@@@@@@@@@AACGself  arr  tmp type  path  typeConst  allFromCache   k ~v  ~tar &id %data modelName path tar  tar path texture tar path tmp pngPath texture  ¨	  % ú! 9 B6  9B 9 B6 ' B99 X096 '		 B6
 
 B8  X6 
 9 B 9'	 
 ' &		6
 9


 9

B

 9

 ' 6 ' B9' 6 ' B9&B
 
 X+
 L
 +
 L
 X@99 X+ L X999 X99 X9 96 9	 9B	 9B	 9 
 B  X!+ L X99! X96" 	 9#
 '$ B:'	 &	6	 9			 9		B		 9		B		 9	 	 B	 	 X
+	 L	 + L .
splitStringUtilPNLgetTextureForKeygetTextureCacheDirector	pathcurLoadingItemJPGPNGMP3DOWNRIGHTapp.const.Const_Dir	IDLEapp.const.Const_Action_getAnimationgetInstanceAnimationCachecc	.pngspriteTexture/modelNamegetDefaultActionConfig_SpriteDatatonumberdata.Config_SpriteDataidSPR	type$app.const.Const_LoadingItemTyperequiregetTypeByPathgetResourceManagerGameGlobalgetPath						  self  loadingItem  p path ypLPath  ytypeConst vid .data 'modelName 	path path ,path tmp pngPath  · 	P³4 G ?  6  ' B 96  '	 B9 	 
 B6 99 6 99
 B	 BL 	maxn	listinsert
tableSPR$app.const.Const_LoadingItemTypecreate#app.control.LoadingItem_SpriterequireÀself  id  completedCallBack  arg loadingItem  ó   cº+  6  ' B) 9  ) M*9	 8			 9		B		 9	 8		9		9
	
 X	9	 8		9			 X	9	 8		9		:			 X	6	 9				 9	
	B		 9		B		 9		 B	6	 9		9  B	XOÖ6  9  9	 B9 
  X&9 99 X!9 9 X9 9: X9  9B 6 9	 9
B 9B 9 B9 +  =  9 + BK  loadNextcompletedCallBackcurLoadingItem	dumpLoggerremove
tableunbindImageAsyncgetTextureCachegetInstanceDirectorccargidSPR	typegetPath	list$app.const.Const_LoadingItemTyperequire
self  did  dcontext  dpath btypeConst _+ + +i ) Á 	]Ò4 G ?   6  ' B 96  '
 B9	 
  B6 99 6	 9		9 B			
 BL 	maxn	listinsert
tablePNL$app.const.Const_LoadingItemTypecreateapp.control.LoadingItemrequireÀself  pngPath  completedCallBack  arg path loadingItem  Á 	]Ú4 G ?   6  ' B 96  '
 B9	 
  B6 99 6	 9		9 B			
 BL 	maxn	listinsert
tablePNG$app.const.Const_LoadingItemTypecreateapp.control.LoadingItemrequireÀself  pngPath  completedCallBack  arg path loadingItem  Á 	]â4 G ?   6  ' B 96  '
 B9	 
  B6 99 6	 9		9 B			
 BL 	maxn	listinsert
tableMP3$app.const.Const_LoadingItemTypecreateapp.control.LoadingItemrequireÀself  mp3Path  completedCallBack  arg path loadingItem  :   ö-     9   + B K   ÀloadNextself  ³  Z{6   9    9  B   9  B   9  -  B -  - 9 = -  9  - 9  X -  9     X6  9 	 - 9B -  +  = -    9 
 B K  -  9  - 9  X -    9  B X &-  9  - 9  X -    9  B X -  9  - 9  X -  9  - 9  X -    9  B X 
-  9  - 9  X -    9  B K  À ÀÀÀloadPnlPNLloadPngJPGPNGloadMp3MP3loadSpriteSPR	typeloadNextunscheduleGlobalschedulerloadingTickermaxTryTimestryTimesunbindImageAsyncgetTextureCachegetInstanceDirectorccpath self loadingItem typeConst  · zäêP9    X6 99  B+  =    X+   X9 :
  X  9 9 :B  X+   X	3 6 9 *  B=  2  K  9 :  X9 9   9	 B  X  B  9
 B2  K  + = 9   X9   9 B A 9 :6 99 ) B= )  = 6 ' B 9B6  9B 9 B3 6 
 9 B  X9    X	6 99
  B+  =  
  9 B2  K  6 9
 ) B=   B2  K  scheduleGloballoadNextcheckFileExist getTypeByPathgetResourceManagerGameGlobalgetPath$app.const.Const_LoadingItemTyperequiretryTimescurLoadingItemremove
tablegetProgressprogressCallBackloadingglobalQueueNext
resetrealLoadallCompletedCallBackperformWithDelayGlobal checkInCache	listunscheduleGlobalschedulerloadingTicker÷Ñðúáõü     ""#####$&&((()))********BDDDDDDDJJJJJJJJJKKKLLNNNNNNOOPPself  {delayLoad  {boo delayCom tmp tmp2 loadingItem 6typeConst +p (path  pLPath   tryLoad  ÷   2¼=  = 9   XK    9 B  X6  9' 9 BK  6	 9
9 B= + =   9 + BK  loadNextrealLoad	maxn
tablemaxItemWhenStartLoad	list=LoadingManager checkGlobalQueueLoading() = true. return!	dumpLoggercheckGlobalQueueLoadingloadingprogressCallBackallCompletedCallBack						
self  pcb  acb   ª  %Þ	   X+  -  9 9
  X-  9 9- B-   9  BK   ÀÀloadNextcompletedCallBackcurLoadingItem	self arg delay   Ó  sýÏ29  99  99  94  6 ' B9  96 '	 B6 
 B8  X6 
 9	 B 9
'	 
 ' &		3
 6 9 9B 9 ' 6 ' B9' 6 ' B9&B  X
 + B2  K  + = 6 ' B6  9B6 9 X  9  	    
  B	X6 9 X6 9 X  9  	    
  B	X
  9  	    
  B	2  K  PLATFORM_OS_IPADPLATFORM_OS_IPHONEloadSpriteForWindowsPLATFORM_OS_ANDROIDgetCurPlatFormGameGlobalapp.utils.StringUtilrealLoadDOWNRIGHTapp.const.Const_Dir	IDLE_getAnimationgetInstanceAnimationCachecc 	.pngspriteTexture/modelNamegetDefaultActionConfig_SpriteDatatonumberdata.Config_SpriteDataapp.const.Const_ActionrequireargcompletedCallBackidcurLoadingItem





   ((((++++,,,,,,,,,,,--------...........000000000022self  tid qcompletedCallBack oarg mactionHasSnd lactionObj iid gdata `modelName 	Wpath SdispatchCompleteAndLoadNext RplatForm $.    A
  X  X+ L 5 )  ) M8 X+ L Oú+ L   model4model5model6model8model9model10model11model12model13model14model101model102model103model104model105self  modelName  spriteData   i   !ÉÃ_6   9B 96   9B 9B-  B6   9' - ' &B  X-  9+ BK  6 9	 9
B 9' - ' &B4  ) , 6 - 8  X6  9-	 B 95 6 
 BHp 9
  Xl4  <)  ) Mf8+ 9
  X+ ) 9 ) M X+ XOû  XS) 84  <)  )  )d ) M!  ' 6 9'  B' &6 9	 9
B 9 B  X)  88< X )  XXOß6 9 988* ) B - '  '  &6 9 9
B 9  B6   9B 96   9B 9B BOFR6 9	
 9
B
 9' - ' &B- :-	 9		9	 	:			 XK  - BK  ÀÀ ÀÀÀÀargcurLoadingItemremoveSpriteFramesFromFileaddAnimationCacheListaddAnimationAnimationCachecreateWithSpriteFramesAnimationgetSpriteFrame	.png	%04dformatstring_dirLimtapy
pairs  actiongetDefaultActionConfig_SpriteDataaddSpriteFramesgetInstanceSpriteFrameCacheccloadNext.plistspriteTexture/checkFileExistgetCurSceneaddTextureCacheListgetResourceManagerGameGlobalµæÌ³æý					
''''()***+,,,,,--./,334555688889999999999;;;;;;;;;<<=>>>??ACCCE8KKKKKKKKKKMMMMMMOOOOOOOOOOPPPPPPPPPPPPPPP'WWWWWWWWWWWWXXXXXXXX\^^_path modelName self id arg dispatchCompleteAndLoadNext texture  Êarray -index action animation  conf allAction 	dirNeed s s sk pv  p	g g gdn edir dneed c  q hasNotCount N" " "k  frameName 
frame 	tmp    ve6  
 B6	 9			 9		B		 9		B		 9		 3 B	2  K   addImageAsyncgetTextureCachegetInstanceDirectorcctonumberbeeself  id  path  modelName  actionObj  actionHasSnd  dispatchCompleteAndLoadNext  arg  id  6    'ü;K  ;self  modelName  actionObj  arg   y  /À-  
  X-  - B-  9 + BK  ÀÀ ÀloadNextcompletedCallBack arg self succ   É	  >¼9  99  99  93 6  9 B B2  K  preloadSoundManager argcompletedCallBack	pathcurLoadingItem
self  path completedCallBack arg 
cb 	   3Ö	   X+  -  
  X-  - B-  9   BK  ÀÀ ÀloadNext	completedCallBack arg self delay   C   *ç-  BK  ÀdispatchCompleteAndLoadNext texture   ï  AÌ 9  96 9 ' B  X 9  99  96 9 9	B 9
B 9 B6  9B 96 
 9B
 9B	 B3   X + B2  K  + = 6 9 9	B 9
B 9	 3
 B2  K   addImageAsyncrealLoad getCurSceneaddTextureCacheListgetResourceManagerGameGlobalgetTextureForKeygetTextureCachegetInstanceDirectorccargcompletedCallBackcommon	findstring	pathcurLoadingItem															  self  Bpath ?completedCallBack 	6arg 4texture (dispatchCompleteAndLoadNext  µ   .Pí"9  9+  X+ 6  9B6 9 X
 X  9 BX  9 BX6 9 X6 9	 X
 X  9 BX  9
 BX  9 BK  loadPnlForAndroidPLATFORM_OS_IPADPLATFORM_OS_IPHONEloadPnlForWindowsPLATFORM_OS_ANDROIDccgetCurPlatFormGameGlobalui/common/common.pnl	pathcurLoadingItem"self  /path ,bFlag +platForm $   3	   X+  -  
  X-  - B-  9   BK  ÀÀ ÀloadNext	completedCallBack arg self delay   ½  Z³-  :'  &6  9 B  X-  9+ BK  6 9 9B 9   B- BK  À ÀÀaddSpriteFramesgetInstanceSpriteFrameCacheccloadNextcheckFileExistGameGlobal.plist









tmp self dispatchCompleteAndLoadNext texture  plistPath  Ý  ^Ð29  99  99  96  9 ' B:' &:' &6	 9
	 9B	 9B	 9
 B6 
 9B
 96  9B 9B B6 
 9B
 96  9B 9B B3   X		 + B	2  K  +	 =	 6		 9			 9		B		 9		 B	6
	 9



 9

B

 9

B

 9

 3 B
2  K   addImageAsyncfullPathForFilenameFileUtilsrealLoad addFrameCacheListgetCurSceneaddTextureCacheListgetResourceManagerGameGlobalgetTextureForKeygetTextureCachegetInstanceDirectorcc.plist	.png.
splitStringUtilargcompletedCallBack	pathcurLoadingItem												"""""""""""0"22self  _path \completedCallBack Zarg Xtmp RpngPath OplistPath Ltexture @dispatchCompleteAndLoadNext !xx    3Ö	   X+  -  
  X-  - B-  9   BK  ÀÀ ÀloadNext	completedCallBack arg self delay   ¬  fîÅ19  99  99  96  9 ' B:' &:' &:'	 &:'	 &	6	
 9			 9		B		 9		B		 9		 B	6
 
 9

B

 9

6  9B 9B B
6
 
 9

B

 9

6  9B 9B B
3
  	 X
 + B2  K  + = 6  9 B  X  9 + B2  K  6
 9 9B 9 B
 B2  K  addSpriteFramesSpriteFrameCacheloadNextcheckFileExistrealLoad addFrameCacheListgetCurSceneaddTextureCacheListgetResourceManagerGameGlobalgetTextureForKeygetTextureCachegetInstanceDirectorcc	.pkm.plist	.png.
splitStringUtilargcompletedCallBack	pathcurLoadingItem			!!$$$$$$$&&&&'')))))))))**11self  gpath dcompletedCallBack barg `tmp ZpngPath WplistPath TplistPkmPath QplistPath Ntexture BdispatchCompleteAndLoadNext # ¹  8 = ú4   7   )  7  6  ' B 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 3' =& 3) =( 3+ =* 3- =, 3/ =. 31 =0 33 =2 35 =4 37 =6 2  L   loadPnlForAndroid loadPnlForWindows loadPnl loadPng loadMp3 loadSpriteForAndroid loadSpriteForWindows isSprite8Dir loadSprite startLoad loadNext addMp3 addPng addPnl removeSprite addSprite checkInCache addByArray getProgress 
reset dispose #resetGlobalLoadingManagerQueue globalQueueNext checkGlobalQueueLoading create 	ctorLoadingManager
class&globalLoadingManagerQueueIndexKeyglobalLoadingManagerQueue              + ! / , 2 0 = 3 E >  G ±  ¹ ³ Ð º Ø Ò à Ú è â :ê M<Où7üJ<lLmÃöÅúúLoadingManager 6  