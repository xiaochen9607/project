LJL@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\sprite\SpineAni.lua�   	5 6 99=6 99=6 99=	6 99
==  4  = K  changedParteventSpANIMATION_EVENTcompleteSpANIMATION_COMPLETE
endSpANIMATION_ENDstartSp  ANIMATION_STARTEventTypespeventType	self   � 
 =c-   9 B+  6 98  X
�6 9 96 98B X#�6 9 9B 9	6
 89B  X�X�6 9 96
 896
 896	
 8		9		B 6 9< 9B= 9' BL  �completeSpaddEventListener
spineretain
scale
atlascreate	jsonConfig_SpineisFileExistgetInstanceFileUtilscccreateWithCacheSkeletonAnimationspspineCacheResourceManagernew














SpineAni self  >id  >logic 9spine 8 l   (!9  <  9   BK  setAttachmentchangedPartself  	slotName  	attachName  	 a   '&9   9  BK  setAttachment
spineself  slotName  attachName   p   	/*9   9 	 
  BK  addAnimation
spineself  
track  
name  
loop  
delay  
 c 
  &.9   9  	 BK  setAnimation
spineself  	track  	name  	loop  	 { 	  429   96 6 BK  attachNameslotNamesetMix
spineself  fromAnimation  toAnimation  time   >   69   9BK  getTimeScale
spineself   K   :9   9 BK  setTimeScale
spineself  scale   _   >9   9 B4  = K  changedPartsetSkin
spineself  	skinName  	 K   D9   9 D getNodeForSlot
spineself  slotName   �  QH-    X�6 9- 9B)   X�6 - 9BH�-  9	 
 BFR�-   X�-   BK  � ��setAttachment
pairschangedPart	nums
tablecompleteSp


eventType self callBack event   	 	 	k v   �  	(G9   93 9 8B2  �K  eventType registerSpineEventHandler
spineself  
eventType  
callBack  
 �   Ld 9 B  9 B 9 B 9B99 X�99 X�+ L + L heighty
widthxgetBoundingBoxconvertToNodeSpacegetLocationgetCurrentTargettouch  event  target location point box  F    x  9  BK  getLocationtouch  event  location  � 	
 V}  9  B 9B 9 B 9B99 X�99 X�-  9
  X�-  9'	 BK   �
endedtouchCallbackheighty
widthxgetBoundingBoxconvertToNodeSpacegetCurrentTargetgetLocation				self touch  event  location target point box  �  X�WH X	�9  
  X�9   99 B2 L�9  X�9 
 X�= +  3 3 ) 3 9 9  X(�9 6	 9				 9	
	B	=	9 9
 9+ B9 9
 9 6 99B9 9
 9 6 99B9 9
 9 6 99B9 9   X�9 9	 	 9		B	=	 9 9 
 99 99 B2  �K  K  +addEventListenerWithSceneGraphPrioritygetEventDispatcherEVENT_TOUCH_ENDEDEVENT_TOUCH_MOVEDEVENT_TOUCH_BEGANHandlerregisterScriptHandlersetSwallowTouchescreateEventListenerTouchOneByOnecc
spine   touchCallbacklistenerremoveEventListenereventDispatcher						
$%244445555555777777888888888999999999:::::::::>>>>??????AAAAAAAAHHself  Xsw  XtouchCallBack  XtouchBeginPoint DonTouchBegan ConTouchMoved Btest AonTouchEnded @ K   �6   9  BK  removeEventsEventManagerself   �   !- �6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   dispose setTouchEnabled addEventListener getNodeForSlot setSkin setTimeScale getTimeScale setMix setAnimation addAnimation setAttachment replaceCloth create 	ctorSpineAni
class $!)&-*1.5296=:C>FDVG�W����SpineAni   