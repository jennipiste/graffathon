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
    shape(p, 0, 0, 0, 0);
    // sphere(59);
}
