LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill4113.lua²   G6  ' B 9	 
    BL create&app.script.skill.SkillRevivedBaserequireself  me  adder  id  lv  needRegStateEvent  layer  ,   4  =  K  effectlistself   È  c
-   9 	 
    B  X9	 9
 6 ' B9B9	 9
 6 ' B9BL  ÀSTATE_ONREMOVESTATE_ONSETDIEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill4113 self  me  adder  id  lv  needRegStateEvent  logic 
 8   %-     9   B K   ÀremoveEffectself  §
 ¶­'9 9  X2 °9  9+  5 9 =B6   Xo6 9  Xk  9 B9	 9	   9 9
 99 5 )	'+
  ) B<9	 9	   9 9
 99 5 )	'+
  ) B<9	 9	   9 9
 99 5 )	'+
  ) B<9	 9	   9 9
 99 5 )	'+
  ) B<6 9	 BX9  X	 9)
 BER÷9 9
 9* 5 6 99=6 99=)'3 )	 B  X9  X 9) B  9 ' B9 9
 99 +  + B9 9
 99 +  +	 +
 + B+  6  BX	9
  X
 E	R	ú  X2  K  6  BX		
 9
 +   +  9 ) BE	R	õ2  K  K  countSkillDamagesummonObjectfindFriendGroupfindEnemyGroup
valuegetAttrInc yheightx  
widthsetScaleipairs x´y¼ xÔy¼ x´y¦ xÔy¦sceneContexteffectlistremoveEffectframeSizeUIManagershoutSkillNameId  idplayEffectAnime
groupÊ2Èd															 ####$$$$%%%%%%%%%$$''self  ¶params  ¶W
 
 
_ v  leffect 	damage 2enemys *arrFriend 
 target   _ v    _ 	v  	 Î 
  /<6  9 BX9  X
6  9	 B  X 9BERñ4  = K  checkObjIsNullGameGlobalremoveFromParenteffectlistipairsself    k v   U   	E9  9 X99  X K  idtargetmeself  
params  
     	KK  self   È    N6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 2  L   dispose STATE_ONREMOVE removeEffect STATE_ONSETDIED create 	ctor Skill4113
class
:C<IELKNNSkill4113   