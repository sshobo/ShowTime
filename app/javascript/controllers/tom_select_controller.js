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
          maxOptions: 5
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
}
