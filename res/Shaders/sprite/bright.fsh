#ifdef GL_ES
precision lowp float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;
uniform float bright;
void main(void)
{	
	vec4 c = texture2D(CC_Texture0, v_texCoord);
	vec3 a = c.rgb * 2.0 ;
	gl_FragColor = v_fragmentColor*vec4(a,c.a);
}