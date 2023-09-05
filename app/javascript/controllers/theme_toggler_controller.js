import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme-toggler"
export default class extends Controller {
  static targets = ['themeChoice'];

  connect() {
    console.log('Dark Theme Controller ACtive');
    console.log(this.themeChoiceTarget.innerText);
    // if (this.themeChoiceTarget.innerText === 'dark') {
    //   document.body.classList.add('dark-theme');
    //   document.body.classList.remove('light-theme');
    // }

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
