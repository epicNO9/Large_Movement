System cis, cis2, cis3, cis4, cis5;
class System {
    ArrayList<Particle> particles;
    PVector origin;
    color c;
    System(PVector position, color tempColor) {
        c = tempColor;
        origin = position.copy();
        particles = new ArrayList<Particle>();
    }
    void addParticle() {
        particles.add(new Particle(origin));
    }
    void run() {
        for (int i = particles.size()-1; i >= 0; i--) {
            Particle p = particles.get(i);
            fill(c);
            p.update();
            if (p.isDead()) {
                particles.remove(i);
            }
        }
    }
}
class Particle {
    PVector position;
    PVector velocity;
    float lifespan;
    float size;
    Particle(PVector v) {
        velocity = new PVector(random(-1, 1), random(-1, 1));
        position = v.copy();
        lifespan = 255;
    }

    void update() {
        position.add(velocity);
        if (zoom)
            lifespan-= 1.75;
        else
            lifespan -= 5;
        size = random(0, 4);
        ellipse(position.x, position.y, size, size);
    }
    boolean isDead() {
        if (lifespan < 0) {
            return true;
        } else
            return false;
    }
}

void runParticles() {
    if (!star1.isEaten) {
        cis.addParticle();
        cis.run();
    }
    if (!star2.isEaten) {
        cis2.addParticle();
        cis2.run();
    }
    if (!star3.isEaten) {
        cis3.addParticle();
        cis3.run();
    }
    if (!star4.isEaten) {
        cis4.addParticle();
        cis4.run();
    }
    //if (!star5.isEaten) {
    //    cis5.addParticle();
    //    cis5.run();
    //}
}