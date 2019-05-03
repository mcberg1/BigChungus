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
float CHUNGX = halfWidth/2;
float CHUNGY = height/2;
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
int halfWidth = 0;
//Movie intro;
void setup() {
  size(screenWidth, screenHeight);
  halfWidth = width/2;
  Carrot = loadImage("carrot.png");
  Chungus = loadImage("ChungusTransparent.png");
  ClosedBackground = loadImage("ChungusBackground.PNG");
  OpenBackground = loadImage("ChungusBackground2.PNG");
  begin = loadImage("begin.png");
  //intro = new Movie(this, "intro.mp4");
  //fullScreen();
  ClosedBackground.resize(halfWidth, height);
  OpenBackground.resize(halfWidth, height);
  begin.resize(halfWidth, height);
  //Chungus.resize(width/16, height/16);
  //Carrot.resize(width/32, height/16);
  CHUNGX = halfWidth/2;
  CHUNGY = height/2;
  speed = (halfWidth+height/2)/200;
  CX = halfWidth/3;
  CY= height/3;
  CWidth = halfWidth/32;
  CHeight = height/16;
  ChungusWidth = halfWidth/8;
  ChungusHieght = height/8;
  
  //frameRate(60);
  //  intro.play();
}


void draw() {
  //println("0");
  if (BEGIN) {
    //background(begin);
    image(begin, 0,0, halfWidth, height);
    image(begin, halfWidth,0, halfWidth, height);
    textSize(60);
    textAlign(CENTER);
    fill(0);
    text("TAP TO START", halfWidth/2, ((height/4)*3));
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
    image(ClosedBackground, 0, 0, halfWidth, height);
    image(ClosedBackground, halfWidth, 0, halfWidth, height);
    image(Carrot, CX, CY, halfWidth/32, height/16);
    image(Carrot, halfWidth+CX, CY, halfWidth/32, height/16);
    textAlign(RIGHT);
    textSize(70);
    fill(255);
    text(Score, halfWidth-100, 80);
    text(Score, width-100, 80);
    //text(map(gammaRadians, 0, 180, -1, 1), halfWidth-100, 80);
	image(Chungus, CHUNGX, CHUNGY, (halfWidth/8)+((Score+1)*multiply), (height/8)+((Score+1)*multiply));
	processMove(alphaRadians, 2);
    if (CHUNGX <= CX && (CHUNGX +((Score+1)*multiply) + halfWidth/8) >= (CX + halfWidth/32)) {
      if (CHUNGY <= CY && (CHUNGY + ((Score+1)*multiply) + height/8) >= (CY + height/16)) {
        //ellipse(CHUNGX, CHUNGY, 10, 10);
        moveCarrot();
        Score++;
      }
    }
  }

  
  
  
  



  if (CHUNGX > halfWidth-(ChungusWidth)) {
    CHUNGX = halfWidth-(ChungusWidth+bounce);
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
	CHUNGY -= speed * Math.sin(alphaRadians);
	
}

void makeChungusBigAgain() {

}

void moveCarrot() {
  CX = round(random(0, halfWidth-Carrot.width));
  CY = round(random(0, height-Carrot.height))	
}




void drawVersion(){
textSize(12);
textAlign(RIGHT);
text("BigChungus v" + version, halfWidth - 100, height - 100);
text("Created by Matthew Berg", halfWidth-100, height-80);

}

void fuckingMove(float alpha, float beta, float gamma){
	alphaRadians = radians(alpha+90);
	betaRadians = radians(beta);
	gammaRadians = gamma+90;//lol its not actually radians get shrekt 
} 
