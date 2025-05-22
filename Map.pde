boolean hover_condition = false;
float x_translate = 0;
float y_translate = 0;
boolean city_viewing = false;
PImage an_image;


class Map {
  String[] MajorCitiesList = {"Toronto", "Ottawa", "Québec City", "Montréal", "Halifax", "Vancouver", "Edmonton", "Winnipeg", "Whitehorse", "Yellowknife", "Iqaluit", "Regina"};
  String[][] Imagesets = {{"CN Tower", "https://travel.usnews.com/images/Istvan_Kadar_Photographycity-skyline-buidings-cn-tower.jpg", "Toronto Islands","https://www.planetware.com/wpimages/2021/08/canada-toronto-islands-things-to-do-ferry-and-city-skyline.jpg", "Casa Loma", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/3a/0a/7b/casa-loma-gardens.jpg?w=1000&h=-1&s=1","Little Canada","https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/87/0c/71/miniature-world-big-wonder.jpg?w=1000&h=-1&s=1", "Hockey Hall of Fame", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/24/85/ed/caption.jpg?w=1000&h=800&s=1","Toronto Zoo","https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/67/72/18/nikita.jpg?w=800&h=600&s=1", "Canada Wonderland", "https://cdn-cloudfront.cfauthx.com/binaries/content/gallery/cw-en-ca/ctas/home/hero/cw-alpenfury-homepage-cta.jpg", "Ontario Science Centre","https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,f_jpg,h_288,q_65,w_512/v1/clients/toronto/167_3_6826_jpeg_053cff05-2df6-4f5a-995a-98a690a83169.jpg"}, {"Parliament hill","https://terrydowdallmp.ca/wp-content/uploads/sites/37/2023/05/Parliament-Hill.jpg","War museum","https://ottawatourism.ca/sites/default/files/styles/facebook_share/public/images/2020/02/Canadian-War-Museum-credit-Ottawa-Tourism.jpg?itok=qzr4dIQI","Rideau Canal National Historic Site","https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/80/d5/f5/rideau-canal.jpg?w=1000&h=-1&s=1","National Gallery of Canada","https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/0c/3f/1b/exterior-of-the-museum.jpg?w=1000&h=800&s=1","Notre Dame Cathedral Basilica","https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/72/db/51/interno.jpg?w=200&h=200&s=1","Hogs Back Falls","https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/ab/e2/d1/photo0jpg.jpg?w=1000&h=-1&s=1","Royal Canadian Mint","https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/a7/66/83/20190804-110011-largejpg.jpg?w=800&h=600&s=1","Ottawa Locks","https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/a8/13/6c/view-up-the-locks-from.jpg?w=1000&h=-1&s=1"}, {"Old quebec city", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2d/25/0f/aa/caption.jpg?w=300&h=300&s=1","Montmorency Falls","https://lh3.googleusercontent.com/gps-cs-s/AC9h4noscMKkgbN65K09MnQ8wUhw1cTQrzDqn5Hb02GRNDeeSzneDAbU38QB1jilunUfg9QY8ZpRbroXe6pmzO7C8Sdfwkx1LWwgsWnzdK4od2xxp84TZaeCpN41bqFI9cx0PbFliyE2jg=s680-w680-h510-rw", "Château Frontenac & Terrasse Dufferin","https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/39/79/65.jpg", "Petit-Champlain District", "https://thumbs.dreamstime.com/z/petit-champlain-street-site-as-part-historic-district-old-quebec-canada-petit-champlain-street-old-quebec-city-163246885.jpg", "Plains of Abraham & The Citadel", "https://d3d0lqu00lnqvz.cloudfront.net/media/media/ea7e8555-9481-4ebb-9585-dc9a4abd22d8.jpg", "Musée de la civilisation", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/50/55/1d/entree-85-dalhousie-photo.jpg?w=1200&h=-1&s=1",  "Île Orléans", "https://i.natgeofe.com/n/2088ae4f-cf7a-42e7-8926-83ce58d5a36a/ile-dorleans-country-road-590.jpg"}, {"La Ronde", "https://lh3.googleusercontent.com/gps-cs-s/AC9h4nrhg0RIahJi4aOoTS1RrQs3-_uPscxHJtPoEYQmZcRoTAlIZD8nIDzm1xtmfOoGP02TRgWyi0Qg7a4MS1inSI975efGXHvH_RaLRu7Q7viBvgDe9pK0rDHIcIUGzOYP-NHBvW4H=s680-w680-h510-rw", "Montreal Museum of Fine Arts", "https://d3d0lqu00lnqvz.cloudfront.net/media/media/fd52f882-edea-4494-9d73-64af105481e2.jpg", "Old Montréal (Vieux-Montréal) & Old Port", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOv_YaJ9PnIpD91XXaM3dSX5NKguObAqS4Lw&s", "Notre-Dame Basilica", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhZrxkmwreRaFmyh_hnQOlAHIuP4eKisoOog&s", "Mount Royal Park (Parc du Mont-Royal)", "https://a.travel-assets.com/findyours-php/viewfinder/images/res70/541000/541262-montreal.jpg", "Jean-Talon Market or Atwater Market", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgu468kKbOeJ_v0tB-GS3p6S6LCmz4ecEORg&s", "Plateau Mont-Royal & Mile End", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/8e/c8/b8/montatanetour-vous-parle.jpg?w=1200&h=-1&s=1"}, {"Fisherman’s Cove, Eastern Passage",
"https://novascotia.com/wp-content/uploads/2024/10/fishermans-cove-fishing-boat-1920x1020-67011c4a82042.webp",
"Maritime Museum of the Atlantic",
"https://novascotia.com/wp-content/uploads/2024/10/mma-titanic-chair-1920x1080-67011c468fadb.webp",
"Canadian Museum of Immigration at Pier 21",
"https://novascotia.com/wp-content/uploads/2024/10/pier-21-1920x1020-67011c43222bb.webp",
"Halifax Central Library",
"https://novascotia.com/wp-content/uploads/2024/10/halifax-central-library-twilight-1920x1080-67011c3dd2cdc.webp",
"Emera Oval",
"https://novascotia.com/wp-content/uploads/2024/10/halifax-oval-1920x1020-67011c3aab6b3.webp",
"Halifax Public Gardens",
"https://novascotia.com/wp-content/uploads/2024/10/halifax-public-gardens-1920x1020-0-67011c6e5efa2.webp",
"Halifax Waterfront Boardwalk",
"https://novascotia.com/wp-content/uploads/2024/10/hfx-waterfront-1920x1080-67011c6a48cf4.webp",
"Halifax Harbour Ferries",
"https://novascotia.com/wp-content/uploads/2024/10/halifax-ferry-at-sunset-1920x1020-67011c466c5cd.webp",
"McNabs Island Provincial Park, Halifax Harbour",
"https://novascotia.com/wp-content/uploads/2024/10/mcnabs-island-bikes-1920x1080-67011c3ea4639.webp",
"Georges Island National Historic Site, Halifax Harbour",
"https://novascotia.com/wp-content/uploads/2024/10/georges-island-1920x1080-67011c726fa1a.webp"}, {
"Stanley Park",
"https://lp-cms-production.imgix.net/2019-06/shutterstock_115945702.jpg?w=1920&h=640&fit=crop&crop=faces%2Cedges&auto=format&q=75",
"Granville Island",
"https://i0.wp.com/vancouversbestplaces.com/wp-content/uploads/2013/11/False-Creek-from-Granville-Island-at-Night.jpg?resize=640%2C285&ssl=1",
"Vancouver Aquarium",
"https://www.watercanada.net/wp-content/uploads/2016/11/VanAquarium.jpg",
"VanDusen Botanical Garden",
"https://vancouver.ca/images/cov/icons/vandusen-garden-maze-large-icon.png",
"Museum of Anthropology",
"https://visit.ubc.ca/wp-content/uploads/2019/03/profile_museum_of_anthropology_moa-770x482_4x.jpg",
"Granville Island Public Market",
"https://hayleyonholiday.com/wp-content/uploads/2014/07/Granville-Island-Vancouver-2.jpg ",
"The Aquabus",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM6LJpyjEjpzX1w2GSnDorMKQvvM_Ju-AQtA&s"}, {"Elk Island National Park",
"https://nationalparks-15bc7.kxcdn.com/images/parks/elk-island/Elk%20Island%20National%20Park.jpg",
"Discover Métis Crossing",
"https://metiscrossing.com/wp-content/uploads/2023/09/q9o6a8l--scaled.jpeg",
"North Saskatchewan River Valley",
"https://cdn.sanity.io/images/lr9tta69/production/a3762c1ff9c246ae56b7bf43003d3c722c2b5344-640x480.jpg?w=1920&q=77&fit=max&auto=format",
"West Edmonton Mall",
"https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/West_Edmonton_Mall%2C_Edmonton%2C_Alberta_%2822094236672%29.jpg/330px-West_Edmonton_Mall%2C_Edmonton%2C_Alberta_%2822094236672%29.jpg", 
"Rogers Place and the Edmonton Oilers",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRa9ADhMTdONEmDgD3AKbIIbKLsneX552kFg&s",
"University of Alberta Botanic Garden",
"https://www.ualberta.ca/en/botanic-garden/media-library/images/rentals/venues-aga-khan-garden.jpg"}, {"Assiniboine Park",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZhvzBbTfpGbbhMvwk1ccQz1AlOKaR9vMp8g&s",
"Royal Canadian Mint",
"https://www.mint.ca/globalassets/about/visit-the-mint/ottawa_location_2x.png?hash=638828293550000000",
"Winnipeg Art Gallery-Qaumajuq",
"https://www.wag.ca/isl/uploads/2023/11/211006-Qaumajuq-1736.jpg",
"The Manitoba Museum",
"https://winnipegarchitecture.ca/wp-content/uploads/2013/06/image.jpg ",
"Royal Aviation Museum of Western Canada",
"https://royalaviationmuseum.com/wp-content/uploads/2022/12/Royal-Aviation-Museum-of-Western-Canada_Drone_Winnipeg_July-2022_Credit-Travel-Manitoba-0331-1150x766.jpg", 
"The Forks",
"https://kattellsall.com/wp-content/uploads/2022/01/DSC_0131-2-e1643581848558.jpg ",
"FortWhyte Alive",
"https://www.fortwhyte.org/wp-content/uploads/2024/03/FWA_HeatherWoods_Early_Spring-18-scaled.jpg", 
"Thermëa by Nordik Spa-Nature",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_OFLvN1b1bzkh6pYaiWMMCRzDI-X0p9Vb2Q&s"}, {"Yukon Territory",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjRzvDbdE4eH_gHNR5gKSurMXN6J8eHEG9gg&s",
"Yukon Wildlife Preserve", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRZxiiJE4ttDQg5ZrwcpYEe5zPUOBKKqISFw&s",
"Carcross", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReC7mh4ZsfM3LM9MgV1c_AoJlydTQ4aAywOA&s"}, {"Northern Lights Viewing",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMZcibjw0nBmjPrnGGRMP_2m5zRMQguGX4YA&s",
"explore the Prince of Wales Northern Heritage Centre",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCVgrQUcE5Ldn-RUtEHZrGiX7LqV6exTf88w&s", 
"Fishing in Great Slave Lake",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9Xkfao-aoH6ct-CSafzaV56ckNtP8JZaikA&s"}, {"Qaummaarviit Territorial Historic Park",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4l-GjPzjv40wzmHg5rSUfsX7MxTGTPvzhLg&s"}, {"Royal Saskatchewan Museum",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA5j5VY5hW1AhRfYWG3nrTpJnEzUgWZmPUUA&s",
"Saskatchewan Science Centre",
"https://wascana.ca/pub/.photos/32/Science%20Centre%201.jpg",
"RCMP Heritage Centre",
"https://tsaskblobstorage.blob.core.windows.net/ics/RCMPHeritageCentre_07.JPG"}};
// for-loop to make the range-coords  
  Map() {}
  
  boolean isDigit(char A_char) {
    // this function works by seeing if a character is in a certain unicode range
    if ((int(A_char) >= 48)&&(int(A_char) <= 57)) {
      return true;
    }
    else {
      return false;
    }
  }
  
  String[] MakeCityImageList(String MajorCity) {
    // this function returns a list of the images for a specific city that need to be displayed
    String file_name = MajorCity + "_All.txt";
    String[] lines = {};
    String[] init_lines = {};
    init_lines = loadStrings(file_name);
    //printArray(init_lines);
    //println(file_name);
    String to_image = "";
    boolean continue_on = false;
    for (int line_index = 0; line_index < init_lines.length; line_index++) {
      if (continue_on == false) {
        to_image = init_lines[line_index];
      }
      else {
        to_image += init_lines[line_index];
      }
      // part to deteremine whether or not to "continue on" to the next line, or enter an attraction entry into "lines" array
      if (line_index != (init_lines.length - 1)) {
        continue_on = false;
        //println("entered");
        char examine_character = char(init_lines[line_index + 1].charAt(0));
        if (isDigit(examine_character)) {
          //println("heyyyyyyyyyyyyyyyy");
          lines = append(lines, to_image.substring(3).trim() + ".jpg");
        } 
        else {
          continue_on = true; 
        }
      }
      else {
        continue_on = false;
        lines = append(lines, to_image.substring(3).trim() + ".jpg");
      }
    }
    //println("this is: "+MajorCity);
    //printArray(lines);
    return lines;
  }
  
  int[] checkCities(PVector coordinate) {
    // for loops to check to see if mouse is over any of the dots
    int hover_condition = 0; // acts like a boolean but using 0 and 1 because wanting to return an integer
    int return_index = 0;
    for (int range_index = 0; range_index < 12; range_index++) {
      PVector first_coord = range_city_coords[range_index][0];
      PVector second_coord = range_city_coords[range_index][1];
      if (((coordinate.x > (first_coord.x*zoomFactor + x_translate)) && (coordinate.x < (second_coord.x*zoomFactor + x_translate))) && ((coordinate.y > (first_coord.y*zoomFactor + y_translate)) && (coordinate.y < (second_coord.y*zoomFactor + y_translate)))) {
        hover_condition = 1;
        return_index = range_index;
      }
    }
    int[] return_array = {hover_condition, return_index};
    return return_array;
  }
  
  String[] OutputAttractions(String preferred_type, String MajorCity) {
    String [] lines = {};
    for (String city: MajorCitiesList) {
      if (MajorCity.equals(city)) {
        if (preferred_type == "Nature and Environment") {
          String file_name = city + "_Nature.txt";
          lines = loadStrings(file_name);
        }
        else if (preferred_type == "History and Landmarks") {
          String file_name = city + "_History.txt";
          lines = loadStrings(file_name);
        }
        else if (preferred_type == "Day-to-day Culture") {
          String file_name = city + "_Culture.txt";
          lines = loadStrings(file_name);
        }
        else if (preferred_type == "No preference") {
          String file_name = city + "_All.txt";
          lines = loadStrings(file_name);
        }
      }
    }
    printArray(lines);
    return lines;
  }
  
  void DisplayMajorCity(String Major_City) {
    int BANNER_SHIFT = 400;
    map_banner = loadImage("banner_image_transparent.png");
    map_banner.resize(500, 400);
    image(map_banner, 70+BANNER_SHIFT+20,-100);
    textSize(25);
    fill(0, 0, 0);
    text(Major_City, 280+BANNER_SHIFT+15, 75);
    fill(0, 255, 0);
    rect(220+(BANNER_SHIFT*0.8), 110, 380, 420);
    fill(255);
    stroke(0);
    rect(25, 320, 400, 70);
    fill(0);
    text("Click on any image to explore the ", 45, 350);
    text("full set for the city. ", 45, 380);
    if (attraction_preference == false) {
      text("Top attractions: ", 260+(BANNER_SHIFT*0.75), 150);
      //println("YAYYYYYYYYYYYYYY");
      String[] lines = OutputAttractions("No preference", Major_City);
      int line_num = 1;
      for (String line: lines) {
        textSize(20);
        text(line, 260+(BANNER_SHIFT*0.75), 150+(line_num*30));
        line_num += 1;
      }
    }
    else {
      if (preferred_type.equals("Nature and Environment")) {
        text("Top nature attractions: ", 260+(BANNER_SHIFT*0.75), 150);
        String[] lines = OutputAttractions("Nature and Environment", Major_City);
        int line_num = 1;
        for (String line: lines) {
          text(line, 260+(BANNER_SHIFT*0.75), 150+(line_num*45));
          line_num += 1;
        }
      }
      else if (preferred_type.equals("History and Landmarks")) {
        text("Top history attractions: ", 260+(BANNER_SHIFT*0.75), 150);
        String[] lines = OutputAttractions("History and Landmarks", Major_City);
        int line_num = 1;
        for (String line: lines) {
          text(line, 260+(BANNER_SHIFT*0.75), 150+(line_num*45));
          line_num += 1;
        }
      }
      else if (preferred_type.equals("Day-to-day Culture")) {
        text("Top daily culture attractions: ", 260+(BANNER_SHIFT*0.75), 150);
        String[] lines = OutputAttractions("Day-to-day Culture", Major_City);
        int line_num = 1;
        for (String line: lines) {
          text(line, 260+(BANNER_SHIFT*0.75), 150+(line_num*45));
          line_num += 1;
        }
      }
    }
    String[] city_image_list = MakeCityImageList(Major_City);
      PImage cool_image;
      if (city_image_list.length >= 3) {
        for (int first_length = 0; first_length < 3; first_length++) {
          cool_image = loadImage(city_image_list[first_length]);
          cool_image.resize(150, 100);
          image(cool_image, 60+(first_length*150), 420);
        }
      }
      else {
        if (city_image_list.length == 1) {
          cool_image = loadImage(city_image_list[0]);
          cool_image.resize(450, 100);
          image(cool_image, 60, 420);
        }
        else if (city_image_list.length == 2) {
          for (int first_length = 0; first_length < 2; first_length++) {
            cool_image = loadImage(city_image_list[first_length]);
            cool_image.resize(225, 100);
            image(cool_image, 60+(first_length*225), 420);
          }
        }
      }
  }
  
  void displayAll() {
    canada_map = loadImage("Canada_Map.png"); // this is going to be turned into a map object
    pushMatrix();
    canada_map.resize(int(1000*zoomFactor), int(550*zoomFactor));
    if (city_viewing == true) {
      x_translate = 0;
      y_translate = 0;
      DisplayMajorCity(MajorCityDisplay);
    }
    else {
      translate((X_of_mouse - X_of_mouse*zoomFactor), (Y_of_mouse - Y_of_mouse*zoomFactor));
      x_translate = X_of_mouse - X_of_mouse*zoomFactor;
      y_translate = Y_of_mouse - Y_of_mouse*zoomFactor;
    }
    image(canada_map, 0, 0);
    if (user_map_description && zoomFactor == 1) {
      map_banner = loadImage("banner_image_transparent.png");
      map_banner.resize(900, 400);
      image(map_banner, 70, -100);
      textSize(25);
      fill(0, 0, 0);
      text("Which major city would you like to explore?", 280, 75);
      fill(0, 255, 0);
      rect(220, 110, 600, 50);
      fill(0);
      text("Click on the city that you would like to view for more", 260, 150);
    }
    if (zoomFactor != 1) {
      user_map_description = false;
    }
    fill(255, 0, 0);
    for (PVector city: city_coords) {
      // each circle on the map represents a city that can be selected
      circle(city.x*zoomFactor, city.y*zoomFactor, POINT_SIZE);
    }
    PVector mouse_coords = new PVector(mouseX, mouseY);
    int[] on_city = checkCities(mouse_coords);
    if (on_city[0] == 1) {
      fill(0,255,0);
      PVector base_coord = range_city_coords[on_city[1]][0];
      circle((base_coord.x+ POINT_SIZE/2)*zoomFactor, (base_coord.y+ POINT_SIZE/2)*zoomFactor, POINT_SIZE);
      fill(0);
      text(MajorCitiesList[on_city[1]], base_coord.x*zoomFactor, base_coord.y*zoomFactor - 10);
    }
    popMatrix();
    if (city_viewing == true) {
      textSize(25);
      stroke(0);
      fill(0);
      text("You can still hover over this map as before!", 25, 40);
      line(500,0, 500, 300);
      line(0,300, 500, 300);
    }
  }
  
  void drawGridlines() {
    // pay attention to the use of text to indicate the coordinates of the gridlines (there is one number since either the x or y is 0)
    for (int grid_num = 0; grid_num < 10; grid_num++) {
      stroke(0);
      line(grid_num*100, 0, grid_num*100, 500);
      textSize(25);
      text(""+grid_num*100,grid_num*100,20);
    }
    for (int horizontal_line = 1; horizontal_line < 6; horizontal_line++) {
      stroke(0);
      line(0, horizontal_line*100, 1000, horizontal_line*100);
      textSize(25);
      text(""+horizontal_line*100,0,horizontal_line*100);
    }
    // this helper function was used for aid in the design process by drawing gridlines on the screen to allow for easier development of code
  }
  
  void ShowMajorCity(String MajorCity) {
    zoomFactor = 0.5;
    city_viewing = true;
    
  }
}
