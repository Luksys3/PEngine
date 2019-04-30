class MObject {
    private String _id;
    private Client _client;
    private PVector _position;

    MObject(Client client, int x, int y) {
        _id = getSaltString();
        _client = client;
        _position = new PVector(x, y);

        // println("MObject init");
    }

    void update() {
        draw();
    }

    void keyPressed(char key) {
        switch (key) {
            case 'a':
                _position.x -= 10;
                break;
            
            case 'd':
                _position.x += 10;
                break;

            case 'w':
                _position.y -= 10;
                break;

            case 's':
                _position.y += 10;
                break;
            
            default:
                return;
        }

        send();
    }

    void setPosition(PVector position) {
        _position = position;
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

    private void send() {
        _client.write(_id +":"+ _position.x +":"+ _position.y +"|");
    }
}

import java.util.*; 
protected String getSaltString() {
    String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    StringBuilder salt = new StringBuilder();
    Random rnd = new Random();
    while (salt.length() < 16) { // length of the random string.
        int index = (int) (rnd.nextFloat() * SALTCHARS.length());
        salt.append(SALTCHARS.charAt(index));
    }
    String saltStr = salt.toString();
    return saltStr;

}