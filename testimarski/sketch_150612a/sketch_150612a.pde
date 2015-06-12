Mbox b1, b2;

void setup() {
  size(640, 360, P3D);
  //noStroke();
  
  b1 = new Mbox(0, 0, 0, 45);
  b2 = new Mbox(50, 50, 0, 20);
}


void draw() {
  lights();
  background(200, 150, 50);
  
  float cameraY = height / 2.0;
  float fov = (19.8+(sin((float)millis()/1000))/4);
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  if (mousePressed) {
    aspect = aspect / 2.0;
  }
  
  perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  translate(width/2+30, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/3 + mouseY/float(height) * PI);
  
  b2.translate_(b2.getPosX()+sin((float)millis()/1000), b2.getPosY()+cos((float)millis()/1000), 0);
  //b1.translate_(b2.getPosX()+sin(millis()/100), b2.getPosY()+cos(millis()/100), 0);
  
  b1.display();
  b2.display();
}

class Mbox {
  float xpos;
  float ypos;
  float zpos;
  float size;
  
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
  
  void move (float posX, float posY, float damping) {
    float dif = ypos - posY;
    if (abs(dif) > 1) {
      ypos -= dif/damping;
    }
    dif = xpos - posX;
    if (abs(dif) > 1) {
      xpos -= dif/damping;
    }
  }
  
  void translate_(float x, float y, float z) {
    xpos = x;
    ypos = y;
    zpos = z;
  }
  
  void display() {
    translate(xpos, ypos, zpos);
    box(size);
  }
}
