LJY@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\framework\cc\ui\UICheckBoxButton.luaύ 	# V7-  9 9  4 5 5 =>5 5 =>5 5 =>5	 5
 =>5 >5 >5 >5 >5 >	5 >
5 >5 >'  B  9 -  99+ B  9 -  99+ B  9 -  99+ B  9 -  99+ B  9 -  99+ B  9 -  99+ B6! 9"=  K  ΐLEFT_CENTERdisplaylabelAlign_on_disabledON_DISABLEDon_pressedON_PRESSEDonONoff_disabledOFF_DISABLEDoff_pressedOFF_PRESSEDOFFsetButtonImageoff tooff_disabled	nameunselect	fromon_disabled tooff	nameunselect	fromon toon_disabled	nameselect	fromoff_disabled toon	nameselect	fromoff toon	namerelease	fromon_pressed tooff	namerelease	fromoff_pressed toon_pressed	name
press	fromon tooff_pressed	name
press	fromoff  on_disabled toon	nameenable  off_disabled tooff	nameenable  onon_pressed toon_disabled	namedisable	from  offoff_pressed tooff_disabled	namedisable	ctor
super		

UICheckBoxButton self  Wimages  Woptions  W Α  ^[6  -  9 X-  9 X-  9 X-  9 X
-  9 X-  9 X+ X+ 6 9'		 6

  B
 A A-  99    	 B-  9 X9 -  98  X9 -  9<9 -  98  X9 -  9<X-  9 X9 -  98  X9 -  9<9 -  98  X9 -  9<L  ΐimages_setButtonImage
supertostring9UICheckBoxButton:setButtonImage() - invalid state %sformatstringON_DISABLEDON_PRESSEDONOFF_DISABLEDOFF_PRESSEDOFFassert				





UICheckBoxButton self  _state  _image  _ignoreEmpty  _ E   9   9' D unselectcanDoEvent	fsm_self   ° 	 ;
  9  B X  X9  9' BX9  9' B  9 5 -  9=9  9	B=
BL   ΐ
stategetState	name  STATE_CHANGED_EVENTdispatchEventunselectselectdoEventForce	fsm_isButtonSelected	UIButton self   selected    Ν  »9 99 X  9  	 B  X+ L 9  9' B  9 5
 -	  9			=	 ==B+ L   9  	 B X0  X9  9'	 B  X9  9'	 B  9 5	 -
  9
	
=
 	=	=	BXC  XA9  9'	 B  X:9  9'	 B  9 5	 -
  9

=
 	=	=	BX+9  9'	 B  X9  9'	 B  9 5	 -
  9

=
 	=	=	=	B X  X  9 9	 	 9		' B	 A  9 5	 -
  9

=
 	=	=	BK   ΐ touchInTargetCLICKED_EVENTselectsetButtonSelected
endedtouchInTarget   touchInTargetRELEASE_EVENTrelease touchInTargetcanDoEvent
moved touchInTargetPRESSED_EVENTdispatchEvent
pressdoEvent	fsm_checkTouchInSprite_
beganyx	name					

UIButton self  event  name ~x  ~y  ~touchInTarget  ^   "CΉ9   9B-  9 X-  9 X-  9 X	4 -  9>-  9>L X4 -  9>-  9>L K  ΐOFFON_PRESSEDON_DISABLEDONgetState	fsm_UICheckBoxButton self  #state  Ό   !@ Γ6   ' B 6 '   B' =' ='	 =' =
' =' =3 =3 =3 =3 =3 =3 =2  L  getDefaultState_ onTouch_ setButtonSelected isButtonSelected setButtonImage 	ctoron_disabledON_DISABLEDon_pressedON_PRESSEDonONoff_disabledOFF_DISABLEDoff_pressedOFF_PRESSEDoffOFFUICheckBoxButton
class.UIButtonimport###$$$$&&''(())**++M7u[·ΐΉΒΒUIButton UICheckBoxButton   