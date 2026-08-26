int time = 0;
float xx = 0;
float yy = 0;


void setup(){
  size(800,800,P2D);
  pixelDensity(2);
  frameRate(30);
}



void draw(){
  background(0);
  fill(255);
  noStroke();
  ellipseMode(CENTER);
  translate(width/2,height/2);
 
 /* 
  rotate(time*0.01);
  step(0,0,400);
  rotate(time*-0.01);
  */
  push();
  rotate(time*0.01);
  step2(0,0,400);
  pop();
  time++;
}

void step2(float x, float y, float r){
  if(r > 3){
  float t = r * 0.44;
  push();
  rotate(HALF_PI);
  translate(t,t);
  rotate(time*0.01);
  step2(x,y,t);
  pop();
  push();
  rotate(HALF_PI*2);
  translate(t,t);
  rotate(time*-0.01);
  step2(x,y,t);
  pop();
  push();
  rotate(HALF_PI*3);
  translate(t,t);
  rotate(time*0.01);
  step2(x,y,t);
  pop();
  push();
  rotate(HALF_PI*4);
  translate(t,t);
  rotate(time*-0.01);
  step2(x,y,t);
  pop();
  
  }else{
  circle(x,y,r*2);
  }
}


void step(float x, float y, float r){
  if(r > 3){
  float t = r * 0.44;
  translate(t,t);
  rotate(time*0.01);
  step(x,y,t);
  rotate(time*-0.01);
  translate(-t,-t);
  rotate(HALF_PI);
  translate(t,t);
  rotate(time*-0.01);
  step(x,y,t);
  rotate(time*0.01);
  translate(-t,-t);
  rotate(HALF_PI);
  translate(t,t);
  rotate(time*0.01);
  step(x,y,t);
  rotate(time*-0.01);
  translate(-t,-t);
  rotate(HALF_PI);
  translate(t,t);
  rotate(time*-0.01);
  step(x,y,t);
  rotate(time*0.01);
  translate(-t,-t);
    rotate(HALF_PI);
  
  }else{
  circle(x,y,r*2);
  }
}
