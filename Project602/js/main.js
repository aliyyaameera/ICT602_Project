let map;
let markers = [];

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 37.7749, lng: -122.4194 },
        zoom: 10,
    });
}

document.getElementById('event-form').addEventListener('submit', function (e) {
    e.preventDefault();

    const name = document.getElementById('name').value;
    const type = document.getElementById('type').value;
    const latitude = parseFloat(document.getElementById('latitude').value);
    const longitude = parseFloat(document.getElementById('longitude').value);
    const schedule = document.getElementById('schedule').value;

    const event = { name, type, latitude, longitude, schedule };

    addEventToMap(event);
    clearForm();
});

function addEventToMap(event) {
    const marker = new google.maps.Marker({
        position: { lat: event.latitude, lng: event.longitude },
        map: map,
        title: event.name,
    });

    const infoWindow = new google.maps.InfoWindow({
        content: `<h5>${event.name}</h5><p>${event.type}</p><p>${event.schedule}</p>`,
    });

    marker.addListener('click', () => {
        infoWindow.open(map, marker);
    });

    markers.push(marker);
}

function clearForm() {
    document.getElementById('event-form').reset();
}
