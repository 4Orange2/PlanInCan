boolean hover_condition = false;
float x_translate = 0;
float y_translate = 0;
boolean city_viewing = false;
PImage an_image;


class Map {
  String[] MajorCitiesList = {"Toronto", "Ottawa", "Québec City", "Montréal", "Halifax", "Vancouver", "Edmonton", "Winnipeg", "Whitehorse", "Yellowknife", "Iqaluit", "Regina"};
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
