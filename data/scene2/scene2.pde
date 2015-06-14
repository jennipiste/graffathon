// import moonlander.library.*;

// // Minim must be imported when using Moonlander with soundtrack.
// import ddf.minim.*;

// Moonlander moonlander;

// Stars parameters
int depth = 10;
int nbStarsMax = 10000;
Stars[] tabStars = new Stars[nbStarsMax];
int maxStarsSpeed = 6;

int taille = 1;
int transparency = 255;

float camPosX = 2500;
float camPosY = 0;
float camPosZ = 0;
float camCentX = 0;
float camCentY = 0;
float camCentZ = 0;
float rotation = 0;

void setup()
{
    size(800,600,P3D);
    stroke(255);
    // moonlander.start();

    colorMode(RGB,255);
    loop();
    strokeWeight(taille);
    //----------------------------------------------
    // Stars initialisation
    // -----------------------
    for(int nb=0; nb<nbStarsMax; nb++) {
        tabStars[nb] = new Stars(-random(depth*255),random(-6*height,6*height)
        ,random(-6*width,6*width),random(1,maxStarsSpeed));
    }

}

void draw()
{
    // moonlander.update();
    // int scene = moonlander.getIntValue("scene");

    background(0);
    //background stars
    for(int nb=0; nb<nbStarsMax; nb++) {
        tabStars[nb].aff();
        if (millis() > 4000) {
            tabStars[nb].anim();
        }
    }

    fill(0);
    float time = (float)millis()/1000;
    camera(camPosX, camPosY, camPosZ, camCentX, camCentY, camCentZ, 0, 1, 0);
    if (millis() > 4000) {
        rotation = time*PI/20;
        moveCamera(800.0, 0.0, 0.0, 0.0, -1000.0, 0.0, 0, 1, 0, 50.0);
    }
    pushMatrix();
    if (millis() > 4000) {
        rotateZ(time);
    }
    sphere(700);
    popMatrix();

    pushMatrix();
    if (millis() > 10000) {
        if (rotation > 3*PI/4) {
            rotation = 3*PI/4;
            moveCamera(800.0, -800.0, 0.0, 0.0, -1000.0, 0.0, 0, 1, 0, 50.0);
        }
        rotateZ(rotation);
    }
    if (millis() > 18000) {
        pushMatrix();
            translate(0, 0, 100);
            rotateX(5*sin(time*0.5));
            rotate(time);
            DiamondStar n2 = new DiamondStar(-810, 0, 0);
        popMatrix();
        pushMatrix();
            translate(0, 0, -100);
            rotate(time);
            rotateX(5*sin(time*0.5));
            DiamondStar n3 = new DiamondStar(-810, 0, 0);
        popMatrix();pushMatrix();
            translate(0, -100, 100);
            rotateX(5*sin(time*0.5));
            rotate(time);
            DiamondStar n4 = new DiamondStar(-810, 0, 0);
        popMatrix();
        pushMatrix();
            translate(0, -100, -100);
            rotate(time);
            rotateX(5*sin(time*0.5));
            DiamondStar n5 = new DiamondStar(-810, 0, 0);
        popMatrix();pushMatrix();
            translate(0, 0, 200);
            rotateX(5*sin(time*0.5));
            rotate(time);
            DiamondStar n6 = new DiamondStar(-810, 0, 0);
        popMatrix();
        pushMatrix();
            translate(0, 100, -200);
            rotate(time);
            rotateX(5*sin(time*0.5));
            DiamondStar n7 = new DiamondStar(-810, 0, 0);
        popMatrix();
        rotateX(5*sin(time*0.5));
    }
    DiamondStar n = new DiamondStar(-810,0,0);
    popMatrix();
}

class Stars {
  float x, y, z;
  float dX;

  Stars(float coordX, float coordY, float coordZ, float speedX) {
    x  = coordX;
    y  = coordY;
    z  = coordZ;
    dX = speedX;
  }

  void aff() {
    stroke(255,transparency);
    point(x,y,z);
  }

  void anim() {
    x = x + dX;
    if(x>=0)
      x = -1023.0;
  }
}

class DiamondStar
{
    float x,y,z;
    float size = 0.2;

    DiamondStar(int xcoord, int ycoord, int zcoord )
    {
        x = (float)xcoord;
        y = (float)ycoord;
        z = (float)zcoord;

        make_shape();

    }
    DiamondStar(float xcoord, float ycoord, float zcoord )
    {
        x = xcoord;
        y = ycoord;
        z = zcoord;
        make_shape();

    }
    void make_shape()
    {
        // Colour for diamond star def 255
        // fill(200); //uncomment
        pushMatrix();
        translate(x,y,z);
        // Diamond 1
        pushMatrix();
        rotateY((float)millis()/100);
        Diamond d1 = new Diamond(0,100*size,0, size);
        popMatrix();

        // Diamond 2
        pushMatrix();
        rotateY(-(float)millis()/100);
        Diamond d2 = new Diamond(0,-100*size,0, size);
        popMatrix();

        rotateZ(PI/2);

        // Diamond 3
        pushMatrix();
        rotateY((float)millis()/100);
        Diamond d3 = new Diamond(0,100*size,0, size);
        popMatrix();

        // Diamond 4
        pushMatrix();
        rotateY((float)millis()/100);
        Diamond d4 = new Diamond(0,-100*size,0, size);
        popMatrix();

        rotateX(PI/2);

        // Diamond 5
        pushMatrix();
        rotateY((float)millis()/100);
        Diamond d5 = new Diamond(0,100*size,0, size);
        popMatrix();

        // Diamond 6
        pushMatrix();
        rotateY((float)millis()/100);
        Diamond d6 = new Diamond(0,-100*size,0, size);
        popMatrix();
        popMatrix();
    }
}

class Diamond
{
    float x, y, z;
    float size = 1;

    //Constructors
    Diamond(float xcoord, float ycoord, float zcoord, float sizeIn)
    {
        x = xcoord;
        y = ycoord;
        z = zcoord;
        size = sizeIn;

        make_shape(size);
    }

    Diamond(float xcoord, float ycoord, float zcoord)
    {
        x = xcoord;
        y = ycoord;
        z = zcoord;

        make_shape(size);
    }

    Diamond(float xcoord, float ycoord, float zcoord, int disableFill)
    {
        x = xcoord;
        y = ycoord;
        z = zcoord;

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


        if(disableFill == 1)
        {
            noFill();
        }
        make_shape(size);
    }


    void make_shape(float size)
    {
        pushMatrix();
        translate( x, y, z);
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
