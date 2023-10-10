// Author:
// Title:

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec3 blue = vec3(0.0, 0.0, 1.0);
vec3 white = vec3(0.972,1.000,0.886);
vec3 lightOrange = vec3(1.000,0.995,0.708);
vec3 darkOrange = vec3(0.825,0.435,0.057);

float plot(vec2 st, float pct, float thick) {
    return  smoothstep( pct-thick, pct, st.y)-
          smoothstep( pct, pct+thick, st.y);
}

vec3 leftColor(vec2 st) {    
    float m = 0.272;
    float b = 0.464;
    float thick = 0.594;
    float pct = plot(st, m * st.x + b, thick);
    

    vec3 color = mix(blue, white, pct);
    return color;
}

vec3 rightColor(vec2 st) {    
    // float m = 0.0;
    // float b = 0.644;
    // float thick = 0.308;
    // float pct = plot(st, m * st.x + b, thick);
    
    float a = 0.000;
    float b = 0.532;
    float c = 0.716;
    float d = 1.168;
    
    float pct = smoothstep(a, b, st.y) - smoothstep(c, d, st.y);
    
    vec3 color = mix(darkOrange, lightOrange, pct);
    
    return color;
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    vec3 left = leftColor(st);
    vec3 right = rightColor(st);
    
    float a = 0.064;
    float b = 0.860;
    float c = 0.6;
    float d = 0.736;
    float rot = -0.1;
    
    float pct = smoothstep(a, b, st.x + st.y * rot);
    
	vec3 color = mix(left, right, pct * (sin(u_time) + 1.0) / 2.0);
    gl_FragColor = vec4(color,1.0);
}