LJH@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\control\Msg.lua�  	 
)��=  )��= )��= )��= +  = +  = )  = +  = + = K  finishAutoAddParam_countisLongConnectionparamsArraybufnumParamsbuffLen	_cmd
_type		
self   7   "6  )��=K  msgLenMsgStaticself   � t�%*  X�)  -   9 B  X �  X �*    X�)   X �*    X�)   X �=)  ===6 ' B6 9 9	B)  X�6 9 9
' B6 9 9) B6 ' B6 ' B9 9B=9 96	 9		B9 9)	  B9 96	 9		*   B	 A9 96	 9		*   B	 A9 96	 9		B9	 X	�9 B=9 99	B9 9)	  B4  =L  �paramsArraygetCount_countwriteBytes	bandbitwriteShortPACKAGE_HEADER_IDwriteIntENDIAN_BIGbuf!framework.cc.utils.ByteArrayframework.cc.utils.bitsetPos00000000000000000000writeBufgetLen
tokenMsgStaticapp.control.GameGlobalrequire	_cmd
_typenumParamsisLongConnectionnew�� 						         !!!!!!"""####$$$$$&&&&&(()Msg self  utype  ucmd  uisLongConnection  umsg mByteArray 2; s  P6  6  9 =6  9)' X�6  )  =6  9L 
countMsgStaticself   "   
X9  L 
_typeself   �  .]\ 9 B+  +  9B)  X� X�U� 9B 6 9 X�+  X� 9
 9 B BX� 9 B 9	 B X�)��L L setPosPACKAGE_HEADER_IDMsgStaticreadIntgetAvailablegetPos

self  /byte  /tmpPos +headerID *b )index  	 �  �tK+  X{�Uz�6  9	  X�6  6   96  9B=6  9  X!�6  9	  X�6  9 9B)  X�6  9 9B6  96  9 9 B6  6  9 9B=6  9)   X �6  9  X>�6  9 9B6  9 X5�  9	 B  X� 9
B' 6 9 B)  ) M�
 6 8	B&
	 X
�
 ' &
O�6 ' B6  9 9B6  )��=6  )��=6  96	  6
 ' B
9

 BX�+ X�K  (GAME_SOCKET_MESSAGE_PARSE_COMPLETEDapp.event.GameSocketEventsendEventEventManager
clearapp.control.EventManagerrequire,tostring	maxn
tablegetParamsnextMsgreadIntsetPosgetPosgetAvailablemsgLenrecvBuffercheckHeaderIDPositionheaderIdPositionMsgStatic����					


"""?????@@@AAACCCCCCCCCCFHIKself  �needBreak ~pos $tmpMsg %1tmpParam ,paramStr +len '  i 
 � 
  %8�	6  9 9B6  9 96  9 9B6  9	 9B B6  9 9 B6  9 9 B  9 BK  dataHandlerwriteBufgetAvailablesetPosgetPosrecvBufferMsgStatic	self  &tmp  &cp   O   �-     9   - - B K   ���parseParamself _buff ret  � >��+6  9 9B6 6 ' B6 9*  6  9 9B A6 9*  6  9	 9B A6 '	 B 9
 	 B6 9*  6	  9			 9		B	 A=6  93 6	  B		 X�+  6  9 9 B2  �L setPos
pcall numParamscreateapp.control.MsgreadShort	bandbitframework.cc.utils.bitrequire	nullgetPosrecvBufferMsgStatic��								  #$$$%%'((((((**self  ?tmpPos 9ret 8type ,cmd 	#ret num 	_buff tryParse boo errMessage   �
 ���=4  = 96 ' B)  ) M��
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
[�		 X
� 9
B
6
 99 6
 99 B 
 BX
K�		 X
"� 9
B
-  9-  9B) 
 ) M� 9 9B AO� 9) B6
 99 6
 99 B  BX
'�6
 9

 6 9B
6 9
 6 9B
 6 9
 X�6 9*  9B A
  9
 B6
 99 6
 99 B  BOJK  �readStringMAX_LENsetPoswriteByteENDIAN_BIGnewreadFloatNUM_TYPE_BITSbrshiftborLEN_MASKreadShort	maxninsert
tablereadIntTYPE_MASKMsgStatic	bandbitreadByteframework.cc.utils.bitrequirenumParamsparamsArray
��������������											

$$$%%%%%&&&&''''''&----0000000000022222233333334444555555559999::::::::::=ByteArray self  �buffer  �ret  �num �� � �i �tmp0 �tmp1 �intParam 
sp 
tmpVal (ii floatParam 
len byteArray   i len2 !strParam 
 � 
  F�6  ' B+   9  B6 9)� 	 9B A6 9 )� B X�+ L readByte	bandbitgetTailframework.cc.utils.bitrequireself  buffer  boundaryValid tail tmp 	 � Mv�-  9 -  9B 9 B 9B)� X �6 9 X�6 9)� 6 9	 6
 9
	
B A6 9
 ) B 9  9 BX�9  96 9
)	 6
 9

B A9  9 B9  9 ) 	 B9  = 6 99 6 99	 B  BL  �	maxnparamsArrayinsert
tablenumParamswriteByteswriteShortLEN_MASKwriteBytebufborNUM_TYPE_BITSblshift	bandbitMAX_LENMsgStaticgetLenwriteStringENDIAN_BIGnew										





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
self  $i  $typecode " � 
 (A� 9 B*   X �9  96 9) 6	 9		B A9  9 B9  9 B9	 =	 6
 99 6
 99 B6 BL  arr	maxnparamsArrayinsert
tablenumParamswriteByteswriteShortLEN_MASKMsgStaticborbitwriteBytebufgetLen��self  )byteArry  )len % �  $�9   9) B9   9 B9  = 6 99 6 99 B  BL  	maxnparamsArrayinsert
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
tokenMsgStaticsetPosisLongConnectiongetPosbuffinishAutoAddParamrandom	mathaddFloatnumParams ��
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
�9  L 	_cmdself   3   �9   9D getPackbufself   �	  Gs� �6   ' B 6 ' B6 ' B4  7 6 99B=6 99B=	6 6 9) )�B=
6 )��=6 )��=6 *  =6 ) =6 )� =6 ) =6 ) =6 6 9) 6 9B=3 = 3 = 3 = 3 = 3  = 6 3" =!6 3$ =#6 3& =%6 3( ='6 3* =)6 3, =+3. =- 6 30 =/32 =1 34 =3 36 =5 38 =7 3: =9 3< =; 3> == 3@ =? 3B =A 3D =C 3F =E 2  �L   getPack getCmd toString getParams getBytes finish addParams addFloat addUbyteArray addInt addTail getTail addString checkBoundary parseParam nextMsg dataReceived dataHandler checkHeaderIDPosition getType getCount create 
reset 	ctorblshiftbitMAX_LENNUM_LEN_BITSNUM_TYPE_BITSLEN_MASKTYPE_MASKPACKAGE_HEADER_IDmsgLenheaderIdPositionrandom	math
countrecvBufferENDIAN_BIGnew
tokenMsgStaticframework.cc.utils.bit!framework.cc.utils.ByteArrayrequireMsg
classҪ��                            
 
 
                            !  $ " O % W P Z X \ r \ t � t � � � � � � � 5� 6I6`Lbsbyu�{�������������
Msg pByteArray m  