class MObject {
    protected String _id;
    private Client _client;
    protected PVector _position;

    MObject(Client client, int x, int y) {
        _id = getSaltString();
        _client = client;
        _position = new PVector(x, y);

        // println("MObject init");
    }

    void update() {}

    void setPosition(PVector position) {
        _position = position;
    }

    /*private*/ protected void send() {
        _client.write(
            _id +":"+
            _position.x +":"+
            _position.y +":"+
            "Player" +"|"
        );
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