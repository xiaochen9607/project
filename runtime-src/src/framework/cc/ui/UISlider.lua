LJQ@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\framework\cc\ui\UISlider.lua*    #6   9  D  newNodedisplay P  -   9 9 9 9 D  Àyx	nameonTouch_self event    = ¯T24  =  6 9  B 9' B 9B9   95 5 =4 5		 5

 =
	>	5	 5
 =
	>	5	 >	5	 >	=5 6	   9 B	=	=B6   B  9 6 96 9B6  B = 6 9 X6 9 X+ X+ = 6   B= 9"=! +  =# 6% 9&  X)  B=$ 6% 9(  X)d B=' 9$ =) 5+ =* 5- =, + =. 6/ 90B1 X90=. )  =2 +  =3 +  =4 +  =5 +  =6   97 B  98 B  99 + B  9: 6 9;3< B2  K   NODE_TOUCH_EVENTaddNodeEventListenersetTouchEnabledupdateButtonPosition_updateImage_currentButtonImage_currentBarImage_buttonSprite_barSprite_buttonRotation_booleantouchInButton	typetouchInButtonOnly_ x y buttonPositionOffset_ max min buttonPositionRange_value_max	max_minchecknumber	min_scale9Size_scale9scale9_
cloneimages_RIGHT_TO_LEFTLEFT_TO_RIGHTisHorizontal_direction_checktableFIXED_SIZEdisplaysetLayoutSizePolicymakeUIControl_callbacksonchangestate  onChangeState_handlerevents tonormal	namerelease	frompressed topressed	name
press	fromnormal  disabled tonormal	nameenable	from  normalpressed todisabled	namedisableinitial   
eventstartup
defer
statenormalsetupStateexportMethods%components.behavior.StateMachineaddComponentcc	fsm_				

  !!!!!""%%&&''(())+++,,,....////1/22self  direction  images  options      	 7P4 >>=  9   X/9   X9  96 99  :9	  :		B A  9 6 99  :9	  :		B AX  9 9 6 99	  :		9
  :

B A  9 9 6 99	  :		9
  :

B AL  barfgSprite_setContentSizeAndScale_setFgBarSize_	sizeccsetContentSizescale9_barSprite_scale9Size_											self  8width  8height  8 Â 	 :U¬
  9   B  X9  9' B  X9  9' B  9 5 -  9=9  9	B=
BX  X9  9' B  X9  9' B  9 5 -  9=9  9	B=
BL   À  disable
stategetState	name  STATE_CHANGED_EVENTdispatchEventdoEventForceenablecanDoEvent	fsm_setTouchEnabled	UISlider self  ;enabled  ; u 
  #Ä6  9    	 B  9 BL  updateImage_
aligndisplayself  align  x  y   D   Ó9   9' D disablecanDoEvent	fsm_self   $   
à9  L value_self   ¿  6î6  9  X9  X+ X+ ' B9  X=   9 B  9 5 -  9=	9 =
BL   À
value	name  VALUE_CHANGED_EVENTdispatchEventupdateButtonPosition_value_.UISlider:setSliderValue() - invalid value	max_	min_assertUISlider self  value   T   =    9 BL  updateImage_buttonRotation_self  rotation   l  "  9  -  9 D  ÀVALUE_CHANGED_EVENTaddEventListenerUISlider self  callback   Z     9   BL  'addSliderValueChangedEventListenerself  callback   f  "  9  -  9 D  ÀPRESSED_EVENTaddEventListenerUISlider self  callback   U   ©  9   BL  "addSliderPressedEventListenerself  callback   f  "®  9  -  9 D  ÀRELEASE_EVENTaddEventListenerUISlider self  callback   U   ¼  9   BL  "addSliderReleaseEventListenerself  callback   l  "Á  9  -  9 D  ÀSTATE_CHANGED_EVENTaddEventListenerUISlider self  callback   Z   Ï  9   BL  'addSliderStateChangedEventListenerself  callback   ¼
 $ ©Ô2  X-  9   B  X+ L 9  9B  9 6	 9		  B	 A9 9!=9 9	!=	9
 	 9'
 B	  9 5
 -  9=
=
=	
B+ L   9   B9 9 9 9	   9 6 9
  B A99	)  9   X 9 9 X9 9X9 9 X9 99 6 9 X9 9!9 9#X&9 9!9 9#X9 9 X9 9X9 9 X9 99 6 9 X9 9!9 9#X9 9!9 9#	  9 9
 9 !

"

9  

B X9
 	 9'
  B  X9
 	 9'
  B	  9 5
" -  9!=
=
=	
=#
BK   ÀtouchInTarget  RELEASE_EVENTreleasecanDoEvent
moved	min_	max_setSliderValueTOP_TO_BOTTOMlengthLEFT_TO_RIGHTdisplaydirection_maxminbuttonPositionRange_isHorizontal_convertToNodeSpace	name touchInTargetPRESSED_EVENTdispatchEvent
pressdoEvent	fsm_yxbuttonPositionOffset_pccconvertToWorldSpacegetPositionbuttonSprite_checkTouchInButton_
began		    !!!""""##%%%%%&&&&&&&((((((,,,,,,,,,........./////00000000002UISlider self  ªevent  ªx  ªy  ªposx  posy   buttonPosition touchInTarget ubuttonPosition goffset d  
  !19    X+ L 9   X9   9B 96 9 	 B C X  9 B 96 9 	 B C K  pcccontainsPointgetCascadeBoundingBoxtouchInButtonOnly_buttonSprite_self  "x  "y  " å  ÷Ã>9    X9   XK  )  )  9   9B99   9B"=99   9B"=9  9B9 9 !9	 9 !#  9
 B9   Xa99"!99 " 9 99	!	=9 9 =9 9 99	 9		 	=6 9)	  )
  B9   X	9   X	
  9 9 6 99 9"9 :B A
  9 B 9 6	 9			 X9 99	 9		"		 	X9   X	
9   X	9	9
 9

"	
	 	=9 9	9
 9

"	
	 	9   X	l9   X	i9 
 9 BXc99 "!99"!9 99	!	=9 9 =9 9 99	 9		 	=6 9)	  )
  B9   X	9   X	
  9 9 6 99 :9 9"B A
  9 B 9 6	 9			 X9 9	9
 9

"	
	 	9   X	9   X	9	9
 9

"	
	 	=X	9 99	 9		"		 	9   X	 9   X	9   X	9 
 9 B9 	 9
  BK  TOP_TO_BOTTOMsetPositionLEFT_TO_RIGHTdisplaydirection_ getbgSpriteLeftBottomPoint_	sizesetContentSizeAndScale_scale9Size_barfgSprite_pccmaxminlengthbuttonPositionRange_yxisHorizontal_getAnchorPoint	max_	min_value_getScaleYheightgetScaleX
widthgetContentSizebuttonSprite_barSprite_ÿ			     !#####$$$$%%%%%&&&&&''''''')))))******++++++++++++,,,,.....///////0000001111111244444455588888899999======>self  øx 
îy  îbarSize êbuttonSize Øoffset Ñap ÎlbPos "AlbPos aD  ) ââÑR9   9B' ' ' 9 89 89 8 X '	 
 &
 '	 
 &
9 8  X	9 89 8  X	9 8  XV9  XE9	   X	9	 
 9
+ B+  =	 9   X	6 9
 B=	 9   X9	 
 9B4	 9
>
	9
>
	=	 X9	 
 96 99 :9 :B AX6 9
 B=	 9   X	
  9 9	 6 99 :9 :B A
  9 9	 -  9B9	 
 9  9 B A9	 
 9)  )  BX6 '
  B  X39   X09   X	6 9
 B= 9 
 96 99 :9 :B AX6 9
 B= 
  9 9 -  9B9 
 96 9 )  )  B A9 
 99	  9!B A  X'9"  X9#   X	9# 
 9
+ B+  =# 6 9
 B=# 
  9 9# -  9$B9# 
 9)  )  B9# 
 9%9& B
  9' BX6 '
(  BK   À@UISlider:updateImage_() - not set button image for state %supdateButtonPosition_buttonRotation_setRotationBUTTON_ZORDERbuttonSprite_currentButtonImage_getPositionpBARFG_ZORDERbarfgSprite_=UISlider:updateImage_() - not set bar image for state %sprintErrorsetPositiongetAnchorPointsetAnchorPointBAR_ZORDERaddChildsetContentSizeAndScale_newSprite	sizeccsetContentSizeheight
widthgetContentSizescale9Size_newScale9Spritedisplayscale9_removeFromParentbarSprite_currentBarImage__normalimages_button
barfgbargetState	fsm_		



       """""""""""#%%%%%&&&'''''''''''******-------.......0000334445556666677777777777799999<<<<<<=========>>>>>>>>BBCCCDDDEEEEEFFHHHHHIIIIIILLLLLLMMMMMNNNNPPPPRUISlider self  ãstate ÞbarImageName ÝbarfgImageName ÜbuttonImageName ÛbarImage ÙbarfgImage ×buttonImage Õsize 4 _   	¥  9  B  X  9 BK  updateImage_isRunningself  
event  
 h   
«9    XK  9   9 BK  setContentSizebarfgSprite_self  size   ª 	 
 "L²9    X6 9)  )  D 9   9B9   9B9   9B99"!99	"!6 9  BL yheightx
widthgetAnchorPointgetBoundingBoxgetPositionpccbarSprite_				self  #posX posY  size ap point  Õ 
  BÁ  XK   9 B, 99#99# 9	 B 9	 BK  setScaleYsetScaleXheight
widthgetContentSize			



self  node  s  size scaleX scaleY   Ý	  F P¬ Ñ6   ' 3 B ' = ' = ' = '
 =	 ' = ' = ' = ' = ' = ' = )  = ) = ) = 3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 3' =& 3) =( 3+ =* 3- =, 3/ =. 31 =0 33 =2 35 =4 37 =6 39 =8 3; =: 3= =< 3? => 3A =@ 3C =B 3E =D 2  L   setContentSizeAndScale_  getbgSpriteLeftBottomPoint_ setFgBarSize_ onChangeState_ updateImage_ updateButtonPosition_ checkTouchInButton_ onTouch_ onSliderStateChanged 'addSliderStateChangedEventListener onSliderRelease "addSliderReleaseEventListener onSliderPressed "addSliderPressedEventListener onSliderValueChanged 'addSliderValueChangedEventListener setSliderButtonRotation setSliderValue getSliderValue isButtonEnabled 
align setSliderEnabled setSliderSize 	ctorBUTTON_ZORDERBARFG_ZORDERBAR_ZORDERVALUE_CHANGED_EVENTSTATE_CHANGED_EVENTRELEASE_EVENTPRESSED_EVENTbutton_disabledBUTTON_DISABLEDbar_disabledBAR_DISABLEDbutton_pressedBUTTON_PRESSEDbar_pressedBAR_PRESSEDbuttonBUTTONbarBAR UISlider
class# # % # ' ' ( ( ) ) * * + + , , . . / / 0 0 1 1 3 3 4 4 5 5  T    ¶ ¬ È Ä Õ Ó â à ö î 
,)0.?<CAROTÏ#Ñ)%0+?2MAPPUISlider L  