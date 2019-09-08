class PEngine {
    private Client _client;
    private MRenderer _renderer;
    private PMessenger _messenger;

    PEngine(Client client, MRenderer renderer) {
        _client = client;
        _renderer = renderer;
        _messenger = new PMessenger(client);
    }

    void update() {
        _messenger.update();
        _executeMessages(_messenger.getMessages());

        _renderer.update();
    }

    private void _executeMessages(List<PMessage> messages) {
        for (PMessage message : messages) {
            println("message.getMessage(): "+message.getMessage());
            if (Objects.equals(message.getType(), "RN")) {
                _renderer.executeMessage(message);
            }
        }
        




        // TODO NEXT: ant servo padaryt kad nesiustu jo pacio message jam paciam
        //      Poto gal padaryt kad servas mapintu ids kitus
        //      Ant MObject send method padaryt kad naudotu PMessenger send method







        // if available ..... paskui jei kas callint rendere function jei kazka reiksi rendere
        // ir manua padaryt atskiras RN mesage kurios reiskia RENDER, kad tipo passint for renderer


        

        // List<PMessage> messages = _messenger.decodeMessage(rawMessage);
        // println("Messages:");
        // for (PMessage message : messages) {
        //     println("  "+ message.getMessage());
        //     if (Objects.equals(message.getType(), "CI")) {
        //         _clientId = message.getData()[1];
        //     } else if (Objects.equals(message.getType(), "RN")) {
        //         _renderer.executeMessage(message);
        //     }
        // }
        // println("");

        // String[] messages = split(rawMessage, '|');
        // for (String message : messages) {
        //     if (!message.isEmpty()) {
        //         _decodeMessage(message);
        //     }
        // }
    }
}