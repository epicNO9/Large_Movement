float eaten = .1;
void hunger() { //Could use optimization. Good for now. 
    rectMode(CENTER);
    noFill();
    stroke(255);
    rect(-transX + width/2, -transY + 25, 600, 25);
    rectMode(CORNER);
    noStroke();
    fill(red, green, blue);
    rect(-transX + width/2-299, -transY + 13, health, 24);
    rectMode(CENTER);
    health -= eaten;
    if (health < 0) {
        health = 0;
        dead = true;
        text("You died.", width/2, height/2);
    }
    if (health >= 550) {
        green = 255;
        red = 50;
        blue =128;
    } else if (health > 500) {
        green = 255;
        red = 100;
        blue = 128;
    } else if (health > 450) {
        green = 255;
        red = 150;
        blue = 128;
    } else if (health > 400) {
        green = 255;
        red = 200;
        blue = 128;
    } else if (health > 350) {
        green = 255;
        red = 255;
        blue = 128;
    } else if (health > 300) {
        green = 200;
        red = 255;
        blue = 128;
    } else if (health > 250) {
        green = 150;
        red = 255;
        blue = 128;
    } else if (health > 200) {
        green = 100;
        red = 255;
        blue = 128;
    } else if (health > 150) {
        green = 50;
        red = 255;
        blue = 128;
    } else if (health > 100) {
        green = 0;
        blue = 60;
        red = 255;
    } else {
        green = 0;
        blue = 0;
        red = 255;
    }
}