LJR@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\framework\cocos2dx\NodeEx.lua   +6  99 9 9 9 B6  9  D rectContainsPointheight
widthyx	rectccrc  pt  rect  © 	  .0  9  6 98B  X  X  9   BL  setPositionANCHOR_POINTSdisplaysetAnchorPointself  anchorPoint  x  y    
 J66  94 6 9 9	 B>6 9 9	 B ?  B6 9 9 B  9  BL runActionRepeatForeverCallFunccreateDelayTimeccsequencetransitionÀself  callback  interval  seq action  â 
 ;@6  94 6 9 9	 B>6 9 9	 B ?  B  9  BL runActionCallFunccreateDelayTimeccsequencetransitionÀself  callback  delay  action    9I+  6  9  ' B  X   B 5 9=9==5	 9=9
=
=-  =L ÀcontainsPointheight  
width	sizey  xorigingetCascadeBoundingBoxgetcfunction
tolua		
isPointIn self  rc func   	  C`  9   B+    X  9 B X  9 B 6 9  B  X+ L + L rectContainsPointccgetBoundingBoxgetCascadeBoundingBoxconvertToNodeSpace							

self  point  bCascade  nsp rect  <   o  9  + BK  removeFromParentself       	sK  self       	vK  self       	yK  self       	|K  self       	K  self   ß  $99   X-   9BX X-   9BX X-   9BX X-   9BX	 X-   9
BK   ÀonCleanupcleanuponExitTransitionStartexitTransitionStartonEnterTransitionFinishenterTransitionFinishonExit	exitonEnter
enter	name					

self event  %name #   !@  X9    X  9 9  B+  =    X3   9 -  9 B=  X	9    X  9 9  B+  =  2  L   ÀNODE_EVENTaddNodeEventListener removeNodeEventListener__node_event_handle__c self  "enabled  "listener  " Õ  @¡
6  9  ' B    B-    XK    X  9 BK  setBaseNodeEventListenersetTouchEnabledgetcfunction
tolua
flagNodeTouchInCocos self  enable  func    	#Á-   9 - 95 > >D  À     PressedKEYPAD_EVENTEventDispatcherself c keycode  
event  
   	#Å-   9 - 95 > >D  À     ReleasedKEYPAD_EVENTEventDispatcherself c keycode  
event  
 Î B¸­%-    X  9   B2 89   X+ 7 6  X2 0= 9   X	  9 B 99 B+  =   X3 3 6 9	 9
B 9 6	 9		9		B 9 6	 9		9		B  9 B 9	 
  B= 2  L  K  L   À+addEventListenerWithSceneGraphPriorityEVENT_KEYBOARD_RELEASEDEVENT_KEYBOARD_PRESSEDHandlerregisterScriptHandlercreateEventListenerKeyboardcc  removeEventListenergetEventDispatcher__key_event_handle___enable_keyboardEnabledsetKeyboardEnabled     !$$flagNodeTouchInCocos c self  Aenable  AeventDispatcher onKeyPressed 	onKeyReleased listener eventDispatcher    *Ô-    X  9  D 9   X+ 7 6 L enable_keyboardEnabledisKeyboardEnabledflagNodeTouchInCocos self   k  â-   9 - 9  BK   À NODE_ENTER_FRAME_EVENTEventDispatcherself c dt  	 Þ >Ü-    X6  9  ' B  B2 3   9  )  B2  K  K   À"scheduleUpdateWithPriorityLua scheduleUpdategetcfunction
tolua




flagNodeTouchInCocos c self  listener  `  ë-   9 - 9  BK   À  NODE_EVENTEventDispatcherself c evt  	  é9    X2 3 =    9 9  B2  K  K   ÀregisterScriptHandler _baseNodeEventListener_c self   ç 9£ñ%-    X6  9  ' B   	 
  BK    X)  9   X4  =   9 B9 9   X)   = 8  X4  <85 ===	=
-	 9			 X	>X	6	 9		  B	9	 L	  Àinsert
tableNODE_ENTER_FRAME_EVENTpriority_	tag_listener_index_ enable_removed_!_nextScriptEventHandleIndex_setBaseNodeEventListener_scriptEventListeners_addNodeEventListenergetcfunction
tolua		


!!!!!$$flagNodeTouchInCocos c self  :evt  :hdl  :tag  :priority  :luaListeners_ idx eventListeners_ lis  Ø 
0-    X6  9  ' B  X    D K  9   XK  6 9 BH6 	 BX
9 X6 9 
 B 	  X  9	  BK  E
R
îFRèK  $removeNodeEventListenersByEventremove
tableindex_ipairs
pairs_scriptEventListeners_removeNodeEventListenergetcfunction
tolua 				





		flagNodeTouchInCocos self  1listener  1func 	  evt liss    i v     7\®-    X	6  9  ' B   BK  9   X'9 8  X#- 9 X  9 + BX- 9 X  9 BX- 9 X  9	 BX- 9
 X  9	 B9 +  <K   ÀNODE_TOUCH_CAPTURE_EVENTremoveTouchEventNODE_TOUCH_EVENTunscheduleUpdateNODE_ENTER_FRAME_EVENTsetKeypadEnabledKEYPAD_EVENT_scriptEventListeners_$removeNodeEventListenersByEventgetcfunction
tolua				



flagNodeTouchInCocos c self  8evt  8  	 %DÃ-    X6  9  ' B  BK    9 - 9B  9 - 9B  9 - 9B  9 - 9B  9 - 9BK   ÀKEYPAD_EVENTNODE_TOUCH_CAPTURE_EVENTNODE_TOUCH_EVENTNODE_ENTER_FRAME_EVENTNODE_EVENT$removeNodeEventListenersByEvent removeAllNodeEventListenersgetcfunction
tolua					




flagNodeTouchInCocos c self  & t  Ð
+  	   X'  X	  X' X6   B L tostring	menu	back 	code  key  Ö  ~§ÜK  + , -  9  X5 =  X+ X-  9 X X-  9 X:: X	+	 L	 5	 =	-
  B
=
			 X  + 6
 9 X+ + +	  9
 
 X9
8	
 	 X
76
 	 B
X19  X+ X,  X9 X+ =9  X"9 B7 6   X6
 9 X9 X X+ X6
 9 X	9 X+ =  X6 X  X6 ERÍ  X
 9
+ B
 9
B
 9
B
 9
B
L  ÀÀunregisterScriptHandlerremoveTouchEvent removeAllNodeEventListenerssetTouchEnabledNODE_TOUCH_EVENT
movedlistenerRetlistener_enable_
beganremoved_ipairs_scriptEventListeners_NODE_TOUCH_CAPTURE_EVENTcckey	code  ReleasedKEYPAD_EVENTNODE_ENTER_FRAME_EVENTcleanup	name  NODE_EVENT			

 !!!""$$%%%%&&&'')))))**---....///000012222345555666779999;;;%%CCDDDDEEEFFFGGGJc KeypadEventCodeConvert self  idx  data  obj }flagNodeCleanup |event {touch_event  {code ename rnval UflagNeedClean Olistener N
4 4 4i 1v  1evtname  ö  7 AÊ §6   9 6  9= 6  9= 9 = 9 = + 9  X+ 3	 3 =
3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3! = 3# ="3% =$3' =&3) =(3+ =*3- =,3/ =.31 =033 =234 36 =52  K   EventDispatcher   removeAllNodeEventListeners $removeNodeEventListenersByEvent removeNodeEventListener addNodeEventListener setBaseNodeEventListener scheduleUpdate isKeypadEnabled setKeypadEnabled setTouchEnabled setNodeEventEnabled onCleanup onExitTransitionStart onEnterTransitionFinish onExit onEnter removeSelf hitTest getCascadeBoundingBox performWithDelay schedule 
align removeTouchEventTOUCH_MODE_ONE_BY_ONETOUCH_MODE_ALL_AT_ONCETOUCHES_ONE_BY_ONETouchesOneByOneTOUCHES_ALL_AT_ONCETouchesAllAtOnce	Nodecc   # # # $ $ $ % % & & ( ) ) ) ) . 4 0 > 6 G @ T I m ` q o t s w v z y } |     « ¡ Ò ­ Ú Ô ç Ü ï é ñ ,A.NCZ§\§§c @Node ?flagNodeTouchInCocos 4isPointIn /KeypadEventCodeConvert +  