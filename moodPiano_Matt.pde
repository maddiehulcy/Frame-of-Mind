/**
 * Button.
 *
 * Click on one of the colored shapes in the
 * center of the image to change the color of
 * the background.
 */
import processing.sound.*;
SoundFile R1file;//7 of each of these- name them after mood sets
SoundFile R2file;
SoundFile R3file;
SoundFile R4file;
SoundFile R5file;
SoundFile R6file;
SoundFile R7file;

SoundFile T1file;
SoundFile T2file;
SoundFile T3file;
SoundFile T4file;
SoundFile T5file;
SoundFile T6file;
SoundFile T7file;

SoundFile C1file;
SoundFile C2file;
SoundFile C3file;
SoundFile C4file;
SoundFile C5file;
SoundFile C6file;
SoundFile C7file;

SoundFile S1file;
SoundFile S2file;
SoundFile S3file;
SoundFile S4file;
SoundFile S5file;
SoundFile S6file;
SoundFile S7file;

int triX, triY;      // Position of square button
int rectX, rectY;      // Position of square button
int rect2X, rect2Y;      // Position of square button
int circleX, circleY;  // Position of circle button
int rectSize = 90;     // Diameter of rect
int circleSize = 93;   // Diameter of circle
int triSize = 90;
int rect2Size = 90;
color rectColor, circleColor, triColor, baseColor, rect2Color;
color rectHighlight, circleHighlight, triHighlight, rect2Highlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;
boolean triOver = false;
boolean rect2Over = false;
void setup() {
  size(640, 360);
  triColor = color(0, 0, 255);
  triHighlight = color(51);
  rectColor = color(255, 204, 0);
  rectHighlight = color(51);
  circleColor = color(255, 0, 0);
  circleHighlight = color(204);
  rect2Color = color(0 , 100, 0);
  rect2Highlight = color(204);
  baseColor = color(102);
  currentColor = baseColor;
  circleX = width/3+circleSize/2+10;
  circleY = height/2;
  rectX = width/3-rectSize-10;
  rectY = height/2-rectSize/2;
  rect2X = width/3-rectSize+310;
  rect2Y = height/2-rectSize/2;
  triX = width/3-triSize+10;
  triY = height/2-triSize/2;
  ellipseMode(CENTER);
  
  //sound files created
  S1file = new SoundFile(this,"S_amaj.aiff");
  S2file = new SoundFile(this,"S_bmin.aiff");
  S3file = new SoundFile(this,"S_cmin.aiff");
  S4file = new SoundFile(this,"S_dmaj.aiff");
  S5file = new SoundFile(this,"S_emin.aiff");
  S6file = new SoundFile(this,"S_fmaj.aiff");
  S7file = new SoundFile(this,"S_gmaj.aiff");
  
  C1file = new SoundFile(this,"C_amaj.aiff");
  C2file = new SoundFile(this,"C_bmin.aiff");
  C3file = new SoundFile(this,"C_cmin.aiff");
  C4file = new SoundFile(this,"C_dmaj.aiff");
  C5file = new SoundFile(this,"C_emin.aiff");
  C6file = new SoundFile(this,"C_fmaj.aiff");
  C7file = new SoundFile(this,"C_gmaj.aiff");
  
  T1file = new SoundFile(this,"T_amaj.aiff");
  T2file = new SoundFile(this,"T_bmin.aiff");
  T3file = new SoundFile(this,"T_cmin.aiff");
  T4file = new SoundFile(this,"T_dmaj.aiff");
  T5file = new SoundFile(this,"T_emin.aiff");
  T6file = new SoundFile(this,"T_fmaj.aiff");
  T7file = new SoundFile(this,"T_gmaj.aiff");
  
  R1file = new SoundFile(this,"R_amaj.aiff");
  R2file = new SoundFile(this,"R_bmin.aiff");
  R3file = new SoundFile(this,"R_cmin.aiff");
  R4file = new SoundFile(this,"R_dmaj.aiff");
  R5file = new SoundFile(this,"R_emin.aiff");
  R6file = new SoundFile(this,"R_fmaj.aiff");
  R7file = new SoundFile(this,"R_gmaj.aiff");
}
void draw() {
  update(mouseX, mouseY);
  background(currentColor);
  if (triOver) {
    fill(triHighlight);
  } else {
    fill(triColor);
  }
  stroke(255);
    triangle(330, 220, 410, 220, 370, 130);
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  stroke(255);
  rect(rectX, rectY, rectSize, rectSize);
  if (rect2Over) {
    fill(rect2Highlight);
  } else {
    fill(rect2Color);
  }
  stroke(255);
  rect(rect2X, rect2Y, rect2Size+20, rectSize);
  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  stroke(0);
  ellipse(circleX, circleY, circleSize, circleSize);
}
void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
    triOver = false;
    rect2Over=false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
    triOver = false;
    rect2Over=false;
  } else if ( overTri(370, 130, 80, 80) ) {
    rectOver = false;
    circleOver = false;
        triOver = true;
    rect2Over=false;
  }
  else if ( overRect2(rect2X, rect2Y, rect2Size+20, rect2Size) ) {
    rectOver = false;
    circleOver = false;
    triOver = false;
    rect2Over = true;
  }
  else {
    circleOver = rectOver  = rect2Over= false;
  }
}
//Piano Mood changer (4 Moods)
void mousePressed() {
  if (circleOver) {
    currentColor = circleColor;
    //soundfiles called
    C1file.play();
  }
  if (rectOver) {
    currentColor = rectColor;
     S1file.play();
  }
   if (triOver) {
    currentColor = triColor;
    T1file.play();
  }
   if (rect2Over) {
    currentColor = rect2Color;
    R1file.play();
  }
}

//keyboard notes (7 per mood)
void keyPressed(){
  if(currentColor == circleColor){
    if(key == 'q'){
       C1file.play();
    }
    if(key == 'w'){
      C2file.play();
    }
    if(key == 'e'){
      C3file.play();
    }
    if(key == 'r'){
      C4file.play();
    }
    if(key == 't'){
      C5file.play();
    }
    if(key == 'y'){
      C6file.play();
    }
    if(key == 'u'){
      C7file.play();
    }
  }
  
  if(currentColor == rectColor){
    if(key == 'q'){
       S1file.play();
    }
    if(key == 'w'){
      S2file.play();
    }
    if(key == 'e'){
      S3file.play();
    }
    if(key == 'r'){
      S4file.play();
    }
    if(key == 't'){
      S5file.play();
    }
    if(key == 'y'){
      S6file.play();
    }
    if(key == 'u'){
      S7file.play();
    }
  }
  
  if(currentColor == triColor){
    if(key == 'q'){
       T1file.play();
    }
    if(key == 'w'){
      T2file.play();
    }
    if(key == 'e'){
      T3file.play();
    }
    if(key == 'r'){
      T4file.play();
    }
    if(key == 't'){
      T5file.play();
    }
    if(key == 'y'){
      T6file.play();
    }
    if(key == 'u'){
      T7file.play();
    }
  }
  
  if(currentColor == rect2Color){
 if(key == 'q'){
       R1file.play();
    }
    if(key == 'w'){
      R2file.play();
    }
    if(key == 'e'){
      R3file.play();
    }
    if(key == 'r'){
      R4file.play();
    }
    if(key == 't'){
      R5file.play();
    }
    if(key == 'y'){
      R6file.play();
    }
    if(key == 'u'){
      R7file.play();
    }
  }
}

boolean overTri(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
boolean overRect2(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
