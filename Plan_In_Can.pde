import g4p_controls.*;
Page display_item;
Map Canada;
Plan Canada_Plan;

int page_num = 1;
int previous_page = 0;
boolean home_open = true;
boolean recommended_open = false;
boolean map_open = false;
boolean user_map_description = true;
float X_of_mouse = 0;
float Y_of_mouse = 0;

PVector[] city_coords = {new PVector(655, 520), new PVector(690,480), new PVector(770,440), new PVector(730, 480), new PVector(890, 430), new PVector(80, 390), new PVector(220, 370), new PVector(415, 435), new PVector(80, 210), new PVector(275, 255), new PVector(660, 235), new PVector(320, 410)};
PVector[][] range_city_coords = new PVector[12][2];

static final int POINT_SIZE = 30;
PVector SIZE_POINT = new PVector(POINT_SIZE,POINT_SIZE);

String MajorCityDisplay = "";

boolean attraction_preference = false;
String preferred_type = "";

String recommend_text1_entered = "";
String recommend_text2_entered = "";
boolean yes_public_transit = false;
String desired_season = "";
String desired_area = "";

int the_one_to_display = 0;

float desired_budget = 5000.0;

int recommended_display = 0; // the index to display the information for
boolean recommended_viewing = false;

ArrayList<String> to_be_displayed = new ArrayList<String>();

String[] image_collection = {};

boolean from_map = true;
String city_collection = "";

void setup(){
  size(1000, 550);
  display_item = new Page(); // creating a Page class object
  Canada = new Map();
  Canada_Plan = new Plan();
  for (int city_index = 0; city_index < 12; city_index++) {
  PVector init_coord_city = city_coords[city_index];
  PVector first_coord_city = new PVector(init_coord_city.x - POINT_SIZE/2, init_coord_city.y - POINT_SIZE/2);
  PVector second_coord_city = new PVector(init_coord_city.x + POINT_SIZE/2, init_coord_city.y + POINT_SIZE/2);
    for (int pair_index = 0; pair_index < 2; pair_index++) {
      if (pair_index == 0) {
        range_city_coords[city_index][pair_index] = first_coord_city;
      }
      else if (pair_index == 1) {
        //println("entered");
        range_city_coords[city_index][pair_index] = second_coord_city;
      }
    }
    //printArray(range_city_coords[city_index]);
  }
}



void draw(){
  background(255);
  if (page_num != previous_page) {
    createGUI(page_num);
    previous_page = page_num;
  }
  else if (page_num == previous_page) {}
  display_item.displayPage(page_num);
}

void mouseClicked() {
  if (page_num == 1) {
    if (((mouseX > 380) && (mouseX < 980)) && ((mouseY > 150) && (mouseY < 450))) {
      page_num = 4;
    }
  }
  else if (page_num == 4) {
    recommended_display = 0;
    PVector ClickLocation = new PVector(mouseX, mouseY);
    int[] on_city = Canada.checkCities(ClickLocation);
    if (on_city[0] == 1) {
      MajorCityDisplay = Canada.MajorCitiesList[on_city[1]];
      Canada.ShowMajorCity(MajorCityDisplay);
    }
    boolean on_images = Canada_Plan.on_images(ClickLocation);
    if (city_viewing==true) {
      if (on_images) {
        the_one_to_display = 0;
        city_collection = MajorCityDisplay;
        page_num = 5;
      }
    }
    
  }
  else if ((page_num == 2) && (recommended_viewing == true)) {
    recommended_display = 0;
    PVector ClickLocation = new PVector(mouseX, mouseY);
    boolean on_images = Canada_Plan.on_images(ClickLocation);
    if (on_images) {
      the_one_to_display = 0;
      from_map = false;
      page_num = 5;
    }
  }
  else if (page_num == 5) {
    PVector ClickLocation = new PVector(mouseX, mouseY);
    boolean on_next = Canada_Plan.on_next(ClickLocation);
    if (on_next) {
      if ((the_one_to_display+1) < (image_collection.length)) {
        the_one_to_display += 1;
      }
      else {
        the_one_to_display = 0;
      }
    }
    boolean on_home = Canada_Plan.on_home(ClickLocation);
    if (on_home) {
      page_num = 1;
    }
  }
}

float zoomFactor = 1;


void mouseWheel(MouseEvent event) {
  if (page_num == 4) {
    if (city_viewing == false) {
      int delta = event.getCount();  // Get the scroll amount (delta)
      if (delta > 0) { 
        // Zoom in (positive delta)
        zoomFactor += 0.1; // Adjust zoom level (example: +0.1)
        X_of_mouse = mouseX;
        Y_of_mouse = mouseY;
      } 
      else if (delta < 0) {
        // Zoom out (negative delta)
        if ((zoomFactor - 0.1) > 0.55) {
          zoomFactor -= 0.1; // Adjust zoom level (example: -0.1)
          X_of_mouse = mouseX;
          Y_of_mouse = mouseY;
        }
        else {}
      }
    }
  }
}
