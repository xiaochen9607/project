LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2137.luaĞ   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer  N   	)  =  )  = +  = K  noSkillTarget
tick2	tickself   Ç  c-   9 	 
    B  X9	 9
 6 ' B9B9	 9
 6 ' B9BL  ÀSTATE_ONREMOVESTATE_ONSECONDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2137 self  me  adder  id  lv  needRegStateEvent  logic 
  
.f)  =  )  = 9 9 99 B6  BX9-  8  X	 99
 -  9 , *  B9- 8  X	 99
 - 9 , *  BERä  9	 BK  ÀÀremoveStateAndEffectlvaddState
stateipairsfindEnemyGroupsceneContextme
tick2	tickŬÛ								defStateId atkStateId self  /enemys $  _ v   Ċ  ^µ(!9   =  9  )  XV9 9)A)8  X  9 BXJ9 9 99 B+  )  6 99 
 9B A 6	 	 BX
6 9 9B A 6 9
  B X  E
R
ï9   X9  X	  9 B  X9  X	  9 B	 99
 + 9 B	 9B  X
= 9 	 96
 9

9

5 B= )  =  K   isRepeatForever˙˙˙˙offset 
ordersilentskillEffectConfig_GameDataplayEffectAnisilentEffectcheckCanNotSkillidsetCanNotSkillnoSkillTargetpGetDistanceipairsgetTilePositionpccfindEnemyGroupsceneContextremoveStateAndEffect
stateme	tickµĉÌ³ĉŭ	






!self  _param  _state Renemys Dchoose Cdis Bpix ;  _ v  ePix 	curDis      (K	9    X9   99 + B+  =  9   X9 9  X6  99 B  X9  9B+  = K  checkObjIsNullGameGlobalremoveFromParentsilentEffectidsetCanNotSkillnoSkillTarget	self  !     V9  9 X
99  X  9 B  9 BK  removeStatesremoveStateAndEffectidtargetmeself  params     W]
9  9 99  B6  BX9-  8  X	 9-
  B9- 8  X	 9-
 BERìK  ÀÀremoveState
stateipairsfindEnemyGroupsceneContextme
defStateId atkStateId self   enemys   _ v   6   j)  =  )  = K  
tick2	tickself   ˘   ? n6   ' 3 B )}S)|S3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 2  L   dispose removeStates STATE_ONREMOVE removeStateAndEffect STATE_ONSECOND setuseSkill create 	ctor Skill2137
class	&I(TK[Vg]mjnnSkill2137 defStateId atkStateId   