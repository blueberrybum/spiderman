import spacebrew.*;


String typedText = "";
String server= "sandbox.spacebrew.cc";
String name="My Milkshakes";
String description ="";
PFont font;
String definition = "";
JSONObject json;


Spacebrew sb;


void setup() {
  size(500, 500);


  sb = new Spacebrew( this );
  sb.addPublish ("alexInput", "definitions", "");
  sb.connect(server, name, description);
  font = createFont("Helvetica", 18);
  json = loadJSONObject("new.json");
}

void draw() {
  background(255);
JSONObject id = json.getJSONObject("id");
String definition = id.getString("definition");
String word = id.getString("word");

  fill(255, 0, 0);
  textFont(font, 18);
  text(typedText+(frameCount/10 % 2 == 0 ? "_" : ""), 35, 45);
  id.setString(definition, "");
  id.setString(word, "");
      sb.send( "alexInput", "definitions", typedText);
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

    }
  }
}

void onStringMessage( String name, String value ) {
  println(value);
}

void onCustomMessage( String name, String type, String value ) {
}

