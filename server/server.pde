import processing.net.*;
import java.util.Map;

// String IPADDRESS = "127.0.0.1";
String IPADDRESS = "192.168.3.28";
int PORT         = 5204;

Server server;

void setup() {
	size(200, 140);
	server = new Server(this, PORT, IPADDRESS);
}

// TODO: dont send real clients ids. Map them with server created other ids

void draw() {
	background(150);

    Client thisClient = server.available();
	
    // If the client is not null, and says something, display what it said
    if (thisClient !=null) {
        String rawMessage = thisClient.readString();
        if (rawMessage != null) {
            String[] messages = split(rawMessage, '|');
            
            for (String message : messages) {
                // TODO: validate message for it to be safely sent to clients

                if (!message.isEmpty()) {
                    println("Message ("+ (messages.length - 1) +") ["+ thisClient.ip() +"]: "+ message);
                    server.write(message +"|");
                }
            }

        } 
    } 

}