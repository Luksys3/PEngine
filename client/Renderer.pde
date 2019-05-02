import java.util.Map;

class Renderer extends MRenderer {
    Renderer(Client client) {
        super(client);
    }

    MObject createObject(String type, int x, int y) {
        if (Objects.equals(type, "Player")) {
            return new Player(_client, x, y);
        }

        println("Error: Undefined object type: "+ type);
        return null;
    }
}