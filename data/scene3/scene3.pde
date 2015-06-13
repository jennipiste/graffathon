

//=====================GLOBALS COS ITS FUN========================================

// Camera start values float
float camPosX = 400; 
float camPosY = 400; 
float camPosZ = 400;
float camCentX = 0; 
float camCentY = 0; 
float camCentZ = 0;

// FLAGS(fags)
int scene = 1;

//======================END OF GLOBALS COS ITS FUN================================
void setup()
{
    size(800, 600, P3D);
    //noStroke();
    // noFill();

}

void draw()
{
    // Every loop
    lights();
    background(0);

    println("(",camPosX,",",camPosY,",",camPosZ,")");


    if(millis()<7000)
    {
        scene1();
    }
    else if(millis()<14000)
    {
        scene2();
    }
    else if(millis()<20000)
    {
        scene3();
    }
}

void scene1()
{

    float time = (float)millis()/1000;

    beginCamera();
    camera(camPosX, camPosY, camPosZ, camCentX, camCentY, camCentZ, 0, 1, 0);
    endCamera();

    DiamondStar n = new DiamondStar(0,0,0);
    moveCamera(100.0, -400.0, 100.0, 0.0, 0.0, 0.0, 0, 1, 0, 50.0);
}

void scene2()
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

void scene3()
{
    // Cam position
    camPosX = 0;
    camPosY = 0;
    camPosZ = 0;
    
    //Needed for every scene!
    beginCamera();
    camera(camPosX, camPosY, camPosZ, camCentX, camCentY, camCentZ, 0, 1, 0);
    endCamera();
    moveCamera(100.0, 400.0, 100.0, 0.0, 0.0, 0.0, 0, 1, 0, 5.0);
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
  