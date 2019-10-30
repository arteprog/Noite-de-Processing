float angle;
String axiom = "F";
String sentence = axiom;
float len = 100;

String[] rule_a = {"F", "G", "T"};
String[] rule_b = {"FF+[+G-T-F]-[-F+G+FF]", "GGF+[+G--F]-[+GF++T]", "T"};

void generate() {
  len *= 0.53;
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

void turtle() {
  background(255);
  resetMatrix();
  translate(width / 2, height);
  stroke(10);
  fill(50);
  strokeWeight(1);
  for (int i = 0; i < sentence.length(); i++) {
    String current = str(sentence.charAt(i));
    if (current.equals("F")) {
      line(0, 0, 0, -len);
      translate(0, -len);
    } else if (current.equals("G")) {
      line(0, 0, 0, -len);
      translate(0, -len);
    } else if (current.equals("T")) {
      ellipse(0, 0, 3, 3);
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
  size (800, 800);
  angle = radians(random(10, 30));
  background(255);
  turtle();
  textSize(48);
  generate();
  generate();
  generate();
  generate();
}
