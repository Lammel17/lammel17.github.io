int time = 0;
int rs = 0;
float z = 1.2;



void setup(){
  size(900,900,P2D);
  pixelDensity(1);
 //((PGraphicsOpenGL)g).textureSampling( 3 ); // for no smooth in P2D
  //frameRate(30);

}



void draw(){
  fill(255);
  ellipseMode(CENTER);
  translate(width/2,height-125);
  stroke(255,255,255,255);
    int tt = 200;

  push();
  translate(0,-tt);
  
  
    time++;
    if (time == 1 || time%50 == 0){
     rs ++; 
     background(0);
     randomSeed(rs);
       step2(0,0,tt);
    }
  pop();
  strokeWeight(tt/3.2);
  line(0,0,0,-tt);
    
}

void step2(float x, float y, float r){
  if(r > 20){
  float t = r * 0.72;
  int numb =int(random(1,5));
  if(numb > 3){
   numb =3; 
  }
  float k = 1000;
  float kk = 1000;
  float kkk = 1000;
  for(int i = 0; i < numb; i++){
    
  push();
 
     if(numb == 1){
  k = random(radians(-40*z),radians(40*z));
  rotate(k);
  }
     if(numb == 2){
  if( i == 0){
  kk = random(radians(-40*z),radians(-2*z));
  }if( i == 1){
  kk = random(radians(2*z),radians(40*z));
  }
  rotate(kk);
  }
     if(numb == 3){
  if( i == 0){
  kkk = random(radians(-40*z),radians(-14*z));
  }
  if( i == 1){
  kkk = random(radians(-12*z),radians(12*z));
  }
  if( i == 2){
  kkk = random(radians(14*z),radians(40*z));
  }
  rotate(kkk);
  }
  
  
  /*
  if(i == 0){
  k = random(radians(-35),radians(35));
  rotate(k);
  }
  if(i == 1){
    while(kk == 1000 || abs(k-kk) < radians(15)){
  kk = random(radians(-35),radians(35));
  rotate(kk);
  }
  }
    if(i == 2){
    while(kkk == 1000 || abs(k-kkk) < radians(10) || abs(kk-kkk) < radians(10)){
  kkk = random(radians(-35),radians(35));
  rotate(kk);
  }
  }
  */
  
      strokeWeight(t*t/(280+t));
  line(x,y,x,-t);
  translate(0,-t);
  step2(x,y,t);
  pop();
  }
  }
}
