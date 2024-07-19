document.addEventListener('turbo:load', function() {
  // Переключатели radio
  let option1 = document.getElementById('option-1')
  let option2 = document.getElementById('option-2')

  // Изменяемые контент
  let analytics = document.getElementById('analytics')
  let settings = document.getElementById('settings')
  let selectedOption = localStorage.getItem('selectedOption')

  function updateContent() {
    if (option1.checked) {
        analytics.classList.remove('hidden')
        settings.classList.add('hidden')
        localStorage.setItem('selectedOption', 'option1')
    } else if (option2.checked) {
        analytics.classList.add('hidden')
        settings.classList.remove('hidden')
        localStorage.setItem('selectedOption', 'option2')
    }
  }

  if (selectedOption === 'option1') {
    option1.checked = true
  } else if (selectedOption === 'option2') {
    option2.checked = true
  }


  updateContent()
  option1.addEventListener('change', updateContent)
  option2.addEventListener('change', updateContent)
})

