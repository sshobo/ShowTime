import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-videos"
export default class extends Controller {
  static targets = ["form", "input", "list", "index"]
  constructor() {
    super(...arguments);

    // Initialize index with a default value of false
    this.index = "false";
  }
  update() {
    // Get the search query from the input field
    const query = this.inputTarget.value;

    // Set the index variable based on whether the query is not empty
    const index = query.trim() !== '';

    // Send the index variable along with the list variable
    const url = `/?query=${query}&index=${index}`;

    // Update the index attribute in the HTML
    this.indexTarget.setAttribute("data-search-videos-index-value", index.toString());

    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      });
  }
}
