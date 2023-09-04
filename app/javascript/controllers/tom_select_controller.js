import { Controller } from "@hotwired/stimulus";
import * as tomSelect  from "tom-select";
// Connects to data-controller="tom-select"
export default class extends Controller {
  static values = { options: Object }
  connect() {
    console.log(this.element.id);
    if (this.element.id === "video_users") {
      this.select_users();
    }
    else {
      this.select_genres();
    }



  }

  select_users() {
    console.log(this.element.querySelectorAll('option'));
    new TomSelect(
      this.element, {
          plugins: {
            remove_button:{
              title:'Remove',
            },

            // clear_button:{
            //   title:'Remove all selected options',
            // }
          },

          valueField: 'id',
          placeholder: "Select",
          maxOptions: 5,
          highlight: true,
          // render: {
          //   option: function(data, escape) {
          //     return '<div>' +

          //         // '<span class="title">' + data.value + '</span>' +
          //       '</div>';
          //   },
          // },
          onChange:function() {
            update();
          }
        }
      );
  }

  select_genres() {
    new TomSelect(
      this.element,

        {
          plugins: {
            remove_button:{
              title:'Remove',
            },

            // clear_button:{
            //   title:'Remove all selected options',
            // }
          },
          valueField: 'id',
          placeholder: "Select",
          maxOptions: 5,
      }

      );
  }

  update() {

    const members = this.element.querySelectorAll(".item").length
    const membersData = this.element.querySelectorAll(".item")

    console.log(members);
    this.formTarget.innerHTML= '';
    let roleHTML = '';
    for (let i=1;i<=members;i++) {
      let input = `<div class="mb-3 string optional video_casts"><label class="form-label string optional" for="video_casts">Role of ${membersData[i-1].innerText.slice(0, -2)}</label><input class="form-control string optional" type="text" name="video[casts${i}]" id="video_casts"></div>`;
      roleHTML += input;
    }
    this.formTarget.innerHTML = roleHTML
  }
}
