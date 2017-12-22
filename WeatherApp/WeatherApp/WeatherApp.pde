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
JSONObject  currentMain = jsonCurrentEdmonton.getJSONObject("main");
float currentTemp = currentMain.getFloat("temp");
float currentTempMin = currentMain.getFloat("temp_min");
float currentTempMax = currentMain.getFloat("temp_max");
JSONObject currentWind = jsonCurrentEdmonton.getJSONObject("wind");
float currentWindSpeed = currentWind.getFloat("speed");

//Forecast In Edmonton
JSONArray list = jsonForecastEdmonton.getJSONArray ("list"); //parent node, unwraps [], or array
JSONObject all = list.getJSONObject (0); //Unwraps {} or array list
int dt_forecast = all.getInt ("dt"); //Loads interger

String currentTime = "http://www.convert-unix-time.com/api?timestamp=" + dt_forecast + "&timezone=Edmonton";
JSONObject localTimeJSONObject = loadJSONObject (currentTime);
String localDate = localTimeJSONObject.getString ("localDate");

println(localDate);
//println(currentMain);
println(currentTemp);
println(currentTempMin);
println(currentTempMax);
//println(currentWind);
println(currentWindSpeed);

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