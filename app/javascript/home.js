document.addEventListener('DOMContentLoaded', function() {
  // Переключатели radio
  let option1 = document.getElementById('option-1')
  let option2 = document.getElementById('option-2')

  // Изменяемые контент
  let analytics = document.getElementById('analytics')
  let settings = document.getElementById('settings')

  function updateContent() {
    if (option1.checked) {
        analytics.classList.remove('hidden')
        settings.classList.add('hidden')
    } else if (option2.checked) {
        analytics.classList.add('hidden')
        settings.classList.remove('hidden')
    }
  }

  updateContent()
  option1.addEventListener('change', updateContent)
  option2.addEventListener('change', updateContent)
})

