  
import processing.sound.*;
Amplitude amp;
SoundFile musica;

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
//PImage a,b,c,dd,e,f;



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




void setup() {
  frameRate(25);
  size(800, 600, P3D);

  //song 
  amp = new Amplitude(this);
  musica = new SoundFile (this,"sample1.mp3");
  musica.play();
  amp.input(musica);
  
  
  
  obsX= width/2.0;
  obsY= height/2.0;  
  obsZ= 700;  

  //cores dos focos de luz 
  r=0;
  g=0;
  b=0;


  



  //a= loadImage("AbnerEst/1.jpg");
  //b = loadImage("AbnerEst/2.jpg");
  //textureMode(NORMAL);

  //Cria valores para os cubos  
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      for (int k = 0; k < 3; k++) {
        myCubes.add(new Cube( tam + i*(tam+d), tam + j*(tam+d), tam+k*(tam+d)));
      }
    }
  }
}

//================================================

void draw() {
  background(255);

  println(amp.analyze());

  //centerX = map(mouseX, 0, width, width, 0);
  //centerY = map(mouseY, 0, height, height, 0);
  camera(pX, pY, pZ, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0);
  //camera( obsX, obsY, obsZ, centerX, centerY, 0, 0, 1, 0);

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




  // Desenha Cubos



  //translate(width/2,height/2);
  rotateX(-mouseY*PI/300);
  rotateY(-mouseX*PI/300);
  translate(-220, -220, -220);
  for (Cube myCube : myCubes) {
    myCube.display();
  }


  //textureWrap (CLAMP); // SEM repetição
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