LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2250.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  -   )  =  K  effectCountself   �  Z-   9 	 
    B  X	�9	 9
 6 ' B9BL  �STATE_ONSETDIEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2250 self  me  adder  id  lv  needRegStateEvent  logic 
 �  \�9 9  X�K  9 )  X�K  9 9 99 +  + B6  BH�
  9 ' B 9	9 +   + B	FR�9 9 9	9 +  + B 	  X�K  6  BH&� 9	
' B	 	 X
�)	 9
9 
 X
� 9

' B
#
	
* 
 X
� 9
B
 9
)�B
9
 
 9

+  5 9 =B
9
 

=
 X�FR�K  shoutSkillNameId  idplayEffectAnisetToDiehplv
maxHpgetAttribValuefindEnemyGroupcountSkillHeal
valuegetAttrInc
pairsfindFriendGroupsceneContexteffectCountme
group �̙����				





self  ]param  ]friends J  _ v  heal enemys 1) ) )_ &v  &maxHp      	+K  self   �    .6   ' 3 B 3 = 3 = 3 = 3
 =	 2  �L   dispose STATE_ONSETDIED create 	ctor Skill2250
class	(-+..Skill2250 
  