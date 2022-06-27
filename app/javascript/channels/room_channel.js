import consumer from "channels/consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    this.appendLine(data.message)
  },

  appendLine(message) {
    const messages = document.getElementById("messages")

  }
});
