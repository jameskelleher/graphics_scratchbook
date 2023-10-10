#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float plot(vec2 st, float pct){
  return  smoothstep( pct-0.02, pct, st.y) -
          smoothstep( pct, pct+0.02, st.y);
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;

    // Smooth interpolation between 0.1 and 0.9
    float low = 0.168;
    float mid = 0.436;
    float hi = 1.056;
    float x_trans = -0.328;
    float y_offset = 0.328;
    float rot = -0.816;
    
    float y = smoothstep(low,mid,(st.x + st.y * rot)- x_trans) - smoothstep(mid,hi,(st.x + st.y * rot) - x_trans);
    
    float slope = 0.0;
    y = y + st.x * slope;

    vec3 color = vec3(y);

    float pct = plot(st,y);
    color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);

    gl_FragColor = vec4(color,1.0);
}
