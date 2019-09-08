class PMessenger {
    private Client _client;
    private String _clientId = null; 
    private List<PMessage> _messages = new ArrayList<PMessage>();

    PMessenger(Client client) {
        _client = client;

        send("CI", new ArrayList<String>());
    }

    void update() {
        _messages = new ArrayList<PMessage>();
        if (_client.available() <= 0) {
            return;
        }
        
        String rawMessage = _client.readString();
        if (rawMessage == null) {
            return;
        }

        _messages = _decodeMessage(rawMessage);
        if (_clientId == null) {
            for (PMessage message : _messages) {
                if (Objects.equals(message.getType(), "CI")) {
                    _clientId = message.getData()[1];
                    println("_clientId: "+ _clientId);
                }
            }
        }
    }

    private List<PMessage> _decodeMessage(String rawMessage) {
        List<PMessage> messages = new ArrayList<PMessage>();
        for (String message : split(rawMessage, '|')) {
            if (!message.isEmpty()) {
                messages.add(new PMessage(message));
            }
        }
        return messages;
    }

    List<PMessage> getMessages() {
        return _messages;
    }

    void send(String type, List<String> params) {
        String paramsString = "";
        for (String param : params) {
            paramsString += ":"+ param;
        }

        // TODO: for some types don't send clientId. One of them: CI

        _client.write(
            type +":"+
            _clientId +
            paramsString +"|"
        );   
    }
}