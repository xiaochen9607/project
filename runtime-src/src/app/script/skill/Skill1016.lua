LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill1016.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self     Z-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_ONDIEDapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill1016 self  me  adder  id  lv  needRegStateEvent  logic 
   	 "5&-   
   X -   9     X -    9  ' - 9-  B -   9- 9+    +  - 9B-  9  9    9  + B K   ÀsetStoryModesceneContextidcountSkillDamageme
valuegetAttrIncisAlivetar self damage   C9  9 99  +  B )   X2 69   99  9 9 B9  9 9+ B: 9' B 9'	 B#)  ) M8
	
 9

'	 B
8	 9' B#


 X
 8	Oð3
 9  	 9
 9  *  B2  K  K  flyingSkill hp
maxHpgetAttribValuesetStoryModelvidaddStatefindEnemyGroupsceneContextmeÿ				
self  Ctargets ;tar (maxHp $hp  minPer   i per com 
 «  "I09 
  X9 9  X9 9 XK  9 9 99 B)  ) M8	 98

 9

B


 
 
BOõK  getMoralemodifyMoralefindEnemyGroupsceneContextattackermeidskillIdÀþself  #params  #arrTar   i 
     
;	+ L self       	GK  self   ¾    I6   ' 3 B 3 = 3 = 3 = 3
 =	 3 = 3 = 2  L   dispose checkCanUse STATE_ONDIED useSkill create 	ctor Skill1016
class	.80D;HGIISkill1016   