/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


// weather.js

$(document).ready(function () {
    $("#getWeather").click(function () {
        var apiKey = '7bd2eb0c15268c4070205bbc64a63333';
        var city = 'Kyoto';
        var apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=' + city + '&appid=' + apiKey;
        $.ajax({
            type: 'GET',
            url: apiUrl,
            dataType: 'json',
            success: function (data) {
                        console.log(data);

                displayWeather(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.error('Error in processing! ' + textStatus);
            }
        });
    });

    function displayWeather(weatherData) {
        var temperature = Math.round(weatherData.main.temp - 273.15); 
        var description = weatherData.weather[0].description;
        $("#temperature").text(`Temperature: ${temperature}°C`);
        $("#description").text(`Description: ${description}`);
        updateBackground(description);
    }
    function updateBackground(weatherDescription) {
        // Clear existing background classes
        $("#weatherSection").removeClass();

        // Add a class based on the weather description
        switch (weatherDescription) {
            case 'clear sky':
                $("#weatherSection").addClass('clearSky');
                break;
            case 'few clouds':
            case 'scattered clouds':
            case 'broken clouds':
            case 'overcast clouds':
                $("#weatherSection").addClass('cloudy');
                break;
            case 'light rain':
            case 'moderate rain':
            case 'heavy intensity rain':
            case 'very heavy rain':
            case 'extreme rain':
            case 'light intensity drizzle':
            case 'drizzle':
            case 'heavy intensity drizzle':
            case 'light intensity drizzle rain':
                $("#weatherSection").addClass('rainy');
                break;
            case 'thunderstorm with light rain':
            case 'thunderstorm with rain':
            case 'thunderstorm with heavy rain':
            case 'light thunderstorm':
            case 'thunderstorm':
                $("#weatherSection").addClass('thunderstorm');
                break;
            case 'light snow':
            case 'snow':
            case 'heavy snow':
            case 'sleet':
            case 'light shower sleet':
            case 'shower sleet':
            case 'light rain and snow':
            case 'rain and snow':
                $("#weatherSection").addClass('snowy');
                break;
            case 'mist':
            case 'smoke':
            case 'haze':
            case 'sand/ dust whirls':
            case 'fog':
                $("#weatherSection").addClass('foggy');
                break;
                // Add more cases for other weather conditions
            default:
                // Default background or fallback
                $("#weatherSection").addClass('defaultBackground');
                break;
        }
    }
});
