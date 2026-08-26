class Stars{
float x;
float y;
float speed;
int type;

Stars(float x, float y, float speed, int type){
  this.x = x;
  this.y = y;
  this.speed = speed;
  this.type = type;

}
  
  void show(){
    fill(255);
    noStroke();
    rect(x,y,3,3);
    y = y + speed;
  }
  
  
  
}
