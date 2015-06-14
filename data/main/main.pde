
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
// int diamClr = 0;




//SCENE1
Mbox[][] bTowers;
PImage happy, sad, demon, img;
float muuttuja = 0;
float boxsize=100;
float boxdist=40;

//SCENE2

//SCENE3

//SCENE4

//SCENE5

//======================END OF GLOBALS COS ITS FUN================================
void setup()
{

    // For all
    size(800, 600, P3D);

    // LOAD IMAGES
    happy = loadImage("happy.jpg");
    sad = loadImage("sad.jpg");
    demon = loadImage("demon.jpg");
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

    // RGB values for background
    bg_clr_r = moonlander.getIntValue("bg_clr_r");
    bg_clr_g = moonlander.getIntValue("bg_clr_g");
    bg_clr_b = moonlander.getIntValue("bg_clr_b");
     // ====================== ====== =============================


    // Every loop
    lights();
    background(bg_clr_r, bg_clr_g, bg_clr_b);

    // TEST PR
    //println("(",camPosX,",",camPosY,",",camPosZ,")");

    fill(105);


    // Main scene selector(MOONLANDER)
    if(scene==0)
    {
        scene0();
    }
    if(scene==1)
    {
        scene1();
    }
    else if(scene==2)
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

void scene0()
{
    loadCrab();
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
        camera(0, -100, 2000, 0, -500, -2000, 0, 1, 0);
        camPosX = 0; camPosY = -100; camPosZ = 2000; camCentX = 0; camCentY = -500; camCentZ = -2000;
        endCamera();
    }

    if (scene_1_subscene == 9) 
    {
        beginCamera();
        moveCamera(500, 0, -1500, 0, -200, 3000, 0, 1, 0, 10);
        endCamera();
    }
    else if (scene_1_subscene == 8) 
    {
        beginCamera();
        moveCamera(500, 0, -1500, 0, -200, -3000, 0, 1, 0, 10);
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
        moveCamera(500, 0, 800, 0, 0, -2000, 0, 1, 0, 10);
        endCamera();
    }

    else if (scene_1_subscene == 3) 
    {
        beginCamera();
        moveCamera(0, 0, 1200, 0, -500, -2000, 0, 1, 0, 10);
        endCamera();
    }

    else if (scene_1_subscene == 2) 
    {
        beginCamera();
        moveCamera(0, 0, 1500, 0, -500, -2000, 0, 1, 0, 10);
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


void scene2()
{

    float time = (float)millis()/1000;

    beginCamera();
    camera(camPosX, camPosY, camPosZ, camCentX, camCentY, camCentZ, 0, 1, 0);
    endCamera();

    DiamondStar n = new DiamondStar(0,0,0);
    moveCamera(100.0, -400.0, 100.0, 0.0, 0.0, 0.0, 0, 1, 0, 50.0);
}

void scene3()
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

void scene4()
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

void scene5()
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
class DiamondStar
{
    float x,y,z;
    float size = 1;

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
        Diamond d1 = new Diamond(0,100,0);
        popMatrix();

        // Diamond 2
        pushMatrix();
        rotateY(-(float)millis()/100);
        Diamond d2 = new Diamond(0,-100,0);
        popMatrix();
        
        rotateZ(PI/2);

        // Diamond 3  
        pushMatrix();
        rotateY((float)millis()/100);
        Diamond d3 = new Diamond(0,100,0);
        popMatrix();
        
        // Diamond 4
        pushMatrix();
        rotateY((float)millis()/100);
        Diamond d4 = new Diamond(0,-100,0);
        popMatrix();

        rotateX(PI/2);

        // Diamond 5
        pushMatrix();
        rotateY((float)millis()/100);
        Diamond d5 = new Diamond(0,100,0);
        popMatrix();

        // Diamond 6
        pushMatrix();
        rotateY((float)millis()/100); 
        Diamond d6 = new Diamond(0,-100,0);
        popMatrix();
        popMatrix();
    }
}

class Diamond 
{
    float x, y, z;
    float size = 1;

    //Constructors
    Diamond(int xcoord, int ycoord, int zcoord)
    {
        x = (float)xcoord;
        y = (float)ycoord;
        z = (float)zcoord;

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

void loadCrab()
{

    return;
}

// ====================================================================================================================================================
//========================================================================================================================================================