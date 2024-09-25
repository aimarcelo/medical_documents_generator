// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import "./components";

import TomSelect from 'tom-select';

// Initialize Tom-select on the dropdown
document.addEventListener("turbo:load", function() {
  var patientDropdown = document.querySelector("patient-dropdown");
  if (patientDropdown) {
    new TomSelect(patientDropdown, {
    create: false,
    sortField: {
        field: "text",
        direction: "asc"
    },
    highlight: true,
    placeholder: "Select a patient...",
    searchField: ['text'],
    closeAfterSelect: true,
    maxOptions: 10
  });
  }
});