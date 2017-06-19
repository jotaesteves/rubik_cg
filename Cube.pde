class Cube {
  float x;
  float y;
  float z;
  float scale;
  float cc=0;
  float speed;

  public Cube (  float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.scale = tam/2;
  }



  void display() {
    stroke(255);
    strokeWeight(.07); 

    pushMatrix();
    translate(x, y, z);
    scale(scale);

    fill(200, 200, 200); 

    beginShape(QUADS);
    // +Z "front" face
    texture(img1);
    vertex(-1, -1, 1, 0, 0);
    vertex( 1, -1, 1, 1, 0);
    vertex( 1, 1, 1, 1, 1);
    vertex(-1, 1, 1, 0, 1);
    endShape();



    beginShape(QUADS);
    // -Z "back" face
    texture(img1);
    vertex( 1, -1, -1, 0, 0);
    vertex(-1, -1, -1, 1, 0);
    vertex(-1, 1, -1, 1, 1);
    vertex( 1, 1, -1, 0, 1);
    endShape();


    beginShape(QUADS);
    // +Y "bottom" face
    texture(img2);
    vertex(-1, 1, 1, 0, 0);
    vertex( 1, 1, 1, 1, 0);
    vertex( 1, 1, -1, 1, 1);
    vertex(-1, 1, -1, 0, 1);
    endShape();


    beginShape(QUADS);
    // -Y "top" face
    texture(img2);
    vertex(-1, -1, -1, 0, 0);
    vertex( 1, -1, -1, 1, 0);
    vertex( 1, -1, 1, 1, 1);
    vertex(-1, -1, 1, 0, 1);
    endShape();


    beginShape(QUADS);
    // +X "right" face
    texture(img3);
    vertex( 1, -1, 1, 0, 0);
    vertex( 1, -1, -1, 1, 0);
    vertex( 1, 1, -1, 1, 1);
    vertex( 1, 1, 1, 0, 1);
    endShape();


    beginShape(QUADS);
    // -X "left" face
    texture(img3);
    vertex(-1, -1, -1, 0, 0);
    vertex(-1, -1, 1, 1, 0);
    vertex(-1, 1, 1, 1, 1);
    vertex(-1, 1, -1, 0, 1);
    endShape();

    popMatrix();
  }


  void display2(float scale1) {
    stroke(255);
    strokeWeight(.07); 

    pushMatrix();
    translate(x, y, z);
    scale(scale1);

    fill(200, 200, 200); 

    beginShape(QUADS);
    // +Z "front" face
    vertex(-1, -1, 1, 0, 0);
    vertex( 1, -1, 1, 1, 0);
    vertex( 1, 1, 1, 1, 1);
    vertex(-1, 1, 1, 0, 1);
    endShape();



    beginShape(QUADS);
    // -Z "back" face
    vertex( 1, -1, -1, 0, 0);
    vertex(-1, -1, -1, 1, 0);
    vertex(-1, 1, -1, 1, 1);
    vertex( 1, 1, -1, 0, 1);
    endShape();


    beginShape(QUADS);
    // +Y "bottom" face
    vertex(-1, 1, 1, 0, 0);
    vertex( 1, 1, 1, 1, 0);
    vertex( 1, 1, -1, 1, 1);
    vertex(-1, 1, -1, 0, 1);
    endShape();


    beginShape(QUADS);
    // -Y "top" face
    vertex(-1, -1, -1, 0, 0);
    vertex( 1, -1, -1, 1, 0);
    vertex( 1, -1, 1, 1, 1);
    vertex(-1, -1, 1, 0, 1);
    endShape();


    beginShape(QUADS);
    // +X "right" face
    vertex( 1, -1, 1, 0, 0);
    vertex( 1, -1, -1, 1, 0);
    vertex( 1, 1, -1, 1, 1);
    vertex( 1, 1, 1, 0, 1);
    endShape();


    beginShape(QUADS);
    // -X "left" face
    vertex(-1, -1, -1, 0, 0);
    vertex(-1, -1, 1, 1, 0);
    vertex(-1, 1, 1, 1, 1);
    vertex(-1, 1, -1, 0, 1);
    endShape();

    popMatrix();
  }

  void moveB(float speed) {
    this.speed=speed;
    if (y<90) {
      cc++;
    } else {
      cc--;
    }

    if (cc>=0 && cc<10) {
      y+=speed;
    } else {
      y-=speed;
    }
  }

  void moveM(float speed) {
    this.speed=speed;
    
    x+=speed;
  }

  void moveC(float speed) {
    this.speed=speed;
    
    y+=speed;
  }
}