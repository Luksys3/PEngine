class Player extends MObject {
    PVector _force = new PVector(0, 0);

    Player(Client client, int x, int y) {
        super(client, x, y);
    }

    void update() {
        _position.x += _force.x * .1;
        _position.y += _force.y * .1;

        if (_force.x > 0) {
            _force.x -= 1;
        } else if (_force.x < 0) {
            _force.x += 1;
        }
        if (_force.y > 0) {
            _force.y -= 1;
        } else if (_force.y < 0) {
            _force.y += 1;
        }

        draw();
    }

    void keyPressed(char key) {
        int force = 50;

        switch (key) {
            case 'a':
                _force.x -= force;
                break;
            
            case 'd':
                _force.x += force;
                break;

            case 'w':
                _force.y -= force;
                break;

            case 's':
                _force.y += force;
                break;
            
            default:
                return;
        }

        send();
    }

    private void draw() {
        pushStyle();
        pushMatrix();

        strokeWeight(0);
        fill(200);
        translate(_position.x, _position.y);
        ellipse(-10, -10, 20, 20);

        popMatrix();
        popStyle();
    }
}