int q =0;
int v = 0;
boolean needsReset = true;
int secs;
void playerAnimation() {
    if (v <= getRandomSecs()) 
        q = 1;
    else if (v <= getRandomSecs()+3)
        q = 2;
    else if (v <= getRandomSecs()+6)
        q = 3;
    else if (v <= getRandomSecs()+9)
        q = 4;
    else if (v <= getRandomSecs()+12)
        q = 2;
    else if (v <= getRandomSecs()+15)
        q = 1;
    else {
        needsReset = true;
        v =0;
    }
    if(dead)
    	tint(0, 125, 255);
    if (!zoom)
        image(head_image[q], 0, 0, 100, 100);
    else
        image(head_image[q], 150, 0, 100, 100);
    v++;
}

int getRandomSecs() {
    if (needsReset) {
        needsReset = false;
        secs = (int) (random(200, 600));
        return secs;
    } else
        return secs;
}