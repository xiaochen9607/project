LJO@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\control\BossSocket.luai   	+  =  +  = + = + = K  disposedconnectedretryScheduleIdsocketself  
 � 
 6-   9 B6 ' B6  9 6 6 '	 B96 
 9	B AL �msgReceivedhandler(BOSS_SOCKET_MESSAGE_PARSE_COMPLETEDapp.event.BossSocketEventBossMsgStaticaddEventEventManagerapp.control.BossMsgrequirenewBossSocket self  BossSocket  � C{ 9 B 9B6 9 X'�6 9 X#�6 9 9B 9B6	  9
B6  9	 -
  9

9

+  5 6   9 B=6   9 B=, *  B	K  9   X�6 99 B6  9  6	 ' B	9		
 BK   �!BOSS_SOCKET_MESSAGE_RECEIVEDapp.event.BossSocketEventrequiresendEventEventManagerunscheduleGlobalschedulerretryScheduleIdcloseCb	fun1returnToLoginhandler ids	nameMESSAGEBOX
addUIUIManagerdisposeSocketGameGlobalgetRunningScenegetInstanceDirectorccMODULE_PLAYER_tokenMissMODULE_PLAYERmsgTypegetCmdgetType���		uiConfig self  Dtarget  Dmsg  Dtype @cmd =curScene  � 	 Fb.9    X�K  9-  9 X�9   X�6 99 B+ = 6  9  6	 '
 B9B9-  9 X�+ =   9 B9-  9 X�+ =   9 B9-  9 X�+ =   9 B9-  9 X�9   X�6 99 BK  �EVENT_DATAEVENT_CONNECT_FAILUREEVENT_CLOSEDtoRetryEVENT_CLOSEBOSS_SOCKET_CONNECTEDapp.event.BossSocketEventrequiresendEventEventManagerconnectedunscheduleGlobalschedulerretryScheduleIdEVENT_CONNECTED	namedisposed									SocketTCP self  G__event  G �  V-  9   X�6 9-  9 B-   9BK   �connectunscheduleGlobalschedulerretryScheduleIdself dt   �	 )IN9    X�6 99  B  9 B9   X�9  9B9  9B+  = 3 6  9	  6
 ' B9B6 9 -  B=  2  �K  �scheduleGlobalBOSS_SOCKET_DISCONNECTEDapp.event.BossSocketEventrequiresendEventEventManager 
closedisconnectsocketclearSocketEventListenersunscheduleGlobalschedulerretryScheduleIdreTryInterval self  *timeOut  �   	^6  ' B6  99BK  	datadataReceivedBossMsgStaticapp.control.BossMsgrequireself  
__event  
 � 	Uof9    XM�-  9- - + B=  9   9-  96   9 B A9   9-  96   9 B A9   9-  96   9 B A9   9-  96   9 B A9   9-  9	6   9
 B A9  99  ' B9  99  *  B9  99  ) B9  99  ) B9   9BK  ���connectsetReconnTimesetConnFailTimesetTickTimeBossSocketsetNameonDataEVENT_DATAEVENT_CONNECT_FAILUREEVENT_CLOSEDEVENT_CLOSEonStatushandlerEVENT_CONNECTEDaddEventListenernewsocket��̙����




SocketTCP IP port self  V �   7z6  9 9B 9B9  X�K   9B9  9 BK  	sendsocketgetPackconnectedgetRunningScenegetInstanceDirectorccself  msg  curScene 	__pack  Z   �9  
  X�9   9BK  removeAllEventListenerssocketself  	 �    �6   9    9  B    X �6     9  B 6     9  B K  returnToLogintokenMisssdkManagerGameGlobal �L��)  =    9 B+  = + = +  = + = +  = 4  = 4  = 9	   X�6
 99	 B6 9 9B 9B6  9 -  99B6  9  6 B6 9 9B 9B3   X�6  9 -	  9		9		+
  5 =, *  B	X� BK   �	fun1 idMESSAGEBOX
addUI MsgStaticremoveEventsEventManager	nameCONNECTINGremoveUIUIManagergetRunningScenegetInstanceDirectorccunscheduleGlobalschedulerretryScheduleIdcallBackList	listcurCallBackcurMsgCallingBackcurMsgnetStatesocketclearSocketEventListenerscurReTryTime���			






uiConfig self  MshowMsg  McurScene #*curScene okFun  �  
 '�
+ =  6  9  B9   X�6 99 B  9 B9   X�9  9B9  9	B+  = K  
closedisconnectsocketclearSocketEventListenersunscheduleGlobalschedulerretryScheduleIdremoveEventsEventManagerdisposed		
self    � 	 " 1� �6   ' B 6   ' B 7  6   ' B 6  ' B6  ' B996  '	 B6
 ' B) 3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3! = 2  �L  dispose returnToLogin clearSocketEventListeners sendMsg connect onData toRetry onStatus msgReceived create 	ctorBossSocket
class!framework.cc.utils.ByteArraysokectPortsokectAddressframework.cc.net.SocketTCPdata.Config_Sysdata.Config_UImsgTypeapp.const.Const_MsgTypeapp.control.EventManagerrequire	


,L.\Nb^wf�z��������uiConfig 'config $SocketTCP !IP  port ByteArray BossSocket reTryInterval   