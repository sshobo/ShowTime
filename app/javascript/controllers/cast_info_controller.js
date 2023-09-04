import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cast-info"
export default class extends Controller {
  static targets = ['form']
  connect() {
  }

  update() {

    const members = this.element.querySelectorAll(".item").length
    const membersData = this.element.querySelectorAll(".item")

    this.formTarget.innerHTML= '';
    let roleHTML = '';
    for (let i=1;i<=members;i++) {
      let input = `<div class="mb-3 string optional video_casts container align-items-center"><label class="form-label string optional" for="video_casts">Role of ${membersData[i-1].innerText.slice(0, -2)}</label><input class="form-control string optional " type="text" name="video[casts${i}]" id="video_casts"></div>`;
      roleHTML += input;
    }
    this.formTarget.innerHTML = roleHTML
  }
}
