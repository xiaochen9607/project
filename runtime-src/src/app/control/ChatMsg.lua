LJL@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\control\ChatMsg.lua�  	 
)��=  )��= )��= )��= +  = +  = )  = +  = + = K  finishAutoAddParam_countisLongConnectionparamsArraybufnumParamsbuffLen	_cmd
_type		
self   ;   "6  )��=K  msgLenChatMsgStaticself   � t�%*  X�)  -   9 B  X �  X �*    X�)   X �*    X�)   X �=)  ===6 ' B6 9 9	B)  X�6 9 9
' B6 9 9) B6 ' B6 ' B9 9B=9 96	 9		B9 9)	  B9 96	 9		*   B	 A9 96	 9		*   B	 A9 96	 9		B9	 X	�9 B=9 99	B9 9)	  B4  =L  �paramsArraygetCount_countwriteBytes	bandbitwriteShortPACKAGE_HEADER_IDMsgStaticwriteIntENDIAN_BIGbuf!framework.cc.utils.ByteArrayframework.cc.utils.bitsetPos00000000000000000000writeBufgetLen
tokenChatMsgStaticapp.control.GameGlobalrequire	_cmd
_typenumParamsisLongConnectionnew�� 						         !!!!!!"""####$$$$$&&&&&(()ChatMsg self  utype  ucmd  uisLongConnection  umsg mByteArray 2; w  P6  6  9 =6  9)' X�6  )  =6  9L 
countChatMsgStaticself   "   
X9  L 
_typeself   �  .]\ 9 B+  +  9B)  X� X�U� 9B 6 9 X�+  X� 9
 9 B BX� 9 B 9	 B X�)��L L setPosPACKAGE_HEADER_IDChatMsgStaticreadIntgetAvailablegetPos

self  /byte  /tmpPos +headerID *b )index  	 �
 ��tK+  X��U��6  9	  X�6  6   96  9B=6  9  X!�6  9	  X�6  9 9B)  X�6  9 9B6  96  9 9 B6  6  9 9B=6  9)   X �6  9  Xo�6  9 9B6  9 Xf�  9	 B  X� 9
B' 6 9 B)  ) M�
 6 8	B&
	 X
�
 ' &
O�6 ' B 9B	 X�6  9 9B	 X�+ -  9-  9B	 96
  9

6  9 9B6  9 9B A6  9	 9B6  =6  9	 9)
 B6  )��=6  )��=  X�6  9	 9B6 	 96
  6 ' B9 BXUXT+ XRK  �(CHAT_SOCKET_MESSAGE_PARSE_COMPLETEDapp.event.ChatSocketEventsendEventEventManager
clearwriteBytesENDIAN_BIGnewgetTypeapp.control.EventManagerrequire,tostring	maxn
tablegetParamsnextMsgreadIntsetPosgetPosgetAvailablemsgLenrecvBuffercheckHeaderIDPositionheaderIdPositionChatMsgStatic����� 					


"""%%%%%'''''''(+++++---------------.....//0000001112223344444<<<<<<<<<<<FHIKByteArray self  �needBreak �pos $tmpMsg %btmpParam ]paramStr \len X  i 
newBuffer  3 � 
  %8�	6  9 9B6  9 96  9 9B6  9	 9B B6  9 9 B6  9 9 B  9 BK  dataHandlerwriteBufgetAvailablesetPosgetPosrecvBufferChatMsgStatic	self  &tmp  &cp   O   �-     9   - - B K   ���parseParamself _buff ret  � >��*6  9 9B6 6 ' B6 9*  6  9 9B A6 9*  6  9	 9B A6 '	 B 9
 	 B6 9*  6	  9			 9		B	 A=6  93 6	  B		 X�+  6  9 9 B2  �L setPos
pcall numParamscreateapp.control.ChatMsgreadShort	bandbitframework.cc.utils.bitrequire	nullgetPosrecvBufferChatMsgStatic��								"###$$&''''''))self  ?tmpPos 9ret 8type ,cmd 	#ret num 	_buff tryParse boo errMessage   �  ���54  = 96 ' B)  ) M΀
 9B6	 9		 6 9B			  X
� 9
	B
6
 99 6
 99 B 
 BX
��		 X
� 9
B
6
 99 6
 99 B 
 BX
��		 X
/�6
 9

6 9 B
6 9)� 
 B)   X�6 9
 * B
 6 9
 6 9B
 )  	
 X� 9B X�
 6
 99 6
 99 B  BX
s�		 X
� 9
B
6
 99 6
 99 B 
 BX
c�		 X
:�6
 9

 6 9B
6 9
 6 9B
 6 9
 X�6 9)�  9B A
 4  ) 
 ) M�6
 9 6
 9 B 6 9)�  9B A AO�6
 99 6
 99 B  BX
'�6
 9

 6 9B
6 9
 6 9B
 6 9
 X�6 9*  9B A
  9
 B6
 99 6
 99 B  BO2K  readStringMAX_LENblshiftreadFloatNUM_TYPE_BITSbrshiftborLEN_MASKreadShort	maxninsert
tablereadIntTYPE_MASKChatMsgStatic	bandbitreadByteframework.cc.utils.bitrequirenumParamsparamsArray
��������������											

       !!!!""""""""$%%%%&&&&&&&&&&&&&&&&%(((((((((((******+++++++,,,,--------111122222222225self  �buffer  �ret  �num �� � �i �tmp0 �tmp1 �intParam 
sp 
tmpVal (ii floatParam 
len 3arr   i len2 "!strParam 
 � 
  F�6  ' B+   9  B6 9)� 	 9B A6 9 )� B X�+ L readByte	bandbitgetTailframework.cc.utils.bitrequireself  buffer  boundaryValid tail tmp 	 � Mv�-  9 -  9B 9 B 9B)� X �6 9 X�6 9)� 6 9	 6
 9
	
B A6 9
 ) B 9  9 BX�9  96 9
)	 6
 9

B A9  9 B9  9 ) 	 B9  = 6 99 6 99	 B  BL  �	maxnparamsArrayinsert
tablenumParamswriteByteswriteShortLEN_MASKwriteBytebufborNUM_TYPE_BITSblshift	bandbitMAX_LENChatMsgStaticgetLenwriteStringENDIAN_BIGnew										





ByteArray self  Nstr  Ntmp Hlen Abb  �  	H�� 9 B 9 B4  ) ) ) M	�6 9)
�  9B A<O�)  ) ) ) M�6	 9		6 9 ) B6 98) B A		 O�6 96 9	 B)� B 6 96 96	 9		 ) B	)
 B6 96
 9

 ) B
)� B AL brshift	bnotblshiftborreadByte	bandbitsetPosgetPos













self  Ibuffer  Ipos Ebytes @
 
 
i b 
2  i  | 	  �  9  9 B9  96 9 )� B AL  	bandbitwriteBytebufgetTailself  b 
 � 
 
#:�) *    X�*  X �9   96 9)� 	 B A9   9 B9 = 6 99 6 9	9 B BL  	maxnparamsArrayinsert
tablenumParamswriteInt	bandbitwriteBytebuf��������										
self  $i  $typecode " �  My�6  9 B)�  X �6 9 X�6 9)� 6 9 6	 9		B A6 9 ) B 9	  9
 BX�6	  9
6 9) 6	 9		B A6	  9
 B)  ) M�6 9)	� 8
B9	 
 9
 BO�9  = 6  99 6  99 B  BL  paramsArrayinsertnumParamsLEN_MASKwriteBytebufborNUM_TYPE_BITSblshift	bandbitMAX_LENChatMsgStatic	maxn
table





self  Narr  Nlen Ibb   i 
tmp  �  $�9   9) B9   9 B9  = 6 99 6 99 B  BL  	maxnparamsArrayinsert
tablenumParamswriteFloatwriteBytebufself  f   �   3U�6  9 B)�  X �)  ) M'�6 98	9		B X�	  9 8
9

BX�6 98	9		B X�	  9 8
9

BX�6 98	B	 X�	  9
 8
9

BX �O�L  addFloat
floataddIntint
valueaddString	type
lowerstring	maxn
table							





self  4args  4len /( ( (i & � 	 Hc�9  	  X�  9 6 9B A+ = 9  )� X�+  = K  9  9B9 	  X�9  96	 9
 9BBX
�9  96	 9
 9BB9  96 99  * B A9  9B9  9) B9  9 BK  writeInt	bandbitwriteShortgetLen
tokenChatMsgStaticsetPosisLongConnectiongetPosbuffinishAutoAddParamrandom	mathaddFloatnumParams ��
self  IcurrentPos 2len ' � 
 6�	  X�9   9B 9   9) B9   9  	 B9  ) =K  positionreadBytessetPosgetLenbuf����self  bytes  offset  len   )   
�9  L paramsArrayself   �   <x�  9  B' 6 9 B+  )  ) M#�6	 8B		 X
�6
 9

8' B

   X
�'		 X
�'	
 
 6  ' 	 ' 6 8B&B&
 X
�
 ' ' &
O�' 9 ' 9 '	 9
 '  '  &L ,  params=, params len=_count, count:	_cmd, cmd:
_type
type:,] [tostring
floatint%.	findstringnumber	type	maxn
table
getParams		

self  =tmpParam 9paramStr 8len 4pos 3$ $ $i "ty  "   
�9  L 	_cmdself   3   �9   9D getPackbufself   �	  Gs� �6   ' B 6 ' B6 ' B4  7 6 99B=6 99B=	6 6 9) )�B=
6 )��=6 )��=6 *  =6 ) =6 )� =6 ) =6 ) =6 6 9) 6 9B=3 = 3 = 3 = 3 = 3  = 6 3" =!6 3$ =#6 3& =%6 3( ='6 3* =)6 3, =+3. =- 6 30 =/32 =1 34 =3 36 =5 38 =7 3: =9 3< =; 3> == 3@ =? 3B =A 3D =C 3F =E 2  �L   getPack getCmd toString getParams getBytes finish addParams addFloat addUbyteArray addInt addTail getTail addString checkBoundary parseParam nextMsg dataReceived dataHandler checkHeaderIDPosition getType getCount create 
reset 	ctorblshiftbitMAX_LENNUM_LEN_BITSNUM_TYPE_BITSLEN_MASKTYPE_MASKPACKAGE_HEADER_IDmsgLenheaderIdPositionrandom	math
countrecvBufferENDIAN_BIGnew
tokenChatMsgStaticframework.cc.utils.bit!framework.cc.utils.ByteArrayrequireChatMsg
classҪ��                            
 
 
                            !  $ " O % W P Z X \ r \ t � t � � � � � � � ,� -@-WCYjYpl}r�~��������������ChatMsg pByteArray m  