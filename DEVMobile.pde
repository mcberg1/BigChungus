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
float alphaRadians = 0;//Alpha from js device orientation goes 0-360 degrees. 
float betaRadians = 0;
float gammaRadians = 0;
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
  speed = (width+height/2)/200;
  CX = width/3;
  CY= height/3;
  CWidth = width/32;
  CHeight = height/16;
  ChungusWidth = width/8;
  ChungusHieght = height/8;
  //frameRate(60);
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
    text("TAP TO START", width/2, ((height/4)*3));
    
      if (mouseX != pmouseX && mouseY != pmouseY) {
        BEGIN = false;
        INTRO = true;
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
      //text(Score, width-100, 80);
    text(map(gammaRadians, -90, 90, -1, 1), width-100, 80);
	image(Chungus, CHUNGX, CHUNGY, (width/8)+((Score+1)*multiply), (height/8)+((Score+1)*multiply));
	processMove(alphaRadians, 2);
    if (CHUNGX <= CX && (CHUNGX +((Score+1)*multiply) + width/8) >= (CX + width/32)) {
      if (CHUNGY <= CY && (CHUNGY + ((Score+1)*multiply) + height/8) >= (CY + height/16)) {
        //ellipse(CHUNGX, CHUNGY, 10, 10);
        moveCarrot();
        Score++;
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

boolean processMove(float angle, int speed) {
	CHUNGX += speed * Math.cos(alphaRadians);
	CHUNGY += speed * map(gammaRadians, -90, 90, -1, 1);
	
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

void fuckingMove(float alpha, float beta, float gamma){
	alphaRadians = radians(alpha+90);
	betaRadians = radians(beta);
	gammaRadians = gamma;//lol its not actually radians get shrekt 
} 
