LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill8101.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  .   + =  K  shieldEffectself   Ó 	 0u-   9 	 
    B  X$9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9B9	 9
 6 ' B9BL  ÀSTATE_ONABNORMALSTATESTATE_ONBEATTACKEDSTATE_ONAFTERBEATTACKEDSTATE_ONATTACKapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill8101 self  1me  1adder  1id  1lv  1needRegStateEvent  1logic 
' µ  IZ"9  9 XD9  9  X@9 )  X9
  X6  99B  X6 ' B 9	9
9B  X9  9 ' B "=9 )  X9
  X6  99B  X6 ' B 99
9B  X9  9 ' B "=K  rangerExtcheckIsRangermeleeExtgetAttrInc
valuejobdefendercheckIsMeleeapp.const.Const_JobrequirecheckIsActiveSkillConfig_SkillUpgradeskillIdlv
adderattackerme								self  Jparams  J    +C19 9  X&9 9  X"6  99B  X9 )  X  9 ' B  9	  B  X9  9
+  5 B+ =9  99BK  stateIdremoveStateabnormalState shoutSkillNameIdôøplayEffectAniifPassiveIsSucimyCtrlRategetAttrInclv	typeisControlStateGameGlobal
addermetargetself  ,params  ,rate  ¥  
 7?
9  9 X9  9  X9 )  X  9 ' B  9  B  X9   9+  5 B)  =	K  
value shoutSkillNameIdóøplayEffectAniifPassiveIsSucimmunityRategetAttrInclv
adderdefenderme
self   params   rate       KK  self  params   á
  ¸¢S'9  )  X39 9 X/9 9 X+99  X'99)  XK  9 
 X  9 '	 B9  9
' B9  9
' B# X+ = 9  99 *	  9
  +  )  , + B9  )  XH9 9 XD9 9 X@99  X<9
  X6  99B  X2  9 ' B  9  B  X(9  9+  5 B9  9
' B9 9
' B6 9!B  9 9  X9 9  9 99	 +
   + 9 B9  )	  X09 9 X,9 9 X(9
  X6  99B  X  9 ' B  9  B  X9  9+  5 B9 9B  9 ' B9 9 "BK  modifyMoraledecreaseMoraleValuegetMorale shoutSkillNameIdöødecreaseMoraleRatecountSkillDamage
floor	mathdefatk shoutSkillNameIdõøplayEffectAniifPassiveIsSucattackExtRatecheckIsActiveSkillConfig_SkillUpgradeaddState
maxHphpgetAttribValueshieldRategetAttrIncshieldEffectjobidskillIdattackerdefendermelvîñ				

      !!!!!!""""####$$$$$$'self  ¹params  ¹shieldRate hp maxHp rate ..atk def value rate -defenderMorale 
percent      	|K  self      # 6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 2  L   dispose STATE_ONAFTERBEATTACKED STATE_ONBEHEALED STATE_ONBEATTACKED STATE_ONABNORMALSTATE STATE_ONATTACK create 	ctor Skill8101
class	 /"=1I?QKzS~|Skill8101   