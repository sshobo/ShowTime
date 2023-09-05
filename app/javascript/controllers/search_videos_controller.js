import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-videos"
export default class extends Controller {
  static targets = ["input", "videos", "users", "home"]

  update() {
    const query = this.inputTarget.value;
    const videos_url = `videos?query=${query}`
    const users_url = `users?query=${query}`
    if (query.trim() !== '') {
      this.homeTarget.style.display = 'none';
      fetch(videos_url, { headers: { "Accept": "text/plain" } })
        .then(response => response.text())
        .then((data) => {
            this.videosTarget.innerHTML = data
          })
      fetch(users_url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
          this.usersTarget.innerHTML = data
        })
      this.homeTarget.style.display = 'none';
    }
    else{
      this.videosTarget.innerHTML = '';
      this.usersTarget.innerHTML = '';
      this.homeTarget.style.display = '';
    }
  }
}
