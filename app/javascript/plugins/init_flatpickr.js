import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';

const flatPickCalendar = () => {
  // First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with the Chrome inspector.
  const startDateInput = document.getElementById('rental_start_date');
  const endDateInput = document.getElementById('rental_end_date');

  const getEvents = () => {
    const displayRate = document.getElementById("bag-rate");
    const startDateValue = startDateInput.value;
    const startDate = new Date(startDateValue);
    const endDateValue = endDateInput.value;
    const endDate = new Date(endDateValue);
    const nbOfDays = (endDate - startDate) / (1000 * 60 * 60 * 24) + 1
    const list = document.getElementById('display-list');

    list.innerHTML = "";
    list.insertAdjacentHTML("beforeend", `<div class="d-flex justify-content-between mt-2">\
                                              <li class="text-total">Total days:</li>\
                                              <li class="text-total">${nbOfDays} day(s)</li>\
                                            </div>\
                                            <div class="d-flex justify-content-between">\
                                              <li class="text-total">Bag rate:</li>\
                                              <li class="text-total"> $ ${displayRate.innerHTML} per day </li>\
                                            </div>\
                                            <hr>\
                                            <li class="total-price" style="text-align: right;"><strong>Total: $ ${(nbOfDays * displayRate.innerHTML).toFixed(2)} </strong></li>`);
  }
  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {
    const unavailableDates = JSON.parse(document.querySelector('#bag-rental-dates').dataset.unavailable)
    endDateInput.disabled = true

    flatpickr(startDateInput, {
      minDate: "today",
      disable: unavailableDates,
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
    });

    console.log('im in the file')

    startDateInput.addEventListener("change", (e) => {
      if (startDateInput != "") {
        endDateInput.disabled = false
      }
      flatpickr(endDateInput, {
        minDate: e.target.value,
        disable: unavailableDates,
        dateFormat: "Y-m-d",
        altInput: true,
        altFormat: "F j, Y",
      });
      // getEvents();
    });
    // To display the number of days + total price
    endDateInput.addEventListener("change", (e) => {
      getEvents();
    });
  };
};

export { flatPickCalendar };
