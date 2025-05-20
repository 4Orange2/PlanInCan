boolean hover_condition = false;
float x_translate = 0;
float y_translate = 0;
boolean city_viewing = false;

class Map {
  String[] MajorCitiesList = {"Toronto", "Ottawa ", "Québec City", "Montréal", "Halifax", "Vancouver", "Edmonton", "Winnipeg", "Whitehorse", "Yellowknife", "Iqaluit", "Regina"};
  // for-loop to make the range-coords
  
  Map() {}
  
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
  
  void mapBasics() {
  
  }
  
  
  void displayAll() {
    canada_map = loadImage("Canada_Map.png"); // this is going to be turned into a map object
    pushMatrix();
    canada_map.resize(int(1000*zoomFactor), int(550*zoomFactor));
    if (city_viewing == true) {
      x_translate = 0;
      y_translate = 0;
    }
    else {
      translate((X_of_mouse - X_of_mouse*zoomFactor), (Y_of_mouse - Y_of_mouse*zoomFactor));
      x_translate = X_of_mouse - X_of_mouse*zoomFactor;
      y_translate = Y_of_mouse - Y_of_mouse*zoomFactor;
    }
    image(canada_map, 0, 0);
    if (map_description || user_map_description) {
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
      map_description = false;
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
      text(MajorCitiesList[on_city[1]], base_coord.x, base_coord.y - 10);
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
