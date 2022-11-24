

void ActualizarPantalla (int NPantalla) { 
  if (NPantalla==0) { 
    background(255);}
    if (NPantalla==1) { 
      background(255);
      image(juego.Imagenes[0], 0, 0, 600, 400);

      fill(255);
      textSize(13);
      fill(255);
      text("Mantener izquierda - derecha o arriba para apuntar ", 400, 25);
      text("Presiona ENTER para disparar",400,40);
      //image(Imagenes[1], , Y, 100, 200);
       text("Pulsa Flecha para abajo para ver creditos",280,380);
    } 
    if (NPantalla==2) {

      background(255);
      textSize(40);
      text("Pulsar ENTER para reiniciar el juego", 200, 250);
    }
  }
