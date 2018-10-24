#ifdef GL_ES
precision mediump float;
#endif
varying vec2 v_texCoord;
uniform vec2 size;
float fac(float a)
{
	int tmp = (int)a;
	float tmp1 = (float)(tmp);
	return a - tmp1;
}

void main()
{	
    vec2 iResolution = size;
	vec2 uv = gl_FragCoord.xy / iResolution.xy;
    uv.x *= iResolution.x / iResolution.y;
    
    vec4 retCol = texture2D(CC_Texture0, v_texCoord);
    vec2 center = vec2(fac(CC_Time[1]*.3)*4.-1.6,.5);
    uv = uv - center;
    
    float a = 1.;
    float b = 1.;
    float c = 0.;
    float w = 0.07;
    
    
    float ap = abs(a*uv.x + b*uv.y + c);
    float ran = 1. - smoothstep(w-.004,w+.004,ap);
    retCol = retCol*(1.-ran) + retCol*vec4(3.)*ran*retCol.a;
    
    
    w = 0.02;
    uv += 0.1;
    ap = abs(a*uv.x + b*uv.y + c);
    ran = 1. - smoothstep(w-.004,w+.004,ap);
    retCol = retCol*(1.-ran) + retCol*vec4(2.)*ran*retCol.a;
    
	gl_FragColor = retCol;
}