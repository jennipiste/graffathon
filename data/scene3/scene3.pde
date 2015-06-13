void setup()
{
    size(800, 600, P3D);
    //noStroke();
}

void draw()
{

    float time = (float)millis()/1000;
    background(255);
    rotateX(5);
    rotateY(5);
    translate(width/2,height/2);
    rotateZ(time);
    fill(0, 51, 102);

    //     background(0); 
    //     fill(0, 51, 102); 
    //     ambientLight(102, 102, 102);
    // lightSpecular(204, 204, 204);
    // directionalLight(102, 102, 102, 0, 0, -1);
    // specular(255, 255, 255);
    // translate(30, 50, 0);
    // shininess(1.0);
    // sphere(20);  // Left sphere
    // translate(40, 0, 0); 
    // shininess(5.0); 
    // sphere(20);  // Right sphere

    // DiamondStar n = new DiamondStar(0,0,0);
    // Many diamond stars :)
    for (int i=0; i<10;i++)
    {
        DiamondStar n = new DiamondStar(400*i ,0,0);
    }
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