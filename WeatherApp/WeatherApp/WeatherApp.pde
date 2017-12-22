//variables
/*
JSONObject jsonCurrentMoscow = loadJSONObject ("api.openweathermap.org/data/2.5/weather?id=5601538&APPID=e6c89f3c42efe3c078ab68b49f4660fb&mode=JSON&units=metric");
JSONObject jsonForecastMoscow = loadJSONObject ("api.openweathermap.org/data/2.5/forecast?id=5601538&APPID=e6c89f3c42efe3c078ab68b49f4660fb&mode=JSON&units=metric");
JSONObject jsonCurrentRepublicOfUganda = loadJSONObject ("api.openweathermap.org/data/2.5/weather?id=226074&APPID=e6c89f3c42efe3c078ab68b49f4660fb&mode=JSON&units=metric");
JSONObject jsonForecastRepublicOfUganda = loadJSONObject ("api.openweathermap.org/data/2.5/forecast?id=226074&APPID=e6c89f3c42efe3c078ab68b49f4660fb&mode=JSON&units=metric");
*/

JSONObject jsonCurrentEdmonton = loadJSONObject ("http://api.openweathermap.org/data/2.5/weather?id=5946768&APPID=e6c89f3c42efe3c078ab68b49f4660fb&mode=JSON&units=metric");
JSONObject jsonForecastEdmonton = loadJSONObject ("http://api.openweathermap.org/data/2.5/forecast?id=5946768&APPID=e6c89f3c42efe3c078ab68b49f4660fb&mode=JSON&units=metric");

//Current Weather In Edmonton
//Present Day
JSONArray list = jsonForecastEdmonton.getJSONArray ("list"); //parent node, unwraps [], or array
JSONObject all = list.getJSONObject (0); //Unwraps {} or array list
int dt_forecast = all.getInt ("dt"); //Loads interger

String currentTime = "http://www.convert-unix-time.com/api?timestamp=" + dt_forecast + "&timezone=Edmonton";
JSONObject localTimeJSONObject = loadJSONObject (currentTime);
String localDate = localTimeJSONObject.getString ("localDate");

String name = jsonCurrentEdmonton.getString("name");
println(name);


JSONObject  currentMain = jsonCurrentEdmonton.getJSONObject("main");
float currentTemp = currentMain.getFloat("temp");
float currentTempMin = currentMain.getFloat("temp_min");
float currentTempMax = currentMain.getFloat("temp_max");
JSONObject currentWind = jsonCurrentEdmonton.getJSONObject("wind");
float currentWindSpeed = currentWind.getFloat("speed");

JSONArray currentWeather = jsonCurrentEdmonton.getJSONArray("weather");
JSONObject weatherAll = currentWeather.getJSONObject(0);
String Con = weatherAll.getString("main");

//println(currentMain);
println("Temperature" + currentTemp);
println("Minimum Temperature" + currentTempMin);
println("Maximum Temperature" +currentTempMax);
//println(currentWind);
println("Wind Speed " + currentWindSpeed);
println("Weather Condition " + Con);

//Forecast In Edmonton
//Day
JSONObject all2 = list.getJSONObject (1); //Unwraps {} or array list
int dt_forecast2 = all2.getInt ("dt"); //Loads interger

String currentTime2 = "http://www.convert-unix-time.com/api?timestamp=" + dt_forecast2 + "&timezone=Edmonton";
JSONObject localTimeJSONObject2 = loadJSONObject (currentTime2);
String localDate2 = localTimeJSONObject2.getString ("utcDate");

println("Local Date " + localDate);
println("Future local date " + localDate2);

JSONObject forecastMain = all2.getJSONObject ("main");
float forecastTemp = forecastMain.getFloat("temp");
float forecastMinTemp = forecastMain.getFloat("temp_min");
float forecastMaxTemp = forecastMain.getFloat("temp_max");

JSONArray forecastWeather = all2.getJSONArray("weather"); 
JSONObject forecastWeatherAll = forecastWeather.getJSONObject(0);
String forecastCon = forecastWeatherAll.getString("main");




//println(forecastWeather);
println(forecastCon);
//println(forecastMain);
println(forecastTemp);
println(forecastMinTemp);
println(forecastMaxTemp);


//Display
size(800, 800);
textSize(20);
fill(0);
text("Current Weather for " + name + ": " + localDate, 50, 50);
text("Temperature: " + currentTemp, 50, 100);
text("Mininum Temperature: " + currentTempMin, 50, 150);
text("Maximun Temperature: " + currentTempMax, 50, 200);
text("Current Wind Speed: " + currentWindSpeed + "km/h", 50, 250);
text("Current weather condition: " + Con, 50, 300);

text("Weather forecast for " + name + ": " + localDate2, 50, 400);
text("Temperature: " + forecastTemp, 50, 450);
text("Min Temperature: " + forecastMinTemp, 50, 500);
text("Max Temperature: " + forecastMaxTemp, 50, 550);
text("Weather Condition: " + forecastCon, 50, 600);


/*
api.openweathermap.org/data/2.5/weather?
id=5946768
&APPID=e6c89f3c42efe3c078ab68b49f4660fb
&mode=JSON&units=metric
"id": 5946768,
    "name": "Edmonton"
"id": 226074,
    "name": "RepublicNJ
    of Uganda"
"id": 5601538,
    "name": "Moscow"
*/

//void Setup () {}

//void draw () {}