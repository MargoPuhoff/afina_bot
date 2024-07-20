document.addEventListener('turbo:load', function() {
  // Получаю элементы со страницы
  let selectChats = document.getElementById('select_chats')
  let noSelect = document.getElementById('no_selection')
  let analyticInfo = document.getElementById('analytic_info')
  let countTgMessage = document.getElementById('count_message')
  let activeUsers = document.getElementById('active_users')
  let SelectDate = document.getElementById('select_date')
  let PartialMonthMessage = document.getElementById('partial_month_message')
  let hideWorkerInput = document.getElementById('hide_worker')
  let customDateRange = document.getElementById('custom_date_range')
  let startDateInput = document.getElementById('start_date')
  let endDateInput = document.getElementById('end_date')

  function changeAnalytics() {
    // Получаю значения из option и checkbox
    let idChat = selectChats.value
    let period = SelectDate.value
    let excludeWorker = hideWorkerInput.checked
    let startDate = startDateInput.value
    let endDate = endDateInput.value

    noSelect.classList.add('hidden')
    analyticInfo.classList.remove('hidden')

    let url = `/chats/${idChat}/count_tg_message.json?period=${period}&exclude_worker=${excludeWorker}`
    if (period === 'another_period') {
      url += `&start_date=${startDate}&end_date=${endDate}`
    }

    let request = new XMLHttpRequest();
    request.open('GET', url, true)

    request.onload = function() {
      // Обновляю содержимое div с количеством сообщений и пользователями
      if (request.status >= 200 && request.status < 400) {
        const data = JSON.parse(request.responseText)
        console.log(data)
        if (period === 'year_period') {
          countTgMessage.innerHTML = '';
          for (const [month, count] of Object.entries(data.count_per_month)) {
            let monthElement = document.getElementById(`count_${month.toLowerCase()}`);
            if (monthElement) {
              monthElement.textContent = count;
            }
          }
          PartialMonthMessage.classList.remove('hidden')
        } else {
          PartialMonthMessage.classList.add('hidden')
          countTgMessage.textContent = data.count_tg_message
        }

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
        console.error("Error message count: ", request.statusText);
        console.error("Response: ", request.responseText);
      }
    };
    request.send();
  }
   SelectDate.addEventListener('change', function() {
    if (SelectDate.value === 'another_period') {
      customDateRange.classList.remove('hidden')
    } else {
      customDateRange.classList.add('hidden')
    }
    changeAnalytics()
   })

  // Обработчик изменения select
  selectChats.addEventListener('change', changeAnalytics);
  hideWorkerInput.addEventListener('change', changeAnalytics);
  startDateInput.addEventListener('change', changeAnalytics);
  endDateInput.addEventListener('change', changeAnalytics);
})