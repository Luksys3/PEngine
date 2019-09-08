import processing.net.*;
import java.util.Map;
import java.util.Objects;

String IPADDRESS = "127.0.0.1";
// String IPADDRESS = "192.168.3.28";
int PORT         = 5204;

Server server;
HashMap<String, Client> clients = new HashMap<String, Client>();

void setup() {
	size(200, 140);
	server = new Server(this, PORT, IPADDRESS);
}

// TODO: dont send real clients ids. Map them with server created other ids
void draw() {
	background(150);

    for (Map.Entry pair : clients.entrySet()) {
        // println(": "+ pair.getKey() +" - "+ clients.get(pair.getKey()).active());
        // if (!clients.get(pair.getKey()).active()) {
            
        // }
    }

    Client thisClient = server.available();
	
    // If the client is not null, and says something, display what it said
    if (thisClient != null) {

        String rawMessage = thisClient.readString();
        if (rawMessage != null) {
            String[] messages = split(rawMessage, '|');
            
            for (String message : messages) {
                // TODO: validate message for it to be safely sent to clients

                if (!message.isEmpty()) {
                    println("Message ("+ (messages.length - 1) +") ["+ thisClient.ip() +"]: "+ message);

                    String[] data = split(message, ':');
                    if (Objects.equals(data[0], "RN")) {
                        server.write(message +"|");

                        // for (Map.Entry pair : clients.entrySet()) {
                        //     println(data[1] +" - "+ pair.getKey());
                        //     if (Objects.equals(data[1], pair.getKey())) {
                        //         continue;
                        //     }

                        //     clients.get(pair.getKey()).write(message +"|");
                        // }
                    } else if (Objects.equals(data[0], "CI")) {
                        String id = getSaltString();
                        clients.put(id, thisClient);
                        thisClient.write("CI:"+ id +"|");
                    }
                }
            }

        } 
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