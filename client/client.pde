import processing.net.*;

// Constants
String IPADDRESS = "127.0.0.1";
int PORT         = 5204;

Client client;

MObject object1;
MRenderer renderer;

void setup() {
    size(600, 560);
	frameRate(10);

    client = new Client(this, IPADDRESS, PORT);

    renderer = new MRenderer(client);
    object1 = new MObject(client, 200, 70);
}

void draw() {
    background(150);

    // object1.update();
    renderer.update();
    
    // if (client.available() > 0) {
    //     String dataIn = client.readString();
    //     println("Server: "+ dataIn);
    // }
}

void keyPressed() {
    object1.keyPressed(key);
}