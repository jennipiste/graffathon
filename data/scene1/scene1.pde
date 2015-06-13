PShape p;

void setup()
{
    size(800, 600, P3D);
    //noStroke();
    p = loadShape("rapu.obj");
}

void draw()
{
    lights();
    float time = (float)millis()/1000;
    background(0);
    translate(width/2,height/2);
    rotateY(time*PI);
    shape(p, 100, 100);
    // fill(0, 51, 102);
    
    // Diamond a = new Diamond(0,0,0);
    // Diamond b = new Diamond(50,0,0);
    // Diamond c = new Diamond(-50,0,0);
    // Diamond b = new Diamond(10,20,30);


}
// shape(s, 10, 10, 80, 80);
class Diamond 
{
    float x, y, z;
    float size = 1;

    //Constructors
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