class EventBus {
  final Map<String, List<Function>> _eventListeners = {};

  void on(String eventName, Function callback) {
    _eventListeners.putIfAbsent(eventName, () => []).add(callback);
  }

  void off(String eventName, [Function? callback]) {
    if (callback == null) {
      _eventListeners.remove(eventName);
    } else {
      _eventListeners[eventName]?.remove(callback);
    }
  }

  void emit(String eventName, [dynamic data]) {
    _eventListeners[eventName]?.forEach((callback) {
      callback(data);
    });
  }
}
