LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill1014.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  '   )  =  K  
countself   �  Z-   9 	 
    B  X	�9	 9
 6 ' B9BL  �STATE_ONSECONDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill1014 self  me  adder  id  lv  needRegStateEvent  logic 
 �  
 8
9   9B  9 ' 9   B9   99  9 9 ,	
 )�B9  99 8=9  99 8=	K  damagetarget
statelvidaddState
valuegetAttrIncgetMyTargetGroupme					
self  target damage  �  7-     9   -  9-  9B    X�-   9    9  -  9-  9 -  9)'B K   �lvidaddStatetargetmeifSkillIsSucself  � 
*P.9  9  X#�9 )  X�9  = 9 
  X�9 9 X�) = 2 �* 3 9  99  +  9	 +
  9   B	9  9	9 B2  �K  K  playEffectAniiddamagecountSkillDamage isAlivetarget
count
adderme�̙�����self  *params  *delayTime finish  �  	 %6B
9   9B  X�6 ' B99L 9   9B9   9 B  X�6 ' B99L X�6 ' B99L K  notInRangesuccesscheckTargetInMyRangenoTargetskillTipsdata.Config_GameDatarequiregetMyTargetGroupme
self  &target  K   O9   99 + BK  idsetCanNotActionmeself   �    S6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 2  �L   dispose checkCanUse STATE_ONSECOND useSkill create 	ctor Skill1014
class
!@.LBROSSSkill1014   