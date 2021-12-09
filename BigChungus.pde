//import processing.video.*;
PImage Carrot;
PImage Chungus;
PImage BigChungus;
PImage ClosedBackground;
PImage OpenBackground;
PImage begin;
boolean BEGIN = true;
boolean INTRO = false;
boolean START = false;
boolean firstrun = false;
boolean timedRun = true;
boolean up, down, left, right;
int pmillis= 0;
int startmillis = 0;
int CHUNGX = width/2;
int CHUNGY = height/2;
int speed = 10;
int bounce = 10;
int CX = 400;
int CY= 600;
int Score = 0;
int timedScore = 0;
int CWidth;
int CHieght;
int ChungusWidth;
int ChungusHeight;
int multiply = 2;
int gamemode = 1;
int time = 30; //Ammount of time in seconds for time mode.
float version = 3.4;
//Movie intro;
void setup() {
  size(screenWidth, screenHeight);
  Carrot = loadImage("carrot.png");
  Chungus = loadImage("ChungusTransparent.png");
  ClosedBackground = loadImage("ChungusBackground.PNG");
  OpenBackground = loadImage("ChungusBackground2.PNG");
  begin = loadImage("begin.png");
  //intro = new Movie(this, "intro.mp4");
  //fullScreen();
  ClosedBackground.resize(width, height);
  OpenBackground.resize(width, height);
  begin.resize(width, height);
  //Chungus.resize(width/16, height/16);
  //Carrot.resize(width/32, height/16);
  CHUNGX = width/2;
  CHUNGY = height/2;
  speed = (width+height/2)/50;
  CX = width/3;
  CY= height/3;
  CWidth = width/32;
  CHeight = height/16;
  ChungusWidth = width/8;
  ChungusHieght = height/8;
  frameRate(60);
  //  intro.play();
}


void draw() {
  //println("0");
  if (BEGIN) {
    //background(begin);
    image(begin, 0,0, width, height);
    textSize(60);
    textAlign(CENTER);
    fill(0);
    if(gamemode == 1){
    text("--> Freeplay\n    Timed", width/2, ((height/4)*3));
    }
    if(gamemode == 2){
    text("    Freeplay\n--> Timed", width/2, ((height/4)*3));
    }
    if (keyPressed) {
      if (key == ENTER || key == RETURN || key == ' ') {
        BEGIN = false;
        INTRO = true;
      }
      if(keyCode == UP && pmillis + 300 <= millis()) {
      gamemode++;
      pmillis = millis();
        if(gamemode > 2){
          gamemode = 1;
        }
      }
      if(keyCode == DOWN && pmillis + 300 <= millis()){
       pmillis = millis();
       gamemode--;
       if(gamemode < 1){
         gamemode = 2;
       }
      }
      
    }
  }
  
  if (INTRO) {
    if (!firstrun) {
      firstrun = true;
      pmillis = millis();
    }
    //image(intro, 0, 0, width, height);
    //intro.play();
    //println(intro.duration());

    //if (millis() >= pmillis + (intro.duration()*1090)) {
      INTRO = false;
      START= true;
      //println("end");
    //}
  }




  if (START && gamemode == 1) {
    if(key == 'e' || key == 'E'){
    START = false;
    BEGIN = true;
    }
    image(ClosedBackground, 0, 0, width, height);
    image(Carrot, CX, CY, width/32, height/16);
    textAlign(RIGHT);
    textSize(70);
    fill(255);
      text(Score, width-100, 80);
    image(Chungus, CHUNGX, CHUNGY, (width/8)+((Score+1)*multiply), (height/8)+((Score+1)*multiply));
    if (up) {
      CHUNGY-= speed;
    }
    if (down) {
      CHUNGY+= speed;
    }
    if (left) {
      CHUNGX-=speed;
    }
    if (right) {
      CHUNGX+=speed;
    }
    if (CHUNGX <= CX && (CHUNGX +((Score+1)*multiply) + width/8) >= (CX + width/32)) {
      if (CHUNGY <= CY && (CHUNGY + ((Score+1)*multiply) + height/8) >= (CY + height/16)) {
        //ellipse(CHUNGX, CHUNGY, 10, 10);
        moveCarrot();
        Score++;
      }
    }
  }
  if (START && gamemode == 2){
  if(key == 'e' || key == 'E'){
    START = false;
    BEGIN = true;
    }
    image(ClosedBackground, 0, 0, width, height);
    if(timedRun){
    timedScore = 0;
    startmillis = millis();
    timedRun = false;
    }

    if((startmillis + (time * 1000)) >= millis() && !timedRun){
    image(ClosedBackground, 0, 0, width, height);
    image(Carrot, CX, CY, width/32, height/16);
    textAlign(RIGHT);
    textSize(70);
    fill(255);
    text(timedScore, width-100, 80);
    textAlign(LEFT);
    text((time)-((millis() - startmillis)/1000), 0, 80);
    image(Chungus, CHUNGX, CHUNGY, (width/8)+((Score+1)*multiply), (height/8));
    
    
    
    if (up) {
      CHUNGY-= speed;
    }
    if (down) {
      CHUNGY+= speed;
    }
    if (left) {
      CHUNGX-=speed;
    }
    if (right) {
      CHUNGX+=speed;
    }
    
    
    
    
    
    if (CHUNGX <= CX && (CHUNGX +((Score+1)*multiply) + width/8) >= (CX + width/32)) {
      if (CHUNGY <= CY && (CHUNGY + ((Score+1)*multiply) + height/8) >= (CY + height/16)) {
        //ellipse(CHUNGX, CHUNGY, 10, 10);
        moveCarrot();
        timedScore++;
      }
    }
    
  
  }
  else{
  textAlign(CENTER);
  textSize(60);
  text(timedScore + " Carrots", width/2, (height/2)+80);
  text((round(((timedScore / time)*100))/100) + " Carrots per Second", width/2, (height/2)+160)
  text("PRESS E TO RETURN TO MENU", width/2, (height/2)+240);
  if(key == 'e' || key == 'E'){
  BEGIN = true;
  START = false;
  timedRun = true;
  timedScore = 0;
  
  }
   
   
    
  }  
    
  }
  
  
  
  



  if (CHUNGX > width-(ChungusWidth)) {
    CHUNGX = width-(ChungusWidth+bounce);
  }
  if (CHUNGX < 0) {
    CHUNGX = bounce;
  }
  if (CHUNGY > height-ChungusHeight) {
    CHUNGY = height-(ChungusHeight+bounce);
  }
  if (CHUNGY < 0) {
    CHUNGY = bounce;
  }
  
  drawVersion();
}
/*
void movieEvent(Movie m) {
  m.read();
}
*/

void keyPressed() {
  processMove(keyCode, true);
}
void keyReleased() {
  processMove(keyCode, false);
}

boolean processMove(int k, boolean b) {
  switch (k) {
  case UP:
    return up = b;

  case DOWN:
    return down = b;

  case LEFT:
    return left = b;

  case RIGHT:
    return right = b;

  default:
    return b;
  }
}

void makeChungusBigAgain() {
}

void moveCarrot() {
  CX = round(random(0, width-Carrot.width));
  CY = round(random(0, height-Carrot.height))
}




void drawVersion(){
textSize(12);
textAlign(RIGHT);
text("BigChungus v" + version, width - 100, height - 100);
text("Created by Matthew Berg", width-100, height-80);


}
