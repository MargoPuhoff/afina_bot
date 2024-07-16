document.addEventListener('DOMContentLoaded', function() {
  // Получаю элементы со страницы
  let selectChats = document.getElementById('select_chats')
  let noSelect = document.getElementById('no_selection')
  let analyticInfo = document.getElementById('analytic_info')
  let countTgMessage = document.getElementById('count_message')
  let activeUsers = document.getElementById('active_users')

  // Обработчик изменения select
  selectChats.addEventListener('change', function() {
    let idChat = selectChats.value
    noSelect.classList.add('hidden')
    analyticInfo.classList.remove('hidden')

    let request = new XMLHttpRequest();

    request.open('GET', '/chats/' + idChat + '/count_tg_message', true)
    request.onload = function() {

      // Обновляю содержимое div с количеством сообщений и пользователями
      if (request.status >= 200 && request.status < 400) {
        const data = JSON.parse(request.responseText)
        countTgMessage.textContent = data.count_tg_message

        activeUsers.innerHTML = ''
        data.users.forEach(user => {
          let divUser = document.createElement('div')
          let userName = document.createElement('p')
          let userCount = document.createElement('p')
          divUser.className = 'flex text-lg justify-between text-gray-600'

          userName.textContent = `${user.name}:`;
          userCount.textContent = `${user.message_count} сообщений`

          activeUsers.appendChild(divUser);
          divUser.appendChild(userName);
          divUser.appendChild(userCount);
        });
      } else {
        console.error("Error message count: ", error)
      }
    };

    request.send()
  })
})