import processing.net.*;

// String IPADDRESS = "127.0.0.1";
// String IPADDRESS = "192.168.3.28";
String IPADDRESS = "78.62.195.219";
int PORT         = 5204;

Client client;

Player player;
Renderer renderer;

void setup() {
    size(600, 560);

    client = new Client(this, IPADDRESS, PORT);

    renderer = new Renderer(client);
    player = new Player(client, 200, 70);
}

void draw() {
    background(150);

    player.update();
    renderer.update();
    
    // if (client.available() > 0) {
    //     String dataIn = client.readString();
    //     println("Server: "+ dataIn);
    // }
}

void keyPressed() {
    player.keyPressed(key);
}

// TODO:
// Server:
    // - Max objects when sends init
// Client:
    // - Padaryt kad visi messages turetu pirma argument
    // kaip message type, pvz ten objectData, exludeObject.
    // Esme kad kai nusiuncia object init message, tai server
    // atsiuncia tam clientui exlude object id pvz:
    // "EO:09PK4VUJLCZM5PIM|" ir dabar renderer exludins
    // object su id "09PK4VUJLCZM5PIM"