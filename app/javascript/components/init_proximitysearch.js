const initProximitysearch = () => {
  // console.log("this thing on?");
  const locationButton = document.getElementById('search_by_location');
  const brandButton = document.getElementById('search_by_brand');
  const searchForm = document.querySelector('form');
  const searchBar = searchForm.querySelector('#query');
  const proximitySelect = document.getElementById('km-select');

  console.log(proximitySelect);

  brandButton.addEventListener('click', (event) => {
    proximitySelect.style.display = 'none';
  })

  locationButton.addEventListener('click', (event) => {
    proximitySelect.style.display = '';
  })
};

export { initProximitysearch };


