LJK@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\sprite\Shaders.lua�
  ' MUH' ' ' ' ' ' ' ' '		 '

 ' ' ' ' ' ' ' &=  ' ' ' ' ' ' ' ' '		 '

 ' ' ' ' ' ' ' &= ' ' ' ' ' ' ' ' '		 '

 ' ' ' ' ' ' ' ' &= ' ' ' ' ' ' ' ' '	 '
  '! '" '# '$ '% '& &= K    }#      v_texCoord = a_texCoord;$     v_fragmentColor = a_color;2     gl_Position = CC_MVPMatrix * a_position;{void main()
#endif
varying vec2 v_texCoord;"varying vec4 v_fragmentColor;
#else
%varying mediump vec2 v_texCoord;( varying lowp vec4 v_fragmentColor;
#ifdef GL_ES
attribute vec4 a_color;attribute vec2 a_texCoord;attribute vec4 a_position;ccLabel_vert>gl_Position = (CC_PMatrix * CC_MVMatrix) * a_position;  
vertDefaultSource2/gl_Position = CC_MVPMatrix * a_position; 
vertDefaultSource1}v_texCoord = a_texCoord;
 v_fragmentColor = a_color;
-gl_Position = CC_PMatrix * a_position; 
{
void main() 
#endif    
 varying vec2 v_texCoord;  
$varying vec4 v_fragmentColor; 
!#else                      
&varying mediump vec2 v_texCoord;
(varying lowp vec4 v_fragmentColor;
#ifdef GL_ES  
attribute vec4 a_color; 
!attribute vec2 a_texCoord; 
!attribute vec4 a_position; 

vertDefaultSource	
 !"""#$%&'()*+,-./01234445679:;<=>?ABCDEFFFHself  N A  L-   9 BL  �newSHADERS self  logic  � 
 
 %]P	  X�9  6 9 9B 9 B6 9 9B 9 B6 9 9 	 B6 9 9		 B  J createGLProgramStatecreateWithByteArraysGLProgramgetStringFromFilefullPathForFilenamegetInstanceFileUtilsccvertDefaultSourceself  &path  &vsh  &path frag 	pProgram 	glState  �   2lZ  9  ' 9 B  X�5  9'	 
 B 9'	 5
 B 96		 9	
	6
	 9

B 96		 9		6
	 9

B 96		 9		6
	 9

B 9B 9B 9	 BK  setGLProgramupdateUniforms	link"VERTEX_ATTRIB_FLAG_TEX_COORDSATTRIBUTE_NAME_TEX_COORDVERTEX_ATTRIB_COLORATTRIBUTE_NAME_COLORVERTEX_ATTRIB_POSITIONATTRIBUTE_NAME_POSITIONccbindAttribLocation w�z x y u_textColoru_effectColorsetUniformVec4 w�z x y ccLabel_vert'res/Shaders/sprite/textOutLine.fsh	init							


self  3sprite  3color  3textColor  3glState -pProgram  - �  	!Yh  9  ' B  X�5   X�*    X�*  9'	 
 B 9'	 
 B 9'	 
 B 9	 BK  setGLProgramStateu_radiusu_thresholdsetUniformFloatu_outlineColorsetUniformVec3 z�x�y�#res/Shaders/sprite/outline.fsh	init������������	self  "sprite  "color  "threshold  "radius  "glState  �   
%x  9  ' 9 B 9 BK  setGLProgramStatevertDefaultSource2$res/Shaders/sprite/labelOut.fsh	initself  sprite  glState  �   ,u}  9  ' B  X� 9B 9B6 9
  B   X�)   X�)  9'	 
 B 9'		 
 B 9'	
 
 B 9	 BK  setGLProgramStatesampleNumblurRadiussetUniformFloatresolutionsetUniformVec2pccgetContentSizeInPixelsgetTexture res/Shaders/sprite/blur.fsh	init		
self  -sprite  -resolution  -blurRadius  -sampleNum  -glState (x y   � 	 7�	  9  ' B  X�) X�  9'  B 9 BK  setGLProgramStatebrightsetUniformFloat res/Shaders/sprite/gray.fsh	init��������	self  sprite  bright  glState  � 	 5�  9  ' B  X�*   9'  B 9 BK  setGLProgramStatebrightsetUniformFloat"res/Shaders/sprite/bright.fsh	init����self  sprite  bright  glState  �  
)i�  9  '	 B  X�5   X�*    X�*   X�) 	 9'
  B	 9'
  B	 9'
  B	 9'
  B	 9	
 BL setGLProgramStatetimeScale
widthfactorsetUniformFloat
colorsetUniformVec3 z�x�y�#res/Shaders/sprite/shining.fsh	init��̙��������	self  *sprite  *factor  *width  *timeScale  *color  *glState % � 	  7�  9  ' B 9'  B 9 BL setGLProgramState	sizesetUniformVec2$res/Shaders/sprite/shining1.fsh	initself  sprite  textureSize  glState 
 �  
 Z�	  9  ' B  X�5  9'	 
 B 9'	 
 B 9'	 
 B 9		 BK  setGLProgramStatetextureSizesetUniformVec2outlineColorsetUniformVec3outlineSizesetUniformFloat z�x�y�$res/Shaders/sprite/outline1.fsh	init	self  sprite  color  textureSize  outLineSize  glState  �   	$�  9  ' B 9 BK  setGLProgramState"res/Shaders/sprite/origin.fsh	initself  
sprite  
glState  �   * �6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   restore outline2 shining1 shining bright 	gray 	blur labelOut outline1 textOutLine 	init create 	ctorSHADERS
classJOLYPgZwh{x�}��������Ļ����SHADERS   