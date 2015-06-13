PShader plasma;

void setup()
{
    size(800,600,P3D);
    stroke(255);
    plasma=loadShader("plasma.glsl");
    
}

void draw()
{
    float time = (float)millis()/1000;
    fill(0);
    translate(width/2,height/2);
    rotateX(time*PI/2);
    sphere(300);
}