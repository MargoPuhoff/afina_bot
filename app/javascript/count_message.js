document.addEventListener('DOMContentLoaded', function() {
  // Получаю элементы со страницы
  let selectChats = document.getElementById('select_chats')
  let countTgMessage = document.getElementById('count_message')

  // Обработчик изменения select
  selectChats.addEventListener('change', function() {
    let idChat = selectChats.value
    let request = new XMLHttpRequest();

    request.open('GET', '/chats/' + idChat + '/count_tg_message', true)
    request.onload = function() {

      // Обновляю содержимое div с количеством сообщений
      if (request.status >= 200 && request.status < 400) {
        countTgMessage.textContent = request.responseText
      } else {
        console.error("Error message count: ", error)
      }
    };

    request.send()
  })
})