Camera Camera0;
PImage[] head_image = new PImage[5];
Star star1, star2, star3, star4, star5, star6;
boolean stopper;
float diffX, diffY;
boolean mouseIsPressed, mouseOver, zoom, full, dead;
float transpar = 0;
float health = 599, red, green=255, blue=128;
float theta;
float headAngle = PI/2;
void setup() {
    size(720, 480);
    //fullScreen();
    frameRate(60);
    imageMode(CENTER);
    for (int i = 1; i < 5; i++) {
        String imageName = "frame" + i + ".gif";
        head_image[i] = loadImage(imageName);
    }
    star1 = new Star(width+100, height/2, #FFA000, "10 Trillion", false, false, ""); 
    star2 = new Star(width+100, -200, #FFC000, "Zero", false, true, "Uhh, this star has a poopy butthole"); 
    star3 = new Star(-200, height+100, #FFB000, "327", false, true, "");
    star4 = new Star(-1000, -150, #AFCFFF, "5 Quintillion", false, false, "");
    star5 = new Star(width+400, height+200, #C000FF, "10 Billion", true, false, "");
    Camera0 = new Camera();
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
    Seg0 = new Segment();
    Seg1 = new Segment();
    Seg2 = new Segment();
    Tail = new Segment();
    cis = new System(new PVector(width+100, height/2), #FFA000);
    cis2 = new System(new PVector(width+100, -200), #FFC000);
    cis3 = new System(new PVector(-200, height+100), #FFB000);
    cis4 = new System(new PVector(-1000, -150), #AFCFFF);
    cis5 = new System(new PVector(width+400, height+200), #C000FF);
}
void draw() {
    background(0);
    fill(255);
    translate(Camera0.position.x, Camera0.position.y);
    runParticles();
    createStars();
    hunger();
    playerDisplay();
    Camera0.moveCamera();
}

void mousePressed() {
    mouseIsPressed = true;
}
void mouseReleased() {
    mouseIsPressed = false;
    stopper = false;
}
class Camera {
    PVector position = new PVector(0, 0);
    PVector velocity = new PVector(0, 0);

    void moveCamera() {
        if (mouseIsPressed && !mouseOver && !zoom && !stopper && !dead) {
            diffX = mouseX - width/2;
            diffY = mouseY - height/2;
            Camera0.velocity.x = -diffX/100;
            Camera0.velocity.y = -diffY/100;
            headAngle = atan2(mouseY - height/2, mouseX - width/2);
            Seg0.blahY[5] = -Camera0.velocity.y;
        }
        Camera0.position.add(Camera0.velocity);
    }
}
class Star {
    float xPos, yPos, xSize =50, ySize = 50;
    color c;
    String number;
    boolean isEaten;
    boolean isBlackHole;
    boolean doesNeedNotes;
    String theNotes;
    Star(float tempxPos, float tempyPos, color tempColor, String tempNum, boolean tempBlack, boolean needsNotes, String notes) {
        xPos = tempxPos;
        yPos = tempyPos;
        c = tempColor;
        number = tempNum;
        isBlackHole = tempBlack;
        doesNeedNotes = needsNotes;
        theNotes = notes;
    }
    void create() {
            displayText();
            starShine();
            fill(c);
            noStroke();
            if (zoom) {
                fill(c);
                ellipse(xPos, yPos, xSize, ySize);
                theta += .1;
                if (transpar < 255) {
                    transpar+= 7.5;
                }
                if (xSize < 200) {
                    xSize += 4;
                    ySize += 4;
                } else {
                    full = true;
                }
                boxOver();
            } else {
                fill(c);
                ellipse(xPos, yPos, xSize, ySize);
            }
            starClick();
            if (mouseOver && mouseIsPressed) {
                zoom = true;
                Camera0.velocity.x = 0;
                Camera0.velocity.y = 0;
            }
    }




    void displayText() {
        fill(255, transpar);
        text(number, xPos-250, yPos-25);
        if (!isBlackHole)
            text("lifeforms depend on this star", xPos-250, yPos-10);
        else {
            text("lifeforms will be destroyed", xPos- 250, yPos-10);
            text("by this black hole", xPos-250, yPos+5);
        }
        if (doesNeedNotes) {
            text("Notes:", xPos-250, yPos+height/2-20);    
            textAlign(LEFT);
            text(theNotes, xPos-225, yPos+height/2-20);
            textAlign(CENTER);
        }
        text("Consume", xPos+ 250, yPos-50);
        text("Exit", xPos+ 250, yPos+50);
    }




    void starShine() {
        noStroke();
        if (!isBlackHole && zoom) {
            fill(c, random(20, 30));
            ellipse(xPos, yPos, xSize+45, ySize+45);
            fill(c, random(60, 70));
            ellipse(xPos, yPos, xSize+25, ySize+25);
            fill(c, random(90, 100));
            ellipse(xPos, yPos, xSize+10, ySize+10);
        } else if (!isBlackHole) {
            fill(c, random(20, 30));
            ellipse(xPos, yPos, xSize+45/4, ySize+45/4);
            fill(c, random(60, 70));
            ellipse(xPos, yPos, xSize+25/4, ySize+25/4);
            fill(c, random(90, 100));
            ellipse(xPos, yPos, xSize+2.5, ySize+2.5);
        }
    }




    void boxOver() {
        if (mouseX >  width/2 + 200 && mouseX <  width/2 + 290 && mouseY > height/2-50-10 && mouseY < height/2-50+10 && full && !dead) { //CONSUME
            noFill();
            stroke(255);
            rect(xPos+250, yPos-55, 70, 30);
            if (mouseIsPressed) {
                zoom = false;
                transpar = 0;
                stopper = true;
                full = false;
                resetStarSize();
                isEaten = true;
                if (!isBlackHole) {
                    eaten-= .01;
                } else {
                    eaten+= .02;
                }
            }
        }
        if (mouseX >  width/2 + 200 && mouseX <  width/2 + 290 && mouseY > height/2+50-10 && mouseY < height/2+50+10 && full && !dead) {
            noFill();
            stroke(255);
            rect(xPos+250, yPos+45, 40, 30);
            if (mouseIsPressed) {
                zoom = false;
                transpar = 0;
                resetStarSize();
                stopper = true;
                full = false;
            }
        }
    }



    void starClick() {
        if (mouseX > Camera0.position.x+xPos-30 && mouseX < Camera0.position.x+ xPos+30 && mouseY < Camera0.position.y+ yPos+ 30 && mouseY > Camera0.position.y+yPos -30) {
            mouseOver = true;
            if (!zoom) {
                noFill();
                stroke(255);
                ellipse(xPos, yPos, 90, 90);
            } else {
                Camera0.position.x = -xPos + width/2;
                Camera0.position.y = -yPos + height/2;
            }
        } else {
            mouseOver = false;
        }
    }
}




void createStars() {
    if(!star1.isEaten)
    star1.create();
    star2.create();
    star3.create();
    star4.create();
    star5.create();
}




void playerDisplay() {
    if (!zoom) {
        pushMatrix();
        translate(-Camera0.position.x + width/2, -Camera0.position.y + height/2);
        rotate(headAngle-PI/2);
        playerAnimation();
        popMatrix();
    } else {
        pushMatrix();
        translate(-Camera0.position.x+width/2, -Camera0.position.y+height/2);
        rotate(radians(theta));
        playerAnimation();
        popMatrix();
    }
}



void resetStarSize() {
    star1.xSize = 50;
    star1.ySize = 50;
    star2.xSize = 50;
    star2.ySize = 50;
    star3.xSize = 50;
    star3.ySize = 50;
    star4.xSize = 50;
    star4.ySize = 50;
    star5.xSize = 50;
    star5.ySize = 50;
}