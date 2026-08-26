float x = 0;
float y = 0;
int rowsColums = 8;
float d = 400/rowsColums;
float dd;
float xx = 0;
float yy = 0;



void setup(){
 size(1000,1000, P2D);
 background(0);
 //translate(width/2,height/2);
 strokeWeight(1.2);
 colorMode(HSB);
 
 
 for(int yt = height/rowsColums/2; yt < height; yt = yt +height/rowsColums){
    for(int xt = width/rowsColums/2; xt < width; xt = xt +width/rowsColums){
   push();
   translate(xt,yt);
   stroke(random(255),230,255);
 
 int f = int(random(-3,4));
 if(f < 0){ 
 f = 0;
 }
 int l = int(random(1,8));
 float k = 1.0/l;
 float j = f+k;
 
 
 for(float r = 0; r <= 360*l; r = r + 5){
   
   dd = d * sin(radians(r*j));
   
   x = dd * cos(radians(r));
   y = dd * sin(radians(r));
   
   
   if(r != 0){
   //point(x,y);
   line(xx,yy,x,y);
   }
   xx = x;
   yy = y;
   
 }
   pop();
 }
 }
}
