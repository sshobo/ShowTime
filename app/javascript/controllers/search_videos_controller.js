import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-videos"
export default class extends Controller {
  static targets = ["form", "input", "list", "home"]

  update() {
    const query = this.inputTarget.value;
    const url = `${this.formTarget.action}?query=${query}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        console.log(this.homeTarget.innerHTML);
        if (query.trim() !== '') {
          this.listTarget.innerHTML = data
          this.homeTarget.style.display = 'none';
        }else{
          this.listTarget.innerHTML = ''
          this.homeTarget.style.display = '';
        }
      })
  }
}
