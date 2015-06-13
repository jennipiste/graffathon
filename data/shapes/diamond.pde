"""
Diamond class

by default fills sides, to disable noFill(); give override parameter true
"""
class Diamond 
{
    float x, y, z;
    float size = 1;

    //Constructors
    Diamond(float x, float y, float z)
    {
        this.x = x;
        this.y = y;
        this.z = z;
        translate( this.x, this.y, this.z);
        make_shape(this.size)     
    }

    Diamond(float x, float y, float z,bool disableFill)
    {   
        this.x = x;
        this.y = y;
        this.z = z;
        
        translate( this.x, this.y, this.z);
        if(disableFill)
        {
            noFill();
        }
        make_shape(this.size)
    }
    
    Diamond(float x, float y, float z,bool disableFill, float size)
    {   
        this.x = x;
        this.y = y;
        this.z = z;
        
        translate( this.x, this.y, this.z);
        if(disableFill)
        {
            noFill();
        }
        make_shape(size)
    }


    void make_shape(size)
    {
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
    }
}