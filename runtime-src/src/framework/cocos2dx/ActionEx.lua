LJT@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\framework\cocos2dx\ActionEx.lua<    9   BL  runActionself  node   O 	-  9 G A = L  �targetbuildercca self  builder  3    6   9    9  D  create	Showcc 3    6   9    9  D  create	Hidecc ?    6   9    9  D  createToggleVisibilitycc 9    6   9    9  D  createRemoveSelfcc =   !6  9 9  D create
FlipXccx   =   %6  9 9  D create
FlipYccy   W 	  
)6  9 96  9   B C pcreate
Placeccx  y   U   
-   X�6  9 9  D + L createCallFunccccb   V   
2   X�6  9 9  D + L createCallFuncNcccb   F  :6  9 9  G C createRotateToccdt   F  >6  9 9  G C createRotateByccdt   v   B  X�6  9  B 6  9 9   D createMoveTopccdt  x  y   x   G  X�6  9  B 6  9 9   D createMoveBypccdt  dx  dy   v   L  X�6  9  B 6  9 9   D createSkewTopccdt  x  y   x   Q  X�6  9  B 6  9 9   D createSkewBypccdt  dx  dy   �   0V  X�6  9  B 6  9 9  	 
  D createJumpTopccdt  x  y  height  count   �   0[  X�6  9  B 6  9 9  	 
  D createJumpBypccdt  x  y  height  count   x 	  "`6  >6  >6  >6 9 9  6  D createBezierTocc	selfdt  c1  c2  p2   x 	  "g6  >6  >6  >6 9 9  6  D createBezierBycc	selfdt  c1  c2  p2   W   n6  9 9   D createCardinalSplineToccdt  points   W   r6  9 9   D createCardinalSplineByccdt  points   T   v6  9 9   D createCardinalRomByccdt  points   T   z6  9 9   D createCardinalRomByccdt  points   E  ~6  9 9  G C createScaleToccdt   F  �6  9 9  G C createScaleByccdt   L   �6  9 9   D create
Blinkccdt  count   Q  �6  9 9   D createFadeTocc�dt  opacity   @   �6  9 9  D createFadeInccdt   A   �6  9 9  D createFadeOutccdt   ]  	�6  9 9   	 
 D createTintTocc�dt  
r  
g  
b  
 `  	�6  9 9   	 
 D createTintBycc�dt  
dr  
dg  
db  
 C   �6  9 9  D createDelayTimeccdt   B   �6  9 9  D createAnimateccani   T   �6  9 9   D createProgressToccdt  progress   ^ 	  �6  9 9    D createProgressFromToccdt  	from  	to  	 m   �   X�6  ' B9   X�  9 D L  
buildaction required!!!
erroract   D   �6  9 9  D createSequenceccacts   A   �6  9 9  D create
Spawnccacts   `  �6  9 9-    B C �createRepeatForevercccheckaction act  	 ^  �6  9 9-    B C �createReverseTimecccheckaction act  	 e  	$�6  9 9-    B D �create
Speedcccheckaction act  
speed  
 f  	$�6  9 9-    B D �createRepeatcccheckaction act  
times  
 m 	 	#�6  9 9 -    B C �createTargetedActioncccheckaction act  
node  
 N   �6  9 9   D createFollowccnode  rect   y  .�6  -  8 9-   B X�- D �  �createcccls checkaction dft act  rate   ]  	 �6  -  8 9-   B C �  createcccls checkaction act  
 � ?�'    9 ' 6 9B&+    X�3 X�3 - < -   9 B<2  �K  � �  
upperstring^%w	gsub	Ease
checkaction cca name  dft  cls 	f  � 
  I�
6  4  -  B=9 X� =9  X�' =+  =- 998  X�6 '   X�' '	 &BL � �' not foundnil
cmd '
errortargetseqcmdparentcursetmetatable	ActionBuilder cca cmd  !parent  !self  V   
�) 9   ) M�9  +  <O�L  curself    i  x   +�  9  B) 9 ) M�9 98<O�L  cur
clearself  other    i  z  %�-  9 9  B=  9  =9  9 =L   �target	argsbuildercurcca self  cmd  args   �	1g�9  99  9  99  9 X� X�-  9 B -  8 	 B  X�6 	 B X�-  
 9B8  X� 	 G
 A =  9  9    <   J  �
upperstring	type
spawnseq	argscmdparentcur							




cca self  2ease  2parent /acts .cmd ,args *act  9   �  9  BL 	doneself  self act   <  �9  9    <L  curself  act   �   0�  X�9  6 6 9 B ' B  9 B 9 D 
addTo	done2ActionBuilder.addTo() - target is not cc.Nodeisnull
toluaasserttargetself  target  self act   Y�-  G A   X�9  9    <L  �curv self  act  � 
 @�9    X�  X�9   9B   X
�6  B X�9   9B -      	 D �getPositionYnumber	typegetPositionXtargetbuilder_moveTo self  dt  x  y   �  ��� �4   6  = 6 93 =6 93 =3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3$ =# 3& =% 3( =' 3* =) 3, =+ 3. =- 30 =/ 32 =1 34 =3 36 =5 38 =7 3: =9 3< =; 3> == 3@ =? 3B =A 3D =C 3F =E 3H =G 3J =I 3L =K 3N =M 3O 3Q =P 3S =R 3U =T 3W =V 3Y =X 3[ =Z 3] =\ 3_ =^ 3`  'a B 'b B 'c B 'd B 'e B 'f B 'g B 'h *  B 'i *  B 'j *  B 'k *  B 'l B 'm B 'n B 'o ) B 'p ) B 'q ) B 'r ) B 's B 't B 'u B9 =v 9I =w 9T =x 9\ =y 4  '{ =z=|3~ =} 3� =3� =�3� =�3� =�3� =�3� =�3� =9=�9�=�6�   BH�3	� <	2 �FR�93� =2  �L    
pairs
buildrun  add action 	done 
begin 
clone 
clear builder__indexActionBuilder__classto	loopanicbsineOutsineInOutsineInrateActionout
inOutinexponentialOutexponentialInOutexponentialInelasticOutelasticInOutelasticInelasticbounceOutbounceInOutbounceInbouncebackinOutbackOutbackIn  follow targeted rep 
speed reverse repeatForever 
spawn seq  progressFromTo progressTo animate 
delay tintBy tintTo fadeOut fadeIn fadeTo 
blink scaleBy scaleTo 
romBy 
romTo splineBy splineTo bezierBy bezierTo jumpBy jumpTo skewBy skewTo moveBy moveTo rotateBy rotateTo callFuncN callFunc 
place 
flipY 
flipX removeSelf toggle 	hide 	show buildAction	Node 
addToActioncccca_G�̙�����       	 	  	         # ! ' % + ) 0 - 5 2 < : @ > E B J G O L T Q Y V ^ [ e ` l g p n t r x v | z � ~ � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �    			



+!2-:4A<SCXU]Zd_gghhkkkkrrrkkw�x��cca �checkaction Q�EaseAction uActionBuilder P%  k v  builder_moveTo   