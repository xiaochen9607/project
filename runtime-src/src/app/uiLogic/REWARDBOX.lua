LJN@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\REWARDBOX.lua    	K  self   �  r
-  
 9 B= =   X	� 9	  B	=	X	� 9	     B	L  �addTouchEventcreateUI	view
title
paramnew	REWARDBOX self  param  title  node  nodeSize  touchPos  touchAp  boxPos  logic  � #��%B  9  B6  9' B4    X�' 6  B X�6  9 '		 B X�6  B
 X�  9' B 9'	 B	 9'
 B
 9 B ,	
 -   X	�)   9+ B 9+ B-  X�- 96 9 B"-   	- 9  -  
X�- 9"-   	- 9 -  
 X�6 9	 - B	  9B-  !	= 9 B 9 
!B 9 
 !B 9	 
 B)  ) MK�6  9' B= )  )  -  X�6 9 B X�- 96 9 B"!- 9! 	!-  - 9" - 9 !	 X�)   
 !- 9 ! 99 B9  9  B6 ' B 9 9 8+ B= 9  9!BO�=" L ������	viewshowNamecreateapp.uiLogic.ICONrequireiconLogicsetPositionaddChildui/common/Icon.luaiconNodesetPositionYsetContentSizegetContentSizemaxheight	ceil	math
widthsetVisiblesetStringText_TitleImage_LineImage_ContentgetChildByName
table,
splitStringUtilstring	typeui/common/RewardBox.luagetNodeFromCacheUIManagercleanFloatBox					
!!""""""%%%&&&&''''((((())))))+++++////0000001122222222233333333444666666666666778:::::::;;;;<<<<<<==========>>>>/@ATOPORI MAXINWIDTH NODESIZE LEFT BOTTOM MINWIDTHPIXEL self  �param  �title  �view 	�rewardNodes �Image_Content �Image_Line �Text_Title �num �width �height  �TOP �lineContentSize 5iL L Li Jx By  B =   i=  = K  
tilte
paramself  param  title   2   n=  K  isTouchEnabledself  flag   �   (�-   9   
   X �6  9  -  9 B -   +  =  -   9     X �K  6    9  - B 
  X �-    9  B K   �	�removeFromParentcheckObjIsNullGameGlobalisTouchEnabledunscheduleGlobalschedulerdelayToShowTickId				self view  �   (�-   9   
   X �6  9  -  9 B -   +  =  -   9     X �K  6    9  - B 
  X �-    9  B K   �	�removeFromParentcheckObjIsNullGameGlobalisTouchEnabledunscheduleGlobalschedulerdelayToShowTickId				self view  �  Z��-    9   - 9- 9B .   -    9  B   9  -  B -  
   X �-     9  - B X ?�-    9  B   9  6 9-  9	B A  A 6 9-  9	B A , -   9
B)d 9 6 9 X�99 !!X�99   9 6 9 X�99 !X�99  -   9	 
 BK       heightCenterYy
widthCenterXUIManagerxgetContentSizegetPositionpccconvertToWorldSpacesetPositionaddChildgetParent
title
paramcreateUI				
view self node boxPos pix )1nodePos *x )y  )size %offset $ � -�-   9      X �2 	�3  -  6 9  *  B=K  K   �	���performWithDelayGlobalschedulerdelayToShowTickId isTouchEnabled����self view node boxPos show  � T�rU+  
  X� X�	 9 B +  
  X� X�6 9 9
B
 A  6 9
 9' ) B 9	+ B	 9		)  B	 9	
 B	 9	9 9 B	 9	' B	 9	)c B	 9	 B	
  X	� 9	 B	+	  3
 3 3 6  9 5 =
5 =B 9+ B2  �K  setSwallowTouches  callBack  widgetTouchExtentUIManager   setPositionaddChildsetLocalZOrder
imagesetNameheight
widthsetContentSizesetAnchorPointsetOpacitysetScale9Enabledcommon_yuanbao.pngcreateImageView	ccuigetAnchorPointpccgetContentSize��̙����		%2RSSSSSSSSSTTTTUUself  Unode  UnodeSize  UtouchPos  UtouchAp  UboxPos  UtouchSize SanchorPoint 	Jim 8view &endedCallBack movedCallBack beganCallBack     �6   99 B
 X�9  9BK  removeFromParent	viewcheckObjIsNullGameGlobalself   � 	  s �6   ' B 5 ) )� ) ) ), ) 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 2  �L   cleanFloatBox addTouchEvent setTouchEnabled refreshParam createUI create 	ctor 
widthkheight|REWARDBOX
class	
#g%lipn�r����REWARDBOX NODESIZE MAXINWIDTH MINWIDTHPIXEL LEFT BOTTOM TOPORI TEXTSIZE   