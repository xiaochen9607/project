LJJ@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\LOGIN.lua�   "+  =  +  = +  = +  = +  = +  = +  = +  = + = )  =	 + =
 6 )��=K  shieldForInstallVersionConfig_SysisMiniPackageloadTryTimesserverListGot
myMacSidtickerbutton4button3button2button	view		

self   l  	.-   9 B= 9BL �	init	viewnewLOGIN self  
view  
param  
logic  �   3@H-     9   B    X�6  9  + = 6  9  + = 6    9  )  B -     9  + B X �6  9  + = 6  9  + = -     9  + B 6    9  +  + B 6  9    9 	 '
 B K  �
writeFileSaveLoadplayMusicsetBrightstopAllSoundsSoundManagersoundEffectOnmusicOnoptionProxyGameGlobalisBright				




soundButton  e   �-     9   + B -     X�-  B K  ��setVisibleTEXT_CUR_LANG slCb  �   �6     9  6 -  -  9B- B K   ��checkUpdateCompletehandlerrestoreGameGameGlobalself _restore  �   �-     9   B -   6 96 -  -  9 B)< B= 6    9  -  9B K  �	viewaddBackKeyUIManagerhandlerscheduleGlobalschedulerscheduler60SeccheckServerListlogic  �  	 +S�	-   9     9  ' B    X�-  9B-  9  9' B    9 ' B 9B  9 ' B 9B6 9 9	6
  B+ BK   ��tonumbersend_testPlayerLoginloginProxyGameGlobalpwgetString	userloginLogicloginNodegetChildByName	view	self logic node %account password 
 �  
/_�-   9     9  ' B   9 ' B 9B  9 ' B 9B6  B6  B
  X�  X�
  X�	  X�6  9'	 BK  6
  9 	 BK   �createRubbishCodeStringUtilU请在框1输入正确的垃圾代码兆数，框2输入垃圾代码文件个数addMessageFloatMessagetonumberpwgetString	userloginNodegetChildByName	view 





self node )account "password num1 num2  B    �6     9  B K  removeRubbishCodeStringUtil I    �6   ' B 9  B K  	initapp.uiEditor.mainrequire h   
�-   + =  -     9  ' + B K  �mapEditortouchFunadjustSkillAnilogic  �   4�-     9   B -   9    9  ' B   9  B 6 9 9B 9B6	  9
   BK  �
addUIUIManagergetRunningScenegetInstanceDirectorccgetTextText_UserNamegetChildByName	viewfakeLocalPlayerlogic txt curScene  �   T{�6     9  ' B ' ) )d ) M1�  9 '	 
 &	
	B  X�X(�'  ' 	 '
 6	 9
6   9 '  &B 9B A  B' 6	 9
6   9 '  &B 9B A B'  &O�' 6 6 9 ' B A  9' ' 	 '
 &
B 9B6  9' BK  complete:E:\pos.txtaddMessageFloatMessage
close
"小地图 上面对应坐标 
writew	openioassertE:\pos.txt}
getPositionY
, y =getPositionXtonumber	ceil	math , x = ] = {  id = 
data[cgetChildByNameworldMap/WorldMap.luagetNodeFromLuaUIManager������������ٝ��	






mm Ostr N2 2 2i 0path 2file  �   6�3   6 ' B 9B6  96 99'	 B 9
 B 9+    BK  startLoadaddByArray,resWORLDMAPConfig_UI
splitStringUtilcreateapp.control.LoadingManagerrequire cb LoadingManager arr 
      �K   N    �6   9    9  B K  switchAccountsdkManagerGameGlobal � 
0�-   9      X �6    9  6 9B 2 �3  6 9
  X�6 9	  X�  B2  �K  6  9	  BK  K  �getServerVersionMainfestGameGlobalcheckUpdateConfig_Sys serverListHaveNotGotConfig_LanguageaddMessageFloatMessageserverListGot 								logic InnerSA  �A  ����  9  6 9 9B 9B4  6 9 9B 9B' &>)  ) M�	 8
<
	O�6 9 9B 9 B6 9	 9
' B6 9 9B 9B ' &6 9	 9B	 9
 B
  X� X�+ =X�' 6	 9			 9		B		 9		 B	
	  X
�	 X
�6
 9

	 B
6 9
B)  X�+ =X�+ =6 96	 9			 9		B	=	
 9' B6	 	 9		 ' B	 9	) B	'	 =	6	 9			9		 	 X
� 9	+ B	X	� 9	+ B	3	  6
 
 9
!
 5" =	#B
6
$ 
 9
%
'& + B
6
' 
 9
(
 6 96) '* B9+6,  9-B A
+
 =
.6
/ 9
0

 9
1
B

 92
) B
 93
'4 65 96'7 6 6  98B A  A&B
 99
': B
 9;
)d ) B
 9<
'= B 9>
 B6  9?
 B 9@B 9'B B=A 9'D B=C 9'F B=E 9'H B=G 9'J B=I 9'K B=K6L  9MB  Xy�6/ 9N 91B 9O': B 9P) B 9Q6R 9SB 9T6 9U)� )� )� )� B A 9V'W ) B 9;9E 9XB9E 9YBB 9Z* B 9[)w )2 B 9> B 9\ 9YBB6R 9]	  X�6R 9^6/ 90 91B 92) B 93 B 99': B 9; 9XB 9YBB 9<'_ B 9> B6  9? B6  9! 5a 3` =#B2 �6  9!9A5c 6,  9bB=#5d =eB=A 9'f B 9g+ B 9'h B  Xp�6/ 9N 91B 9O': B 9P) B 9Q'i B 9T6 9U)� )� )� )� B A 9V'W ) B 9<'h B 9j)� B 9k+ B 9'f B  X� 9XB  X�)�  X� 9YB  X�)g 9;  B 9Z) ) B 9l* * B 9m6 9U)� )� )� )� B A 9[)w )2 B 9g+ B 9> B3n 6  9! 5o =#B2 �3p 6 9q 9r B6s 9t  X
�6s 9t	  X�6) 'u B 9vB'w 6x  9y6z '{ B:'| &6  9} B X� 9'~ B 9 6/ 9�9�B6�  9� B6s 9�	 X�9C 9g+ B9E 9g+ B9G 9g+ B9I 9g+ B9K 9g+ BX�6/ 9N 91B 9O': B 9P) B 9Q'� B 9T6 9U)� )� )� )� B A 9V'W ) B 9<'� B 9;9A 9XB9A 9YB	B 9[)w )2 B 9> B3� 6  9! 5� =#B6/ 9N 91B 9O': B 9P) B 9Q'� B 9T6 9U)� )� )� )� B A 9V'W ) B 9<'� B 9;9A 9XB
9A 9YB	B 9[)w )2 B 9> B3� 6  9! 5� =#B6/ 9N 91B 9O': B 9P) B 9Q'� B 9T6 9U)� )� )� )� B A 9V'W ) B 9<'� B 9;9A 9XB9A 9YB	B 9[)w )2 B 9> B3� 6  9! 5� =#B6/ 9N 91B 9O': B 9P) B 9Q'� B 9T6 9U)� )� )� )� B A 9V'W ) B 9<'� B 9;9A 9XB9A 9YB	B 9[)w )2 B 9> B6  9! 5� 3� =#B9C
  X�6  9!9C5� 6,  9bB=#5� =eB=C9I
  X	�6  9!9I5� 3� =#B=I9E
  X�6  9!9E5� 6,  9bB=#5� =eB=E9G
  X	�3� 6  9!9G5� =#B=G3� 9K
  X�6  9!9K5� =#B=K6'  9( 6 96) '� B9�6,  9�B A6s 9�)   X�3� 6�  B X�6�  9� B6) '� B 9� B 9�B6 9q 9�B  X� 9'f B 9g+ B3� 6  9! 9'f B5� =#B6  9�B=�+ 7� 2  �K  GAME_INIT_SUCCESS
myMacgetMacID   enableSwitchAccountButtoninitAni	testapp.control.TestCasethrowErrorLogger
pcall enterGamegetPlayerBaseInfoapp.event.LoginProxyEvent        mapEditor       mapEditor     uiEditor   removeRubbish   createRubbish   testLoginshowPrintcheckNeed18LimitMultiVersionUIHelperplistTypeTextureResTypeloadTextureImage_14checkPngExistInPlist	.pngpf_PACKAGE_PF
splitStringUtillogin_logo_	initapp.utils.MEMORYMONITORshowMemoryConfig_SyscheckObbsdkManager    setColorsetAnchorPointsetTouchEnabledsetTag游戏修复restoresetVisibleswitchAccount
param  
login  touchFun   TEXT_CUR_LANGtraditionalChinesesimpleChinesesetPositionYsetContentSizesetScalegetPositionYgetPositionXcommon_anniu3up.pngloadTextureNormalc4bsetTitleColorswitchLanguageConfig_LanguagesetTitleTextsetTitleFontSizesetTitleFontNameButtonenableSwitchLanguageButtonSdkManagercityposButton_5button5Button_4button4Button_3button3Button_2button2Button_1buttonlayoutfontStokeaddChildversionTextsetNamesetPositionsimhei.ttfsetFontNamegetVersionCode	%.2fformatstringVersion:setStringsetFontSizecreate	Text	ccuiserverListGotsuccessRegisterhandlerregisterapp.event.LocalPlayerEventrequireaddEventEventManagermusic/1000.mp3playMusicSoundManagercallBack  widgetTouchExtent setBrightsoundEffectOn
soundsetLocalZOrderalignLeftUIManagerButton_SoundgetChildByNameversionShieldshieldForInstallVersionloginProxyversiontonumberdecode	json!src/version/version.manifestisMiniPackagegetStringFromFile!new_version/project.manifest	readFileSaveLoadoptionProxyGameGlobalsetSearchPathsnew_version/getWritablePathgetSearchPathsgetInstanceFileUtilscc	view
͙���̙��2����� ����	                              
 
 
 
 
 
 
 
 
                                                               " " " " " " " " % % % % & & & & & & ' ' ' ' ( ( ) ) ) ) ) * * * * * , , , , < = = = = = = = B B B B B B C C C C C C C C C C C C C C C D D G G G G G H H H H I I I I I I I I I I I I I I I J J J J K K K K K L L L L M M M M N N N N N Q Q Q R R R R R S S S S S T T T T T U U U U U V V V V V W W W W W \ \ \ \ ] ] ^ ^ ^ ^ ^ _ _ _ _ ` ` ` ` a a a a a b b b b b b b b b b c c c c c d d d d d d d d d d d d d e e e e f f f f f g g g g i i i i i i i j j k k l l n n n n n o o o o p p p p q q q q r r r r r r r r r r s s s s t t t t u u u u u v v v v v y y v y | | | | | | | | | | | | | | � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �     

7888::::::::AAAAAAAAAAAAAAA[[[[[^___``aaaaafffffffmmm|||||||}}}}}}}}��������������������self  �logic �view �searchPaths �correctSearchPaths �  i writablePath �fileNameVersion �strConVersion 	�fileNameVersion strConVersion 	_strJson soundButton �soundCb �TEXT_VERSION #�needSl N�slCb  �curLang  �_Button_switchLanguage slang ?4TEXT_CUR_LANG 	+_restore MjswitchAccount +?x 	6y .restore 'checked 	�fileName �_Button_2 :�testLogin 5�_Button_3 �createRubbishFun 6�_Button_4 createRubbishFun 6I_Button_5 =button4Touch ocitypos 	Wtry  
ret errMessage  switchAcc !
str  �  ���9    6 9 9) )��)��B6 9 9) )  )	  B6 9 96 9
 9  B A 9'	 B 9	 B 9'	 B 9'		 B 9
 9	' B		 9		'	 B		 9		B		 	B 9'	 B 9'		 B 9 9	' B		 9		'	 B		 9		B		 	B 9'	 B 9'	 B 9
 9	' B		 9		' B		 9		B		 	B 9'	 B 9'	 B 9 9	' B		 9		' B		 9		B		 	B 9'	 B 9'	 B 96	 9		6
 9

B 9'	 B 9'	 B 96	 9		6
 9

B6 9 9)	 5
 B6 9	 9)
 5 B6 9
 96 9 9  B A 9	' B		 9		 B	6	 9			 9		) * B		 9
	B
6 9 96 9 9	 
 B A 9' B 9 B 9BK  createBombreverseScaleBy	body x y���� x yMoveByBaseSprite_100149armONEDST_COLORglsetBlendFuncBaseSprite_100148getScaleYsetScaleYgetScaleXsetScaleXBaseSprite_100147runActionweapongetChildByNameSequenceRepeatForevercreateRotateTocc	view�������






















self  �view �logic �action1 �action2 �action �action1 �=action2 6action *action1 action2 action  �  u��6  9)   X�K  9   X�K  6 ' B 9*  +  + B6 9)
 ) B 9 B 9	 B 9
+  + B 9* B6 9) ) B	 X�9  9' B 9' B 9 B 96 9)	��)
,B6 9)
  )d B AX�9  9' B 9' B 9 B 96 9)	��)
,B6 9)
� ),B A6 9)2 )� B6 96 	  9
 B B= K  createBombhandlerperformWithDelayGlobalschedulerticker
wall2setPositionaddChild
wall1Image_1getChildByName	viewsetScale	initsetRotationSkewYsetRotationSkewXrandom	mathcreateapp.sprite.SkillAnirequireisMiniPackageshowPrintConfig_Sys��̙��挀�					

self  veff bran ]ran Gdelay =
 � 	8r�+    X�-  8   X�- . +    X�-  8 
  X�-  8 9 6 ' B9 X�6  9'   ' &B X�- . +    X�- 8   X�- . +   X�  X�X �K  �����	.luaapp/script/skill/SkillcheckFileExistGameGlobalTYPE_PERMANENTapp.const.Const_Skillrequire	type����


sks total1 total2 upgrade total3 id  9needHero  9exist 7 �  s��N6  ' B6  ' B6  ' B+  )  )  )  6  '
 B
 9' , )  B3	 6
  B
H�) ) ) M�9		  X�'
  &8	  + BO�FR�6
 6 B
H�9	 X�6 9B 	  + BFR�6
 6 B
H$�) )
 ) M �'  &86  9 ' B)  ) M�6  98' + B:	  X�::	  + BO�O�FR�)
  
 X
 �)
  
 X
 �)
  
 X
 �2  �K  _,
splitStringUtillvConfig_FactionTech	datatonumber	typeConfig_TalentskisShow
pairs -11,10304,40,40,4477,0createOneHeroByStrapp.proxy.vo.Herodata.Config_SkillUpgradedata.Config_HeroSkilldata.Config_Herorequire�									$%%%%&&&&((())))****&%%////00011112222//666677778888999999::::;;;;;;;<<<>?@@@@:766EEEHHHKKKNNself  theros psks mupgrade jid itotal1 htotal2 gtotal3 fhero 	]check \  k v    l   k v  ' ' 'k $v  $! ! !lv str arr   k tmpX 	id lv  �  ���(6   99 ' B6   99 ' B9  9' B6   9 ) B9  9'	 B6   9 B9  9'
 B 9B6  9" 9 B 96  9 B6   99 '	 '
 ' ' ' B9  9B+  )  )	 M8�8
 9B 6 9 ' B
  X�8
 98
 9BB8
 98
 9BB6 9 ' B
  X�8
 98
 9BB8
 98
 9BBO�K  100143getScaleYsetScaleYsetScaleX100146	findstringgetNamegetChildrenButton_5Button_4Button_3Button_2cityposrightShiftPxsetPositionXsetScalescaleXgetScaleXBaseSprite_100143Image_12scaleXToFullScreenImage_1getChildByNameversionTextalignLeftswitchAccount	viewalignRightUIManager����(self  �img qimg fimg 
\scale Vchildren >name =9 9 9i 7 �   -�&6   9  6 9B5 5 6 9 9 B6 9 9 + BK  $MODULE_PLAYER_getPlayerBaseInfoMODULE_PLAYER_getHeroInfo  $1,1001,3,4,90,1,0,0,0,0,0,0,0,0$2,1002,3,4,90,1,0,0,0,0,0,0,0,0$3,1003,3,4,90,1,0,0,0,0,0,0,0,0$4,1004,3,4,90,1,0,0,0,0,0,0,0,0$5,1005,3,4,90,1,0,0,0,0,0,0,0,0  ���N�猪 ����    -1�N�N  1,2,3,4,5-1-1loginProxyGameGlobalremoveEventsEventManager$$$$$$%%%%%%%&self  param 	tmp  �   +K�9  X�  9 ' BX"�9  9' B6  9' B 9	'
 B 99 	 9'
 B	 9B A9  9 B  9  BK  setRegisterNode1addChildgetPositionposcentergetChildByNamesetPositionregisterNode1setNameres/ui/login/register2.luagetNodeFromLuaUIManagerregisterNoderemoveChildByName	viewguestRegLogintouchFun
param					



self  ,target  ,param  ,node  C   �-     9   ' B K   �regLogintouchFunself  N   �-   9     9  - B K   ��removeChild	viewself node  �  ,K� 9 ' B 96 99B 9 ' B 96 99B3 3 6  9		 9 '

 B5 =B6  9		 9 '
 B5 =B2  �K    	backcallBack  
loginwidgetTouchExtentUIManager  pwoptionProxyGameGlobalsetString	usergetChildByName	









self  -node  -submit back  � " ���=6  ' B X� X�6 9 9B 9B6  9	 -
  9
	
9


+  5 BK   X�6  99 
 9B-	  9			9	
	+
  5 BK  6  9 B)  X�6  99 
 9B-	  9			9	
	+
  5 BK  6  9 B)  X�6  99 
 9B-	  9			9	
	+
  5 BK  6 9 ' B
  X�6  99 
 9B-	  9			9	
	+
  5 BK  6   X	�6  9 )	 B X�K   X�6  99 
 9B-	  9			9	
	+
  5 BK  6  9 B)  X�6  99 
 9B-	  9			9	
	+
  5 BK  6  9 B)  X�6  99 
 9B-	  9			9	
	+
  5 BK  6 9 ' B
  X�6  99 
 9B-	  9			9	
	+
  5 BK   X	�6 9 9  	 
 BX�6 9 9! 	 BK   �send_registersend_loginloginProxy
login idpasswordHasSpace id id idcheckHasForbiddenWordGameGlobalPACKAGE_USEYLLOGIN idaccountHasSpace 	findstring id idgetByteLenStringUtil idgetParent	view id	nameMESSAGEBOX
addUIUIManagergetRunningScenegetInstanceDirectorccapp.control.GameGlobalrequire ##$$$$$$$$$$$$$%(((((((()))))))))))))*--------............./22222223333333333333477888888888:::::::=uiConfig self  �account  �password  �loginOrRegister  �isGuest  �curScene  \   "�-     9   - - B K   ���touchFunNextself toWhere mapEditState  � 
M�9    X�6  96 9B2 �3 6 9
  X�6 9	  X� B2  �K  6  9	 B2  �K  K  getServerVersionMainfestGameGlobalcheckUpdateConfig_Sys serverListHaveNotGotConfig_LanguageaddMessageFloatMessageserverListGot 
self  toWhere  mapEditState  InnerLogin  �   G�6  9 9B X�K  6   X�  9   '	 
 BX�6  9 9+ BK  sdkManager
logincheckLoginOrRegisterPACKAGE_USEYLLOGINcheckCanEnterServerloginProxyGameGlobalself  account  password  isGuest  ret   �     �'   6 96  9B A &  ' 6 9 9   + BK  send_registerloginProxy123456getServerTimeGameGlobal
floor	mathguser 

pw 	 �   Cl�6     9  B 6  ' B   9  -  ) - )  - B 6  9B 96  9B99	B6
 9 9B 9B  X
�6
 9 9B 9  BX	�6
 9 9B 9  B- 9 X�+ =   9 BK  ��� �startInstanceScriptskillAniEditadjustSkillAnirunWithScenereplaceScenegetRunningScenegetInstanceDirectorccBATTLESCENEsceneNametblsetCurScenegetResourceManagerGameGlobalcreateapp.scenes.BattleScenerequire
clearUIManager				

batType insId mapEditState self scene 4 �&n����  X
�  9 6 996 99+ B X�9  9'	 B 9'
 B 9B 9' B 9B6 9=
6 9=  9 	 
 + B X�9  9' B 9'
 B 9B 9' B 9B6 9=
6 9=  9 	 
 + B X\�6 9 9B X�2 G�6 99
  X�6 99 X�' 6 96  9B A &' 6 9 9 	 +
 BX7�6 996 99 X�6 9 96 996 99+ BX"�3 6 99  X�6  96 9 	 9!B	 9"B-  9#9$+	  5
% =&
6 99='
+  + )�'B	X� B( X�6 9 9B X�2  �K  6  9)'* B  9+  B, X-�6 9 9B X�2  �K  6-   X�9  9'	 B  X�9  9'. B  X�9  9' B  X�2  �K    9/ BX�6 90 9,+ B1 X��6 + =2) )  9  9' B  X� 93B  X�64  95'	6 B2  �K   9'	
 B 9B	  97 B X�68 99	 '
: B
  X�) 6; 6
< 
 9
=
 ': + B
:

B   X�68 99
 '> B ) 6; 6
< 
 9
=
 '> + B
:

B   X�68 99
 '? B ) 6; 6
< 
 9
=
 '? + B
:

B   X�68 99
 '@ B ) 6; 6
< 
 9
=
 '@ + B
:

B   X�68 99
 'A B ) 6; 6
< 
 9
=
 'A + B
:

B   X�68 99
 'B B ) 6; 6
< 
 9
=
 'B + B
:

B   X�68 99
 'C B ) )   X�68 99
 'D B ) )   X�68 99
 'E B )	 6; 6
< 
 9
=
 'E + B
:

B 6 9F5	H =	G6 9F)	�=	I  X7�68 99
 'J B )
 6; 6
< 
 9
=
 'J + B
:

B 6 9K4	 6
 9
M
9
N
:

>
	6
 9
M
9
N
:

>
	6
 9
M
9
N
:

>
	6
 9
M
9
N
:

>
	6
 9
M
9
N
:

>
	=	L6 9K5	P =	O6 9K)	��=	Q  X�68 99
 'R B ) )u  X�)  6; 
 B   X�) 3S 9T  X�) )  +    X	� X	�	 X	�6	U 'V B	8		 X	�6	U 'W B	8	6	 9	F	5
Y =
X		 X	�6	U 'Z B	8		 X	�6	U '[ B	8		 X	�6	U '\ B	8		 X	�4  6	^ 8		9	_	=	]	 X	�4  6	` 8		9	_	=	]		 X	�6	U 'a B	8	+	  	
 X
�6
U 'V B
8
	 X
�6
U 'V B
8
	 X
�4  )
�=
]	 X
�)	�X
�9	]6
U 'b B
9
c
6U 'b B'd 	 &86U 'e B6<  9=9f'g B4  6h  9i  B6  9j9k  )  B 9lB6h  9i  B6h  9m B6  99 9$
 +   + B2 �2  �K  K   �removeDuplicateItemsgetPreloadRessceneContextgetBattleInfocombineTableTableUtil,resapp.utils.StringUtilBATTLEFIELDLOADINGdata.Config_UIdata.Config_RotlaConfig_QijinInstbattleIdConfig_DuelInstbattleFieldId!data.Config_FourSidesWarInstdata.Config_HeroTrialsInstdata.Config_ArenaInst  classicBatInBatSetupdata.Config_ClassicPointdata.Config_InstanceDatarequireadjustSkillAni xqjqcInsId  ������qjqcNpcData
heroslocalPlayerqjqcInBatSetupActivityProxyqcur_duelBattleHeroId  ����������cur_duleNpcDatacampaigndlrswfha
splitStringUtiltonumberc	findstringfakeLocalPlayer:请点击开始游戏，在用户名框输入副本idaddMessageFloatMessageisVisibleeditStatemapEditorsdkManagerloginLogicregisterNodePACKAGE_USEYLLOGIN
loginsetRegisterNoderes/ui/login/register1.luagetNodeFromLuaregisterLoginparam1	fun1 idguestRegist	nameMESSAGEBOXgetRunningScenegetInstanceDirectorcc
addUIUIManager send_loginlatestServergServersend_register123456getServerTime
floor	mathgcheckCanEnterServerloginProxyguestLoginloginNodeacLoginpwgetString	userregisterNode1getChildByName	viewregLogingPw
gUseroptionProxyGameGlobaldoLoginguestRegLogin  &
							


!!!!!!!!!!!!!()))))**************************,,1122222222233333444488999999999:::;;;;;;;;;;;;;;;;;;;;;<<>>>>@@@@@@EEFFFGHIIIIIJJJJJJJKKKKKLLNNNNNNNOOOPPRRRRRSSTUUUUUUUUUUUXXYYYYYYZ[[[[[[[[[[[^^______`aaaaaaaaaaaddeeeeeefgggggggggggjjkkkkkklmmmmmmmmmmmppqqqqqqrsssssssssssuuvvvvvvwxzz{{{{{{|}���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������uiConfig self  �toWhere  �mapEditState  �node account password node account password user )	pw cb !node 1insId 9�batType �node �txt �pos 
�loadComplete ��insInfo �battleFieldId ;Qconf 7battleFieldConf 0battleFieldResArr 	'arr &battleRes  �   �-     9   ' B 
   X �-     9  ' B K  �removeChildByName_TEXTTMPNAMEgetChildByNamenode  �   �-     9   ' B 
   X �-     9  ' B K  �removeChildByName_TEXTTMPNAME1getChildByNamenode  �   �-     9   ' B 
   X �-     9  ' B K  �removeChildByName_TEXTTMPNAME2getChildByNamenode  �   Q�-     9   B -  9 B  X �6    9  6 9B K  -    9  -  9 B-  9 B' B K  	�� ��registercheckLoginOrRegister
mmbyzConfig_LanguageaddMessageFloatMessagegetStringText_UserName2 Text_UserName1 self Text_UserName  m   �-   9     9  - B -     9  B K   ��loginLogicremoveChild	viewself node  � -���D9   9' B 9' B 99   9' B 9B A9   9	 B3
  9' B6  9 
 9B)	 )
 5 =B= 9  96 9*	  *
  B A9  9	 9B A 9	9 B 9' B 9B 9	 B 9' B 96 9B3 3 	 9'
 B6 
 9  9B) ) 5 =B= 9 
 96 9*  *  B A9 
 9 9B A
 9	9 B
 9' B
 9B 9		 B	 9	'  B	 9	6 9!B	 9	'" B	6
 
 9

	 	 9	B) ) 5$ =B
=
# 9
# 
 9

6 9*  *  B A
9
# 
 9

	 9	B A
 9
	9# B
	 9
	' B
	 9
	B
 9	
 B
 9
'% B
 9
6 9!B3& 3' 6  9( 9') B5* =B6  9( 9'+ B5, =B2  �K    	back  
zhucewidgetTouchExtent  _TEXTTMPNAME2  _ebxUserName2pw2
qsrmm_TEXTTMPNAME1  _ebxUserName1pw1  
qsrzhConfig_Language_TEXTTMPNAME
clonesetStringpccsetAnchorPointcallBack  getContentSizecreateEditBoxWithLabelUIManager_ebxUserName	user addChildgetPositionposcentergetChildByNamesetPositionregisterNodesetNameloginNoderemoveChildByName	view����	



    !!!!!!!!!!!!!"""""""""#######$$$$%%%%&&&''''(((()))))++++,,,,,,,,,,,,,---------.......////00001112222333344444;@AAAAAAAAAABBBBBBBBBBDDself  �node  �nameCb �Text_UserName �_textTmpName (�nameCb1 �nameCb2 �Text_UserName1 �_textTmpName1 (^Text_UserName2 M_textTmpName2 (%submit back  � 	  -�6   9' B 9' B 99  9' B 9	B A9  9
 B  9  BK  setAccountInfoaddChildgetPositionposcentergetChildByName	viewsetPositionloginNodesetNameres/ui/login/register.luagetNodeFromLuaUIManagerself  node  G    �6   9    9  B K  
checknewBieProxyGameGlobal �   �6   + = 3  6  99	  X	�6   9  + +  + BX�6   9  + BK  returnHomereturnWorldMapmaxNewBienewBieProxy VideoPlayerRunningGameGlobal 





com  �  %3�3   6 99	  X�6  9B6  9B 96  9B99	B6
 ' B 9B6 9 BX�  BK  replaceScenedisplaycreateapp.scenes.VideoScenerequireVIDOESCENEsceneNametblsetCurScenegetResourceManagerstopAllSoundsSoundManagerisNewAccountloginProxyGameGlobal cb $scene  `  �6   9  -  *  B K  �performWithDelayGlobalscheduler����loadComplete  �  <}�.9    X�6 99  B+  =  9   X�6 99 B+  = 6 ' B 9B3 3 6 '	 B9
6  9 ' B6 9 9B 9B6  9	 6
 '	 B
9

9

 +   + B2  �K  	nameLOADING
addUIUIManagergetRunningScenegetInstanceDirectorcc,
splitStringUtilLOGINGAME_PRELOADRESdata.Config_UI  	initapp.control.CsbObjectPoolrequirescheduler60SecunscheduleGlobalschedulerticker$(****++++++,,,,,,,,--------------..self  =loadComplete #loadComplete2 "res resArr curScene  Z    	
�	6   9    9  B   9  B K  endToLuagetInstanceDirectorcc @   �
-     9   B K    checkUpdateCompleteself  @   �-     9   B K    checkUpdateCompleteself  @   �-     9   B K    checkUpdateCompleteself  � (�3   6 9
  X�6 9	  X�  BX�6  9  BK    getServerVersionMainfestGameGlobalcheckUpdateConfig_Sys  					self checkUpdateCb  �   Ab�-   9     9  ' B    X�-   9     9  ' B    X�-   9     9  ' B    X�K  6    9  -  9  9B6 9	9
+  5 - =- =6 9-	 B=-  9 	 9'
 B=-  9 	 9'
 B=- =B K    ���cb	stat	textservermax	maxn
tablelatestServerallServer  	nameCHANGESERVERConfig_UIgetParent
addUIUIManagerloginNoderegisterNoderegisterNode1getChildByName	viewself serverConf i serverChanged  �   2<�-      X�-      X 	�6  9    9  B   9  -  B 6  9    X 	�6  9    9  B   9 	 B X �6  9   
 X 	�6  9    9  B   9 	 B X �6  9    9  B   9 	 B K  �iosendToLuaDirectorandroidplatformdeviceopenURLgetInstanceApplicationcc									forceUrl  @   �-     9   B K    checkUpdateCompleteself  Z    	
�6   9    9  B   9  B K  endToLuagetInstanceDirectorcc �L #��	��	�6     9  -  9B    X�2 �-  9  	   X Є-  9  	  X ̄-  9    +  6  9 B 6  B6	  B
 X� B X�6  96  996 '
 B99+	  5
 6 -  -  9B=
+  + )�'B	2 ��+  3 
  X� X�6  96	 9			 9		B		 9		B	6
 ' B
9

9

+  5 6 -  -  9B=+  + )�'B	2  �K  6 86 86 86	 8		6
 8

7
 9 
  X
� X
�6
 
 9

6 9 9B 9B6 ' B99+  5! 6 -  -  9B=+  + )�'B
	2  �K  -
  + ="
6
#  
 X�6
# 	
 X
�9
$ 
 X�6
% 9$B
H�9&	 X�+ ='FR�9
( 
 X�6
% 9(B
H�9&	 X�+ ='FR�6
  
 9
)
B
6* 9+=+6 9,
 X�6 9-
 X	�9.9&9$9/906 9$7 X�919&9(92936 9(7 8  X�6  96 9 9B 9B6 ' B99+  54 =5+  + )�'B	) )  + 4  ) 66 97 B) M�89&  X�89&6  9899 X�89'  X�+  X�O�6  9899  X�6  9899)   X�  X�6  9889=:X6�8  X�89&  X�89'  X�6  9889&=96  9889=: X�66 97 B) )��M�8  X�89&  X�89'  X�6  9889&=96  9889=: X�O�6* 89<=;6* 89>==6* 89@=?6* 89B=A6  9C89E=D6* 6G 89FB=F6* 6G 89HB=H6* 6G 89IB=I6* +  =J6* ) =K6* 6G 89LB=L89M
  X�89M X�6* 89M=N89O
  X�6* 6G 89OB=O6* 9L  X�6* )��=L89J
  X�6* 89J=J89K
  X�6* 6G 89KB=K6* 9I X�6* 9I	 X�6* 9+  X�6* 9+ X�6* )  =K6* 9P  X�6* 9P	 X�6* ) =K6 9,
 X�6 9-
 X��9Q	
  XD�6  989L6G 9Q	9RB X;�6  989Q	9&=96  989Q	9=:6* 9Q	9<=;6* 9Q	9>==6* 9Q	9@=?6* 9Q	9B=A6  9C9Q	9E=D6* 6G 9Q	9FB=F6* 6G 9Q	9HB=H6* 6G 9Q	9IB=I9Q	9M
  X�9Q	9M X�6* 9Q	9M=N9Q	9O
  X�6* 6G 9Q	9OB=O6* +  =J6* 6G 9Q	9KB=K6  986G 9Q	9RB=L6* 6G 9Q	9RB=L-  9 9S'I B 9T+ B-  9 9S'U B 9V9Q	9B-  9 9S'W B 9T+ B6  9X+  6Y 9Z9B3[ 6* 9K
  X�6* 9K	 X� BX�6   9\ B2  �K  X��9]	
  X��6  989L6G 9]	9RB X��6  989]	9&=96  989]	9=:6* 9]	9<=;6* 9]	9>==6* 9]	9@=?6* 9]	9B=A6  9C9]	9E=D6* 6G 9]	9FB=F6* 6G 9]	9HB=H6* 6G 9]	9IB=I9]	9M
  X�9]	9M X�6* 9]	9M=N9]	9O
  X�6* 6G 9]	9OB=O6* +  =J6* 6G 9]	9KB=K6  986G 9]	9RB=L6* 6G 9]	9RB=L-  9 9S'I B 9T+ B-  9 9S'U B 9V9]	9B-  9 9S'W B 9T+ B6  9X+  6Y 9Z9B3^ 6* 9K
  X�6* 9K	 X� BX�6   9\ B2  �K    X�-   9_ B6  989L6* 9L X�-   9`B2  �K  -  9 9S'I B 9T+ B-  9 9S'U B 9V89B6* 9I	 X!�-  9 9S'I B 9T+ B-  9 9S'U B 9a6b 9cB-  9 9S'I B 9d'e ) BX��6* 9I	 X�-  9 9S'U B 9a6b 9cB-  9 9S'I B 9T+ BX��6* 9I	 X!�-  9 9S'I B 9T+ B-  9 9S'I B 9d'f ) B-  9 9S'U B 9a6b 9cBXn�6* 9I	 X!�-  9 9S'I B 9T+ B-  9 9S'I B 9d'g ) B-  9 9S'U B 9a6b 9cBXI�6* 9I	  X!�-  9 9S'I B 9T+ B-  9 9S'I B 9d'h ) B-  9 9S'U B 9a6b 9cBX$�6* 9I	 X �-  9 9S'I B 9T+ B-  9 9S'I B 9d'i ) B-  9 9S'U B 9a6b 9cB3j 3k 6  9l-  9 9S'm B5n =oB6p  9q6  9r6 's B9t5u =v=966 97 B=w-  9 9S'U B=x-  9 9S'I B=IB+  3y   XG� )   XC�)  ) M>�6  9z8'{ B6  9| 9}B
  X0�6G  B6G :B X(�6G 6~ 9'� 6G 6  ! 9�+" B A  A A 6G :B XI�:6  96  996 ' B99+  5� =�+  +  )!�'B	2  �K  X3�O�X1�  X/� X-�6  9z '{ B6G 6~ 9'� 6G 6   9�+ B A  A A 6G :B X�:6  96  996 ' B99+  5� =�+  + )�'B	2  �K  3� 6* 9K
  X�6* 9K	 X� BX�6   9\ B2 �3 � 6  96  996 ' B99+  5� 6 -
  -  9B=+  +	 )
�'B	K  K  K   �� idserverListErrorvisibleCloseButton   idforceUpdatevisibleCloseButton	fun1 idforceUpdatevisibleCloseButtongetVersionCode	%.2fformatstringgetChannelTypesdkManager,
split 	textmaxallServer  requestServerListapp.event.FactionEventfactionsendEventEventManagercallBack  changeServerwidgetTouchExtent  common2_jijiangkaifu.pngcommon2_baoman.pngcommon2_huobao.pngcommon2_xinfu.pngcommon2_weihu.pngloadTexture	oranConst_colorDatasetColorcheckUpdateCompleteloadNotice IosShenhegetServerVersionMainfest CALLBOARDConfig_UIremoveUIversionTextsetStringserversetVisiblegetChildByNameinstallVersionAndroidShenhenoticeControlUpdateshieldForCheckVersionCodePathchangeVersionPathshieldForInstallVersioncheckUpdateopenTime	statshieldForChargetonumberpayRatiochatTypepayTypelocalPlayerchatSocketPortchatPortchatSocketAddresschatAddresssocketPortsokectPortsocketAddresssokectAddresslatestServerNamelatestServerloginProxy	maxn
table
param iddefaultSvrNotExistIosforceUpdateIosforceUpdateBySubChannelIosDefaultServAndroidforceUpdate#AndroidforceUpdateBySubChannelAndroidDefaultServPLATFORM_OS_WINDOWSPLATFORM_OS_ANDROIDinWhiteListConfig_SysgetCurPlatFormIosisHideid
pairsAndroidPACKAGE_SHOW_TEST_SERVERserverListGot idserverListErrorPFvisibleCloseButtonserTypeSERVER_LISTPACKAGE_PF idserverListErrorvisibleCloseButtongetRunningScenegetInstanceDirectorcc funcheckServerListhandler idserverListErrorvisibleCloseButton	nameMESSAGEBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManagerfunction	typeloadstringTryRemoveUtf8BOMStringUtilresponsestatusreadyState	viewcheckObjIsNullGameGlobal� 
                           	 	 	 
 
 
 
 
                                                                           " " " % ' ' ' ' ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ( ) ) + + + , , , , , , . . . / / / / 0 0 0 1 1 / / 5 5 5 6 6 6 6 7 7 7 8 8 6 6 = = = = > > > A A A A A A A A B B C D E F F F F H H I J K L L L N N N O O O O O O O O O O O O O O O O O O O O O O O P S T U e e e e e e e f f f f f f f f f f f f f f f g h i e m m m m m m m m m m m m m n n n n n n q q q q q q q q q q q r r r r r s s s s s t t v v v v v v v w w w w w w w w w w w x x x x x y y y y y z { v � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �     				










)/000000000000111111111111111111111111111111113ACCCCCCDDDDEEEEEEFFFFFGGGGGGGGGGHHHHHHHHHHHHHHHHHHIJJJJJJJJJJJJJJJJJJKKMDOPPPPRRRRRRSSSSSSSSSSSSSSSSSSTUUUUUUUUUUUUUUUUUUVV[\\\\\\\\^^^aaaaabfgggggggggggggggggggggggj  self xhr serverList �	a �	district �	b 	�	defaultServ "�	close �	serverConf $�serverRoot �serverRoot1 �serverRoot2 �5  k v    k v  curPlatForm �i 8�latestServerExist �serverTable �  j C  m checkUpdateCb �checkUpdateCb �serverChanged ��openSelect �forceUrl -�forceUpdate �	? ? ?i =tmp 7channelTypeStr 2tmp >'checkUpdateCb (close  �
 ! W���6  9  X�2 P�9  9' B 9+ B6 9 9B6 9
=	6 9 X�+ = 6  96 9=  9 B2 1�6   9B) 6 9 X�6 9 X�) X�) 6 96 96 9' B  X�6 9' 6 ' 	 &	 9' 	 B3  9	 B 9 B2  �K  K  K  	sendregisterScriptHandler GET	open&os_type=PACKAGE_PFs=/Complex/getSvrs&pf=?	findstringPLATFORM_OS_WINDOWSPLATFORM_OS_ANDROIDgetCurPlatFormcheckUpdateCompleteserverIdlatestServerloginProxyserverListGotserverListPathConfig_Sys#XMLHTTPREQUEST_RESPONSE_STRINGresponseTypenewXMLHttpRequestccsetVisible	statgetChildByName	viewisHotFixingGameGlobal              	 	 	 	 	 
 
 
                                 " " $ $ $ $ $ $ $ $ % % % % % % % ' ' ' ' ' ����������  self  Vxhr BcurPlatForm ,osType +des onReadyStateChange 	 �    �6   6 9  X �6   6 9  X 	�6  9    9  B   9  B X �6    9  6	 9
9B K  sceneContextnewBieProxyGameGlobalmakeCrashUIManagerendToLuagetInstanceDirectorPLATFORM_OS_WINDOWSPLATFORM_OS_ANDROIDcccurPlatForm �	 Hg�6  9  X�3 6  96  996 ' B9	9
+  5 =B2  �K  6  9 99 9  9' B A6 9  X�6  9 9B6  99  X�6  9 9B6 9  X�6 9  X�9  9' B  X� 9+ BK  setVisiblerestorecheckUpdateConfig_SystalkingDataManagerinitSdkinitedSdkManagerswitchAccountgetChildByName	viewbuttonsetLoginButtonsdkManagerfun idneedReEnterGamevisibleCloseButton	nameMESSAGEBOXdata.Config_UIrequiresceneContextnewBieProxy
addUIUIManager needExitAtOnceGameGlobal 	














self  Ifinish restoreNode < �   �-     9   ' B 
   X �-     9  ' B K  �removeChildByName_TEXTTMPNAMEgetChildByNamenode  �   :�-     9   B -   9+ B-  96 9'   B AK  ��*repstringsetStringsetVisiblegetStringText_UserPsw Text_PswForView strPsw  N   �-   9     9  - B K   ��removeChild	viewself node  � /���.3   9' B6  9 
 9B)	 )
 5 =B= 9  9	6
 9*	  *
  B A9  9	 9B A 99 B6 99  X�6 99 X� 96 99BX� 9' B 9B 9 B 9' B 96 9B 9' B 9' B 9' B3 6 	 9
  9B) ) 5 =B= 9 	 9	6

 9

*  *  B
 A9 	 9 9
B
 A	 99
 B6 99  X�6 99 X�	 96
 9

9

B	 9+
 B BX�	 96
 9

B3 6 
 9  9'! B5$ 6"   9# B=5% =&B6 
 9  9'' B5( 6"   9# B=5) =&B6 
 9  9'* B5+ 6"   9# B=5, =&B6 
 9  9'- B5. =B2  �K    	back  registerLogin  register  guestLogin  
guest
param  acLogin  touchFunhandler
loginwidgetTouchExtent 
qsrmmsetVisible  _ebxUserPsw 	pw11pw
qsrzhConfig_Language_TEXTTMPNAMEsetName
clonesetStringoptionProxyGameGlobaladdChildgetPositionsetPositionpccsetAnchorPointcallBack  getContentSizecreateEditBoxWithLabelUIManager_ebxUserName	usergetChildByName ����							



          !!!!!!""""###%%%%%)****************++++++++++++++++,,,,,,,,,,,,,,,,----------..self  �node  �nameCb �Text_UserName �_textTmpName 9Text_UserPsw �Text_PswForView {returnCb zcb >< �  b��)-   9   	   X M�-   9  	  X I�-  9     X�K  -   9      X� X�K  6  9 B 6  B B   X�K  99	  X�6
  B X�K    X�)  ) M�6	
 6  9B A	 6

 8B
	
 X	�K  O�6  9- 9
 9B6	 9		9		+
  5 =BX �-  - 9= -  9  )   X �K  -    9  - B K  � ��loadNoticeloadTryTimes	info  	nameCALLBOARDConfig_UIgetParent	view
addUIUIManagergetChannelTypeSdkManagertonumber	shownoNeedloadstringTryRemoveUtf8BOMStringUtilresponsedisposedstatusreadyState�						     """""#&&&&&)xhr self district serverList Aa @configTable 2noNeedShowChannel +show *  i  �
  *k�96  9 9B6  9=6 9 X�2 �6  9	6 9'
 B: '  '
 & 9' 	 B3  9	 B 9B2  �K  K  	sendregisterScriptHandler GET	open_	.txt
splitStringUtilcallBoardPathConfig_Sys#XMLHTTPREQUEST_RESPONSE_STRINGresponseTypenewXMLHttpRequestcc								




5777788899self  *district  *needRetry  *xhr $path onReadyStateChange 	 �   DL�6   99 B  X�9  9B6   99 B  X�9  9B6   99 B  X�9  9B6   99 B  X�9  9B9   X�6 9	9 B9
   X�6 9	9
 B6  9  6  9B+  = K  	viewloginProxyremoveEventsEventManagerscheduler60SecunscheduleGlobalschedulerticker_ebxUserPsw_ebxUserName2_ebxUserName1#unregisterScriptEditBoxHandler_ebxUserNamecheckObjIsNullGameGlobal






self  E �  0 4| �6   ' B 6 ' B3 =3 =3	 =3 =
3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3! = 3# ="3% =$3' =&3) =(3+ =*3- =,3/ =.2  �L  dispose loadNotice setAccountInfo checkUpdateComplete checkServerList enterGame loginLogic setRegisterNode touchFunNext doLogin touchFun checkLoginOrRegister setRegisterNode1 successRegister fakeLocalPlayer layout checkScriptExist createBomb initAni 	init create 	ctor
LOGIN
classdata.Config_UIrequire          � ����4�]5�^����������>�E?tFu-\.�]����uiConfig 1LOGIN .  