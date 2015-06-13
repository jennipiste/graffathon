Mbox b1, b2, b3, b4, b5; Diamond d1;

void setup() {
  size(640, 480, P3D);
  //noStroke();
  
  b1 = new Mbox(0, 0, 0, 45);
  b2 = new Mbox(50, 0, 0, 20);
  b3 = new Mbox(-50, 0, 0, 20);
  b4 = new Mbox(0, 50, 0, 20);
  b5 = new Mbox(0, -50, 0, 20);
  d1 = new Diamond(0, 0, 150);
}


void draw() {
  lights();
  background(200, 150, 50);
  float time = (float)millis();
  
  float cameraY = height / 2.0;
  float fov = 20;//(19.8+(sin((float)millis()/1000))/4);
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  
  perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  translate(width/2+30, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/3 + mouseY/float(height) * PI);
  
  b2.translate_(cos((float)millis()/1000) * 50, sin((float)millis()/1000) * 50, 0);
  //b2.translate_(b2.getPosX()+sin((float)millis()/1000), b2.getPosY()+cos((float)millis()/1000), 0);
  b3.translate_(cos((float)millis()/1000+PI) * 50, sin((float)millis()/1000+PI) * 50, 0);
  b4.translate_(cos((float)millis()/1000-HALF_PI) * 50, sin((float)millis()/1000-HALF_PI) * 50, 0);
  b5.translate_(cos((float)millis()/1000+HALF_PI) * 50, sin((float)millis()/1000+HALF_PI) * 50, 0);
  b1.rotate_(PI*sin(time/1000));
  b2.rotate_(PI*sin(time/1000));
  b3.rotate_(PI*sin(time/1000));
  b4.rotate_(PI*sin(time/1000));
  b5.rotate_(PI*sin(time/1000));
  d1.rotate_x(sin(time/1000));
  
  b1.display();
  b2.display();
  b3.display();
  b4.display();
  b5.display();
  d1.make_shape(d1.size);
}

class Mbox {
  float xpos;
  float ypos;
  float zpos;
  float size;
  float rot = 0;
  
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
  
  void rotate_(float angle) {
    rot = angle;
  }
  
  void display() {
    pushMatrix();
    translate(xpos, ypos, zpos);
    rotate(rot);
    box(size);
    popMatrix();
  }
}

/*
Diamond class

by default fills sides, to disable noFill(); give override parameter true
*/
class Diamond 
{
    float x, y, z;
    float size = 1;
    float rotX = 0;

    //Constructors
    Diamond(float xcoord, float ycoord, float zcoord)
    {
        x = xcoord;
        y = ycoord;
        z = zcoord;
        //translate( x, y, z);
        make_shape(size);
    }

    Diamond(float xcoord, float ycoord, float zcoord, int disableFill)
    {   
        x = xcoord;
        y = ycoord;
        z = zcoord;
        
        //translate( x, y, z);
        if(disableFill == 1)
        {
            noFill();
        }
        make_shape(size);
    }
    
    Diamond(float xcoord, float ycoord, float zcoord,int disableFill, float size)
    {   
        x = xcoord;
        y = ycoord;
        z = zcoord;

        //translate( x, y, z);
        if(disableFill == 1)
        {
            noFill();
        }
        make_shape(size);
    }
    
    void rotate_x(float angle) {
      rotX = angle;
    }


    void make_shape(float size)
    {
        pushMatrix();
        translate( x, y, z);
        rotateX(rotX);
        beginShape(TRIANGLES);
        float h = 200*size;
        float w = 50*size;
        //==================TOP PYRAMIDE=============================
        //Left
        vertex(0, -h/2, 0);
        vertex(-w/2, 0, -w/2);
        vertex(-w/2, 0, w/2);

        //back
        vertex(0, -h/2, 0);
        vertex(-w/2, 0, -w/2);
        vertex(w/2, 0, -w/2);

        //right
        vertex(0, -h/2, 0);
        vertex(-w/2, 0, w/2);
        vertex(w/2, 0, w/2);

        //front
        vertex(0, -h/2, 0);
        vertex(w/2, 0, w/2);
        vertex(w/2, 0, -w/2);
        //===========================================================


        //=======================BOTTOM PYRAMIDE=========================
        vertex(0, h/2, 0);
        vertex(-w/2, 0, -w/2);
        vertex(-w/2, 0, w/2);

        //back
        vertex(0, h/2, 0);
        vertex(-w/2, 0, -w/2);
        vertex(w/2, 0, -w/2);

        //right
        vertex(0, h/2, 0);
        vertex(-w/2, 0, w/2);
        vertex(w/2, 0, w/2);

        //front
        vertex(0, h/2, 0);
        vertex(-w/2, 0, w/2);
        vertex(w/2, 0, w/2);

        vertex(0, h/2, 0);
        vertex(w/2, 0, w/2);
        vertex(w/2, 0, -w/2);
        //===========================================================
        endShape();
        popMatrix();
    }
}
