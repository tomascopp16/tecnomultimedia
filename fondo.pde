void ActualizarPantalla (int NPantalla) {
  if (NPantalla==0) { 
    background(255);
  image(juego.Imagenes[0], 0, 0, 600, 400);
  
  fill(255);
  textSize(13);
    text("PRESIONA LA TECLA ENTER PARA PATEAR Usá izquierda - arriba - derecha para apuntar",10,30);
   //image(Imagenes[1], , Y, 100, 200);
  } if (NPantalla==2){
  
  background(255);
      textSize(40);
        text("Pulsar ENTER para reiniciar el juego", 200,250);
  }
  }
