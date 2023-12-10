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

function search(endpoint) {
  id = document.getElementById("search_id").value;

  window.location.href = `./${endpoint}.html?id=${id}`;
}

/** UI Functions **/
function view_package(id) {
  window.location.href = `./index.html?id=${id}`;
}
function view_vehicle(id) {
  window.location.href = `./fleet.html?id=${id}`;
}
function view_depot(id) {
  window.location.href = `./depots.html?id=${id}`;
}
function view_tt(id) {
  window.location.href = `./tt.html?id=${id}`;
}


function popup_new() {
  document.getElementById("new_popup").style.display = "block";
  document.getElementById("over").style.display = "block";
}

function popup_update() {
  document.getElementById("update_popup").style.display = "block";
  document.getElementById("over").style.display = "block";
}

function close_popups() {
  popups = document.getElementsByClassName("popup");
  for (i = 0; i < popups.length; i++) {
    popups[i].style.display = "none";
  }
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
  const QUERY_STRING = window.location.search;
  const URL_PARAMS = new URLSearchParams(QUERY_STRING);
  const TARGET_ID = URL_PARAMS.get('id');
  const HAS_ID = URL_PARAMS.has('id');
  const TARGET_DEPOT = URL_PARAMS.get('depot');
  const HAS_DEPOT = URL_PARAMS.has('depot');
  const TARGET_VEHICLE = URL_PARAMS.get('fleet');
  const HAS_VEHICLE = URL_PARAMS.has('fleet');

  if (HAS_ID) { var results = getTableAsJson(`/packages/${TARGET_ID}`); }
  else if (HAS_DEPOT) { var results = getTableAsJson(`/depots/${TARGET_DEPOT}/packages`); }
  else if (HAS_VEHICLE) { var results = getTableAsJson(`/depots/${TARGET_VEHICLE}/packages`); }
  else { var results = getTableAsJson("/packages"); }

  var target = document.getElementById("packages_target");

  var newContent = "<table><thead><tr><th>ID</th><th>Destination</th><th>Status</th><th>Actions</th></tr></thead></tbody>";
  for (var i = 0; i < results.result.length; i++) {
    var row = results.result[i];
    if (row.stat == "travel") {
      var statmsg = `Travelling (Vehicle ${row.vehicle_id})`;
    }
    if (row.stat == "stored") {
      var statmsg = `Stored at depot (Depot ${row.depot_id})`;
    }
    if (row.stat == "loading") {
      var statmsg = `Loading (Vehicle ${row.vehicle_id})`;
    }
    if (row.stat == "delivered") {
      var statmsg = `Delivered`;
    }
    if (row.stat == "missing") {
      var statmsg = `Reported missing`;
    }
    buttons = ""
    buttons += `<button onClick="view_package(${row.id})">View Package</button>`;
    if (row.vehicle_id != null) {
      buttons += `<button onClick="view_vehicle(${row.vehicle_id})">View Vehicle</button>`;
    }
    if (row.depot_id != null) {
      buttons += `<button onClick="view_depot(${row.depot_id})">View Depot</button>`;
    }
    buttons += `<button onClick="popup_update(${row.depot_id})">Update</button>`;
    newContent += `<tr><td>${row.id}</td><td>${row.city} (${row.dest})</td><td>${statmsg}</td><td>${buttons}</td></tr>`;
  }
  newContent += "</tbody></table>";
  target.innerHTML = newContent;
}

function setup_depots() {
  const QUERY_STRING = window.location.search;
  const URL_PARAMS = new URLSearchParams(QUERY_STRING);
  const TARGET_ID = URL_PARAMS.get('id');
  const HAS_ID = URL_PARAMS.has('id');

  if (HAS_ID) { var results = getTableAsJson(`/depots/${TARGET_ID}`); }
  else { var results = getTableAsJson("/depots"); }

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

    buttons = ""
    buttons += `<button onClick="view_depot(${row.id})">View Depot</button>`;
    buttons += `<button onClick="view_packages_at_depot(${row.id})">View Packages</button>`;
    buttons += `<button onClick="view_vehicles(${row.id})">View Vehicles</button>`;
    buttons += `<button onClick="popup_update(${row.depot_id})">Update</button>`;
    newContent += `<tr><td>${row.id}</td><td>${row.city}</td><td>${row.usage} / ${row.capacity} kg</td><td>${vehicles}</td><td>${buttons}</td></tr>`;
  }
  newContent += "</tbody></table>";
  target.innerHTML = newContent;
}

function setup_fleet() {
  const QUERY_STRING = window.location.search;
  const URL_PARAMS = new URLSearchParams(QUERY_STRING);
  const TARGET_ID = URL_PARAMS.get('id');
  const HAS_ID = URL_PARAMS.has('id');
  const TARGET_DEPOT = URL_PARAMS.get('depot');
  const HAS_DEPOT = URL_PARAMS.has('depot');

  if (HAS_ID) { var results = getTableAsJson(`/fleet/${TARGET_ID}`); }
  else if (HAS_DEPOT) { var results = getTableAsJson(`/depot/${TARGET_DEPOT}/fleet`); }
  else { var results = getTableAsJson("/fleet"); }

  var target = document.getElementById("fleet_target");

  var newContent = "<table><thead><tr><th>ID</th><th>Vehicle Type</th><th>Range</th><th>Capacity</th><th>Status</th><th>Destination</th><th>Actions</th></tr></thead><tbody>";
  for (var i = 0; i < results.result.length; i++) {
    var row = results.result[i];
    if (row.stat == "travel") {
      var statmsg = `Travelling`;
    }
    if (row.stat == "parked") {
      var statmsg = `Parked`;
    }
    if (row.stat == "loading") {
      var statmsg = `Loading`;
    }

    newContent += `<tr><td>${row.id}</td><td>${row.vehicle_type}</td><td>${row.rng} km</td><td>${row.usage} / ${row.capacity} kg</td><td>${statmsg}</td><td>${row.city} (${row.destination})</td><td></td></tr>`;
  }
  newContent += "</tbody></table>";
  target.innerHTML = newContent;
}

function setup_tt() {
  const QUERY_STRING = window.location.search;
  const URL_PARAMS = new URLSearchParams(QUERY_STRING);
  const TARGET_ID = URL_PARAMS.get('id');
  const HAS_ID = URL_PARAMS.has('id');

  if (HAS_ID) { var results = getTableAsJson(`/tt/${TARGET_ID}`); }
  else { var results = getTableAsJson("/tt"); }

  var target = document.getElementById("tt_target");

  var newContent = "<table><thead><tr><th>ID</th><th>Vehicle ID</th><th>Departure</th><th>Arrival</th><th>Status</th><th>Actions</th></tr></thead><tbody>";
  for (var i = 0; i < results.result.length; i++) {
    var row = results.result[i];
    if (row.diff == 0) {
      var statmsg = "On time"
    }
    else if (row.diff > 0) {
      var statmsg = "Late"
    }
    else {
      var statmsg = "Early"
    }

    newContent += `<tr><td>${row.id}</td><td>${row.fleet_id}</td><td>${row.departure}<br />${row.source_city} (${row.source})</td><td>${row.arrival}<br />${row.dest_city} (${row.dest})</td><td>${statmsg}</td><td></td></tr>`;
  }
  newContent += "</tbody></table>";
  target.innerHTML = newContent;
}

function depot_dropdown() {
  var elements = document.getElementsByClassName("depots_dropdown");
  var results = getTableAsJson("/depots");

  var newContent = "";
  for (var i = 0; i < results.result.length; i++) {
    var row = results.result[i];
    newContent += `<option value="${row.id}">${row.city}</option>`;
  }

  for (i = 0; i < elements.length; i++) {
    var el = elements[i];
    el.innerHTML = newContent;
  }
}

function vehicle_dropdown() {
  var elements = document.getElementsByClassName("fleet_dropdown");
  var results = getTableAsJson("/vehicles");

  var newContent = "";
  for (var i = 0; i < results.result.length; i++) {
    var row = results.result[i];
    newContent += `<option value="${row.id}">${row.id}: ${row.vehicle_type} (To: ${row.city})</option>`;
  }

  for (i = 0; i < elements.length; i++) {
    var el = elements[i];
    el.innerHTML = newContent;
  }
}