import 'dart:html';
import './mapView.dart';
import './hero.dart';


MapView mv = new MapView();
Hero hero = new Hero(3,3, 1);

void main() {
  CanvasElement canvas = query("#canvas");
  var context = canvas.context2d;
  mv.drawMap(context);
  mv.paintHero(context, hero);
  
  document.window.on.keyDown.add((e) => onKeyDown(e, context), true);
  canvas.on.mouseMove.add((e) => onMouseMove(e, context), true);
}

/**
 * 
 * on mouse move event handler
 * 
 */
void onMouseMove(event, context) {
  mv.drawHoverOnMouseOver(context, event.offsetX, event.offsetY);
}

/**
 * 
 * on mouse move event handler
 * 
 */
void onKeyDown(event, context) {
  switch(event.keyCode) {
    
    case 38:
      print('up!');
      hero.moveUp();
      mv.paintHero(context, hero);
      break;
      
    case 40:
      print('down!');
      hero.moveDown();
      mv.paintHero(context, hero);
      break;
      
    case 37:
      print('left!');
      hero.moveLeft();
      mv.paintHero(context, hero);
      break;
      
    case 39:
      print('right!');
      hero.moveRight();
      mv.paintHero(context, hero);
      break;
      
    default:
      print('${event.keyCode}');
      break;
  }
}


