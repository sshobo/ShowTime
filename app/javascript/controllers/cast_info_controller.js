import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cast-info"
export default class extends Controller {
  static targets = ['form']
  connect() {
    console.log("Hi");
  }

  update() {

    const members = this.element.querySelectorAll(".item").length
    const membersData = this.element.querySelectorAll(".item")
    console.log(membersData[0].innerText);
    console.log(members);
    let roleHTML = '';
    for (let i=1;i<=members;i++) {
      let input = `<div class="mb-3 string optional video_casts"><label class="form-label string optional" for="video_casts">Cast Roles</label><input class="form-control string optional" type="text" name="video[casts${i}]" id="video_casts"></div>`;
      roleHTML += input;
    }
    this.formTarget.innerHTML = roleHTML
  }
}
