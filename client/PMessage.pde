class PMessage {
    private String _type;
    private String _message;
    private String[] _data;

    PMessage(String message) {
        _message = message;

        _data = split(_message, ':');
        _type = _data[0];
    }

    String getType() {
        return _type;
    }

    String getMessage() {
        return _message;
    }

    String[] getData() {
        return _data;
    }
}