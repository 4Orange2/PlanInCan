PImage home_page;
PImage canada_map;
PImage map_banner;

class Page {
  //FIELDS
  int page_num;
  boolean zoom;
  Map Canada = new Map();
  Plan Recommended = new Plan();
  
  //CONSTRUCTOR
  Page() {}
  
  //Methods
  void displayPage(int page_num) {
    if (page_num == 1) {
      home_page = loadImage("planInCan_Logo_transparent.png");
      home_page.resize(300, 150);
      image(home_page, 700, 0);
      map_banner = loadImage("banner_image_transparent.png");
      map_banner.resize(500, 400);
      image(map_banner,-50,-20);
      fill(0);
      textSize(20);
      text("What is PlanInCan?", 110, 152);
      fill(0,0,100);
      rect(10, 195, 375, 290);
      fill(255, 165, 0);
      strokeWeight(4);
      textSize(23);
      int start_Home_space = 220;
      int in_between_space = 30;
      text("We all want to make our travels local", 20, start_Home_space);
      text("to Canada nowadays!", 20, start_Home_space+in_between_space*1);
      text("But where exactly do you want to", 20, start_Home_space+in_between_space*2);
      text("travel? Have no fear, because", 20, start_Home_space+in_between_space*3);
      text("PlanInCan is here. Whether you are", 20, start_Home_space+in_between_space*4);
      text("looking to budget a travel,", 20, start_Home_space+in_between_space*5);
      text("build a travel plan completely from", 20, start_Home_space+in_between_space*6);
      text("scratch or are looking from activities", 20, start_Home_space+in_between_space*7);
      text("to do on the trip, it's got your back.", 20, start_Home_space+in_between_space*8);
      canada_map = loadImage("Canada_Map.png");
      canada_map.resize(600, 300);
      image(canada_map, 380, 150);
      textSize(20);
      text("Click on the image of the Canada Map to view", 500, 475);
      text("specific cities!", 600, 500);
    }
    else if (page_num == 2) {
      home_page = loadImage("planInCan_Logo_transparent.png");
      home_page.resize(150, 75);
      image(home_page, 850, 0);
      map_banner = loadImage("banner_image_transparent.png");
      map_banner.resize(500, 400);
      image(map_banner,-50,-120);
      fill(0);
      textSize(20);
      text("Recommendation Page", 80, 50);
      fill(0,0,100);
      rect(10, 100, 530, 100);
      fill(255, 165, 0);
      strokeWeight(4);
      textSize(23);
      int start_Home_space = 130;
      int in_between_space = 30;
      text("You do not have fill in an answer for every question.", 20, start_Home_space);
      text("If no answer is given, then the question will not be", 20, start_Home_space+in_between_space*1);
      text("accounted for in the recommendations generated.", 20, start_Home_space+in_between_space*2);
      if (recommended_viewing == true) {
        Recommended.displayRecommended(to_be_displayed);
      }
    }
    else if (page_num == 4) {
      Canada.displayAll();
    }
  }
}
