float angle;
String axiom = "F+G+G";
String sentence = axiom;
float len = 500;

String[] rule_a = {"F", "G"};
String[] rule_b = {"F+G-F-G+F", "GG"};

void generate(int n) {
  for (int c = 0; c < n; c++){
    len *= 0.50;
    String nextSentence = "";
    for (int i = 0; i < sentence.length(); i++) {
      String current = str(sentence.charAt(i));
      Boolean found = false;
      for (int j = 0; j < rule_a.length; j++) {
        if (current.equals(rule_a[j])) {
          found = true;
          nextSentence += rule_b[j];
          break;
        }
      }
      if (!found) {
        nextSentence += current;
      }
    }
    sentence = nextSentence;
    turtle();
  }
}

void turtle() {
  background(255);
  resetMatrix();
  translate(width - 100, height - 50);
  stroke(10);
  fill(50);
  strokeWeight(3);
  for (int i = 0; i < sentence.length(); i++) {
    String current = str(sentence.charAt(i));
    if (current.equals("F")) {
      line(0, 0, 0, -len);
      translate(0, -len);
     // ellipse(0, 0, 10, 10);
    } else if (current.equals("G")) {
      line(0, 0, 0, -len);
      translate(0, -len);
      
    } else if (current.equals("+")) {
      rotate(angle);
    } else if (current.equals("-")) {
      rotate(-angle);
    } else if (current.equals("[")) {
      pushMatrix();
    } else if (current.equals("]")) {
      popMatrix(); //<>//
    }

  }
}

void setup() {
  size (600, 600);
  angle = radians(-120);
  background(255);
  //turtle();
  textSize(48);
  generate(5);
  //saveFrame("pattern-6.png");
}
