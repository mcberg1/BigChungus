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
boolean up, down, left, right;
int pmillis= 0;
int CHUNGX = width/2;
int CHUNGY = height/2;
int speed = 10;
int bounce = 10;
int CX = 400;
int CY= 600;
int Score = 0;
//Movie intro;
void setup() {
  Carrot = loadImage("carrot.png");
  Chungus = loadImage("ChungusTransparent.png");
  ClosedBackground = loadImage("ChungusBackground.PNG");
  OpenBackground = loadImage("ChungusBackground2.PNG");
  begin = loadImage("begin.png");
  //intro = new Movie(this, "intro.mp4");
  size(1280, 960);  
  //fullScreen();
  ClosedBackground.resize(width, height);
  OpenBackground.resize(width, height);
  begin.resize(width, height); 
  Chungus.resize(width/8, height/8);
  Carrot.resize(width/32, height/16);
  CHUNGX = width/2;
  CHUNGY = height/2;
  speed = (width+height/2)/200;
  CX = width/3;
  CY= height/3;
  //frameRate(60);
  //  intro.play();
}


void draw() {
  println("0");
  if (BEGIN) {
    background(begin);
    textSize(70);
    textAlign(CENTER);
    fill(0);
    text("PRESS SPACE TO START", width/2, ((height/4)*3));
    if (keyPressed) {
      if (key == ' ') {
        BEGIN = false;
        INTRO = true;
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
    println(intro.duration());

    if (millis() >= pmillis + (intro.duration()*1090)) {
      INTRO = false;
      START= true;
      println("end");
    }
  }




  if (START) {

    background(ClosedBackground);
    image(Carrot, CX, CY);
    textAlign(RIGHT);
    textSize(70);
    fill(255);
      text(Score, width-100, 80);
    image(Chungus, CHUNGX, CHUNGY);
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
    if (CHUNGX <= CX && CHUNGX + Chungus.width >= CX+Carrot.width) {
      if (CHUNGY <= CY && CHUNGY + Chungus.height >= CY+Carrot.height) {
        ellipse(CHUNGX, CHUNGY, 10, 10);
        moveCarrot();
        Score++;
      }
    }
  }




  if (CHUNGX > width-Chungus.width) {
    CHUNGX = width-(Chungus.width+bounce);
  } 
  if (CHUNGX < 0) {
    CHUNGX = bounce;
  }
  if (CHUNGY > height-Chungus.height) {
    CHUNGY = height-(Chungus.height+bounce);
  } 
  if (CHUNGY < 0) {
    CHUNGY = bounce;
  }
}

void movieEvent(Movie m) {
  m.read();
}


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
  CY = round(random(0, height-Carrot.height));
}



