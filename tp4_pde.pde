//https://youtu.be/opr55LUUYjs
//Manuel Garmendia
//Tomas Coppola

Juego juego;

void setup () {
  size(600, 400);
  juego=new Juego();
}
void draw() {
  ActualizarPantalla (juego.pantallaActual);
juego.draw();
}
void keyPressed () {
 
  juego.teclado();
}
