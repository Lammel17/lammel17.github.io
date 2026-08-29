class Invader extends GameObj{
  PImage img;
  color[] col = new int[6];
  int size;


  boolean alife = true;
  
  Invader(float x, float y, float speed, int type, int size) {
    super(x, y,speed,type);
    this.size = size;
    img = createInvader(7);

}
  
    void show(){
    image(img,x,y,size * (-4+5*type),size* (-1+2*type));
    //rect(x,y,41,41);
    y = y + speed;
    
    if(y == -900 || y == height+300){
      speed = 0;
    }
  }
  
  
  
  PImage createInvader(int invaderSize){
    PImage imgInvader = createImage(invaderSize * (-1+2*type), invaderSize*type, ARGB);
      setColors();
      
      int symmetricColumnCount = imgInvader.width;
      for(int y = 0; y< imgInvader.height; y++){
      for(int x = 0; x< symmetricColumnCount; x++){
      color c = col[(int)random(0,5)];
      imgInvader.set(x,y,c);
      imgInvader.set(invaderSize*(-1+2*type) -1 - x, y, c);
  }
    if (0 != float(invaderSize) % 2) {
      imgInvader.set(invaderSize/2, y, col[(int)random(0,5)]);
    }

}
  return imgInvader;
  }
  
  void setColors(){ 
  col[0] = color(random(255),random(230,230),random(150,255));
  col[1] = color(random(255),random(230,230),random(150,255));
  col[2] = color(random(255),random(230,230),random(150,255));
  col[3] = color(0,0,0,0);
  col[4] = color(0,0,0,0);
  col[5] = color(0,0,0,0);
}
  
}
