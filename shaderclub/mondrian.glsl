// Author @patriciogv - 2015
// http://patriciogonzalezvivo.com

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float not(float x){
    return abs(x - 1.0);
}

float xor(float a, float b){
    return (a - b) * (a - b);
}

float xnor(float a, float b){
    return not(xor(a, b));
}

vec2 xnor(vec2 a, vec2 b){
    return vec2(xnor(a.x, b.x), xnor(a.y, b.y));
}

float cfloor(float x){
    return clamp(0.0, 1.0, floor(x));
}

vec2 cfloor(vec2 v){
    return vec2(cfloor(v.x), cfloor(v.y));
}

float btw(float val, float low, float hi){
    return xor(cfloor(val/low), cfloor(val/hi));
}

float and(float a, float b){
    return a * b;
}

float rect(vec2 bl, float width, float height, vec2 st) {
    float btw_x = btw(st.x, bl.x, bl.x+width);
    float btw_y = btw(st.y, bl.y, bl.y+height);
    return and(btw_x, btw_y);
}

void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(0.0);
    
        // float pct = xnor(cfloor(st.x/0.1), cfloor(st.x/0.2));

    
    // float pct = xor(floor(st.x/0.1), floor(st.x/0.9));
    
    // float pct = xnor(floor(st.x/0.3), floor(st.x/0.4));
    
    // vec2 bl = xnor(cfloor(st/0.1), cfloor(st/0.2));
    // float pct = bl.x * bl.y;

    // bottom-left
    // vec2 bl = abs(step(vec2(0.1),st));
    // float pct = bl.x * bl.y;

    // top-right
    // vec2 tr = step(vec2(0.1),1.0-st);
    // pct *= tr.x * tr.y;
    
    // vec2 st_ = 1.0-st;
    // vec2 tr = xnor(cfloor(st_/0.1), cfloor(st_/0.2));
    // pct *= tr.x * tr.y;

    // color = vec3(pct);
    
    vec3 red = vec3(1.0, 0., 0.);
    
    color = mix(color, red, rect(vec2(0.1, 0.1),0.2,0.2, st));
    color = mix(color, red, rect(vec2(0.240,0.560),0.056,0.320, st));
    

    gl_FragColor = vec4(color,1.0);
}




