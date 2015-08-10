(function() {

window.OurMap = function() {
	var mapOptions = {
		zoom: 4,
		center: new google.maps.LatLng(41.3917782, 2.1772809999999936)
	};
	// this is where we create our map
	this.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
};

window.ironMap = new OurMap();

})();
