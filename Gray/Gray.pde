PGraphics pg1,pg2;
PImage img;

void setup() {
  size(1400,700);
  pg1 = createGraphics(700, 700);
  pg2 = createGraphics(700, 700);
  img=loadImage("2.jpg");
  //size(960, 1048);
  //pg1 = createGraphics(960, 574);
  //pg2 = createGraphics(960, 574);
  //img = loadImage("1.jpg");
}

void draw() {
  pg1.beginDraw();
  
  pg1.image(img,0,0);
  
  pg1.endDraw();
  
  pg2.beginDraw();
  
  //pg.image(img,0,0);
  //int count = img.width * img.height;
  for (int w=0; w<img.width;w++){
   for (int h=0; h<img.height;h++){
    color c = pg1.get(w,h);
    c= int(color((red(c) + green(c) + blue(c))/3));
    pg2.set(w,h,c);
   }
  }
  
  pg2.endDraw();
  
  image(pg1, 0, 0);
  image(pg2,700,0);
  
  //image(pg1, 0, 0);
  //image(pg2,0,574);

}