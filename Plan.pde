class Plan {

//FIELDS
String[] plans;
boolean chooseBudgetType;
int num_of_days;
int user_budget;
String cityChosen;
String[] activities;
boolean choosePlanType;
String favouritePlans;
String[] demoPlans;

String[] northern_cities = {"Iqaluit", "Yellowknife", "Whitehorse"};
String[] eastern_cities = {"Québec City", "Halifax"};
String[] western_cities = {"Vancouver", "Edmonton", "Whitehorse"};
String[] southern_cities = {"Winnipeg", "Regina", "Toronto", "Ottawa", "Montréal"};
String[] MajorCitiesList = {"Toronto", "Ottawa", "Québec City", "Montréal", "Halifax", "Vancouver", "Edmonton", "Winnipeg", "Whitehorse", "Yellowknife", "Iqaluit", "Regina"};
float[] budgetList = {3834, 1743, 2907, 2984, 1600, 2289, 2261, 2816, 2793, 2793, 4760, 1836};
String[] cityattractionType = {"Day-to-day Culture", "History and Landmarks", "History and Landmarks", "Day-to-day Culture", "Day-to-day Culture", "Nature and Environment", 
"Nature and Environment", "Nature and Environment", "Nature and Environment", "Nature and Environment", "Nature and Environment"};
boolean[] publicTransport = {true, true, true, true, false,  true, true, false, false, false, false, false};
String[] badSeason = {"none", "none","none","none","none","none","none", "none", "winter","winter","winter","none"};

//CONSTRUCTOR
Plan(){}

//METHODS
int returnCityIndex(String city) {
  // All cities are ordered in the same way, 
  // one index can be used for budget info, attraction type,
  // area/region, public transport, and season checks
  boolean exit = false;
  int return_index = 13;
  for (int index = 0; (exit==false); index++) {
    if (MajorCitiesList[index].equals(city)) {
      return_index = index;
      exit = true;
    }
  }
  println("this is our index: ", return_index);
  return return_index;
}

boolean checkcityBudget(float budget_threshold, int city_index) {
  // will measure budget threshold
  if (budget_threshold > budgetList[city_index]) {
    return true;
  }
  else {
    return false;
  }
}

boolean checkcityAttractionType(String attractionType, int city_index) {
  println("this FUNCTION");
  if (attraction_preference == false) {
    return true;
  }
  else {
    if (cityattractionType[city_index].equals(attractionType)) {
      return true;
    }
    else {
      return false;
    }
  }
  
}

boolean checkTransport(boolean public_transport, int city_index) {
  if (public_transport == false) {
    return true;
  }
  else {
    if (publicTransport[city_index] == public_transport) {
      return true;
    }
    else {
      return false;
    }
  }
}

boolean checkseason(String season, int city_index) {
  if (badSeason[city_index].equals(season)) {
    return false;
  }
  else {
    return true;
  }
}

ArrayList<String> calculateRecommended(float budget, String attractionType, String area, boolean public_transport, String season) {
  // this algorithm limits the recommending options by the area selected first, 
  // then by the budget, 
  // then by the attraction type,
  // then by the need for public transport,
  // and by the season
  ArrayList<String> recommended_list = new ArrayList<String>(); 
  if (desired_area != "") {
    if (desired_area.equals("northern")) {
      for (String city: northern_cities) {
        int city_index = returnCityIndex(city); 
        if (checkcityBudget(budget, city_index)) {
          if (checkcityAttractionType(attractionType, city_index)) {
            if (checkTransport(public_transport, city_index)) {
              if (checkseason(season, city_index)) {
                recommended_list.add(city);
              }
            }
          }
        }
      }
    }
    else if (desired_area.equals("southern")) {
      for (String city: southern_cities) {
        int city_index = returnCityIndex(city); 
        println("WE GOT HERE");
        if (checkcityBudget(budget, city_index)) {
          if (checkcityAttractionType(attractionType, city_index)) {
            if (checkTransport(public_transport, city_index)) {
              if (checkseason(season, city_index)) {
                recommended_list.add(city);
              }
            }
          }
        }
      }
    }
    else if (desired_area.equals("western")) {
      for (String city: western_cities) {
        int city_index = returnCityIndex(city); 
        if (checkcityBudget(budget, city_index)) {
          if (checkcityAttractionType(attractionType, city_index)) {
            if (checkTransport(public_transport, city_index)) {
              if (checkseason(season, city_index)) {
                recommended_list.add(city);
              }
            }
          }
        }
      }
    }
    else if (desired_area.equals("eastern")) {
      for (String city: eastern_cities) {
        int city_index = returnCityIndex(city); 
        if (checkcityBudget(budget, city_index)) {
          if (checkcityAttractionType(attractionType, city_index)) {
            if (checkTransport(public_transport, city_index)) {
              if (checkseason(season, city_index)) {
                recommended_list.add(city);
              }
            }
          }
        }
      }
    }
  }
  else {
    for (String city: MajorCitiesList) {
      int city_index = returnCityIndex(city); 
      if (checkcityBudget(budget, city_index)) {
        if (checkcityAttractionType(attractionType, city_index)) {
          if (checkTransport(public_transport, city_index)) {
            if (checkseason(season, city_index)) {
              recommended_list.add(city);
            }
          }
        }
      }
    }
  }
  return recommended_list;
}

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
        to_image += init_lines[line_index].trim();
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

boolean on_images(PVector ClickLocation) {
  if (((ClickLocation.x > 50) && (ClickLocation.x < 370)) && ((ClickLocation.y > 420) && (ClickLocation.y < 530))) {
    return true;
  }
  else {
    return false;
  }
}

boolean on_next(PVector ClickLocation) {
  if (((ClickLocation.x > 300) && (ClickLocation.x < 700)) && ((ClickLocation.y > 420) && (ClickLocation.y < 530))) {
    return true;
  }
  else {
    return false;
  }
}

boolean on_home(PVector ClickLocation) {
  if (((ClickLocation.x > 10) && (ClickLocation.x < 310)) && ((ClickLocation.y > 20) && (ClickLocation.y < 70))) {
    return true;
  }
  else {
    return false;
  }
}


void showImages(String Major_City) {
  image_collection = MakeCityImageList(Major_City);
  PImage one_of_them = loadImage(image_collection[the_one_to_display]);
  one_of_them.resize(500, 300);
  image(one_of_them, 250, 130);
  int BANNER_SHIFT = 400;
  map_banner = loadImage("banner_image_transparent.png");
  map_banner.resize(500, 400);
  image(map_banner, -160+BANNER_SHIFT+20,-100);
  textSize(25);
  fill(0, 0, 0);
  text("Image Collection:", 30+BANNER_SHIFT, 30);
  text(Major_City, 50+BANNER_SHIFT+15, 75);
  fill(125, 125, 0);
  rect(300, 450, 400, 80);
  fill(0, 0, 0);
  textSize(25);
  text("Go to next image", 420, 500);
  fill (125, 0, 125);
  rect(10, 20, 200, 50);
  fill(255);
  textSize(25);
  text("Back to Home", 30, 50);
}

void DisplayMajorCity(String Major_City) {
    int BANNER_SHIFT = 400;
    map_banner = loadImage("banner_image_transparent.png");
    map_banner.resize(500, 400);
    image(map_banner, 70+BANNER_SHIFT+20,-100);
    textSize(25);
    fill(0, 0, 0);
    text("Recommended:", 230+BANNER_SHIFT, 30);
    text(Major_City, 280+BANNER_SHIFT+15, 75);
    fill(0, 255, 0);
    rect(230+(BANNER_SHIFT*0.8), 110, 380, 420);
    fill(255);
    stroke(0);
    rect(25, 330, 400, 70);
    fill(0);
    text("Click on any image to explore the ", 45, 350);
    text("full set for the city. ", 45, 380);
    if (attraction_preference == false) {
      text("Top attractions: ", 270+(BANNER_SHIFT*0.75), 150);
      //println("YAYYYYYYYYYYYYYY");
      String[] lines = OutputAttractions("No preference", Major_City);
      int line_num = 1;
      for (String line: lines) {
        textSize(20);
        text(line, 270+(BANNER_SHIFT*0.75), 150+(line_num*30));
        line_num += 1;
      }
    }
    else {
      if (preferred_type.equals("Nature and Environment")) {
        text("Top nature attractions: ", 270+(BANNER_SHIFT*0.75), 150);
        String[] lines = OutputAttractions("Nature and Environment", Major_City);
        int line_num = 1;
        for (String line: lines) {
          text(line, 270+(BANNER_SHIFT*0.75), 150+(line_num*45));
          line_num += 1;
        }
      }
      else if (preferred_type.equals("History and Landmarks")) {
        text("Top history attractions: ", 270+(BANNER_SHIFT*0.75), 150);
        String[] lines = OutputAttractions("History and Landmarks", Major_City);
        int line_num = 1;
        for (String line: lines) {
          text(line, 270+(BANNER_SHIFT*0.75), 150+(line_num*45));
          line_num += 1;
        }
      }
      else if (preferred_type.equals("Day-to-day Culture")) {
        text("Top daily culture attractions: ", 270+(BANNER_SHIFT*0.75), 150);
        String[] lines = OutputAttractions("Day-to-day Culture", Major_City);
        int line_num = 1;
        for (String line: lines) {
          text(line, 270+(BANNER_SHIFT*0.75), 150+(line_num*45));
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
  
  void displayRecommended(ArrayList<String> to_be_displayed) {
    if (to_be_displayed.size() > 0) {
      DisplayMajorCity(to_be_displayed.get(recommended_display));
    }
    else {
      println("Sorry, But no recommendations have been made with the desired settings inputted");
    }
  }
}
