import java.util.Map;

class MRenderer {
    protected Client _client;
    private HashMap<String, MObject> _objects = new HashMap<String, MObject>();

    MRenderer(Client client) {
        _client = client;
    }

    void update() {
        if (_client.available() > 0) {
            String rawMessage = _client.readString();
            if (rawMessage != null) {
                String[] messages = split(rawMessage, '|');
                println("Message count: "+ (messages.length - 1));
                
                for (String message : messages) {
                    if (!message.isEmpty()) {
                        _decodeMessage(message);
                    }
                }
            }
        }

        for (Map.Entry pair : _objects.entrySet()) {
            _objects.get(pair.getKey()).update();
        }
    }

    private void _decodeMessage(String message) {
        println("Client - "+ message);

        String[] data = split(message, ':');
        String id = data[0];
        PVector position = new PVector(
            Float.parseFloat(data[1]),
            Float.parseFloat(data[2])
        );
        String type = data[3];

        if (!_objects.containsKey(id)) {
            // new Player(_client, Math.round(position.x), Math.round(position.y))
            MObject newObject = createObject(type, Math.round(position.x), Math.round(position.y));
            if (Objects.equals(newObject, null)) {
                println("NOPE");
                return;
            }

            _objects.put(id, newObject);
        }

        _objects.get(id).setPosition(position);

        // println("Client - "+ id);
        // println("  pos: "+ position.x +" "+ position.y);
        // println("");
    }

    protected MObject createObject(String type, int x, int y) {
        return null;
    }
}