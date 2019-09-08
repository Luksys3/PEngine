import java.util.Map;

class MRenderer {
    protected Client _client;
    private HashMap<String, MObject> _objects = new HashMap<String, MObject>();

    MRenderer(Client client) {
        _client = client;
    }

    void update() {
        for (Map.Entry pair : _objects.entrySet()) {
            _objects.get(pair.getKey()).update();
        }
    }

    void executeMessage(PMessage message) {
        String[] data = message.getData();

        String id = data[1];
        String objectType = data[2];
        PVector position = new PVector(
            float(data[3]),
            float(data[4])
        );

        if (!_objects.containsKey(id)) {
            // new Player(_client, Math.round(position.x), Math.round(position.y))
            MObject newObject = createObject(objectType, Math.round(position.x), Math.round(position.y));
            if (Objects.equals(newObject, null)) {
                println("NOPE");
                return;
            }

            _objects.put(id, newObject);
        }

        _objects.get(id).setPosition(position);
    }

    protected MObject createObject(String type, int x, int y) {
        return null;
    }
}