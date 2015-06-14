
//IMPORTS
import moonlander.library.*;

// Minim must be imported when using Moonlander with soundtrack.
import ddf.minim.*;


//=====================GLOBALS COS ITS FUN========================================

Moonlander moonlander;

// Camera start values float
float camPosX = 0;
float camPosY = 0;
float camPosZ = 0;
float camCentX = 0;
float camCentY = 0;
float camCentZ = 0;

// MOONLANDER
int scene = 1;
int scene_1_subscene = 1;
int face = 1; //1 happy 2 sad 3 demon
int bg_clr_r = 0;
int bg_clr_g = 0;
int bg_clr_b = 0;
int scene_2_subscene = 1;
int pyoritin = 2;
// int diamClr = 0;

float time;

//SCENE1
Mbox[][] bTowers;
PImage happy, sad, demon, img;
float muuttuja = 0;
float boxsize=100;
float boxdist=40;

//SCENE2
// Stars parameters
int depth = 10;
int nbStarsMax = 10000;
Stars[] tabStars = new Stars[nbStarsMax];
int maxStarsSpeed = 6;
int taille = 1;
int transparency = 255;
int ptsW, ptsH;
PImage ball_image;
int numPointsW;
int numPointsH_2pi;
int numPointsH;
float[] coorX;
float[] coorY;
float[] coorZ;
float[] multXZ;
int red = 0;
float rotation = 0;

//SCENE3

//SCENE4

//SCENE5

//======================END OF GLOBALS COS ITS FUN================================
void setup()
{

    // For all
    size(1360, 768, P3D);

    // LOAD IMAGES
    happy = loadImage("happy.jpg");
    sad = loadImage("sad.jpg");
    demon = loadImage("demon.jpg");
    ball_image=loadImage("texture.jpg");
    textureMode(IMAGE);

    // BOX TOWER INIT WHY HERE?
    Mbox[][] bTowers1 = new Mbox[8][]; // Array of box tower arrays
    for (int i = -4; i < 4; i++)
    {
        Mbox[] bG = makeBoxTower((float)random(90,110)*i,0,(float)random(600,700)*i);
        bTowers1[i+4] = bG; // Save to array
    }
    bTowers = bTowers1;

    //SCENE2 SETUP
    colorMode(RGB,255);
    loop();
    strokeWeight(taille);
    ptsW=100;
    ptsH=100;
    initializeSphere(ptsW, ptsH);
    // Stars initialisation
    for(int nb=0; nb<nbStarsMax; nb++) {
        tabStars[nb] = new Stars(-random(depth*255),random(-6*height,6*height)
        ,random(-6*width,6*width),random(1,maxStarsSpeed));
    }

    //SCENE3 SETUP

    //SCENE4 SETUP

    //SCENE5 SETUP

    //MOONLANDER SETUP
    moonlander = Moonlander.initWithSoundtrack(this, "track.mp3", 120, 8);
    moonlander.start();
}

void draw()
{
    // ====================== MOONLANDER :DD ======================
    moonlander.update();
    scene = moonlander.getIntValue("scene");
    scene_1_subscene = moonlander.getIntValue("scene_1_subscene");
    face = moonlander.getIntValue("face");
    scene_2_subscene = moonlander.getIntValue("scene_2_subscene");

    // RGB values for background
    bg_clr_r = moonlander.getIntValue("bg_clr_r");
    bg_clr_g = moonlander.getIntValue("bg_clr_g");
    bg_clr_b = moonlander.getIntValue("bg_clr_b");

    pyoritin = moonlander.getIntValue("pyoritin");

     // ====================== ====== =============================

    // Every loop
    lights();
    background(bg_clr_r, bg_clr_g, bg_clr_b);
    time = (float)millis()/1000;

    // TEST PR
    //println("(",camPosX,",",camPosY,",",camPosZ,")");

    //fill(105);


    // Main scene selector(MOONLANDER)
    if(scene==1)
    {
        scene1();
    }
    if(scene==2)
    {
        scene2();
    }
    else if(scene==3)
    {
        scene3();
    }
    else if (scene==4)
    {
        scene4();
    }
    else if (scene==5)
    {
        scene5();
    }
}

void scene1()
{

    //================RUNNER FOR FACES=======================
    if (face == 1)
    {
        img = happy;
    }
    else if (face == 2)
    {
        img = sad;
    }
    else if (face == 3)
    {
        img = demon;
    }

    //======================================================

    if (scene_1_subscene == 1) {
        beginCamera();
        camera(0, -100, 3500, 0, -500, -2000, 0, 1, 0);
        camPosX = 0; camPosY = -100; camPosZ = 3500; camCentX = 0; camCentY = -500; camCentZ = -2000;
        endCamera();
    }

    else if (scene_1_subscene == 10)
    {
        beginCamera();
        moveCamera(-500, -1000, 0, 0, -200, 3000, 0, 1, 0, 600);
        endCamera();
    }

    else if (scene_1_subscene == 9)
    {
        beginCamera();
        moveCamera(500, 0, -1500, 0, -200, 3500, 0, 1, 0, 100);
        endCamera();
    }
    else if (scene_1_subscene == 8)
    {
        beginCamera();
        moveCamera(-500, 0, 0, 0, -200, -3000, 0, 1, 0, 10);
        endCamera();
    }

    else if (scene_1_subscene == 7)
    {
        beginCamera();
        moveCamera(-500, 0, -1000, 0, -300, -2000, 0, 1, 0, 10);
        endCamera();
    }

    else if (scene_1_subscene == 6)
    {
        beginCamera();
        moveCamera(500, 0, -500, 200, -500, -2000, 0, 1, 0, 10);
        endCamera();
    }

    else if (scene_1_subscene == 5)
    {
        beginCamera();
        moveCamera(-500, 0, 200, -200, -500, -2000, 0, 1, 0, 10);
        endCamera();
    }

    else if (scene_1_subscene == 4)
    {
        beginCamera();
        moveCamera(800, 0, -500, -50, 0, -2000, 0, 1, 0, 100);
        endCamera();
    }

    else if (scene_1_subscene == 3)
    {
        beginCamera();
        moveCamera(0, 0, 1200, 0, -500, -2000, 0, 1, 0, 100);
        endCamera();
    }

    else if (scene_1_subscene == 2)
    {
        beginCamera();
        moveCamera(0, 0, 1500, 0, -500, -2000, 0, 1, 0, 300);
        endCamera();
    }




    for (int i = 0; i < bTowers.length; i++) {
    pushMatrix();
    for (int j = 0; j < bTowers[i].length; j++) {
      Mbox box = bTowers[i][j];
      box.translate_(box.getPosX()+(cos((float)millis()/1000*pyoritin*PI)), box.getPosY(), box.getPosZ()+sin((float)millis()/1000*pyoritin*PI));
      box.displayInMatrix();
    }
    popMatrix();
    }


}

void scene2()
{
    background(0);
    //background stars
    for(int nb=0; nb<nbStarsMax; nb++) {
        tabStars[nb].aff();
        if (scene_2_subscene == 2) {
            tabStars[nb].anim();
        }
    }
    float scene2_time = 0;
    if (scene_2_subscene == 1) {
        camPosX = 1500;
        camPosY = 0;
        camPosZ = 0;
        camCentX = 0;
        camCentY = 0;
        camCentZ = 0;
        scene2_time = (float)millis()/1000;
    }
    noStroke();
    lights();
    pointLight(255, 0, 0, 800.0, 0.0, 0.0);
    fill(red, 0, 0);
    camera(camPosX, camPosY, camPosZ, camCentX, camCentY, camCentZ, 0, 1, 0);
    if (scene_2_subscene == 2) {
        // rotation = rotation + PI;
        moveCamera(800.0, 0.0, 0.0, 0.0, -1000.0, 0.0, 0, 1, 0, 50.0);
    }
    pushMatrix();
    if (scene_2_subscene >= 2) {
        rotate(time);
        red = int(255*abs(sin((float)millis()/1000)));
    }
    textureSphere(700, 700, 700, ball_image);
    // sphere(700);
    popMatrix();

    println("SUBSCENE: " + scene_2_subscene);
    println("ROTATION: "+ rotation);
    println("scene2_time: "+scene2_time);
    pushMatrix();
    if (scene_2_subscene >= 3) {

        moveCamera(800.0, -800.0, 0.0, 0.0, -1000.0, 0.0, 0, 1, 0, 20.0);
        // rotateX(5*sin(time*0.5));
        if (scene_2_subscene >= 13) {
            rotate(time);
            rotateY(time);
        }
        DiamondStar n = new DiamondStar(200,-1000,0);
    }
    if (scene_2_subscene >= 4) {
        pushMatrix();
            translate(0, 0, 100);
            rotateX(5*sin(time*0.5));
            DiamondStar n2 = new DiamondStar(400, -1000, 0);
        popMatrix();
        //rotateX(5*sin(time*0.5));
    }
    if (scene_2_subscene >= 5) {
        pushMatrix();
            translate(10, 0, -300);
            if (scene_2_subscene >= 13) {
                rotate(time);
                rotateY(time);
            }
            rotateX(5*sin(time*0.5));
            DiamondStar n3 = new DiamondStar(200, -1000, 0);
        popMatrix();
    }
    if (scene_2_subscene >= 6) {
        pushMatrix();
            translate(20, -100, 100);
            if (scene_2_subscene >= 13) {
                rotate(time);
                rotateZ(time);
            }
        DiamondStar n4 = new DiamondStar(-900, -1000, 0);
        popMatrix();
    }
    if (scene_2_subscene >= 7) {
        pushMatrix();
            translate(80, -50, -100);
            if (scene_2_subscene >= 13) {
                rotate(time);
                rotateX(time);
            }
            DiamondStar n5 = new DiamondStar(-900, -1000, 0);
        popMatrix();
    }
    if (scene_2_subscene >= 8) {
        pushMatrix();
            translate(0, 300, 200);
            if (scene_2_subscene >= 13) {
                rotate(time);
                rotateY(time);
            }
            DiamondStar n6 = new DiamondStar(-900, -1000, 0);
        popMatrix();
    }
    if (scene_2_subscene >= 9) {
        pushMatrix();
            translate(200, 100, -200);
            if (scene_2_subscene >= 13) {
                rotate(time);
                rotateZ(time);
            }
            DiamondStar n7 = new DiamondStar(-900, -1000, 0);
        popMatrix();
    }
    if (scene_2_subscene >= 10) {
        pushMatrix();
            translate(0, 100, -400);
            if (scene_2_subscene >= 13) {
                rotate(time);
                rotateZ(time);
            }
            DiamondStar n7 = new DiamondStar(-900, -1000, 0);
        popMatrix();
    }
    if (scene_2_subscene >= 11) {
        pushMatrix();
            translate(0, -400, 400);
            if (scene_2_subscene >= 13) {
                rotate(time);
                rotateZ(time);
            }
            DiamondStar n7 = new DiamondStar(-900, -1000, 0);
        popMatrix();
    }
    if (scene_2_subscene >= 12) {
        pushMatrix();
            translate(200, 50, -200);
            if (scene_2_subscene >= 13) {
                rotate(time);
                rotateZ(time);
            }
            DiamondStar n7 = new DiamondStar(-900, -1000, 0);
        popMatrix();
    }
    popMatrix();
}


void scene3()
{

    beginCamera();
    camera(camPosX, camPosY, camPosZ, camCentX, camCentY, camCentZ, 0, 1, 0);
    endCamera();

    DiamondStar n = new DiamondStar(0,0,0);
    moveCamera(100.0, -400.0, 100.0, 0.0, 0.0, 0.0, 0, 1, 0, 50.0);
}

void scene4()
{
    // Cam position
    camPosX = 0;
    camPosY = 500;
    camPosZ = 0;

    //Needed for every scene!
    beginCamera();
    camera(camPosX, camPosY, camPosZ, camCentX, camCentY, camCentZ, 0, 1, 0);
    endCamera();
    moveCamera(0, 0, 0, 0.0, 0.0, 0.0, 1, 0, 0, 5.0);

    pushMatrix();
    rotateY(millis()*PI/2000);
    DiamondStar n = new DiamondStar(0,0,0);
    popMatrix();
}

void scene5()
{
    // Cam position
    camPosX = 0;
    camPosY = 0;
    camPosZ = 0;
    camCentX = 0;
    camCentY = 0;
    camCentZ = 0;

    //Needed for every scene!
    beginCamera();
    camera(camPosX, camPosY, camPosZ, camCentX, camCentY, camCentZ, 0, 1, 0);
    endCamera();
    moveCamera(100.0, 400.0, 100.0, 0.0, 0.0, 0.0, 0, 1, 0, 5.0);
}

void scene6()
{
    // Cam position
    camPosX = 400;
    camPosY = 400;
    camPosZ = 400;

    //Needed for every scene!
    beginCamera();
    camera(camPosX, camPosY, camPosZ, camCentX, camCentY, camCentZ, 0, 1, 0);
    endCamera();

    DiamondStar n = new DiamondStar(0,200,0);
    rotateX(2*PI/3);
    DiamondStar n2 = new DiamondStar(0,200,0);
    rotateX(2*PI/3);
    DiamondStar n3 = new DiamondStar(0,200,0);
}

// ====================================================================================================================================================
// =================================CLASSES===================================================================================================
// ====================================================================================================================================================
// ====================================================================================================================================================
void initializeSphere(int numPtsW, int numPtsH_2pi) {

  // The number of points around the width and height
  numPointsW=numPtsW+1;
  numPointsH_2pi=numPtsH_2pi;  // How many actual pts around the sphere (not just from top to bottom)
  numPointsH=ceil((float)numPointsH_2pi/2)+1;  // How many pts from top to bottom (abs(....) b/c of the possibility of an odd numPointsH_2pi)

  coorX=new float[numPointsW];   // All the x-coor in a horizontal circle radius 1
  coorY=new float[numPointsH];   // All the y-coor in a vertical circle radius 1
  coorZ=new float[numPointsW];   // All the z-coor in a horizontal circle radius 1
  multXZ=new float[numPointsH];  // The radius of each horizontal circle (that you will multiply with coorX and coorZ)

  for (int i=0; i<numPointsW ;i++) {  // For all the points around the width
    float thetaW=i*2*PI/(numPointsW-1);
    coorX[i]=sin(thetaW);
    coorZ[i]=cos(thetaW);
  }

  for (int i=0; i<numPointsH; i++) {  // For all points from top to bottom
    if (int(numPointsH_2pi/2) != (float)numPointsH_2pi/2 && i==numPointsH-1) {  // If the numPointsH_2pi is odd and it is at the last pt
      float thetaH=(i-1)*2*PI/(numPointsH_2pi);
      coorY[i]=cos(PI+thetaH);
      multXZ[i]=0;
    }
    else {
      //The numPointsH_2pi and 2 below allows there to be a flat bottom if the numPointsH is odd
      float thetaH=i*2*PI/(numPointsH_2pi);

      //PI+ below makes the top always the point instead of the bottom.
      coorY[i]=cos(PI+thetaH);
      multXZ[i]=sin(thetaH);
    }
  }
}

void textureSphere(float rx, float ry, float rz, PImage t) {
  // These are so we can map certain parts of the image on to the shape
  float changeU=t.width/(float)(numPointsW-1);
  float changeV=t.height/(float)(numPointsH-1);
  float u=0;  // Width variable for the texture
  float v=0;  // Height variable for the texture

  beginShape(TRIANGLE_STRIP);
  texture(t);
  for (int i=0; i<(numPointsH-1); i++) {  // For all the rings but top and bottom
    // Goes into the array here instead of loop to save time
    float coory=coorY[i];
    float cooryPlus=coorY[i+1];

    float multxz=multXZ[i];
    float multxzPlus=multXZ[i+1];

    for (int j=0; j<numPointsW; j++) {  // For all the pts in the ring
      normal(coorX[j]*multxz, coory, coorZ[j]*multxz);
      vertex(coorX[j]*multxz*rx, coory*ry, coorZ[j]*multxz*rz, u, v);
      normal(coorX[j]*multxzPlus, cooryPlus, coorZ[j]*multxzPlus);
      vertex(coorX[j]*multxzPlus*rx, cooryPlus*ry, coorZ[j]*multxzPlus*rz, u, v+changeV);
      u+=changeU;
    }
    v+=changeV;
    u=0;
  }
  endShape();
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
    float size = 0.5;

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
    TexturedCube();
  }
}

// ====================================================================================================================================================
// ====================================================================================================================================================
// =================================HELPER FUNCTIONS===================================================================================================
// ====================================================================================================================================================

// Move camera smoothly
void moveCamera (float posX, float posY, float posZ, float centerX, float centerY, float centerZ, float upX, float upY, float upZ, float damping)
{
    // Move smoothly to a pos
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

 // ======================TEXTURED CUBE======================
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

Mbox[] makeBoxTower(float x, float y, float z) {
  Mbox b1 = new Mbox(x, y, z);
  Mbox b2 = new Mbox(0, -100-boxdist, 0);
  Mbox b3 = new Mbox(0, -100-boxdist, 0);
  Mbox b4 = new Mbox(0, -100-boxdist, 0);
  Mbox b5 = new Mbox(0, -100-boxdist, 0);
  Mbox[] array = {b1, b2, b3, b4, b5};
  return array;
}
// ====================================================================================================================================================
//========================================================================================================================================================
