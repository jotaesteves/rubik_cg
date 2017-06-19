
import processing.sound.*;
Amplitude amp;
SoundFile musica;

float counterMeio=0;

float speedBaixo=10;
float ampScale=1;
float speedMeio=5;

float smooth_factor=0.55;
float sum;
float sumScale=2;
float ampln;
int index;

ArrayList<Cube> myCubes = new ArrayList<Cube>();

int tam = 100;
int d = 15;

boolean roda = true;
boolean spot = true;
boolean camera = false;

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
PImage img1, img2, img3;



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

  musica = new SoundFile (this, "sample1.mp3");
  musica.play();

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

  ampln = amp.analyze(); 

  // suaviza o amp
  sum += (amp.analyze()-sum) * smooth_factor;  

  float ampScale=sum*(height/2)*sumScale;
  println(ampScale);

  float ampDiv = ampln*100;
  println("new:"+ampDiv);

  if ((ampScale >=  0 )&&(ampScale <  100)) {


    /**Face Baixo**/
    myCubes.get(0).moveB(ampScale/ampDiv);
    myCubes.get(1).moveB(ampScale/11);
    myCubes.get(2).moveB(ampScale/13);
    myCubes.get(9).moveB(ampScale/ampDiv);
    myCubes.get(10).moveB(ampScale/12);
    myCubes.get(11).moveB(ampScale/ampDiv);
    myCubes.get(18).moveB(ampScale/14);
    myCubes.get(19).moveB(ampScale/ampDiv);
    myCubes.get(20).moveB(ampScale/10);
    /**--ENd Face Baixo--**/
  } else if ((ampScale >= 100) &&(ampScale <150)) {
    /**Face Meio**/
    myCubes.get(3).moveM(ampDiv*2);
    myCubes.get(4).moveM(ampDiv);
    myCubes.get(5).moveM(ampDiv*3);
    myCubes.get(12).moveM(ampDiv);
    myCubes.get(13).moveM(ampDiv-(ampDiv/2));
    myCubes.get(14).moveM(ampDiv);
    myCubes.get(21).moveM(ampDiv);
    myCubes.get(22).moveM(ampDiv*2);
    myCubes.get(23).moveM(ampDiv);
    /**--ENd Face Meio--**/
  } else if ((ampScale >=150) && (ampScale<=400)) {

    /**Face Cima**/
    myCubes.get(6).moveC(ampScale/2);
    myCubes.get(7).moveC(ampScale/3);
    myCubes.get(8).moveC(ampScale);
    myCubes.get(15).moveC(ampScale/2);
    myCubes.get(16).moveC(ampScale/3);
    myCubes.get(17).moveC(ampScale);
    myCubes.get(24).moveC(ampScale/5);
    myCubes.get(25).moveC(ampScale/8);
    myCubes.get(26).moveC(ampScale/10);
    /**--ENd Face Cima--**/
  }
  //centerX = map(mouseX, 0, width, width, 0);
  //centerY = map(mouseY, 0, height, height, 0);
  //camera( obsX, obsY, obsZ, centerX, centerY, 0, 0, 1, 0);
  


  //float orbitRadius= mouseX+550;
  //float ypos= (mouseY/2)*4;
  // float xpos= cos(radians(rotation))*orbitRadius;
  //float zpos= sin(radians(rotation))*orbitRadius;

  // camera(xpos, ypos, zpos, 0, 0, 0, 0, -1, 0);


  //Luz ambiente
  if(spot==true){
  spotLight(255, 255, 255, 0, 0, 0, Hsize/2, 0, -1, PI, 0);
  } else{
  ambientLight(200, 200, 200);
  }
  //Luz da esfera R
  spotLight(r, 0, 0, (width), 0, 0, 0, 0, -1, PI, concentration);
  //Luz da esfera G
  spotLight(0, g, 0, 0, 0, (width), 0, 0, -1, PI, concentration);
  //Luz da esfera B
  spotLight(0, 0, b, 0, (width), 0, 0, 0, -1, PI, concentration);
  
  spotLight(255, 142, 62, 500, 100, 200, 0, 0, -1, PI, concentration);
  spotLight(0,150,250, (-width),0,0,  0,0,-1,  PI, concentration);
  spotLight(250,150,0, 0,0,(-width),  0,0,-1,  PI, concentration);



if(camera ==false){
  //translate(width/2,height/2);
  rotateX(-mouseY*PI/300);
  rotateY(-mouseX*PI/300);
  translate(-220, -220, -220);
}else{
 camera(pX, pY, pZ, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0);
}

  for (Cube myCube : myCubes) { 
    myCube.display();
  }


  //textureWrap (CLAMP); // SEM repetição

  // Desenha Cubos
  //desenhaEixos();
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
  
  if((key=='s') || (key=='S')){
    if(spot == true)
    spot =false;
    else
    spot =true;
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

if ((key=='c') || (key=='C')){
   if(camera == true)
    camera =false;
    else
    camera =true;
}

  if (keyCode == ENTER) {
    if (index > 0) {
      index --;
      myCubes.remove(index);
    }
    //for (int i = 0; i < 3; i++) {
    //  for (int k = 0; k < 3; k++) {
    //    for (int j = 0; j < 3; j++) {
    //      myCubes.add(new Cube( tam + i*(tam+d), tam + k*(tam+d), tam+ j*(tam+d)));
    //    }
    //  }
    //}
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