document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('input[type="checkbox"][id^="change_status_"]').forEach(function(checkbox) {
    checkbox.addEventListener('change', function() {
      let tgChatId = this.dataset.id
      let newStatus = this.checked

      let request = new XMLHttpRequest();
      request.open('PATCH', `/tg_chats/${tgChatId}/change_status`, true);
      request.setRequestHeader('Content-Type', 'application/json');
      request.setRequestHeader('X-CSRF-Token', document.querySelector('meta[name="csrf-token"]').getAttribute('content'));

      request.onload = function() {
        if (request.status >= 200 && request.status < 400) {
          const data = JSON.parse(request.responseText);
        } else {
          console.error('Error:', request.statusText);
        }
      };

      request.send(JSON.stringify({ status: newStatus }));
    })
  })
})
