import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme-toggler"
export default class extends Controller {

  connect() {
    console.log('Dark Theme Controller ACtive');
  }

  toggleTheme() {
    // update the UI
    document.body.classList.toggle('dark-theme');
    document.body.classList.toggle('light-theme');

    // update the database
    fetch('/toggle-theme', {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
      },
    })
      .then(response => console.log('updated theme'))
      .catch(error => { console.log(error) })
  }
}
