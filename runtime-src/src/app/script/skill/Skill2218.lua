LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2218.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  *   + =  K  isAttackself   �  c
-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONATTACKSTATE_BATTLECONTROL_STARTapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2218 self  me  adder  id  lv  needRegStateEvent  logic 
 �   9    X�K  9  99 )�V9 B9  9)�5 9 =BK  shoutSkillNameId  idplayEffectAnilvaddStatemeisAttackself   �   Mi9 9  X�K  99  X�K  9   X�K  + = 9  9)�VB9 99 )�V9 6 99	B9 9
B  X�99)�V8  X�9 9)�VB9 9' B  X�)    9 ' B  X�)  9 99 +  6	 9		"B			 +
  9 BK  id
floor	mathcountSkillDamagepergetAttrInchpgetAttribValue
statecheckCanNotAction
dizzyskillEffectConfig_GameDatalvaddStateremoveStateisAttackdefendermeattacker







self  Nparams  Nhp 9per  c   (9  9)�V8  X�9   9)�VBK  removeState
statemeself   �    .6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 2  �L   dispose STATE_ONATTACK STATE_BATTLECONTROL_START create 	ctor Skill2218
class
&,(..Skill2218   