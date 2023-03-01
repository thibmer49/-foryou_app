import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startDate", "endDate" ]

  connect() {
    flatpickr(this.startDateTarget, {
      enableDate: true,

      // Provide an id for the plugin to work
      plugins: [new rangePlugin({ input: "#end_date"})]})
    flatpickr(this.endDateTarget, {})
    }
  }
