LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2159.lua�   G6  ' B 9	 
    BL create&app.script.skill.SkillRevivedBaserequireself  me  adder  id  lv  needRegStateEvent  layer  &   ) =  K  	tickself   �  c-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONSECONDSTATE_ONBEATTACKEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2159 self  me  adder  id  lv  needRegStateEvent  logic 
 �  9y9   =  9  )  X1�)  =  9  9' B9  9' B#*  X�K  9 9 99 ) +	 +
 + B  9 ' B6	  BX	�
 9

9 +   +  9 B
 9
)�BE	R	�K  playEffectAniidcountSkillHealipairs
addHpgetAttrIncfindFriendGroupsceneContexthp
maxHpgetAttribValueme	tick��̙��������				







		self  :param  :maxHp *hp %targets value   _ v   � 	 %I&9  9 99  9B  X�K  9   9' B9   9' B#*   X�K    9 ' B6
 99	"B=	K  
floor	math
valuePergetAttrInchp
maxHpgetAttribValuedefendercheckGroupIsMyFriendsceneContextme����self  &params  &maxHp hp Per 	     	0K  self   �    36   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 2  �L   dispose STATE_ONBEATTACKED STATE_ONSECOND create 	ctor Skill2159
class
$-&1022Skill2159   