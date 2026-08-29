int invaderCount = 20;
Mover[] mov = new Mover[invaderCount];
Invader[] inv = new Invader[invaderCount];
ArrayList<Stars> starList = new ArrayList<Stars>();
float maxSpeed = 12; //9
float maxSpeedSlowest = maxSpeed/1.5;
int size = 28;  //28
float pullMouse = 0.6;  //Gravity
float pullPushOthers = 0.1;
int pullPushRadius = 41;   
int pullOrPush = 1;
int counttt = 10;
boolean beginn = true;
boolean oneColorOnly = true;

void setup(){
 size(800,800,P2D);
 ((PGraphicsOpenGL)g).textureSampling( 3 ); // for no smooth in P2D
  frameRate(30);
  imageMode(CENTER);
  noSmooth();
  noStroke();
  colorMode(HSB, 255,255,255); 
  int colo = (int)random(190);
  
  for(int i = 0; i< mov.length; i++){
   inv[i] = new Invader(size,i, colo);
 }
 
 for(int i = 0; i< mov.length; i++){
   mov[i] = new Mover(random(maxSpeedSlowest,maxSpeed), size, i, pullPushRadius);
 }
 
 
}


void draw(){
  background(0);
  
  
  showStars();
  
  
  
    if(mousePressed & counttt > 20){
      pullOrPush = pullOrPush * -1;
      counttt = 0;
    }
    for (int i = 0; i < mov.length; i++) {
    mov[i].update(pullMouse, pullPushOthers, pullOrPush);
    mov[i].checkEdges();
    mov[i].display();
  }
  
  fill(100,255,230);
  if(pullOrPush == -1){
    fill(248,255,230);
  }
  ellipse(mouseX,mouseY,16,16);
  
  counttt++;
  
}



void showStars(){
if(beginn){
    for( int i = 0; i<height;i=i+10){
    backStars(i);  
    }
    beginn = false;
  }
    for(Stars st : starList){
    st.show();
    if(st.y > height){
    st.y = 0;
    }
  }
}


void backStars(int y){
  float x = random(0,width);
  float speed = 0.4+random(0,0.05);
  //GameObj enemy = new GameObj(x,y,speed);
  Stars stars = new Stars(x,y,speed,0);
  starList.add(stars);  
}
