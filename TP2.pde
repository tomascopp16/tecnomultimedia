//TRABAJO PRACTICO ILUSION OPTICA //

float altura;
float centro;
float escala;
float angulo;
float x;
float y;
float incremento;
void setup(){
 size(600,600);
 
 altura=30;
 centro=20;
 angulo=0;
 escala=10;
 background(0);
incremento=PI/150;
 
}


void draw(){
 

 noStroke();
  funcion2();
  funcion1();
  }
  
  
  void funcion1(){
  
  for(int i=0;i<50;i++)
{fill(random(125));
ellipse(x,y*i,mouseX,y);}
  }
  void funcion2(){
    
  angulo=angulo+incremento;
  x=x+1;
  y=altura+(cos(angulo)*escala);
  
  }
  
  void keyPressed(){
    background(0);
    size(600,600);
 
 altura=30;
 centro=20;
 angulo=0;
 escala=10;
incremento=PI/150;
x=0;
y=0;
}
