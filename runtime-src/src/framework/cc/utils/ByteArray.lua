LJU@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\framework\cc\utils\ByteArray.luaT   6  9-  6  9  B C �	byteformatstring__fmt __s  	 � /�  X�) -  9 8 X�'   X�'   &3 6   B X�6 9  ' 	 2  �D 4  ) 9  ) M�
 9 8	B
<
	O�6	 9
 B 2  �J  �concat
table	_buf(.)	gsubstring	type  	%02X
radix							ByteArray self  0__radix  0__separator  0__fmt  __format __bytes   i  M   -=  4  = ) = K  	_pos	_buf_endianself  __endian   &   39   L 	_bufself   ;  79   9 ! L 	_pos	_bufself   !   
;9  L 	_posself   )   ?=  L  	_posself  __pos   $   
D9  L _endianself   /   H=  K  _endianself  __endian   � 	  ,N  X�)   X�9   6 99  '   D concat
table	_bufself  __offset  __length   �  #bZ  X�)   X�9   4    ) M	�  6	 9		9  8B	<	O�  9 '  &B6 9 6 
 B AL unpack	packb_getLC	bytestring	_buf							
self  $__offset  $__length  $__t 	
 
 
i __fmt __s  g  
 h6  9 G A  9  BL  writeBuf	packstringself  __fmt  __s  �   6p  9  9 B6 9  B9  =   J unpackstring	_posgetBytesself  __fmt  __s __next __val   I  	z  9  B	  X�+ X�+ L readChar self  
 b   �  X�  9  ) BX�  9  )  BL  writeByteself  __bool   y   �6  9  9 ) B  9 ' B AL d_getLCreadBufunpackstringself  __ __v   �   &�6  9  9 ' B B  9  BL  writeBufd_getLC	packstringself  __double  __s 	 y   �6  9  9 ) B  9 ' B AL f_getLCreadBufunpackstringself  __ __v   �   %�6  9  9 ' B B  9  BL  writeBuff_getLC	packstringself  __float  __s 	 y   �6  9  9 ) B  9 ' B AL i_getLCreadBufunpackstringself  __ __v   �   #�6  9  9 ' B B  9  BL  writeBufi_getLC	packstringself  __int  __s 	 y   �6  9  9 ) B  9 ' B AL I_getLCreadBufunpackstringself  __ __v   �   $�6  9  9 ' B B  9  BL  writeBufI_getLC	packstringself  __uint  __s 	 y   �6  9  9 ) B  9 ' B AL h_getLCreadBufunpackstringself  __ __v   �   %�6  9  9 ' B B  9  BL  writeBufh_getLC	packstringself  __short  __s 	 y   �6  9  9 ) B  9 ' B AL H_getLCreadBufunpackstringself  __ __v   �   &�6  9  9 ' B B  9  BL  writeBufH_getLC	packstringself  __ushort  __s 	 d   �6  9  9 B' BL breadRawByteunpackstringself  	__ __val   l   
"�6  9'  B  9  BL  writeBufb	packstringself  __ubyte  __s  � 	  *�6  9  9 ) B  9 ' B AL n_getLCreadBufunpackstringself  __number  __ __v   �   &�6  9  9 ' B B  9  BL  writeBufn_getLC	packstringself  __number  __s 	 � 
 	4�6   ' B	  X�' L   9 B6 9  9  B  9 ' 	 &	B AL A_getLCreadBufunpackstring_checkAvailable!Need a length of the string!assert self  __len  __ __v   �   &�6  9  9 ' B B  9  BL  writeBufA_getLC	packstringself  __string  __s 	 �  �6   ' B	  X�' L   9 B  9  D readBuf_checkAvailable!Need a length of the string!assert self  __len   @   �  9   BL  writeBufself  __string   v   
�  9  B  9 B  9  D readStringBytesreadUInt_checkAvailableself  __len  f   	�  9   B  9  BL  writeStringByteswriteUIntself  
__string  
 s   �  9  B  9   9 ' B AL a_getLCrawUnPack_checkAvailableself  __s  \ 	  	�  9    9 ' B BL  a_getLCrawPackself  
__string  
 x   
�  9  B  9 B  9  D readStringBytesreadUShort_checkAvailableself  __len  �   &�6  9  9 ' B B  9  BL  writeBufP_getLC	packstringself  __string  __s 	 �  	){�6  6  '	 B' B9  9 !  X�)  X�)   X�)    X� X�  9	 B  ) M� 9
  9 B A
O�K  readRawBytewriteRawBytesetPos	_pos	_bufNeed a ByteArray instance!ByteArrayiskindofassert 				





	self  *__bytes  *__offset  *__length  *__selfLen 
 __availableLen   i  �  	3��6  6  '	 B' B 9B	  X�K    X�)  X�) !  X�   X� X�  9B	 9
 B  )	 M�  9  9B AO�	 9
 BL  readRawBytewriteRawBytesetPosgetPosgetLenNeed a ByteArray instance!ByteArrayiskindofassert 			



self  4__bytes  4__offset  4__length  4__bytesLen )__availableLen 
__oldPos   i  d   �6  9  9 B' BL creadRawByteunpackstringself  	__ __val   d 	  	�  9  6 9'  B AL  c	packstringwriteRawByteself  
__char  
 I   �6  9  9 B C  readRawByte	bytestringself   ]   �  9  6 9 B AL  	charstringwriteRawByteself  	__byte  	 i  
�  9  B9 9 89  = L 	_pos	_buf_checkAvailableself  __byte  � 
 !B�	9  9    X�9   9   ) M�9 6 9)	  B<O�9 9  6 9 ) ) B<9   =  L  sub	charstring	_buf	_posself  "__rawByte  "  i  h  "�  9  9 9   B9  = L 	_posgetBytesself  __len  __ba  �   *�)  ) M
�  9  6	 9		   B	 AO�L  substringwriteRawByteself  __s    i 	 � 	  �6  9  9  X�+ X�+ 6 9' 9 9  B AK  3End of file was encountered. pos: %d, len: %d.formatstring	_pos	_bufassertself   �  4�  X�'  9 -  9 X�'  &L X	�9 -  9 X�'  &L '  &L  �=>ENDIAN_BIG<ENDIAN_LITTLE_endianByteArray self  __fmt   6   �4  =  ) = K  	_pos	_bufself   �  r x� �6   ' B ' = ' = 5 = 6 ' B3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 3' =& 3) =( 3+ =* 3- =, 3/ =. 31 =0 33 =2 35 =4 37 =6 39 =8 3; =: 3= =< 3? => 3A =@ 3C =B 3E =D 3G =F 3I =H 3K =J 3M =L 3O =N 3Q =P 3S =R 3U =T 3W =V 3Y =X 3[ =Z 3] =\ 3_ =^ 3a =` 3c =b 3e =d 3g =f 3i =h 3k =j 3m =l 3o =n 3q =p 2  �L   
clear _getLC _checkAvailable writeBuf readBuf writeRawByte readRawByte writeByte readByte writeChar readChar writeBytes readBytes writeStringUShort readStringUShort writeStringSizeT readStringSizeT writeStringUInt readStringUInt writeString readString writeStringBytes readStringBytes writeLuaNumber readLuaNumber writeUByte readUByte writeUShort readUShort writeShort readShort writeUInt readUInt writeInt readInt writeFloat readFloat writeDouble readDouble writeBool readBool rawUnPack rawPack getPack getBytes setEndian getEndian setPos getPos getAvailable getLen 	ctor toString	packrequire  ����	%02X ����	%03u ����	%03o
radixENDIAN_BIGENDIAN_LITTLEByteArray
class            +  1 - 5 3 9 7 = ; B ? F D J H S N e Z l h x p ~ z � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � 
"+'1.73=9MA`Pgdlirpyv�{��������������ByteArray u  