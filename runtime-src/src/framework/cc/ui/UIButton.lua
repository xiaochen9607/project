LJQ@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\framework\cc\ui\UIButton.lua*    #6   9  D  newNodedisplay `  b9   X-   9BK   ÀupdateButtonImage_
enter	nameself event  	 Ø / o:-4  =  6 9  B 9' B 9B9   95 5 ==	=
5 6	   9 B	=	=B6   B  9 6 96 9B  9 + B  9 6 96 
  9 B A X9= +  = 4  = 4  =  X9=  X9 =  X9"=! +  =# 4  =$ 5& =% 6 9(=' =) 6 9*  6 9(B6+ 9 B, X+ = 6+ 9! B, X+ =!   9 6 9-3. B2  K   NODE_EVENTboolean	type
aligninitialState_CENTERlabelAlign_    labelOffset_labels_scale9Size_
flipYflipY_
flipXflipX_scale9scale9_sprite_images_currentImage_touchInSpritetouchInSpriteOnly_onTouch_NODE_TOUCH_EVENTaddNodeEventListenersetButtonEnabledFIXED_SIZEdisplaysetLayoutSizePolicymakeUIControl_callbacksonchangestate  onChangeState_handlereventsinitial  
state 
eventstartup
defersetupStateexportMethods%components.behavior.StateMachineaddComponentcc	fsm_					
!!!!!""$$$$$%%((((,(--self  pevents  pinitialState  poptions  p õ 
  9u
6  9    	 B  9 B  9 B  9 B9  9 BL  getAnchorPoint	sizegetCascadeBoundingBoxupdateButtonLable_updateButtonImage_
aligndisplay	self  align  x  y  size ap  ¯   7  X  XK  9  <9  9B X  9 BL  updateButtonImage_getState	fsm_images_self  state  image  ignoreEmpty    	
 (X¡  X   9  B 6   X+ X+ ' B6  B X:9 8  X 9B9 <  9  -  9B  9	 BL   ÀupdateButtonLable_LABEL_ZORDERaddChildremoveSelflabels_
table	type.UIButton:setButtonLabel() - invalid labelassertgetDefaultState_					UIButton self  )state  )label  )currentLabel     ¼  X  9  B 6  B X:9 8L labels_
table	typegetDefaultState_self  state   ®    TÏ6  9   X+ X+ ' B  X 6 9 BH
 9 BFRúX9 8  X 9 BL  setString
pairs4UIButton:setButtonLabelString() - not add labellabels_assert						self  !state  !text  !  _ label  label 	 9   ç9  :9  :J labelOffset_self   e   ö4 >>=    9 BL  updateButtonLable_labelOffset_self  	ox  	oy  	 )   
9  L labelAlign_self   S   =    9 BL  updateButtonLable_labelAlign_self  align   Ð   4w¤4 >>=  6 9 BX)9   X	
 96 99  :9  :B AX
 9B 9	B	 9
	B
9  :"	9
#	9  :"
9#
 9	 B 9
 BERÕL  setScaleYsetScaleXheight
widthgetScaleYgetScaleXgetContentSize	sizeccsetContentSizescale9_sprite_ipairsscale9Size_			




self  5width  5height  5, , ,i )v  )size scaleX scaleY  Â 	 :UÁ
  9   B  X9  9' B  X9  9' B  9 5 -  9=9  9	B=
BX  X9  9' B  X9  9' B  9 5 -  9=9  9	B=
BL   À  disable
stategetState	name  STATE_CHANGED_EVENTdispatchEventdoEventForceenablecanDoEvent	fsm_setTouchEnabled	UIButton self  ;enabled  ; D   Ö9   9' D disablecanDoEvent	fsm_self   f  "Ú  9  -  9 D  ÀCLICKED_EVENTaddEventListenerUIButton self  callback   U   è  9   BL  "addButtonClickedEventListenerself  callback   f  "í  9  -  9 D  ÀPRESSED_EVENTaddEventListenerUIButton self  callback   U   û  9   BL  "addButtonPressedEventListenerself  callback   f  "  9  -  9 D  ÀRELEASE_EVENTaddEventListenerUIButton self  callback   U     9   BL  "addButtonReleaseEventListenerself  callback   l  "  9  -  9 D  ÀSTATE_CHANGED_EVENTaddEventListenerUIButton self  callback   Z   ¡  9   BL  'addButtonStateChangedEventListenerself  callback      ¦  9  B  X  9 B  9 BK  updateButtonLable_updateButtonImage_isRunningself  event   q   ­6  ' BK  ;UIButton:onTouch_() - must override in inherited classprintErrorself  event    " ëá±H9   9B9 8  X6   9 B A H9 8  XXFRù  XÌ9  X·6 9 BX
 9+ BERú4  = = 6	  B
 XV6  BXO9   X	"9 6	 9		 B	<	9   X9 8
 9B4	 9
>
	9
>
	=	 X9 8
 96 99 :9 :B AX9 6	 9		 B	<	
  9 9 8-  9B9 89  X	9   X		9 8
 99   X+ B9   X		9 8
 99   X+ BER¯XO9   X"9 6 9 B>9   X9 : 9B4 9>9>= X9 : 96 99 :9	 :		B AX9 6 9 B>9 :9  X9   X	9 : 99   X+ B9   X	9 : 99   X+ B  9 9 :-  9B6 9 BX
 9  9 B A
 9)  )  BERóX9   X6  '!  BK   À?UIButton:updateButtonImage_() - not set image for state %sprintErrorlabels_setPositiongetAnchorPointsetAnchorPointsetFlippedYflipY_flipX_setFlippedXIMAGE_ZORDERaddChildnewSprite	sizeccsetContentSizeheight
widthgetContentSizescale9Size_newScale9Spritedisplayscale9_
table	typeremoveFromParentsprite_ipairscurrentImage_getDefaultState_
pairsimages_getState	fsm_

     !!!"""""""""$$$%%%%%%%%%(***++++++,,,-----.......000000000000133333355555666777777777999:::::::::=======AAAABBBBBBCCCCCAADEEEFFFFHUIButton self  ìstate çimage å  _ s    i v  R R Ri Ov  Osize size RA  i v   Þ  Hû9    XK  9  9B9  8  X6   9 B A H9  8  XXFRù9 :9 :9 :  X  9 B9 : 9B9	9
 " 99 " 6 9  BH	 9
		 X+ X+ B
	 9
	9   B
FRðK  labelAlign_
alignsetVisibleyheightx
widthgetContentSizegetAnchorPointsprite_labelOffset_getDefaultState_
pairsgetState	fsm_labels_ÿself  Istate 	@label >  _ s  ox +oy  +ap spriteSize 
  _ l   5   4 9  >L initialState_self    
  "29    X9 :  X9 : 9B 96 9 	 B AL X  9 B 96 9 	 B C K  pcccontainsPointgetCascadeBoundingBoxsprite_touchInSpriteOnly_self  #x  #y  # Æ  ? H ¢6   ' 3 B ' = ' = ' = ' = )ÿ= )  = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3$ =# 3& =% 3( =' 3* =) 3, =+ 3. =- 30 =/ 32 =1 34 =3 36 =5 38 =7 3: =9 3< =; 3> == 2  L   checkTouchInSprite_ getDefaultState_ updateButtonLable_ updateButtonImage_ onTouch_ onChangeState_ onButtonStateChanged 'addButtonStateChangedEventListener onButtonRelease "addButtonReleaseEventListener onButtonPressed "addButtonPressedEventListener onButtonClicked "addButtonClickedEventListener isButtonEnabled setButtonEnabled setButtonSize setButtonLabelAlignment getButtonLabelAlignment setButtonLabelOffset getButtonLabelOffset setButtonLabelString getButtonLabel setButtonLabel setButtonImage 
align 	ctorLABEL_ZORDERIMAGE_ZORDERSTATE_CHANGED_EVENTRELEASE_EVENTPRESSED_EVENTCLICKED_EVENT UIButton
class# # % # ' ' ( ( ) ) * * , , - - g :  u   ° ¡ Â ¼ Û Ï é ç ú ö 5$KAXV\Zkhom~{¤¡«¦¯­ù±û!!UIButton D  