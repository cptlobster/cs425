const BASE_ENDPOINT = "http://localhost:9000"

function Query(endpoint, query) {
    /* Execute an SQL query against the database via the backend API. Returns data as JSON. */
    var request = new XMLHttpRequest();
    request.open( "POST", BASE_ENDPOINT + endpoint, false ); // false for synchronous request
    request.send( query );
    return request.responseJSON;
}

function getTableAsJson(endpoint) {
    /* Query one of the HTTP endpoints of the backend API, with a pre-written query. Returns data as JSON. */
    var request = new XMLHttpRequest();
    request.open( "GET", BASE_ENDPOINT + endpoint, false ); // false for synchronous request
    request.send( null );
    return request.responseJSON;
}