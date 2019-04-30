import java.util.Map;

class MRenderer {
    private Client _client;
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

        if (!_objects.containsKey(id)) {
            _objects.put(
                id,
                new MObject(_client, Math.round(position.x), Math.round(position.y))
            );
        }

        _objects.get(id).setPosition(position);

        // println("Client - "+ id);
        // println("  pos: "+ position.x +" "+ position.y);
        // println("");
    }
}