LJS@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\framework\cc\net\SocketTCP.lua+   !-   9   D  	�gettimesocket  �   P%6    B 9' B 9B= = +  = +  = +  = '
 =	 +  = = + = K  isConnectedisRetryConnecttcpSocketTCP	nameconnectTimeTickSchedulerreconnectSchedulertickScheduler	port	hostexportMethods&components.behavior.EventProtocoladdComponentcc		
self  __host  __port  __retryConnectWhenFailure   *   3=  L  	nameself  __name   8   $8.  L   �SOCKET_TICK_TIME self  __time   =   )=.  L  �SOCKET_RECONNECT_TIME self  __time   C   /B.  L  �SOCKET_CONNECT_FAIL_TIMEOUT self  __time   h   l-     9   B    X�-   9BL   �_onConnected_connectself __succ  �   %gw-   9      X�K  -   -  9  X�)  = -   -  9-  = -   9  -   X �-   +  = -     9  B -     9  B -  B K   �  �_connectFailure
closewaitConnectisConnected

self SOCKET_TICK_TIME SOCKET_CONNECT_FAIL_TIMEOUT __checkConnect  � G�G>  X�=    X�= 
  X�= 6 9    X�9 ' B+ -  999  B6 	 B
  X�6 	 BH
�9	
 X�+ X�F
R
�  X�-  9B= X�-  9B= 9   X�9 	 9)
  B3  B  X�3 -	 9		 - B	=	 2  �K  	� ���scheduleGlobalconnectTimeTickScheduler  settimeout	tcp6tcp
inet6family
pairs	dumpgetaddrinfodns!Host and port are necessary!assertisRetryConnect	port	host!!!"""""+----;<<<<<<>>socket SOCKET_TICK_TIME SOCKET_CONNECT_FAIL_TIMEOUT scheduler self  H__host  H__port  H__retryConnectWhenFailure  Hisipv6_only 6addrinfo 1err  1  k v  __checkConnect __connectTimeTick  �   �6  9 9 ' &B9  9 BK  	sendtcp is not connected.	nameisConnectedassertself  __data   �	 9�	9    X�9   9B9   X�-  99 B9   X�-  99 B  9 5 - 9=BK  �
�	name  EVENT_CLOSEdispatchEventtickSchedulerunscheduleGlobalconnectTimeTickScheduler
closetcp	scheduler SocketTCP self   L   �  9  B+ = K  isRetryConnect_disconnectself   � D�9   99 9 B  X�-   X�+ X�+ L �	port	hostconnecttcpSTATUS_ALREADY_CONNECTED self  __succ 	__status  	 �  #�+ =  9   X�9  9B  9 5 -  9=BK  
�	name  EVENT_CLOSEDdispatchEventshutdowntcpisConnectedSocketTCP self   �  �+ =    9 5 -  9=B  9 BK  
�_reconnect	name  EVENT_CLOSEDdispatchEventisConnectedSocketTCP self   �  G��U E�-   9     9  ' B -  X�-  X�-   9B-  9  X�-   9BX�-   9BK     X�6 9  B  X�  X�6 9 B	  X�K     X�  X�   & -   9	5 - 9
= X�  === BX �K   �    	bodypartial	data	name  EVENT_DATAdispatchEventlenstring_connectFailure_onDisconnectisConnected
close*areceivetcp 



self STATUS_CLOSED STATUS_NOT_CONNECTED SocketTCP __body >__status  >__partial  > �
 r�+ =    9 5 -  9=B9   X�- 99 B3 - 9	 - B= 2  �K  
���� �scheduleGlobaltickScheduler unscheduleGlobalconnectTimeTickScheduler	name  EVENT_CONNECTEDdispatchEventisConnectedSocketTCP scheduler STATUS_CLOSED STATUS_NOT_CONNECTED SOCKET_TICK_TIME self  __tick  �  &�  9  5 -  9=B  9 BK  
�_reconnect	name  EVENT_CONNECT_FAILUREdispatchEventSocketTCP self  status   4   �-     9   B K   �connectself  �	 "j�	9    X�2 �6 ' 9 B  X�  9 B2 �9   X�-  99 B+  = 3 -  9 - B= 2  �K  K  K  ��performWithDelayGlobal unscheduleGlobalreconnectSchedulerconnect	name%s._reconnectprintInfoisRetryConnect		scheduler SOCKET_RECONNECT_TIME self  !__immediately  !__doReConnect  �  6A� �*   ) ) '  ' ' ' ' 6 '
 B6	 ' B	6
 '	 B
' =

' =
' =
' =
' =
9	=
9	=
3 =
3 =
3 =
3 =
3 =
3! = 
3# ="
3% =$
3' =&
3) =(
3+ =*
3- =,
3/ =.
31 =0
33 =2
35 =4
2  �L
  _reconnect _connectFailure _onConnected _onDisconnect _disconnect _connect disconnect 
close 	send connect setConnFailTime setReconnTime setTickTime setName 	ctor getTime_DEBUG_VERSIONSOCKET_TCP_CONNECT_FAILUREEVENT_CONNECT_FAILURESOCKET_TCP_CONNECTEDEVENT_CONNECTEDSOCKET_TCP_CLOSEDEVENT_CLOSEDSOCKET_TCP_CLOSEEVENT_CLOSESOCKET_TCP_DATAEVENT_DATASocketTCP
classsocketframework.schedulerrequiretimeout"Operation already in progressalready connectedSocket is not connectedclosed��̙����	
#!1%63;8@=EB�G������������ع������SOCKET_TICK_TIME @SOCKET_RECONNECT_TIME ?SOCKET_CONNECT_FAIL_TIMEOUT >STATUS_CLOSED =STATUS_NOT_CONNECTED <STATUS_ALREADY_CONNECTED ;STATUS_ALREADY_IN_PROGRESS :STATUS_TIMEOUT 9scheduler 6socket 3SocketTCP 0  