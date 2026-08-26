class Circle{
float x;
float y;
float r;
float speedT;
int counter;
boolean growing = true;

 Circle (float x1, float y1, float speedT1){
   x = x1;
   y = y1;
   r = 1;
   speedT = speedT1;
 }
 
 void grow() {
   growing = true;
    checkOthers();
    checkEdge();
   if(growing){
     counter = 0;
    r = r+speedT;
   } else {
     counter++;
   }
 }
 
 void checkEdge(){
   if( x + r+2 >= width || x - r+2 <= 0 || y + r+2 >= height || y - r+2 <= 0 ){
     growing = false;
   }
 }
 
 void checkOthers(){
    for(Circle other : circles){
      if( x != other.x && y != other.y){
   float d = dist(x,y, other.x, other.y);
        if(d <= r + other.r+5){
          growing = false;
        }
      }
    }
 }
 
 void show(int t){
   
   if(counter == 0){
     stroke(255);
   }else{
   stroke(255,t,t,t);
   }
   strokeWeight(5);
   noFill();
  circle(x,y,r*2); 
 }
 
}
