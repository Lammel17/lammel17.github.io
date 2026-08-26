GameObj go;
float level = 1;  //1-3
int countTime = 0;
int points = 0;
int maxPoints = 15;
int lifePoints = 3;
int invaderSize = 42;
ArrayList<GameObj> gameobjList;
ArrayList<GameObj> starList;
boolean beginn = true;
boolean noLoose = true;
boolean bossCheck = true;
int LP = 600;
int bla = 0;
final int lpMax = LP;
int lpNow;

void setup(){
  size(625,1000,P2D);
 ((PGraphicsOpenGL)g).textureSampling( 3 ); // for no smooth in P2D
  //frameRate(30);
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);
  textSize(38);
  noStroke();
  noSmooth();
  colorMode(HSB, 255,255,255); 
  gameobjList = new ArrayList<GameObj>();
  starList = new ArrayList<GameObj>();
}

void draw(){
  background(0);
  countTime++;
  
  if(beginn){
    for( int i = 0; i<height;i=i+10){
    backStars(i);  
    }
    beginn = false;
  }
  
  if(countTime%int((50/level)) == 0 && noLoose && bossCheck){
    newObj();
  }
  
  if(bossCheck == false && noLoose){
    if(countTime%int((100/level)) == 0){
    newObj2();
  }
  }
  
  for(GameObj st : starList){
    st.show();
    if(st.y > height){
    st.y = 0;
    }
  }
  
  for(GameObj go : gameobjList){
    go.show();
  }

  mouseAttackAndDamage();
  life();
  winOrLoose();
 
  fill(255);
  textAlign(CENTER);
  text(points, 40, height-17);
  //text(LP, 60, height - 50);
  
  if(bossCheck == false && LP > 0){
    push();
    fill(248,255,230);
    rectMode(CORNER);
    rect(90,60, LP*(width-180)/lpMax,8);
    pop();
  }
  
  curser();
}



void backStars(int y){
  float x = random(0,width);
  float speed = 0.4+random(0,0.05);
  //GameObj enemy = new GameObj(x,y,speed);
  GameObj stars = new GameObj(x,y,speed,0);
  starList.add(stars);  
}

void newObj(){
  float x = random(75,width-30);
  float y = -20;
  float speed = 1+level+random(-0.5,0.5);
  GameObj enemy = new Invader(x,y,speed,1,invaderSize);
  gameobjList.add(enemy);  
}

void newObj2(){
  
  float x = width/2;
  while( x > width/2 - 140 && x < width/2 + 140){
  x = random(75,width-30);
  }
  float y = -100;
  float speed = 1+level+random(-0.5,0.5);
  GameObj enemy = new Invader(x,y,speed,1,invaderSize);
  gameobjList.add(enemy);  
}

void newBoss(){
  float x = width/2;
  float y = -200;
  float speed = 0.6+0.2*level;
  GameObj enemy = new Invader(x,y,speed,2,invaderSize);
  gameobjList.add(enemy);  
}


  void mouseAttackAndDamage(){
    for(GameObj g : gameobjList){
     if(mousePressed && g.speed != 0){
      float d = dist(mouseX,mouseY+15,g.x,g.y);
      
      if(g.type == 1){
      if(d <= 25){
        points++;
        g.speed = 0;
        int j = (width-90-25-30)/(maxPoints-1);
        g.x = points*j + 100 -(width-90)/maxPoints;
        if(points > maxPoints){
        g.x = width + 100;
        }
        g.y = height-30;
      }
      }
      
      if(g.type == 2){
        if(d <= 70){
         LP--;
         g.y = g.y - 0.3;
         g.x = g.x + random(-4,4);
         if(LP == 0){
        points = points + 100;
        g.speed = -3;
         }
      }
    }
     }
    if(g.y >= height-15){
      lifePoints = lifePoints -1;
       g.y = -80;
      g.speed = 0;
      if(g.type == 2){
        lifePoints = 0;
      }
    }
  }
  }
  
  void winOrLoose(){
  if(points >= maxPoints){
  if(bossCheck){
    newBoss();
    bossCheck = false;
    for(GameObj g : gameobjList){
      if(g.speed != 0 && g.type == 1){
      g.speed = -10;
      }
    }
    
  }
  if(points >= maxPoints+99){ 
  textAlign(CENTER);
  fill(255);
  text("YOU WON AGAINST SPACEBUGS", width/2, height/2);
      for(GameObj g : gameobjList){
      if(g.speed != 0 && g.type == 1){
      g.speed = -10;
      }
      }
  noLoose = false;
  }
  }
  }
 
  
  
  void life(){
  if(lifePoints > 0){
    int y = 30;
  for(int l = lifePoints ; l>0; l--){
    fill(248,255,230);
    rect(30,y,30,30);
    y = y+45;
  }
  } else {
    noLoose = false;
    textAlign(CENTER);
    fill(255);
    text("YOU ARE DEAD, ALOT", width/2, height/2);
    for(GameObj g : gameobjList){
      if(g.speed != 0){
      g.speed = 20;
      }
    }
  }
}
  





void curser(){
  fill(255);
  rect(mouseX,mouseY,3,31);
  rect(mouseX,mouseY,31,3);
}
