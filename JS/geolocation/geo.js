if ("geolocation" in navigator) {
  addEventListeners();
} else {
  alert("Geolocation is not available")
}

function addEventListeners() {
  var saveButton = document.getElementById('save-location');
  saveButton.addEventListener('click', getLocation);
  var showButton = document.getElementById('show-locations');
  showButton.addEventListener('click', showLocations);
  var clearButton = document.getElementById('clear-locations');
  clearButton.addEventListener('click', clearLocations);
}

function getLocation() {
  console.log("getting your location...");
  navigator.geolocation.getCurrentPosition(success)
  // in the success handler, save the location in local storage
}

function success(position) {
  console.log(position.coords.latitude);
  console.log(position.coords.longitude);
  var positionStr = (position.coords.latitude) + "," + (position.coords.longitude)
  window.sessionStorage.setItem("position", positionStr);
}


function showLocations() {
  console.log("showing locations");
  console.log(window.sessionStorage.position)
  window.sessionStorage.getItem("position")
  // retrieve the locations from local storage and add them to the DOM
}

function clearLocations() {
  console.log('All cleared!')
  window.sessionStorage.removeItem("position")
  // remove the locations from local storage
}