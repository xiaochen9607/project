LJg@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\framework\cc\components\behavior\EventProtocol.lua  !-  9 9  ' B4  = )  = K  ΐnextListenerHandleIndex_listeners_EventProtocol	ctor
superEventProtocol self   Μ  H}6  6  B X X+ X+ ' B6 9 B 9 8  X9 4  <6  B X X	6	 '
 B6   B ' 9  = 6 9 B  X' 9 84 >><6 )  X6 ' 6	 9 B	
  6  B AL target_K%s [EventProtocol] addEventListener() - event: %s, handle: %s, tag: %sprintInfo
DEBUGtostringnextListenerHandleIndex_handler€EventProtocol:addEventListener(eventName, listener, target) is deprecated, please use EventProtocol:addEventListener(eventName, handler(target, listener), tag)PRINT_DEPRECATEDuserdata
tablelisteners_
upper9EventProtocol:addEventListener() - invalid eventNamestring	typeassert				


self  IeventName  Ilistener  Itag  Ittag ,handle  '   0+ =  K  
stop_self   Η  I&6 96 9 B A = 9 6 )  X6 ' 6 9 B B9 8  X2 09 =	+ =
3 =6 9 8BH 6 )	 	 X6 '
 6 9 B  B:=:
 B9
  X	6 )	 	 X
6 '
 6 9 B BXFRή9 2  L K  H%s [EventProtocol] dispatchEvent() - break dispatching for event %stagM%s [EventProtocol] dispatchEvent() - dispatching event %s to listener %s
pairs 	stop
stop_targetlisteners_target_2%s [EventProtocol] dispatchEvent() - event %sprintInfo
DEBUGtostring
upperstring	name		self  Ievent  IeventName 	@# # #handle  listener        xG6  9 BH6  	 BH

 X+  <
6 )  X6 ' 6 9 B
  B9 L F
R
μFRζ9 L target_tostringQ%s [EventProtocol] removeEventListener() - remove listener [%s] for event %sprintInfo
DEBUGlisteners_
pairsself  !handleToRemove  !  eventName listenersForEvent    handle _      {W6  9 BH6  	 BH
: X+  <
6 )  X6 ' 6 9 B
  BF
R
νFRη9 L target_tostringQ%s [EventProtocol] removeEventListener() - remove listener [%s] for event %sprintInfo
DEBUGlisteners_
pairsself   tagToRemove     eventName listenersForEvent    handle listener      (h9  6 9 B+  <6 )  X6 ' 6 9 B B9 L target_tostring]%s [EventProtocol] removeAllEventListenersForEvent() - remove all listeners for event %sprintInfo
DEBUG
upperstringlisteners_self  eventName   Θ   p4  =  6 )  X6 ' 6 9 B A9 L target_tostringH%s [EventProtocol] removeAllEventListeners() - remove all listenersprintInfo
DEBUGlisteners_self   Ί 
  =x6  96  B A  9 86  BH+ L FRό+ L 
pairslisteners_tostring
upperstringself  eventName  t 

  _ __   ©   \	6  9 BH6 ' 	 B6   BH		6 ' 6 :
B6 	 B AF	R	υFRλ9 L target_tostring$--     listener: %s, handle: %s-- event: %sprintflisteners_
pairsself    name listeners    handle 	listener  	      9  5 B9 L target_
  addEventListenerdispatchEventremoveEventListenerremoveEventListenersByTag removeEventListenersByEvent$removeAllEventListenersForEventremoveAllEventListenershasEventListenerdumpAllEventListenersexportMethods_self       	K  self       	K  self   Ν   !> ’6   ' B 6 '   B3 =3 =3	 =3 =
3 =3 =3 =3 =3 =3 =3 =3 =2  L  onUnbind_ onBind_ exportMethods dumpAllEventListeners hasEventListener removeAllEventListeners  removeEventListenersByEvent removeEventListenersByTag removeEventListener dispatchEvent addEventListener 	ctorEventProtocol
class..Componentimport	$E&UGfWnhvpx‘‘Component EventProtocol   