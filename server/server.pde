import processing.net.*;
import java.util.Map;

Server server;
int val = 0;

void setup() {
	size(200, 140);
	//frameRate(5);
	server = new Server(this, 5204, "localhost");
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
            println("Message count: "+ (messages.length - 1));
            
            for (String message : messages) {
                // TODO: validate message for it to be safely sent to clients

                if (!message.isEmpty()) {
                    println("Client: "+ message);
                    server.write(message +"|");
                }
            }

        } 
    } 

}