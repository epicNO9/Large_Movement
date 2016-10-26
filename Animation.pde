int q =0;
int v = 0;
boolean needsReset = true;
int secs;
void playerAnimation() {
    if (v <= getRandomSecs()) 
        q = 1;
    else if (v <= getRandomSecs()+2)
        q = 2;
    else if (v <= getRandomSecs()+4)
        q = 3;
    else if (v <= getRandomSecs()+6)
        q = 4;
    else if (v <= getRandomSecs()+8)
        q = 2;
    else if (v <= getRandomSecs()+10)
        q = 1;
    else {
        needsReset = true;
        v =0;
    }
    if (!zoom)
        image(head_image[q], 0, 0, 100, 100);
    else
        image(head_image[q], 150, 0, 100, 100);
    v++;
    println(v);
    println(secs);
}

int getRandomSecs() {
    if (needsReset) {
        needsReset = false;
        secs = (int) (random(200, 600));
        return secs;
    } else
        return secs;
}