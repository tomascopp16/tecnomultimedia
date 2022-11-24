
//https://youtu.be/BfRO55R7mR8 Video explicativo

//Manuel Garmendia
//Tomas Coppola

import processing.sound.*;
SoundFile musicafondo;


Juego juego;

void setup () {
  size(600, 400);
  juego=new Juego();
   musicafondo= new SoundFile(this, "musicafondo.mpeg");
  musicafondo.play();
 musicafondo .loop();
  
}
void draw() {
  print(juego.pantallaActual);
  ActualizarPantalla (juego.pantallaActual);
  juego.draw();
}
void keyPressed () {

  juego.teclado();
}
