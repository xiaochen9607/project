LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill1033.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  4   ) =  )  = K  dam	tickself     'l	-   9 	 
    B  X9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9BL  ÀSTATE_ONBEATTACKEDSTATE_ONREMOVESTATE_ONSECONDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill1033 self  (me  (adder  (id  (lv  (needRegStateEvent  (logic 
    F) 9  9 99  B6 9 B)  ) M8
 99  9 9 BOø9   99  9 9	 BK  lvidaddState	maxn
tablefindEnemyGroupsceneContextme






self   dis arr len 	 	 	i  ¡  ">&9  9  XK  *  9 = 9 )  X)  = 9   99 +  
  9 ' B+	  9
  B9   99 BK  playEffectAniid
valuegetAttrInccountSkillDamage	tick
addermeÿµæÌ³æý		self  #param  #delayTime  |   89  9 X9  9  XK  9 9 = K  
valuedam
adderattackermeself  param   ¹  	)G?9  9  X9  9 X9 9 XK  9 	  XK  9    9 ' B"9   99  +   +	 9
 B9   9)	B)  = K  playEffectAnicountSkillHealpergetAttrIncdamidtarget
adderme 									self  *param  *hpRecovered      	NK  self   á   ! Q6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 2  L   dispose STATE_ONREMOVE STATE_ONBEATTACKED STATE_ONSECOND useSkill create 	ctor Skill1033
class$6&=8L?PNQQSkill1033   