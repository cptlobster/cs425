const BASE_ENDPOINT = "http://localhost:9000"

/** API Functions **/
function query(endpoint, query) {
  /* Execute an SQL query against the database via the backend API. Returns data as JSON. */
  var request = new XMLHttpRequest();
  request.open( "POST", BASE_ENDPOINT + endpoint, false ); // false for synchronous request
  request.send( query );
  var result = JSON.parse(request.responseText);
  return result;
}

function getTableAsJson(endpoint) {
  /* Query one of the HTTP endpoints of the backend API, with a pre-written query. Returns data as JSON. */
  var request = new XMLHttpRequest();
  request.open( "GET", BASE_ENDPOINT + endpoint, false ); // false for synchronous request
  request.send( null );
  var result = JSON.parse(request.responseText);
  return result;
}

/** UI Functions **/
function view(packId) {
      
  alert("This is where the other action details will be at " + packId);
}

function popup() {
  document.getElementById("newPackPopup").style.display = "block";
  document.getElementById("over").style.display = "block";
}

function closePopup() {
  document.getElementById("newPackPopup").style.display = "none";
  document.getElementById("over").style.display = "none";
}

function submit() {
  // Add more for package
  alert("Form submitted. Thank you!");
  closePopup();
}

function clearForm() {
  document.getElementById("newPackForm").reset();
}

/** Tables **/
function setup_packages() {
  var results = getTableAsJson("/packages");
  var target = document.getElementById("packages_target");
  var newContent = "<table><thead><tr><th>ID</th><th>Destination</th><th>Status</th><th>Actions</th></tr></thead></tbody>";
  for (var i = 0; i < results.result.length; i++) {
    var row = results.result[i];
    newContent += `<tr><td>${row.id}</td><td>${row.dest}</td><td>${row.status}</td><td></td></tr>`;
  }
  newContent += "</tbody></table>";
  target.innerHTML = newContent;
}
setup_packages;

function setup_depots() {
  var results = getTableAsJson("/depots");
  var target = document.getElementById("depots_target");
  var newContent = "<table><thead><tr><th>ID</th><th>Location</th><th>Capacity</th><th>Vehicles</th><th>Actions</th></tr></thead><tbody>";
  for (var i = 0; i < results.result.length; i++) {
    var row = results.result[i];
    var vehicles = "";
    if (row.truck_spaces > 0) {
      vehicles += `${row.trucks} / ${row.truck_spaces} trucks<br />`;
    }
    if (row.train_spaces > 0) {
      vehicles += `${row.trains} / ${row.train_spaces} trains<br />`;
    }
    if (row.plane_spaces > 0) {
      vehicles += `${row.planes} / ${row.plane_spaces} planes<br />`;
    }
    newContent += `<tr><td>${row.id}</td><td>${row.city}</td><td>${row.usage} / ${row.capacity} kg</td><td>${vehicles}</td><td></td></tr>`;
  }
  newContent += "</tbody></table>";
  target.innerHTML = newContent;
}

setup_depots();

function setup_fleet() {
  var results = getTableAsJson("/fleet");
  var target = document.getElementById("fleet_target");
  var newContent = "<table><thead><tr><th>ID</th><th>Vehicle Type</th><th>Range</th><th>Capacity</th><th>Status</th><th>Destination</th><th>Actions</th></tr></thead><tbody>";
  for (var i = 0; i < results.result.length; i++) {
    var row = results.result[i];
    newContent += `<tr><td>${row.id}</td><td>${row.vehicle_type}</td><td>${row.usage} / ${row.capacity} kg</td><td>${row.status}</td><td>${row.dest}</td><td></td></tr>`;
  }
  newContent += "</tbody></table>";
  target.innerHTML = newContent;
}
setup_fleet();