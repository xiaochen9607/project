LJU@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\cocos\cocos2d\DrawPrimitives.lua�  	 +�-      X !�6   9    9  B   9  - B .  -  
   X �6  9  -  9B' B .  6  9  -  9B' B .  +  7  -     X �+  L  +  L   �����dp_Initializedu_pointSizeu_colorgetUniformLocationglgetProgramgetInstanceShaderCacheccdp_initialized dp_shader SHADER_NAME_POSITION_U_COLOR dp_colorLocation dp_pointSizeLocation  �   : 6   9  6 9B -     9  B -     9  B -     9  - - ) B K  ���setUniformLocationWith4fvsetUniformsForBuiltinsuse VERTEX_ATTRIB_FLAG_POSITIONCCConstantsglEnableVertexAttribsgldp_shader dp_colorLocation dp_color  &    '-   B K  �lazy_init  &    +1  K   �dp_initialized  S   	#/-  > -  >-  >-  >K  �dp_color r  
g  
b  
a  
 �  %66  9 9B 9B" .  K  �getContentScaleFactorgetInstanceDirectorccdp_pointSize pointSize   i  ':-    >-   >-   >-   >K  ��dp_color r  g  b  a   �  	 #BH-   6 9B=  6  9  6 9-  9 B 4  - 9> - 9> 6 96 9)   6 9B6 96 9)  BK  � �STATIC_DRAWbufferDatayxARRAY_BUFFERbindBuffercreateBufferglbuffer_idvertexBuffer point vertices  � 2�A-  B  X�2 ,�4  3   B- B-  9- - B6 96 99B6 96 9) 6 9	+ )	  )
  B6 9
6 9)  ) B6 96 9)  B2  �K  K  �	����POINTSdrawArrays
FLOATVERTEX_ATTRIB_POSITIONCCConstantsvertexAttribPointerbuffer_idARRAY_BUFFERbindBufferglsetUniformLocationWith1f lazy_init setDrawProperty dp_shader dp_pointSizeLocation dp_pointSize point  2vertexBuffer +initBuffer * �  	.fd
-   6 9B=  6  9  6 9-  9 B 4   ) - ) M� - 89<  - 89< O�6 96 9-    6 9B6 96 9)  BK  �� �STATIC_DRAWbufferDatayxARRAY_BUFFERbindBuffercreateBufferglbuffer_id						
vertexBuffer numOfPoint points vertices !  i  � 3�\-  B  X�2 -�4  ) 3   B- B-  9- -	 B6 96 99B6 96 9) 6	 9			+
 )  )  B6 9
6 9)  	 B6 96 9)  B2  �K  K  �	����POINTSdrawArrays
FLOATVERTEX_ATTRIB_POSITIONCCConstantsvertexAttribPointerbuffer_idARRAY_BUFFERbindBufferglsetUniformLocationWith1f lazy_init setDrawProperty dp_shader dp_pointSizeLocation dp_pointSize points  3numOfPoint  3vertexBuffer ,i +initBuffer * �  	 )U�-   6 9B=  6  9  6 9-  9 B 4  - 9> - 9> - 9> - 9> 6 96 9)   6 9B6 96 9)  BK  � ��STATIC_DRAWbufferDatayxARRAY_BUFFERbindBuffercreateBufferglbuffer_idvertexBuffer origin destination vertices  � ,z|-  B  X�2 &�4  3   B- B6 96 99B6 96 9) 6 9+	 )
  )  B6 9	6 9
)  ) B6 96 9)  B2  �K  K  �	�
LINESdrawArrays
FLOATVERTEX_ATTRIB_POSITIONCCConstantsvertexAttribPointerbuffer_idARRAY_BUFFERbindBuffergl lazy_init setDrawProperty origin  ,destination  ,vertexBuffer %initBuffer $ �  	.g�
-   6 9B=  6  9  6 9-  9 B 4   ) - ) M� - 89<  - 89< O�6 96 9-    6 9B6 96 9)  BK  �� �STATIC_DRAWbufferDatayxARRAY_BUFFERbindBuffercreateBufferglbuffer_id						
vertexBuffer numOfPoints points vertices !  i  � 7�� -  B  X�2 1�4  ) 3   B- B6 96 99	B6 96 9)	 6
 9

+ )  )  B  X�6 9	6 9
)	  
 BX�6 9	6 9)	  
 B6 96 9)	  B2  �K  K  �	�LINE_STRIPLINE_LOOPdrawArrays
FLOATVERTEX_ATTRIB_POSITIONCCConstantsvertexAttribPointerbuffer_idARRAY_BUFFERbindBuffergl   lazy_init setDrawProperty points  7numOfPoints  7closePolygon  7vertexBuffer 0i /initBuffer . �  	.g�-   6 9B=  6  9  6 9-  9 B 4   ) - ) M� - 89<  - 89< O�6 96 9-    6 9B6 96 9)  BK  �� �STATIC_DRAWbufferDatayxARRAY_BUFFERbindBuffercreateBufferglbuffer_id										





vertexBuffer numOfPoints points vertices !  i  � ?�� -  B  X�2 9�4  ) 3   B6 96 9B-  9B-  9B-  9-	 
 ) B6 96 9	9	
B6 96 9)	 6
 9

+ )  )  B6 96 9)	  
 B6 96 9	)	  B2  �K  K  ���TRIANGLE_FANdrawArrays
FLOATVERTEX_ATTRIB_POSITIONvertexAttribPointerbuffer_idARRAY_BUFFERbindBuffersetUniformLocationWith4fvsetUniformsForBuiltinsuse VERTEX_ATTRIB_FLAG_POSITIONCCConstantsglEnableVertexAttribsgl   lazy_init dp_shader dp_colorLocation points  ?numOfPoints  ?color  ?vertexBuffer 8i 7initBuffer 6 � 
  9Q�6  6  99 9 B6  999	 B A6  6  999 B6  999	B A6  6  999B6  99 9	B A6  6  99 9B6  99 9	 B AK  yx__callCCPointccDrawLineorigin  :destination  : � 	 B�4 > 6   999 B>>6   99 9B ?  6  )  BK  ccDrawSolidPolyyx__callCCPoint	����origin  destination  color  vertices  �  W��6   9     -  #  ) 4  - 6 9B=6 96 9- 9B) -  ) M �" - 6	  9		-  B	"	-	 "	-	 9		 	-	 6
  9
	
-  B
"	
	-
 "	
	-
 9


 	
	
 

<

 <	
O�-    - 9<-    - 9
<6 96 9-     6 9B6 96 9)  BK  ����� ��STATIC_DRAWbufferDataysinxcosARRAY_BUFFERbindBuffercreateBufferglbuffer_idpi	math												


segments vertexBuffer radius angle scaleX center scaleY coef Ri Qvertices P! ! !i rads j k  �0��(-  B  X�2 *�)   X� 4  3	  
	 B
-
 B
6
 9

6 99B
6
 9

6 9) 6 9+ )  )  B
6
 9
	
6 9
)   B
6
 9

6 9)  B
2  �K  K  �	�LINE_STRIPdrawArrays
FLOATVERTEX_ATTRIB_POSITIONCCConstantsvertexAttribPointerbuffer_idARRAY_BUFFERbindBuffergl 
  ""$$$$$$%%%%%%%%%%%&&&&&&&''''''((lazy_init setDrawProperty center  0radius  0angle  0segments  0drawLineToCenter  0scaleX  0scaleY  0additionalSegment )vertexBuffer %initBuffer $ �   
C�6     	 
  ) ) BK  ccDrawCircleScalecenter  radius  angle  segments  drawLineToCenter   �  W��6   9     -  #  ) 4  - 6 9B=6 96 9- 9B) -  ) M �" - 6	  9		-  B	"	-	 "	-	 9		 	-	 6
  9
	
-  B
"	
	-
 "	
	-
 9


 	
	
 

<

 <	
O�-    - 9<-    - 9
<6 96 9-     6 9B6 96 9)  BK  ����� ��STATIC_DRAWbufferDataysinxcosARRAY_BUFFERbindBuffercreateBufferglbuffer_idpi	math												


segments vertexBuffer radius angle scaleX center scaleY coef Ri Qvertices P! ! !i rads j k  �,��#-  B  X�2 &�4  3   B- B6 96
 9

9B6 96
 9

) 6 9+ )  )  B6 9	6
 9


)   B6 96
 9

)  B2  �K  K  �	�TRIANGLE_FANdrawArrays
FLOATVERTEX_ATTRIB_POSITIONCCConstantsvertexAttribPointerbuffer_idARRAY_BUFFERbindBuffergl            !!!!!!!""""""##lazy_init setDrawProperty center  ,radius  ,angle  ,segments  ,scaleX  ,scaleY  ,vertexBuffer %initBuffer $ �  c��4   ) )  ) -  ) M1� 6  9
) B-	 9		"			 	"		-
 9

"	
	 	"	-
 9

"	
	 	<  6  9
) B-	 9		"			 	"		-
 9

"	
	 	"	-
 9

"	
	 	< -   O�-   - 9< -   - 9< - 6 9B=6 96 9- 9B6 9	6 9-     6 9
B6 96 9)  BK  � ����STATIC_DRAWbufferDataARRAY_BUFFERbindBuffercreateBufferglbuffer_idyxpow	mathsegments origin control destination vertexBuffer vertices bi at `2 2 2i 0 �,��#-  B  X�2 &�4  3   B- B6 96 99	B6 96 9)	 6
 9

+ )  )  B6 9	6 9
)	  
 B6 96 9)	  B2  �K  K  �	�LINE_STRIPdrawArrays
FLOATVERTEX_ATTRIB_POSITIONCCConstantsvertexAttribPointerbuffer_idARRAY_BUFFERbindBuffergl            !!!!!!!""""""##lazy_init setDrawProperty origin  ,control  ,destination  ,segments  ,vertexBuffer %initBuffer $ �  }��4   )  ) ) -  ) MK� 6  9
) B-	 9		"	6	  9		) B			"		-
 9

"	
	 				"		"		-
 9

"	
	 	"	"		-
 9

"	
	 	<  6  9
) B-	 9		"	6	  9		) B			"		-
 9

"	
	 				"		"		-
 9

"	
	 	"	"		-
 9

"	
	 	< -   O�-   - 9< -   - 9< - 6 9B=6 96 9- 9B6 9	6 9-     6 9
B6 96 9)  BK  � �����STATIC_DRAWbufferDataARRAY_BUFFERbindBuffercreateBufferglbuffer_idyxpow	mathsegments origin control1 control2 destination vertexBuffer vertices |t {i zL L Li J �+��#-    X�2 &�4  3   B- B6 96	 9		9
B6 96	 9		)
 6 9+ )  )  B6 9	6	 9	
	)
   B6 96	 9		)
  B2  �K  K  �	�LINE_STRIPdrawArrays
FLOATVERTEX_ATTRIB_POSITIONCCConstantsvertexAttribPointerbuffer_idARRAY_BUFFERbindBuffergl            !!!!!!!""""""##lazy_init setDrawProperty origin  +control1  +control2  +destination  +segments  +vertexBuffer %initBuffer $ �  * 5� �+  +  )��5  )��) ' 6 9	 9B	 9B3 3	 3
 7
	 3

 7
 3
 7
 3
 7
 3
 7
 3
 7
 3
 7
 3
 7
 3
 7
 3
 7
 3
 7
 3
 7
 3
  7
! 3
" 7
# 3
$ 7
% 3
& 7
' 3
( 7
) 2  �K  ccDrawCubicBezier ccDrawQuadBezier ccDrawSolidCircle ccDrawCircle ccDrawCircleScale ccDrawSolidRect ccDrawRect ccDrawSolidPoly ccDrawPoly ccDrawLine ccDrawPoints ccDrawPoint ccDrawColor4B ccPointSize ccDrawColor4f ccDrawFree ccDrawInit   getTargetPlatformgetInstanceApplicationccShaderPosition_uColor        	          % ) ' - + 4 / 8 6 ? : Z A z \ � | � � � � � � � � � 6[8�]��dp_initialized 4dp_shader 3dp_colorLocation 2dp_color 1dp_pointSizeLocation 0dp_pointSize /SHADER_NAME_POSITION_U_COLOR .targetPlatform &lazy_init %setDrawProperty $  