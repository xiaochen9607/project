LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\script\skill\Skill2060.lua«   G6  ' B 9	 
    BL createapp.script.skill.SkillBaserequireself  me  adder  id  lv  needRegStateEvent  layer      	K  self     Z-   9 	 
    B  X	9	 9
 6 ' B9BL  ÀSTATE_ONATTACKapp.event.StateEventrequirestateEventRegisterssceneContextnewSkill2060 self  me  adder  id  lv  needRegStateEvent  logic 
 ½  ,1-     9   - B    X-  - 8    9  -  9-  9 -  9)'B K   ÀÀÀÀlvidmeaddStateifPassiveIsSucself rate targets k  Ï  '  9  B  X2 9 9 X9 9  X9 X2 z9 99 8
  X9 99 8)   X2 m  9 ' B  9	  B  X_9 99 9
 <9 9 99) + B9  9+  5 9	 =	B9 99 B  9 ' B=9 9B9  9B96  9	 
 ) B4  6 
 BH9' 9&+ <FRø) 	 )
 M8 9B9' 9&8 X3 8 99+    9 ' 98B+  9 +   B	2 Oâ2 2  K  K  K  K  countSkillDamage y,x
pairsgetRow3ColNTilesByDirMapUtildirgetLeadergetTilePosition
valueshoutSkillNameId  playEffectAnidefenderfindFriendGroupsceneContextcdifPassiveIsSuc	rategetAttrIncidskillCDisCastSkill
adderattackermecheckPassiveCanUse



!################$%''self  params  rate %gtargets Qpos ;dir 6tiles /tmpTiles .	 	 	k v    k targetTile finish      	>K  self   ¾    A6   ' B 6  ' 3 B 3 = 3 = 3
 =	 3 = 2  L   dispose STATE_ONATTACK create 	ctor Skill2060
classapp.utils.MapUtilrequire
<?>AASkill2060 
  