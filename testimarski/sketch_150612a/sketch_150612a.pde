Mbox[][] bGroups; // Create globally used valuables
Diamond d1;

void setup() {
  size(800, 600, P3D);
  //noStroke();

  Mbox[][] bGroups1 = new Mbox[20][]; // Array of box group arrays, size 20
  for (int i = -10; i < 10; i++) {
    Mbox[] bG = makeBoxGroup(0,0,(float)100*i);
    bGroups1[i+10] = bG; // Save to array
  }

  bGroups = bGroups1; // Save to global variable bGroups
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
  
  for (int j = 0; j < bGroups.length; j++) { // All box groups
    // Translation for circular movement: start position(big box center) + cos/sin of time * radius
  
    bGroups[j][1].translate_(bGroups[j][0].getPosX()+cos((float)millis()/1000) * 50, bGroups[j][0].getPosY()+sin((float)millis()/1000) * 50, bGroups[j][1].getPosZ());
    //b2.translate_(b2.getPosX()+sin((float)millis()/1000), b2.getPosY()+cos((float)millis()/1000), 0);
    bGroups[j][2].translate_(bGroups[j][0].getPosX()+cos((float)millis()/1000+PI) * 50, bGroups[j][0].getPosY()+sin((float)millis()/1000+PI) * 50, bGroups[j][2].getPosZ());
    bGroups[j][3].translate_(bGroups[j][0].getPosX()+cos((float)millis()/1000-HALF_PI) * 50, bGroups[j][0].getPosY()+sin((float)millis()/1000-HALF_PI) * 50, bGroups[j][3].getPosZ());
    bGroups[j][4].translate_(bGroups[j][0].getPosX()+cos((float)millis()/1000+HALF_PI) * 50, bGroups[j][0].getPosY()+sin((float)millis()/1000+HALF_PI) * 50, bGroups[j][4].getPosZ());
    bGroups[j][0].rotate_(PI*sin(time/1000));
    bGroups[j][1].rotate_(PI*sin(time/1000));
    bGroups[j][2].rotate_(PI*sin(time/1000));
    bGroups[j][3].rotate_(PI*sin(time/1000));
    bGroups[j][4].rotate_(PI*sin(time/1000));
    
    for (int i = 0; i < bGroups[j].length; i++) { // Display all boxes in the group
      bGroups[j][i].display();
    }
  }
  // Diamond
  d1.rotate_x(sin(time/100)/2);
  d1.make_shape(d1.size);
}

Mbox[] makeBoxGroup(float x, float y, float z) { // Move all boxes due to xyz
  Mbox b1 = new Mbox(0+x, 0+y, 0+z, 45);
  Mbox b2 = new Mbox(50+x, 0+y, 0+z, 20);
  Mbox b3 = new Mbox(-50+x, 0+y, 0+z, 20);
  Mbox b4 = new Mbox(0+x, 50+y, 0+z, 20);
  Mbox b5 = new Mbox(0+x, -50+y, 0+z, 20);
  Mbox[] array = {b1, b2, b3, b4, b5};
  return array;
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
  
  void move (float posX, float posY, float damping) { // Move smoothly to a pos
    float dif = ypos - posY;
    if (abs(dif) > 1) {
      ypos -= dif/damping;
    }
    dif = xpos - posX;
    if (abs(dif) > 1) {
      xpos -= dif/damping;
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
