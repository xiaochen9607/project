LJO@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\control\ChatSocket.lua   +  =  +  = + = + = ' = ' = K  	portIPdisposedconnectedretryScheduleIdsocketself   χ  F-   9 B- 9=- 9=6 ' B6  9 6	 6 '	
 B96 
 9B AL ΐΐmsgReceivedhandler(CHAT_SOCKET_MESSAGE_PARSE_COMPLETEDapp.event.ChatSocketEventChatMsgStaticaddEventEventManagerapp.control.ChatMsgrequirechatPort	portchatAddressIPnewChatSocket config self  newChatSocket   
  +9    X6 99  B+  =  6  9  6 '	 B9 BK  !CHAT_SOCKET_MESSAGE_RECEIVEDapp.event.ChatSocketEventrequiresendEventEventManagerunscheduleGlobalschedulerretryScheduleIdself  target  msg   Ι 	 A]#9    XK  9-  9 X9   X6 99 B+  = + = 6  9  6	 '
 B9B9-  9 X+ = 9-  9 X+ = 9-  9 X+ = 9-  9 X	9   X6 99 B+  = K  ΐEVENT_DATAEVENT_CONNECT_FAILUREEVENT_CLOSEDEVENT_CLOSECHAT_SOCKET_CONNECTEDapp.event.ChatSocketEventrequiresendEventEventManagerconnectedunscheduleGlobalschedulerretryScheduleIdEVENT_CONNECTED	namedisposed									SocketTCP self  B__event  B 8  L-   9 BK   ΐconnectself dt   Η
 +PC9    X6 99  B+  =    9 B9   X9  9B9  9B+  = 3 6  9	  6
 '	 B9B6 9 -  B=  2  K  ΐscheduleGlobalCHAT_SOCKET_DISCONNECTEDapp.event.ChatSocketEventrequiresendEventEventManager 
closedisconnectsocketclearSocketEventListenersunscheduleGlobalschedulerretryScheduleIdreTryInterval self  ,id  ,timeOut     	X6  ' B6  99BK  	datadataReceivedChatMsgStaticapp.control.ChatMsgrequireself  
__event  
 Φ 
h`  X-  9=  -  9= X
6 99=  6 99= +  = 9   XM- 9	9  9 + B= 9  9
- 96   9	 B A9  9
- 96   9	 B A9  9
- 96   9	 B A9  9
- 96   9	 B A9  9
- 96   9	 B A9 99 ' B9 99 *  B9 99 ) B9 99 ) B9  9BK  ΐΐconnectsetReconnTimesetConnFailTimesetTickTimeChatSocketsetNameonDataEVENT_DATAEVENT_CONNECT_FAILUREEVENT_CLOSEDEVENT_CLOSEonStatushandlerEVENT_CONNECTEDaddEventListenernewsocketkuaFuChatPortkuaFuChatAddrkuaFuProxyGameGlobalchatPort	portchatAddressIP΅ζΜ³ζύconfig SocketTCP self  iisKuaFu  i   )R{6  9 9B 9B9 
 X9 9 XK  6 99	  X9
 -  9 X9 -  9 XK   9B9  9 BK  ΐ	sendgetPackchatPort	portchatAddressIPinitedkuaFuProxyGameGlobalisConnectedsocketconnectedgetRunningScenegetInstanceDirectorcc			config self  *msg  *curScene 	!__pack  Z   9  
  X9   9BK  removeAllEventListenerssocketself  	 Έ  
 !)
+ =  6  9  B9   X6 99 B+  =   9 B9   X9  9B9  9	B+  = K  
closedisconnectsocketclearSocketEventListenersunscheduleGlobalschedulerretryScheduleIdremoveEventsEventManagerdisposed		
self  " Λ   -w 6   ' B 6   ' B 7  6   ' B 6  ' B6  ' B6  ' B6 '	 B) 3 =
3 =3 =3 =3 =3 =3 =3 =3 =3 =2  L  dispose clearSocketEventListeners sendMsg connect onData toRetry onStatus msgReceived create 	ctorChatSocket
class!framework.cc.utils.ByteArrayframework.cc.net.SocketTCPdata.Config_Sysdata.Config_UImsgTypeapp.const.Const_MsgTypeapp.control.EventManagerrequire
!A#VC\Xz`{uiConfig #config  SocketTCP ByteArray ChatSocket reTryInterval   