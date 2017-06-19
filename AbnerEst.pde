
import processing.sound.*;
Amplitude amp;
SoundFile musica;

float counterMeio=0;

float speedBaixo=10;
float ampScale=1;
float speedMeio=5;

ArrayList<Cube> myCubes = new ArrayList<Cube>();

int tam = 100;
int d = 15;

boolean roda = true;


//camera
float rotation = 0;
float ang = 70;
int c = 800;
float pX = c * (cos(ang));
float pY = c * (sin(ang));
float pZ = 600.0;

float centerX, centerY;
float obsX, obsY, obsZ;

// Texturas
PImage img1,img2,img3;



//Iluminação
int Wsize=800;
int Hsize=600;

int focoLuz = 0;
int r, g, b;
int concentration = 10;

int fill1= 255;
int fill2=25;
int fill3=25;

int cor[ ][ ]={
  {255, 255, 255}, 
  {255, 0, 0}, 
  {0, 255, 0}, 
  {0, 0, 255}, 
  {255, 255, 0}, 
  {0, 255, 255}, 
  {255, 0, 255}, 
  {180, 0, 0}, 
  {0, 180, 0}, 
  {0, 0, 180}, 
  {180, 180, 0}, 
  {0, 180, 180}, 
  {180, 0, 180}
};


float smooth_factor=0.25;
float sum;
float sumScale=5;



void setup() {
  frameRate(25);
  size(800, 600, P3D);

  //song 

  musica = new SoundFile (this, "sample1.mp3");
  musica.loop();
  
   amp = new Amplitude(this);
  amp.input(musica);



  obsX= width/2.0;
  obsY= height/2.0;  
  obsZ= 700;  

  //cores dos focos de luz 
  r=0;
  g=0;
  b=0;



//Carregar as imagens

  textureMode(NORMAL);

  img1= loadImage("data/1.jpg");
  img2 = loadImage("data/2.jpg");
  img3 = loadImage("data/3.jpg"); 


  //Cria valores para os cubos  
  for (int i = 0; i < 3; i++) {
    for (int k = 0; k < 3; k++) {
      for (int j = 0; j < 3; j++) {
        myCubes.add(new Cube( tam + i*(tam+d), tam + k*(tam+d), tam+ j*(tam+d)));
      }
    }
  }
}


//================================================

void draw() {
  background(255);

  println(amp.analyze());
  
  // smooth the rms data by smoothing factor
  sum += (amp.analyze() - sum) * smooth_factor;  

  // amp.analyze() return a value between 0 and 1. It's
  // scaled to height/2 and then multiplied by a scale factor
  float ampScale=sum*(height/2)*sumScale;


 if ((amp.analyze() >=  0.0000 )&&( amp.analyze() <  0.06)){

  /**Face Baixo**/
  myCubes.get(0).moveB(ampScale);
  myCubes.get(1).moveB(ampScale);
  myCubes.get(2).moveB(ampScale);
  myCubes.get(9).moveB(ampScale);
  myCubes.get(10).moveB(ampScale);
  myCubes.get(11).moveB(ampScale);
  myCubes.get(18).moveB(ampScale);
  myCubes.get(19).moveB(ampScale);
  myCubes.get(20).moveB(ampScale);
  /**--ENd Face Baixo--**/

 }else if ((amp.analyze() >= 0.06) &&(amp.analyze() <0.09)) {
  /**Face Meio**/
  myCubes.get(3).moveM(ampScale);
  myCubes.get(4).moveM(ampScale);
  myCubes.get(5).moveM(ampScale);
  myCubes.get(12).moveM(ampScale);
  myCubes.get(13).moveM(ampScale);
  myCubes.get(14).moveM(ampScale);
  myCubes.get(21).moveM(ampScale);
  myCubes.get(22).moveM(ampScale);
  myCubes.get(23).moveM(ampScale);
  /**--ENd Face Meio--**/
 }else if ((amp.analyze() >=0.09) && (amp.analyze()<=0.15)) {
   
  /**Face Cima**/
  myCubes.get(6).moveC(ampScale);
  myCubes.get(7).moveC(ampScale);
  myCubes.get(8).moveC(ampScale);
  myCubes.get(15).moveC(ampScale);
  myCubes.get(16).moveC(ampScale);
  myCubes.get(17).moveC(ampScale);
  myCubes.get(24).moveC(ampScale);
  myCubes.get(25).moveC(ampScale);
  myCubes.get(26).moveC(ampScale);
  /**--ENd Face Cima--**/
 }
  //centerX = map(mouseX, 0, width, width, 0);
  //centerY = map(mouseY, 0, height, height, 0);
  //camera( obsX, obsY, obsZ, centerX, centerY, 0, 0, 1, 0);
  camera(pX, pY, pZ, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0);


  //float orbitRadius= mouseX+550;
  //float ypos= (mouseY/2)*4;
  // float xpos= cos(radians(rotation))*orbitRadius;
  //float zpos= sin(radians(rotation))*orbitRadius;

  // camera(xpos, ypos, zpos, 0, 0, 0, 0, -1, 0);


  //Luz ambiente
  spotLight(255, 255, 255, 0, 0, 0, Hsize/2, 0, -1, PI, 0);

  //Luz da esfera R
  spotLight(r, 0, 0, (width/2), 0, 0, 0, 0, -1, PI, concentration);

  //Luz da esfera G
  spotLight(0, g, 0, 0, 0, (width/2), 0, 0, -1, PI, concentration);

  //Luz da esfera B
  spotLight(0, 0, b, 0, (width/2), 0, 0, 0, -1, PI, concentration);








  //translate(width/2,height/2);
  rotateX(-mouseY*PI/300);
  rotateY(-mouseX*PI/300);
  translate(-220, -220, -220);
  
  
  for (Cube myCube : myCubes) { 
    myCube.display();
  }


  //textureWrap (CLAMP); // SEM repetição
  
  // Desenha Cubos
  desenhaEixos();
  if (roda==true) {
    rotation++;
  }
}


void keyPressed() {  

  if (key == ' ') {
    if (roda ==false) {
      roda = true;
    } else {
      roda = false;
    }
  }

  if (keyCode == RIGHT) {
    ang = ang+0.5;
    pX = c*(cos(ang));
    pY = c*(sin(ang));
  }
  if (keyCode == LEFT) {
    ang = ang-0.5;
    pX = c*(cos(ang));
    pY = c*(sin(ang));
  }
  if (keyCode == UP) {
    pZ=pZ+50;
  }
  if (keyCode == DOWN) {
    pZ=pZ-50;
  }

  if ((key=='r') || (key=='R')) {
    if (r==0) {
      r= 255;
    } else if (r==255) {
      r=0;
    }
  }

  if ((key=='g') || (key=='G')) {
    if (g==0) {
      g= 255;
    } else if (g==255) {
      g= 0;
    }
  }
  if ((key=='b') || (key=='B')) {
    if (b==0) {
      b=255;
    } else if (b==255) {
      b=0;
    }
  }

  if (key=='+') {
    concentration=concentration-5;
  }
  if (key =='-') {
    concentration=concentration+5;
  }
  
  if ((key=='t') || (key=='T')) {
    img1 = img2;
    img2 = img3;
    img3 = img1;
  }
  
}

void desenhaEixos() {
  noFill();
  strokeWeight(5);
  stroke(255, 100, 100);
  line(0, 0, 0, 1500, 0, 0); //x
  stroke(125, 100, 100);
  line(0, 0, 0, 0, 1500, 0); //y
  stroke(2, 100, 100);
  line(0, 0, 0, 0, 0, 1500); //z
  noStroke();
}