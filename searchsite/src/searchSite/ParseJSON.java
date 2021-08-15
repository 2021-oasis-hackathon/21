package searchSite;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Calendar;

public class ParseJSON {

    public static void main(String[] args){

    }


    public String[] weather(String nx,String ny) throws IOException, ParseException {
        Calendar cal = Calendar.getInstance();
        int year = cal.get(cal.YEAR);
        int month = cal.get(cal.MONTH) + 1 ;
        String monthStr;
        if(month<10){
            monthStr = "0"+String.valueOf(month);
        }else{
            monthStr = String.valueOf(month);
        }
        int date = cal.get(cal.DATE)-1 ;
        String yearStr = String.valueOf(year);

        String dateStr = String.valueOf(date);
        String baseDate = yearStr+monthStr+dateStr;
        String pageNo = "1";
        String numOfRows = "120";
        String data_type = "JSON";
        String baseTime = "2300";

        String[] resultArr = new String[2];
        String myurl ="http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
        String key = "oIfU%2BI9A77i5G8CuU8PpjLtQ%2FEMspjnhaRo3tRnh%2BGsgl8BOcrCKUUOZbodB6zZujAzgPR9ihS0Q%2Fzs3u2xyqA%3D%3D";

        StringBuilder urlString = new StringBuilder(myurl);
        urlString.append("?"+URLEncoder.encode("ServiceKey","UTF-8") + "="+key);
        urlString.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8"));
        urlString.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="+ URLEncoder.encode(numOfRows, "UTF-8")); /* 한 페이지 결과 수 */
        urlString.append("&" + URLEncoder.encode("dataType", "UTF-8") + "=" + URLEncoder.encode(data_type, "UTF-8")); /* 타입 */
        urlString.append("&" + URLEncoder.encode("base_date", "UTF-8") + "="+ URLEncoder.encode(baseDate, "UTF-8")); /* 조회하고싶은 날짜 */
        urlString.append("&" + URLEncoder.encode("base_time", "UTF-8") + "="+ URLEncoder.encode(baseTime, "UTF-8")); /* 조회하고싶은 시간 AM 02시부터 3시간 단위 */
        urlString.append("&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); // 경도
        urlString.append("&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")+"&"); // 위도
        urlString.append("pageNo=1&numOfRows=7&_type=json"); // 위도



        URL url = new URL(urlString.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
//        System.out.println(url);

        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        String result= sb.toString();
//        System.out.println(result);
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(result);
        JSONObject parseResponse = (JSONObject) jsonObj.get("response");
        JSONObject parseBody = (JSONObject) parseResponse.get("body");
        JSONObject parseItems = (JSONObject) parseBody.get("items");

        JSONArray parseItem = (JSONArray) parseItems.get("item");

        for(int i = 0 ; i < parseItem.size() ; i++){
            JSONObject obj = (JSONObject) parseItem.get(i);
            Object fcstV = obj.get("fcstValue");
            String cate = (String) obj.get("category");
            switch(cate) {
                case "SKY":
                    resultArr[0] = (obj.get("fcstValue").toString());
                    break;
                case "REH":
                    resultArr[1] = (obj.get("fcstValue").toString());
                    break;
            }
        }
        return resultArr;
    }
}
