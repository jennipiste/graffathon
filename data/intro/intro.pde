// PShape p;
// Camera start values float
float camPosX = 400;
float camPosY = 400;
float camPosZ = 400;
float camCentX = 0;
float camCentY = 0;
float camCentZ = 0;

// for moonlander
float ell_size = 10;

//intro opacity goes 100(seen)->1 in given time
float intro_opa = 1;

void setup()
{

    size(800, 600, P3D);
    background(0);
    // moveCamera(0,0,0,0,0,0,0,1,0,500);
    //noStroke();
    // p = loadShape("rapu.obj");
}

void draw()
{
    // beginCamera();
    // camera(0, -100, 3500, 0, -500, -2000, 0, 1, 0);
    // camPosX = 0; camPosY = -100; camPosZ = 3500; camCentX = 0; camCentY = -500; camCentZ = -2000;
    // endCamera();
    //background(0);
    lights();
    Rain();
    ending();
}

void rotatingLabel()
{

    pushMatrix();
    noStroke();
    fill (255,255,255,intro_opa);
    translate(width/2, height/2); // put 0,0,0 at the center of the screen
    text("Crabhics presents\nSpooky", 20, 20, 20);
    popMatrix();
}

void Rain()
{
    pushMatrix();
    noStroke();
    fill(0,10);
    rect(0 ,0, width, height);
    fill(255);
    ellipse(random(width), random(height), ell_size*3 , ell_size*3);
    popMatrix();
}
void ending()
{
    pushMatrix();
    noStroke();
    fill (255,255,255,intro_opa);
    translate(width/2, height/2); // put 0,0,0 at the center of the screen
    textSize(32);
    text("<-----Spooky------>\nMade by\n\nmarski\nbensku\nmeriloh1\n", 40, 40, 40);
    popMatrix();
}

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