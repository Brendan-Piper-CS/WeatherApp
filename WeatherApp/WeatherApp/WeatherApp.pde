void setup () {
  fullScreen();

//variables
JSONObject jsonCurrentEdmonton = loadJSONObject ("http://api.openweathermap.org/data/2.5/weather?id=5946768&APPID=e6c89f3c42efe3c078ab68b49f4660fb&mode=JSON&units=metric");
JSONObject jsonForecastEdmonton = loadJSONObject ("http://api.openweathermap.org/data/2.5/forecast?id=5946768&APPID=e6c89f3c42efe3c078ab68b49f4660fb&mode=JSON&units=metric");

/*JSONObject jsonCurrentMoscow = loadJSONObject ("api.openweathermap.org/data/2.5/weather?id=5601538&APPID=e6c89f3c42efe3c078ab68b49f4660fb&mode=JSON&units=metric");
JSONObject jsonForecastMoscow = loadJSONObject ("api.openweathermap.org/data/2.5/forecast?id=5601538&APPID=e6c89f3c42efe3c078ab68b49f4660fb&mode=JSON&units=metric");

JSONObject jsonCurrentRepublicOfUganda = loadJSONObject ("api.openweathermap.org/data/2.5/weather?id=226074&APPID=e6c89f3c42efe3c078ab68b49f4660fb&mode=JSON&units=metric");
JSONObject jsonForecastRepublicOfUganda = loadJSONObject ("api.openweathermap.org/data/2.5/forecast?id=226074&APPID=e6c89f3c42efe3c078ab68b49f4660fb&mode=JSON&units=metric");
*/
/* How to make a JSON Object call

*/

JSONArray list = jsonForecastEdmonton.getJSONArray ("list"); //parent node, unwraps [], or array
JSONObject all = list.getJSONObject (0); //Unwraps {} or array list
int dt_forecast = all.getInt ("dt"); //Loads interger

String currentTime = "http://www.convert-unix-time.com/api?timestamp=" + dt_forecast + "&timezone=Edmonton";
JSONObject localTimeJSONObject = loadJSONObject (currentTime);
String localDate = localTimeJSONObject.getString ("localDate");
println(localDate);

fill(0);
text(localDate, displayWidth/2, displayHeight/2);

/* How to  make a time call with concatenation 

*/

/* Edmonton
  "base":"stations",
  "main":{
    "temp":5,
    "pressure":1004,
      "humidity":44,
      "temp_min":5,
        "temp_max":5
  },
    "visibility":14484,
    "wind":{
      "speed":6.2,
      "deg":290,
        "gust":13.4
    },
    "dt":1513368000,
        "sys":{
        "type":1,
          "id":3162,
          "message":0.1637,
            "country":"CA",
            "sunrise":1513352704,
              "sunset":1513379652
        },
*/


/*
api.openweathermap.org/data/2.5/weather?
id=5946768
&APPID=e6c89f3c42efe3c078ab68b49f4660fb
&mode=JSON&units=metric

"id": 5946768,
    "name": "Edmonton"
"id": 226074,
    "name": "Republic of Uganda"
"id": 5601538,
    "name": "Moscow"
*/

}

//void draw () {}