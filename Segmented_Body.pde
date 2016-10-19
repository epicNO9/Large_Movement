Segment Seg0;
Segment Seg1;
Segment Seg2;
Segment Tail;
class Segment {
    PVector position;
    PVector velocity;
    int i = 0, j = 0, q = 0, x = 0;
    float [] blahX = new float [6];
    float [] blahY = new float [6];
    void followHead() {
        rect(Seg0.position.x, Seg0.position.y, 10, 10);
        Seg0.velocity.x = blahX[0];
        Seg0.velocity.y = blahY[0];
        Seg0.position.add(Seg0.velocity);
        blahX[5] = -Camera0.velocity.x;
        blahY[5] = -Camera0.velocity.y;
        spacing();
    }
    void follow1() {
        rect(Seg1.position.x, Seg1.position.y, 10, 10);
        Seg1.velocity.x = blahX[0];
        Seg1.velocity.y = blahY[0];
        Seg1.position.add(Seg1.velocity);
        blahX[5] = Seg0.velocity.x;
        blahY[5] = Seg0.velocity.y;
        spacing();
    }
    void follow2() {
        rect(Seg2.position.x, Seg2.position.y, 10, 10);
        Seg2.velocity.x = blahX[0];
        Seg2.velocity.y = blahY[0];
        Seg2.position.add(Seg2.velocity);
        blahX[5] = Seg1.velocity.x;
        blahY[5] = Seg1.velocity.y;
        spacing();
    }
    void follow3() {
        rect(Tail.position.x, Tail.position.y, 10, 10);
        Tail.velocity.x = blahX[0];
        Tail.velocity.y = blahY[0];
        Tail.position.add(Tail.velocity);
        blahX[5] = Seg2.velocity.x;
        blahY[5] = Seg2.velocity.y;
        spacing();
    }
    void spacing() {
        blahX[i] = blahX[i+1];
        blahY[i] = blahY[i+1];
        if (i < 4)
            i++;
        else
            i = 0;
    }
}