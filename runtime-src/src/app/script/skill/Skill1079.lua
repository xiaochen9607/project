LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill1079.lua�   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self   �  c-   9 	 
    B  X�9	 9
 6 ' B9B9	 9
 6 ' B9BL  �STATE_ONBEATTACKEDSTATE_ONUNREVALLEDDAMAGEapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill1079 self  me  adder  id  lv  needRegStateEvent  logic 
 �  @s9   9B  X�K  9  9 9 ) + + +	 B= 4  = 6 9 BX�9 6 
 9) ) B<ER�9   9	9  9
 9 ,	 *
  , + B6 9 BX�	  9 
 BER�9   9+  5 9
 =BK  shoutSkillNameId  playEffectAnicountDamagelvidaddStaterandomBattleRandomipairstimesMapfindFriendGroupsceneContexttargetsgetMyTargetGroupme��				



		self  Atarget <  _ v    _ v   �    &-   9   - 8  )    X �K  -  9     X �K  -     9  - B K   ��countDamageisAlivetimesMapself target  � ;$
  9  ' 9  B3 9 9 8 < 99 +  	 +
  9 *  B	 99 B2  �K  playEffectAniidcountSkillDamagetimesMap medamagegetAttrInc��̙����				

self  target  damage cb  �   !09  9 X�K  99  X�K  9  X�+ =K  isHurtidskillIdattackermeself  params   �  %69  9 X�K  99  X�K  9	  X�9)   X�9=K  countValue
valueidskillIdattackerme self  params   X   
>9   9B  X�+ X�+ L getMyTargetGroupmeself       	CK  self   �   # E6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 2  �L   dispose checkCanUse STATE_ONBEATTACKED STATE_ONUNREVALLEDDAMAGE countDamage useSkill create 	ctor Skill1079
class	".$40<6@>DCEESkill1079   