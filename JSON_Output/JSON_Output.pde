import spacebrew.*;


String typedText = "";
String server= "sandbox.spacebrew.cc";
String name="My Milkshakes";
String description ="";
PFont font;

Spacebrew sb;


void setup() {
  size(500, 500);


  sb = new Spacebrew( this );
  sb.addPublish ("alexInput", "string", "");
  sb.connect(server, name, description);
  font = createFont("Helvetica", 18);
}

void draw() {
  background(255);

  fill(255, 0, 0);
  textFont(font, 18);
  text(typedText+(frameCount/10 % 2 == 0 ? "_" : ""), 35, 45);
}

void keyReleased() {

  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      typedText = typedText.substring(0, max(0, typedText.length()-1));
      break;
    case TAB:
      typedText += "    ";
      break;
    case ENTER:
    case RETURN:
      // comment out the following two lines to disable line-breaks
      typedText += "\n";
      break;
    case ESC:
    case DELETE:
      break;
    default:
      typedText += key;
      println(typedText);
      sb.send( "alexInput", "string", typedText);
    }
  }
}

void onStringMessage( String name, String value ) {
  println(value);
}

void onCustomMessage( String name, String type, String value ) {
}

