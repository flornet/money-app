document.addEventListener('turbolinks:load', () => {
  const entryDatePicker = flatpickr('#entryDatePicker', {
      inline: true
    });
  console.log(entryDatePicker.selectedDates);
});
