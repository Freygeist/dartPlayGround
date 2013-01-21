import 'dart:html';
import './mapView.dart';
import './hero.dart';


MapView mv = new MapView();

void main() {
  CanvasElement canvas = query("#canvas");
  var context = canvas.context2d;
  mv.drawMap(context);
  
  document.window.on.keyDown.add(onKeyDown, true);
  canvas.on.mouseOut.add((e) => onMouseOut(e, context), true);
  canvas.on.mouseMove.add((e) => onMouseMove(e, context), true);
  canvas.on.mouseOver.add((e) => onMouseOver(e, context), true);
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
 * on mouse over event handler
 * 
 */
void onMouseOver(event, context) {
  print(event.target);
  
  event.target.style.color = "orange";
}

/**
 * 
 * on mouse out event handler
 * 
 */
void onMouseOut(event, context) {
  
  mv.drawMap(context);
  
}

/**
 * 
 * on mouse move event handler
 * 
 */
void onKeyDown(event) {
  switch(event.keyCode) {
    
    case 38:
      print('up!');
      break;
      
    case 40:
      print('down!');
      break;
      
    case 37:
      print('left!');
      break;
      
    case 39:
      print('right!');
      break;
      
    default:
      print('${event.keyCode}');
      break;
  }
}


