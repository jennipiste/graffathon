import moonlander.library.*;

// Minim must be imported when using Moonlander with soundtrack.
import ddf.minim.*;

Moonlander moonlander;

//=====================GLOBALS COS ITS FUN========================================

// Camera start values float
float camPosX = 400;
float camPosY = 400;
float camPosZ = 400;
float camCentX = 0;
float camCentY = 0;
float camCentZ = 0;

// FLAGS(fags)
int scene_3_subscene = 1;

// Diamond distances
float diamond_dist;
float d_dist = 50;

//======================END OF GLOBALS COS ITS FUN================================
void setup()
{
    size(800, 600, P3D);
    //noStroke();
    // noFill();
    moonlander = Moonlander.initWithSoundtrack(this, "../music/deepspace.mp3", 127, 8);
    moonlander.start();
}

void draw()
{
    moonlander.update();
    // Every loop
    lights();
    background(0);

    println("(",camPosX,",",camPosY,",",camPosZ,")");

    fill(105);

    scene_3_subscene = moonlander.getIntValue("scene_3_subscene");


    if(scene_3_subscene==1)
    {
        scene_3_subscene1();
    }
    else if(scene_3_subscene==2)
    {
        diamond_dist = d_dist*abs(sin((float)millis()/1000*PI));
        scene_3_subscene1();
    }
    else if(scene_3_subscene==3)
    {
        scene_3_subscene3();
    }
    else if (scene_3_subscene==4)
    {
        scene_3_subscene4();
    }
    else if (scene_3_subscene==5)
    {
        scene_3_subscene5();
    }
    else if (scene_3_subscene==6) {
        scene_3_subscene6();
    }
}

void scene_3_subscene1()
{

    float time = (float)millis()/1000;

    beginCamera();
    camera(camPosX, camPosY, camPosZ, camCentX, camCentY, camCentZ, 0, 1, 0);
    endCamera();

    DiamondStar n = new DiamondStar(0,0,0);
    moveCamera(100.0, -400.0, 100.0, 0.0, 0.0, 0.0, 0, 1, 0, 50.0);
}

void scene_3_subscene3()
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

void scene_3_subscene4()
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

void scene_3_subscene5()
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

void scene_3_subscene6() {
    d_dist = 1000;
    diamond_dist = d_dist*abs(sin((float)millis()/1000*PI));
}

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
        noStroke();
        directionalLight(204, 204, 204, .5, 0, -1);
        emissive(0, 26, 51);
        translate(x,y,z);
        // Diamond 1
        pushMatrix();
        rotateY((float)millis()/100);
        Diamond d1 = new Diamond(0,(100+diamond_dist),0);
        popMatrix();

        // Diamond 2
        pushMatrix();
        rotateY(-(float)millis()/100);
        Diamond d2 = new Diamond(0,-(100+diamond_dist),0);
        popMatrix();

        rotateZ(PI/2);

        // Diamond 3
        pushMatrix();
        rotateY((float)millis()/100);
        Diamond d3 = new Diamond(0,(100+diamond_dist),0);
        popMatrix();

        // Diamond 4
        pushMatrix();
        rotateY((float)millis()/100);
        Diamond d4 = new Diamond(0,-(100+diamond_dist),0);
        popMatrix();

        rotateX(PI/2);

        // Diamond 5
        pushMatrix();
        rotateY((float)millis()/100);
        Diamond d5 = new Diamond(0,(100+diamond_dist),0);
        popMatrix();

        // Diamond 6
        pushMatrix();
        rotateY((float)millis()/100);
        Diamond d6 = new Diamond(0,-(100+diamond_dist),0);
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
