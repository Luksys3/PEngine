class MObject {
    protected String _id;
    private Client _client;
    protected PVector _position;

    MObject(Client client, int x, int y) {
        _id = getSaltString();
        _client = client;
        _position = new PVector(x, y);

        // println("MObject init");
        // _client.write("OI:"+ _id +"|");
        // TODO: yra issue. Kai sukuria renderer nauja object
        //      tai constuctorius nusiunica serveriui OI kas 
        //      neturetu buti. Turi siust IO kai object yra
        //      ne shadow (yra sukurtas ne pagal server message)
    }

    void update() {}

    void setPosition(PVector position) {
        _position = position;
    }

    /*private*/ protected void send() {
        _client.write(
            "RN:"+
            _id +":"+
            "Player" +":"+
            int(_position.x) +":"+
            int(_position.y) +"|"
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