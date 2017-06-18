class Cube {
  float x;
  float y;
  float z;
  float scale;

  public Cube (  float x, float y, float z){
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
      
      fill(200,200,200); 
     
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
}