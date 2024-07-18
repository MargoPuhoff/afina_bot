document.addEventListener('DOMContentLoaded', function() {
  let modal = document.getElementById('editModal')
  let closeModal = document.getElementById('closeModal')

  document.addEventListener('ajax:success', function(event) {
    const [data, status, xhr] = event.detail;

    if (modal && xhr.responseURL.includes('edit')) {
      modal.innerHTML = xhr.response;
      modal.classList.remove('hidden');
    }

    if (xhr.responseURL.includes('update')) {
      window.location.reload();
    }
  });

  document.addEventListener('click', function(event) {
    if (event.target.classList.contains('edit-link')) {
      console.log('click click')
      event.preventDefault();
      const url = event.target.closest('a').href;

      fetch(url, {
        headers: {
          'X-Requested-With': 'XMLHttpRequest'
        }
      })
      .then(response => response.text())
      .then(html => {
        modal.innerHTML = html;
        modal.classList.remove('hidden');
      })
      .catch(error => console.error('Error loading form:', error));
    }
  });

  closeModal.addEventListener('click', function() {
    modal.classList.add('hidden');
  });
})