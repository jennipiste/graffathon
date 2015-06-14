// ======================ME WANT MORE GLOBALS PLS======================
Mbox[][] bTowers;
float camPosX, camPosY, camPosZ;
float camCentX, camCentY, camCentZ;
PImage happy, sad, demon, img;

//temp
float muuttuja = 0;

float boxsize=100;
float boxdist=40;
 // ====================== GLOBALS :DD ======================


void setup () {
  size(800, 600, P3D);
  //DEFAULT 
  happy = loadImage("happy.jpg");
  sad = loadImage("sad.jpg");
  demon = loadImage("demon.jpg");
  textureMode(IMAGE);
  
  Mbox[][] bTowers1 = new Mbox[8][]; // Array of box tower arrays
  for (int i = -4; i < 4; i++) {
    Mbox[] bG = makeBoxTower((float)random(90,110)*i,0,(float)random(600,700)*i);
    bTowers1[i+4] = bG; // Save to array
  }
  
  bTowers = bTowers1;
}

void draw() {

  // ======================SCENE VARIABLES======================

  lights();
  float time = (float)millis();

  // ===================================================


  // temp imgchanger for boxtower ======================
  if (millis()/1000 > muuttuja+4)
  {
    background(255,0,0);
    muuttuja = millis()/1000;
    img = demon;
  }
  else if (millis()/1000 > muuttuja+3)
  {
    background(255,0,0);
    // muuttuja = millis()/1000;
    img = demon;
  }
  else if ((millis()/1000)>=(muuttuja+2))
  {
    background(255);
    img = sad;
  }

  else if (millis()/1000>=muuttuja)
  {
    background(255);
    img = happy;
  }
  //======================================================

  
  if (time/1000 < 4) {
    beginCamera();
    camera(0, -100, 2000, 0, -500, -2000, 0, 1, 0);
    camPosX = 0; camPosY = -100; camPosZ = 2000; camCentX = 0; camCentY = -500; camCentZ = -2000;
    endCamera();
  }

  if (time/1000 > 35) {
    beginCamera();
    moveCamera(500, 0, -1500, 0, -200, 3000, 0, 1, 0, 100);
    endCamera();
  }
  else if (time/1000 > 30) {
    beginCamera();
    moveCamera(500, 0, -1500, 0, -200, -3000, 0, 1, 0, 100);
    endCamera();
  }
  
  else if (time/1000 > 25) {
    beginCamera();
    moveCamera(-500, 0, -1000, 0, -300, -2000, 0, 1, 0, 100);
    endCamera();
  }
  
  else if (time/1000 > 20) {
    beginCamera();
    moveCamera(500, 0, -500, 200, -500, -2000, 0, 1, 0, 100);
    endCamera();
  }
  
  else if (time/1000 > 15) {
    beginCamera();
    moveCamera(-500, 0, 200, -200, -500, -2000, 0, 1, 0, 100);
    endCamera();
  }
  
  else if (time/1000 > 10) {
    beginCamera();
    moveCamera(500, 0, 800, 0, 0, -2000, 0, 1, 0, 100);
    endCamera();
  }
  
  else if (time/1000 > 7) {
    beginCamera();
    moveCamera(0, 0, 1200, 0, -500, -2000, 0, 1, 0, 100);
    endCamera();
  }
  
  else if (time/1000 > 5) {
    beginCamera();
    moveCamera(0, 0, 1500, 0, -500, -2000, 0, 1, 0, 100);
    endCamera();
  }
  
  
  
  
  for (int i = 0; i < bTowers.length; i++) {
    pushMatrix();
    for (int j = 0; j < bTowers[i].length; j++) {
      Mbox box = bTowers[i][j];
      box.translate_(box.getPosX()+(cos((float)millis()/1000*2*PI)), box.getPosY(), box.getPosZ()+sin((float)millis()/1000*2*PI));
      box.displayInMatrix();
    }
    popMatrix();
  }
  
}

Mbox[] makeBoxTower(float x, float y, float z) {
  Mbox b1 = new Mbox(x, y, z);
  Mbox b2 = new Mbox(0, -100-boxdist, 0);
  Mbox b3 = new Mbox(0, -100-boxdist, 0);
  Mbox b4 = new Mbox(0, -100-boxdist, 0);
  Mbox b5 = new Mbox(0, -100-boxdist, 0);
  Mbox[] array = {b1, b2, b3, b4, b5};
  return array;
}

// Move camera smoothly
void moveCamera (float posX, float posY, float posZ, float centerX, float centerY, float centerZ, float upX, float upY, float upZ, float damping) { // Move smoothly to a pos
    // Position
    float dif = camPosY - posY;
    if (abs(dif) > 1) {
      camPosY -= dif/damping;
    }
    dif = camPosX - posX;
    if (abs(dif) > 1) {
      camPosX -= dif/damping;
    }
    dif = camPosZ - posZ;
    if (abs(dif) > 1) {
      camPosZ -= dif/damping;
    }
    // View center
    dif = camCentY - centerY;
    if (abs(dif) > 1) {
      camCentY -= dif/damping;
    }
    dif = camCentX - centerX;
    if (abs(dif) > 1) {
      camCentX -= dif/damping;
    }
    dif = camCentZ - centerZ;
    if (abs(dif) > 1) {
      camCentZ -= dif/damping;
    }
    camera(camPosX, camPosY, camPosZ, camCentX, camCentY, camCentZ, upX, upY, upZ);
}
  

class Mbox { // Class of a box
  float xpos;
  float ypos;
  float zpos;
  float rot = 0; // Rotation
  
  Mbox(float posX, float posY, float posZ) {
    xpos = posX;
    ypos = posY;
    zpos = posZ;
  }
  
  float getPosX() {
    return xpos;
  }
  float getPosY() {
    return ypos;
  }
  float getPosZ() {
    return zpos;
  }
  
  void move (float posX, float posY, float posZ, float damping) { // Move smoothly to a pos
    float dif = ypos - posY;
    if (abs(dif) > 1) {
      ypos -= dif/damping;
    }
    dif = xpos - posX;
    if (abs(dif) > 1) {
      xpos -= dif/damping;
    }
    dif = zpos - posZ;
    if (abs(dif) > 1) {
      zpos -= dif/damping;
    }
  }
  
  void translate_(float x, float y, float z) { // Saves coordinates, doesn't draw
    xpos = x;
    ypos = y;
    zpos = z;
  }
  
  void rotate_(float angle) {
    rot = angle;
  }
  
  void display() { // Moves the box in an own matrix
    pushMatrix();
    translate(xpos, ypos, zpos);
    rotate(rot);
    TexturedCube();
    popMatrix();
  }
  void displayInMatrix() { // Moves the box in current matrix
    translate(xpos, ypos, zpos);
    rotate(rot);
    println("Im here :D img is:",img);
    TexturedCube();
  }
}



 // ======================TEXTURE BOX======================
void TexturedCube() {
  beginShape(QUADS);
  texture(img);

  // Given one texture and six faces, we can easily set up the uv coordinates
  // such that four of the faces tile "perfectly" along either u or v, but the other
  // two faces cannot be so aligned.  This code tiles "along" u, "around" the X/Z faces
  // and fudges the Y faces - the Y faces are arbitrarily aligned such that a
  // rotation along the X axis will put the "top" of either texture at the "top"
  // of the screen, but is not otherwised aligned with the X/Z faces. (This
  // just affects what type of symmetry is required if you need seamless
  // tiling all the way around the cube)
  
  // +Z "front" face
  vertex(-boxsize/2, -boxsize/2,  boxsize/2, 0, 0);
  vertex( boxsize/2, -boxsize/2,  boxsize/2, boxsize/2, 0);
  vertex( boxsize/2,  boxsize/2,  boxsize/2, boxsize/2, boxsize/2);
  vertex(-boxsize/2,  boxsize/2,  boxsize/2, 0, boxsize/2);

  // -Z "back" face
  vertex( boxsize/2, -boxsize/2, -boxsize/2, 0, 0);
  vertex(-boxsize/2, -boxsize/2, -boxsize/2, boxsize/2, 0);
  vertex(-boxsize/2,  boxsize/2, -boxsize/2, boxsize/2, boxsize/2);
  vertex( boxsize/2,  boxsize/2, -boxsize/2, 0, boxsize/2);

  // +Y "bottom" face
  vertex(-boxsize/2,  boxsize/2,  boxsize/2, 0, 0);
  vertex( boxsize/2,  boxsize/2,  boxsize/2, boxsize/2, 0);
  vertex( boxsize/2,  boxsize/2, -boxsize/2, boxsize/2, boxsize/2);
  vertex(-boxsize/2,  boxsize/2, -boxsize/2, 0, boxsize/2);

  // -Y "top" face
  vertex(-boxsize/2, -boxsize/2, -boxsize/2, 0, 0);
  vertex( boxsize/2, -boxsize/2, -boxsize/2, boxsize/2, 0);
  vertex( boxsize/2, -boxsize/2,  boxsize/2, boxsize/2, boxsize/2);
  vertex(-boxsize/2, -boxsize/2,  boxsize/2, 0, boxsize/2);

  // +X "right" face
  vertex( boxsize/2, -boxsize/2,  boxsize/2, 0, 0);
  vertex( boxsize/2, -boxsize/2, -boxsize/2, boxsize/2, 0);
  vertex( boxsize/2,  boxsize/2, -boxsize/2, boxsize/2, boxsize/2);
  vertex( boxsize/2,  boxsize/2,  boxsize/2, 0, boxsize/2);

  // -X "left" face
  vertex(-boxsize/2, -boxsize/2, -boxsize/2, 0, 0);
  vertex(-boxsize/2, -boxsize/2,  boxsize/2, boxsize/2, 0);
  vertex(-boxsize/2,  boxsize/2,  boxsize/2, boxsize/2, boxsize/2);
  vertex(-boxsize/2,  boxsize/2, -boxsize/2, 0, boxsize/2);

  endShape();
}
 // ===================================================================