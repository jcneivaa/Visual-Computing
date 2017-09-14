int illusions = 7;
int current = 1;
//toggle illusion activation
boolean active = true;

void setup() {
  size(800, 800);
}
//Variables usadas para stepping
  int a=80;
  int b=40;
  int s=0;
  

void draw() {
  background(255);
  pushStyle();
  switch(current) {
  case 1:
    scintillating();
    break;
    // implement from here. Don't forget to add break for each case
  case 2:
    hering();
    break;
  case 3:
    stepping();
    break;
  case 4:
    diss();
    break;
  case 5:
    squares();
    break;
  case 6:
    gray();
    break;
  case 7:
    ebbin();
    break;
    //println("implementation is missed!");
  }
  popStyle();
}

// switch illusion using the spacebar
void keyPressed() {
  if (key == ' ')
    current = current < illusions ? current+1 : 1;
  if (key == 'a')
    active = !active;
}

// Complete info for each illusion
 
/*
 Scintillating Grid
 Author: E. Lingelbach, 1994
 Code adapted from Rupert Russell implementation
 Tags: Physiological illusion, Hermann grid illusion
*/
void scintillating() {
  background(0);          // black background

  //style
  strokeWeight(3);        // medium weight lines 
  smooth();               // antialias lines
  stroke(100, 100, 100);  // dark grey colour for lines

  int step = 25;          // grid spacing

  //vertical lines
  for (int x = step; x < width; x = x + step) {
    line(x, 0, x, height);
  }

  //horizontal lines
  for (int y = step; y < height; y = y + step) {
    line(0, y, width, y);
  }

  // Circles
  if (active) {
    ellipseMode(CENTER);
    stroke(255, 255, 255);  // white circles
    for (int i = step; i < width -5; i = i + step) {
      for (int j = step; j < height -15; j = j + step) {
        strokeWeight(6); 
        point(i, j);
        strokeWeight(3);
      }
    }
  } 
}

/*
 Hering Illusion
 Author: E. Hering, 1861
 Code adapted from Greg Wittman implementation
*/

void hering(){
  background(255);
  translate(400, 400);
  stroke(0, 0, 100);
  for (int i=0; i<490; i=i+10) {
   if (active){
    line(0, 0, 400, 400);}
     rotate(5);
    
  }
  
  strokeWeight(3);
  stroke(200, 0, 0);
  rotate(-245);
  translate(-250, -250);
  line(200, -250, 200, 1000);
  line(300, -250, 300, 1000);
 
}

/*
 Stepping Feet Ilussion
 Author: Stuart Anstis
 Code adapted from Greg Wittman implementation
*/

void stepping() {
background(255);
  if (b>=height-a/2) {
    s=1;
  }
  if (b==a/2) {
    s=0;
  }
  if (s==0) {
    b++;
  }
  else {
    b--;
  }
  rectMode(CORNER);
  noStroke();
  fill(0);
  if(active) {
  for (int y=0; y<800; y=y+40) {
    rect(0, y, 800, 20);
  }
  }
  rectMode(CENTER);
  fill(0, 0, 30);
  rect(320, b, a, a);
  rect(640, b, a, a);
  fill(255, 255, 0);
  rect(160, b, a, a);
  rect(480, b, a, a);
}

/*
 Stepping Dissapearing Light Illusion
 Author: I. Troxler
 Code adapted from Greg Wittman implementation
*/

void diss() {
  background(0);
  //Surrounding ellipses
  fill(255, 255, 0);
  noStroke();
  ellipse(240, 240, 16, 16);
  ellipse(560, 240, 16, 16);
  ellipse(400, 560, 16, 16);
  //Grid
  Grid grid = new Grid();
  translate(400, 400);
  rotate(millis()/1000.0);
  grid.diss();
  //Center Ellipse
  if ((frameCount/20) % 2 == 0) {
    noStroke();
    fill(200, 510, 200);
    ellipse(-14, -14, 16, 16);
  }
}

class Grid {
  Grid() {
  }

  void diss() {
    stroke(0, 0, 255);
    for (int x=-280; x<280; x=x+40) {
      for (int y=-280; y<280; y=y+40) {
        line(x, y+13, x+26, y+13);
        line(x+13, y, x+13, y+26);
      }
    }
  }
}
/*
 Moving Squares
 Author: Bridget Louise Rile, 1961
 Code adapted from R. Heartbreak implementation
*/
void squares(){
 background(0);
  smooth();
  float angle = 0.0;
  float scaleVal = (mouseX/7.6)/1.5;
  float i = 4;
  println(i);
  float angleInc = PI/i;
  float w = 75/1.5;
  fill(255);
  for (int y=0; y<= height+w; y+=w){
    stroke(130);
    strokeWeight(2);
    line(0,y,800,y);
  }
  
  for (int offset = 0; offset<width+w; offset +=w*2){
    angle = 0.0;
    for (int y=0; y<= height; y+=w){
      float x = offset + (sin(angle)*scaleVal);
      rect(x,y,w,w);
      angle += angleInc;
    }
  }
}
/*
 Gradient Illusion
 Code implemented by Camilo Neiva
*/
void gray(){
  background(255);          

  noStroke();
  if(active){
  fill(60);    
  rect(0, 0, 400, 800);
  fill(220);   
  rect(400, 0, 400, 800);
  }
  fill(130);
  ellipse(200, 400, 330, 330);
  ellipse(600, 400, 330, 330);
  
}
/*
 Ebbinghaus Illusion
 Author: H. Ebbinghaus, 1901
 Code implemented by Camilo Neiva
*/
void ebbin(){
  background(255);          
  noStroke();

  
  fill(0,128,175);
  ellipse(200, 400, 70, 70);

  ellipse(600, 400, 70, 70);
  if (active){
  fill(129,84,202);
  ellipse(70, 400, 120, 120);
  ellipse(330, 400, 120, 120);
  ellipse(200, 270, 120, 120);
  ellipse(200, 530, 120, 120);
  
  ellipse(540, 400, 40, 40);
  ellipse(660, 400, 40, 40);
  ellipse(600, 340, 40, 40);
  ellipse(600, 460, 40, 40);
  ellipse(560, 360, 40, 40);
  ellipse(640, 360, 40, 40);
  ellipse(640, 440, 40, 40);
  ellipse(560, 440, 40, 40); 
  }
}