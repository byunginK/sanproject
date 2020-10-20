<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC8Un5TEXbB8cb1ZVWxDjP84a8xkS5a5RM&callback=initAutocomplete&libraries=places&v=weekly" defer></script>

	<div class="mapdetailborder">
		<input id="pac-input" class="controls" type="text"
			placeholder="Search Box" name="address" />
	
		<div id="map"></div>
		<div class='mapdetailDiv'>
			
		</div>
		</div>
	<script>
      "use strict";

      // This example adds a search box to a map, using the Google Place Autocomplete
      // feature. People can enter geographical searches. The search box will return a
      // pick list containing a mix of places and predicted search terms.
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
      function initAutocomplete() {
        const map = new google.maps.Map(document.getElementById("map"), {
          center: {
            lat: 37.566536,
            lng: 126.97797,
          },
          zoom: 12,
          mapTypeId: "roadmap",
        }); // Create the search box and link it to the UI element.

        const input = document.getElementById("pac-input");
        const searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input); // Bias the SearchBox results towards current map's viewport.

        map.addListener("bounds_changed", () => {
          searchBox.setBounds(map.getBounds());
        });
        let markers = []; // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.

        searchBox.addListener("places_changed", () => {
          const places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          } // Clear out the old markers.

          markers.forEach((marker) => {
            marker.setMap(null);
          });
          markers = []; // For each place, get the icon, name and location.

          const bounds = new google.maps.LatLngBounds();
          places.forEach((place) => {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }

            const icon = {
              url: place.icon,
              size: new google.maps.Size(30, 30),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(30, 30),
              scaledSize: new google.maps.Size(30, 30),
            }; // Create a marker for each place.

            markers.push(
              new google.maps.Marker({
                map,
                icon,
                title: place.name,
                position: place.geometry.location,
              })
            );

            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });
      }
    
	
 	$("#pac-input").keydown(function(key){
        if(key.keyCode==13){
             let adress_text = $("#pac-input").val();
             $.ajax({
                url : "./mountainInformationCom.do",
                type : "POST",
                data : {"adress_text": adress_text},
                dataType :"text",
                success : function(retVal){
                   let jsonn = JSON.parse(retVal);
                   let addSan="";
                   let totalCount = jsonn.response.body.totalCount;
                   
                   if(totalCount == 1){
	                   addSan += "<p><img src="+jsonn.response.body.items.item.mntnattchimageseq+" width=390px></p>"
	                        //  +  "<p>"+jsonn.response.body.items.item.crcmrsghtnginfodscrt+"</p>"
	                          +  "<p>"+jsonn.response.body.items.item.crcmrsghtnginfoetcdscrt+"</p>"
	                          +  "<p>"+jsonn.response.body.items.item.pbtrninfodscrt+"</p>"
	                          +  "<p>"+jsonn.response.body.items.item.mntninfodtlinfocont+"</p>";
                   }else {
                       for (let i = 0; i < totalCount; i++){
                    	   addSan += "<p><img src="+jsonn.response.body.items.item[i].mntnattchimageseq+" width=390px></p>"
	                        //  +  "<p>"+jsonn.response.body.items.item[i].crcmrsghtnginfodscrt+"</p>"
	                          +  "<p>"+jsonn.response.body.items.item[i].crcmrsghtnginfoetcdscrt+"</p>"
	                          +  "<p>"+jsonn.response.body.items.item[i].pbtrninfodscrt+"</p>"
	                          +  "<p>"+jsonn.response.body.items.item[i].mntninfodtlinfocont+"</p>";
                           }
                   }
                   $(".mapdetailDiv").html(addSan);
                },
                error : function(retVal){
                   alert("error");
                }
                   
           })};
     });  

	$("#pac-input").keydown(function(key){
        if(key.keyCode==13){
             let adress_text = $("#pac-input").val();
             $.ajax({
                url : "./Matzip.do",
                type : "POST",
                data : {"address": adress_text},
                dataType :"text",
                success : function(retVal){
                   console.log(retVal);
                },
                error : function(retVal){
                   alert("error");
                }
                   
           })};
     });
    
	</script>

