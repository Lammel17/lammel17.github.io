float deg = 0;
float mov;

void setup(){
 size(700,700,P2D);
 ((PGraphicsOpenGL)g).textureSampling( 3 ); // for no smooth in P2D
  //frameRate(30);   
  pixelDensity(2); //thats the size issue
 translate(width/2,height/2);
 fill(130,150,250,150);
 stroke(255);
}

void draw(){
  background(0);
   translate(width/2,height/2);
  deg = deg+0.6;
  //rotate(radians(deg));
  mov = sin(radians(deg))*180;
  
  PVector a = new PVector(100,92,100);
  PVector b = new PVector(100,92,100);
  
   a.x = cos(radians(mov))*dist(0,0,100,100);  //deg instead of mov for continuous rotation
   a.z = sin(radians(mov))*dist(0,0,100,100);
   
   b.x = cos(radians(-mov+90))*dist(0,0,100,100);
   b.z = sin(radians(-mov+90))*dist(0,0,100,100);
  
  
   quad( a.x,  a.y+a.z/2,     a.x, -a.y+a.z/2,     -b.x, -b.y+b.z/2,    -b.x, b.y+b.z/2);
  
   quad(-b.x,  b.y+b.z/2,    -b.x, -b.y+b.z/2,     -a.x, -a.y-a.z/2,    -a.x, a.y-a.z/2);
   
   quad(-a.x,  a.y-a.z/2,    -a.x, -a.y-a.z/2,      b.x, -b.y-b.z/2,     b.x, b.y-b.z/2);
    
   quad( b.x, -b.y-b.z/2,     b.x,  b.y-b.z/2,      a.x,  a.y+a.z/2,     a.x, -a.y+a.z/2);
     
     
   quad( a.x,  a.y+a.z/2,    -b.x, b.y+b.z/2,      -a.x,  a.y-a.z/2,     b.x, b.y-b.z/2);
   quad( a.x, -a.y+a.z/2+a.z,   -b.x, -b.y+b.z/2+a.z,   -a.x, -a.y-a.z/2+a.z,     b.x, -b.y-b.z/2+a.z);
  
  
}
