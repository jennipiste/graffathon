import moonlander.library.*;

// Minim must be imported when using Moonlander with soundtrack.
import ddf.minim.*;

Moonlander moonlander;

Mbox[][] bTowers;
float camPosX, camPosY, camPosZ;
float camCentX, camCentY, camCentZ;
float scene_1_subscene = 1;

void setup () {
  size(800, 600, P3D);

  Mbox[][] bTowers1 = new Mbox[8][]; // Array of box tower arrays
  for (int i = -4; i < 4; i++) {
    Mbox[] bG = makeBoxTower((float)random(90,110)*i,0,(float)random(600,700)*i);
    bTowers1[i+4] = bG; // Save to array
  }

  bTowers = bTowers1;
  moonlander = Moonlander.initWithSoundtrack(this, "../../music/deepspace.mp3", 127, 8);
  moonlander.start();
}

void draw() {
  moonlander.update();
  lights();
  background(255);
  float time = (float)millis();
  int scene_1_subscene = moonlander.getIntValue("scene_1_subscene");

  if (scene_1_subscene == 1) {
    beginCamera();
    camera(0, -100, 2000, 0, -500, -2000, 0, 1, 0);
    camPosX = 0; camPosY = -100; camPosZ = 2000; camCentX = 0; camCentY = -500; camCentZ = -2000;
    endCamera();
  }

  if (scene_1_subscene == 9) {
    beginCamera();
    moveCamera(500, 0, -1500, 0, -200, 3000, 0, 1, 0, 100);
    endCamera();
  }
  else if (scene_1_subscene == 8) {
    beginCamera();
    moveCamera(500, 0, -1500, 0, -200, -3000, 0, 1, 0, 100);
    endCamera();
  }

  else if (scene_1_subscene == 7) {
    beginCamera();
    moveCamera(-500, 0, -1000, 0, -300, -2000, 0, 1, 0, 100);
    endCamera();
  }

  else if (scene_1_subscene == 6) {
    beginCamera();
    moveCamera(500, 0, -500, 200, -500, -2000, 0, 1, 0, 100);
    endCamera();
  }

  else if (scene_1_subscene == 5) {
    beginCamera();
    moveCamera(-500, 0, 200, -200, -500, -2000, 0, 1, 0, 100);
    endCamera();
  }

  else if (scene_1_subscene == 4) {
    beginCamera();
    moveCamera(500, 0, 800, 0, 0, -2000, 0, 1, 0, 100);
    endCamera();
  }

  else if (scene_1_subscene == 3) {
    beginCamera();
    moveCamera(0, 0, 1200, 0, -500, -2000, 0, 1, 0, 100);
    endCamera();
  }

  else if (scene_1_subscene == 2) {
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
  Mbox b1 = new Mbox(x, y, z, 45);
  Mbox b2 = new Mbox(0, -50, 0, 45);
  Mbox b3 = new Mbox(0, -50, 0, 45);
  Mbox b4 = new Mbox(0, -50, 0, 45);
  Mbox b5 = new Mbox(0, -50, 0, 45);
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
  float size;
  float rot = 0; // Rotation

  Mbox(float posX, float posY, float posZ, float sz) {
    xpos = posX;
    ypos = posY;
    zpos = posZ;
    size = sz;
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
    box(size);
    popMatrix();
  }
  void displayInMatrix() { // Moves the box in current matrix
    translate(xpos, ypos, zpos);
    rotate(rot);
    box(size);
  }
}
