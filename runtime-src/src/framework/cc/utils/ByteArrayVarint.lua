LJ[@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\framework\cc\utils\ByteArrayVarint.luaM   =  4  = ) = K  	_pos	_buf_endianself  __endian   W     9  B  9  D _zigZagDecode_decodeVarintself  __v  j   	   9   B  9  BL  _encodeVarint_zigZagEncodeself  
__vint  
__v  /   !  9  D _decodeVarintself   C   %  9   BL  _encodeVarintself  __uvint   W   *  9  B  9  D readStringBytesreadUVIntself  __len  c   	/  9   B  9  BL  writeStringByteswriteUVIntself  
__str  
 �   &7)   X�6  9 ) D 6  96  9 ) B6  9)  B C 	bnot	bxorlshiftbitself  __value   �  *<6  9 ) B	  X�6  9 ) D 6  96  9 ) B6  9)  B C 	bnot	bxorrshift	bandbit self  __value   � 
 	3OA6  6  B X�+ X�+ ' B6 9 ) B6 9 ) B   X�U�  9 6 9)� 	 B A6 9 ) B 6 9 ) B X�  9  BK  borwriteBytershift	bandbit&Value to encode must be a number!number	typeassert 




self  4__value  4__bytes # �  2XV)  )  +  9  9   X&�U%�  9 B 6 9 6 96	 9		 ) B	
 B A 6 9 )� B	  X�L 6 )    X�+ X�+ ' BX�6	 '
 BK  Read variant at EOF!
error@Varint decode error! 32bit bitwise is unavailable in BitOp!assert	bandlshiftborbitreadByte	_buf	_pos 
self  3__result 1__shift 0__byte / �   !4 h6   ' 6 ' B A 6 ' B3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   _decodeVarint _encodeVarint _zigZagDecode _zigZagEncode writeStringUVInt readStringUVInt writeUVInt readUVInt writeVInt readVInt 	ctor	.bit.ByteArrayimportBitVaiant
class#!(%-*3/:7?<TAeVggByteArrayVarint   