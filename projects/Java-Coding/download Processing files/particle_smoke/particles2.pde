import java.util.Iterator;
//ParticleSystem ps;
ArrayList<ParticleSystem> pasy;
PImage img;
int wind = 270;
PVector windDir;
int count = 0;

void setup(){
  //frameRate(60);
  size(800,800,P2D);
 ((PGraphicsOpenGL)g).textureSampling( 3 ); // for no smooth in P2D
  //frameRate(30);
  colorMode(HSB);
  imageMode(CENTER);
  rectMode(CENTER);
  blendMode(ADD);
  pasy = new ArrayList<ParticleSystem>(); 
  img = loadImage("blackSmoke25.png");
  windDir = new PVector(0,-0.3);
  pasy.add( new ParticleSystem(new PVector(width/2,height-100)));
}

void draw(){
 background(0); 
 
 for( ParticleSystem p: pasy){
 p.run(windDir);
 }
 direction();
}

void mouseClicked(){
     pasy.add( new ParticleSystem(new PVector(mouseX,mouseY)));
}

void direction(){
   if (count == 100){
 wind = -int(random(180));
 windDir.x = cos(radians(wind))*0.3;
 windDir.y = sin(radians(wind))*0.3;
 count = 0;
 }
 count++;
 
 stroke(255);
 strokeWeight(2);
 line(width/2,height/2, width/2+windDir.x*180,height/2+windDir.y*180);
}

PImage getImg(){
  return img;
}
