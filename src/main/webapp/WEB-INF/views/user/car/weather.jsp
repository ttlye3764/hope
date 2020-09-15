<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/popper.js/umd/popper.min.js"></script>
<script src="assets/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>


<div class="innerpage-banner center bg-overlay-dark-7 py-7" style="background:url(assets/images/bg/04.jpg) no-repeat; background-size:cover; background-position: center center;">
      <div class="container">
         <div class="row all-text-white">
            <div class="col-md-12 align-self-center">
               <h1 class="innerpage-title">세차하기 좋은 날</h1>
               <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/user/main/mainForm.do"><i class="ti-home"></i> Home</a></li>
                     <li class="breadcrumb-item">Timeline</li>
                  </ol>
               </nav>
            </div>
         </div>
      </div>
   </div>
      <br>
      <br>
      <br>
<script type="text/javascript">
function handleGeoSucc(position) {
		console.log(position);
	    const latitude = position.coords.latitude;  // 경도  
	    const longitude = position.coords.longitude;  // 위도
	    const coordsObj = {
	        latitude,
	        longitude
	    }
	    saveCoords(coordsObj);
	    getWeather(latitude, longitude);
	}

	function handleGeoErr(err) {
		console.log("geo err! " + err);
	}

	function requestCoords() {
	    navigator.geolocation.getCurrentPosition(handleGeoSucc, handleGeoErr);
	}
	function getWeather(lat, lon) {
	    fetch('https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=8feca7855e3426a810150c6acea323be&units=metric')
	    .then(res => res.json())
	    .then(data => {
	        const temp = data.main.temp;
	        const weathers = data.weather[data.weather.length -1];
	        alert(weathers);
	        weatherSpan.innerHTML = '${temp}&#176;C ${weathers.main}';
	    })
	}
</script>
