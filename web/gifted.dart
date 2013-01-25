import 'dart:html';
import './mapView.dart';
import './hero.dart';
import './Timer.dart';


MapView mv;
Hero hero = new Hero(45,45, 1);

Timer timer = new Timer();
var context;
var clockTick;


void main() {
  CanvasElement canvas = query("#canvas");
  context = canvas.context2d;

  mv = new MapView(context, hero);
  mv.drawMap(context);

  document.window.on.keyDown.add((e) => onKeyDown(e, context, clockTick), true);
  canvas.on.mouseMove.add((e) => onMouseMove(e, context), true);

  start();
}

void start(){
  window.requestAnimationFrame(loop);
}

void loop(num time){
  clockTick = timer.tick();

  //print(clockTick);

  //mv.paintHeroLeft(context, clockTick);

  window.requestAnimationFrame(loop);
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
void onKeyDown(event, context, clockTick) {
  switch(event.keyCode) {

    case 38:
      print('up!');
      hero.moveUp();
      break;

    case 40:
      print('down!');
      hero.moveDown();
      break;

    case 37:
      print('left!');
      hero.moveLeft();
      mv.paintHeroLeft(context, clockTick);
      break;

    case 39:
      print('right!');
      hero.moveRight();
      break;

    default:
      print('${event.keyCode}');
      break;
  }
}


