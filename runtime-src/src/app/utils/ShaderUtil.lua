LJM@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\utils\ShaderUtil.lua�	  ' E|''  ' ' ' ' ' ' ' '	 '
	 '
 ' ' ' ' ' ' &' ' ' ' ' ' ' '	 '
 ' ' &6 9 9  B 96 96 9B 96 9 6 9!B 96 9"6 9#B 9$B 9%B  9&  BK  setGLProgramupdateUniforms	link"VERTEX_ATTRIB_FLAG_TEX_COORDSATTRIBUTE_NAME_TEX_COORDVERTEX_ATTRIB_COLORATTRIBUTE_NAME_COLORVERTEX_ATTRIB_POSITIONATTRIBUTE_NAME_POSITIONbindAttribLocationcreateWithByteArraysGLProgramccgl_FragColor.w = c.w; 
;gl_FragColor.xyz = vec3(0.4*c.r + 0.4*c.g +0.4*c.b); 
3vec4 c = texture2D(CC_Texture0, v_texCoord); 
{ 
void main(void) 
varying vec2 v_texCoord; 
#endif 
precision mediump float; 
#ifdef GL_ES 
}v_texCoord = a_texCoord;
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
	
!!!!!!!"""""""#######$$$%%%&&&&'node  FvertDefaultSource 3pszFragSource 'pProgram   :    )4   7   6   3 = K   	grayShaderUtil)))  