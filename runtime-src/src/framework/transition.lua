LJM@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\framework\transition.lua� 1�H6  96  B A 6  9 ) ) B X�6  9 ) B +  -  8  X�6 -  8B	  X	�
 9   X� B X�
 9  B  X�  L �createunpackCCEASEsubtostring
upperstring									ACTION_EASING action  2easingName  2more  2key +easing cls count  default   � 
L�d6   B 9  X�6 9B X	�-  9  6 9B A  X�-  9  9B  4  6 9B)   X	�  6 9	 9
 B<  < 96  B X�+    X	�  6 9 9
	 B< )  X�-  9 D X�:L K   �sequenceCallFuncfunctiononCompletecreateDelayTimecc
delaychecknumberunpacknewEasing
table	typeeasingchecktable
transition action  Margs  Mactions 0delay -onComplete  �  @�6  6 9  B ' B-  9  B  9  BL  �runActioncreate1transition.execute() - target is not cc.Nodeisnull
toluaasserttransition target  action  args  action  � 
 :�6  6 9  B ' B6 9 999B-  9	    D  �executerotate	timecreateRotateTocc2transition.rotateTo() - target is not cc.Nodeisnull
toluaasserttransition target  args  action  �  $[�6  6 9  B ' B  9 B9  X� 9  X� 6 9 9	9	
6
 9

  B
 A-  9	  
  D  �executep	timecreateMoveToccyxgetPosition0transition.moveTo() - target is not cc.Nodeisnull
toluaasserttransition target  %args  %tx ty  x y action  �  !N�6  6 9  B ' B9  X�)  9  X�)  6 9 99	6 9

  B A-  9   	 D  �executep	timecreateMoveByccyx0transition.moveBy() - target is not cc.Nodeisnull
toluaasserttransition target  "args  "x y action  � 	 9�6  6 9  B ' B6 9 99B-  9    D  �execute	timecreateFadeIncc0transition.fadeIn() - target is not cc.Nodeisnull
toluaasserttransition target  args  action  � 	 9�6  6 9  B ' B6 9 99B-  9    D  �execute	timecreateFadeOutcc1transition.fadeOut() - target is not cc.Nodeisnull
toluaasserttransition target  args  action  � 	 !P�
6  6 9  B ' B6 9B)   X�)  X�)�  X�)� 6 9 99	 B-  9
    D  �execute	timecreateFadeToccopacitycheckint0transition.fadeTo() - target is not cc.Nodeisnull
toluaassert						transition target  "args  "opacity action  �  I��6  6 9  B ' B+  9  X�6 9 96 9	B6 9	B A X*�9
  X�9  X$�, 9
  X�6 9
B X�  9 B 9  X�6 9B X�  9 B 6 9 96 9
	B	 
 B -  9    D  �executegetScaleYgetScaleXscaleYscaleX	timechecknumbercreateScaleTocc
scale1transition.scaleTo() - target is not cc.Nodeisnull
toluaassert



transition target  Jargs  Jaction 
@scaleX #scaleY  # �   9�	  )  X�K    )  X�: L : )   ) M	�6  9 9	 8
 B O�L createSequenceccactions  prev 
 
 
i  � M��4  6   B X�)   X�  9 +	 B  6 9	 9
 B<  6 9	 9B<  6 9	 9
 B<  X�  6 9	 9B<  X	�  6 9		 9
 B<+   )  X�-  9
	 B X�:	  9 
 BL  �runActionsequenceCallFuncRemoveSelfAnimate	ShowcreateDelayTimeccsetVisiblenumber	type

transition target  Nanimation  NremoveWhenFinished  NonComplete  Ndelay  Nactions Laction < �  9��6  9 9 B+  6  B X!�)   X�  9 + B-  94 6  9
 9 B>6  9
 9B>>B6  9	 9	 B X�6  9	 9 B   9
  BL  �runActionRepeatForever	ShowDelayTimesequencesetVisiblenumber	typecreateAnimatecc







transition target  :animation  :delay  :animate 3action 2sequence  {  $�6  9  B  X�-   9  BK  �removeActionisnull
toluaactionManager action   �  $�6  9  B  X�-   9  BK  �removeAllActionsFromTargetisnull
toluaactionManager target   z  $�6  9  B  X�-   9  BK  �pauseTargetisnull
toluaactionManager target   {  $�6  9  B  X�-   9  BK  �resumeTargetisnull
toluaactionManager target   �  e �� �4   4  5 6 9>= 5 6 9>=5	 6 9>=5 6 9>=
5 6 9>=5 6 9>=5 6 9>=5 6 9>=5 6 9>=5 6 9>=5! 6 9 >=5$ 6 9#>="5' 6 9&>=%5* 6 9)>=(5- 6 9,>=+50 6 9/>=.53 6 92>=156 6 95>=459 6 98>=75< 6 9;>=:5? 6 9>>==6 9@ 9AB 9BB3D =C 3F =E 3H =G 3J =I 3L =K 3N =M 3P =O 3R =Q 3T =S 3V =U 3X =W 3Z =Y 3\ =[ 3^ =] 3` =_ 3b =a 3d =c 2  �L   resumeTarget pauseTarget stopTarget removeAction playAnimationForever playAnimationOnce sequence scaleTo fadeTo fadeOut fadeIn moveBy moveTo rotateTo execute create newEasinggetActionManagergetInstanceDirector   EaseSineOutSINEOUT   EaseSineInOutSINEINOUT   EaseSineInSINEIN   EaseRateActionRATEACTION   EaseOutOUT   EaseInOut
INOUT   EaseInIN   EaseExponentialOutEXPONENTIALOUT   EaseExponentialInOutEXPONENTIALINOUT   EaseExponentialInEXPONENTIALIN   ��̙����EaseElasticOutELASTICOUT   ��̙����EaseElasticInOutELASTICINOUT   ��̙����EaseElasticInELASTICIN   ��̙����EaseElasticELASTIC   EaseBounceOutBOUNCEOUT   EaseBounceInOutBOUNCEINOUT   EaseBounceInBOUNCEIN   EaseBounceBOUNCE   EaseBackOutBACKOUT   EaseBackInOutBACKINOUT   EaseBackInccBACKIN! # $ $ $ $ $ % % % % % & & & & & ' ' ' ' ' ( ( ( ( ( ) ) ) ) ) * * * * * + + + + + , , , , , - - - - - . . . . . / / / / / 0 0 0 0 0 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 4 4 4 4 4 5 5 5 5 5 6 6 6 6 6 7 7 7 7 7 8 8 8 8 8 : : : : : : : : W H � d � � � � .(OKok������8cS�|��������transition �ACTION_EASING �actionManager q$  