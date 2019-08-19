document.addEventListener("turbolinks:load", function() {
  const marker = JSON.parse(document.querySelector("#map").dataset.marker);

  const map = new GMaps({
    div: "#map",
    lat: marker.latitude,
    lng: marker.longitude
  });

  if (marker.latitude && marker.longitude) {
    map.addMarker({
      lat: marker.latitude,
      lng: marker.longitude,
      title: marker.name,
      infoWindow: {
        content: `
        <div>
          <div>
            <img class="card-img" src="${marker.image_url}" alt="">
          </div>
          <h4>${marker.name}</h4>
          <p>${marker.description}<p>
        </div>
        `
      }
    });
  }
});
