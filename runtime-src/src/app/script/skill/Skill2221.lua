LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2221.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  'l	-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_BATTLECONTROL_STARTSTATE_ONAFTERHPCHANGESTATE_ONABNORMALSTATEapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2221 self  (me  (adder  (id  (lv  (needRegStateEvent  (logic 
 �  n�9 9  X�K  99  X�6 98  X�  X�9 998  X�9 9989  X�K  9  X�K  6  99B  X�K  9	  X�K  9  9
' B9  9
' B#*   X�K  + =	9  X#�9 998  X�9 9989  X�9 99899  X�9 9989 9B9 998+  =9  9)�5	 9
 =
	BK  shoutSkillNameId  idplayEffectAniremoveFromParenteffAni
maxHphpgetAttribValueabnormalState	typeisControlStateGameGlobal
stateConfig_HeroSkillstateId
addermetarget�̙����				







self  oparams  oadder hhp -;maxHp 6 � 
 9W*9  9 X�K  9	  X�K  9   9' B9   9' B#*  X�9  9)�V8  X�9   9)�VBX�9  9)�V8  X�9   99  )�V9		 B9   9
)�5 9	 =	BK  shoutSkillNameId  idplayEffectAnilvaddStateremoveState
state
maxHphpgetAttribValue
valuedefenderme �̙����





self  :params  :hp +maxHp & � 	 
4;9   9' B9   9' B#*   X�K  9   99  )�V9 B9   9)�5 9 =	BK  shoutSkillNameId  idplayEffectAnilvaddState
maxHphpgetAttribValueme�̙����self   hp maxHp      	CK  self   �    F6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 2  �L   dispose STATE_BATTLECONTROL_START STATE_ONAFTERHPCHANGE STATE_ONABNORMALSTATE create 	ctor Skill2221
class	(9*A;DCFFSkill2221   