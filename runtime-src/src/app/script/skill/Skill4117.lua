LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill4117.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  c-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONSETDIEDSTATE_ONBEATTACKEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill4117 self  me  adder  id  lv  needRegStateEvent  logic 
 �  Xu9 9  X�K  9  9B  X�K  9 9*  8  X�K  9  9' B9 )   X:�  9 ' B  9	  B  X0�9  9
5 B)  =)  =9  99 	 9'
 B  X�) B9  99 *  9	 B9  99 * 9	 B9  9+  5 9	 =	B9  99 BK  removeStateshoutSkillNameId  idplayEffectAnilvaddState
maxHp
setHpcountValue   addFilterifPassiveIsSuc	rategetAttrInc
valuehpgetAttribValue
statecheckRevivedmedefender����					

self  Yparams  Yhp @rate 	6 c   
*9 9  X�K  9  9BK  clearFiltersme
groupself  params       	0K  self   �    36   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 2  �L   dispose STATE_ONSETDIED STATE_ONBEATTACKED create 	ctor Skill4117
class	(-*2033Skill4117   