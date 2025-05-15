PImage home_page;
PImage canada_map;
class Page {
  //FIELDS
  int page_num;
  boolean zoom;
  
  //CONSTRUCTOR
  Page() {}
  
  //Methods
  void displayPage(int page_num) {
    if (page_num == 1) {
      home_page = loadImage("planInCan_Logo_transparent.png");
      home_page.resize(150, 75);
      image(home_page, 850, 0);
      fill(255, 165, 0);
      strokeWeight(4);
      textSize(13);
      text("We all want to make our travels local to Canada nowadays!", 10, 220);
      text("But where exactly do you want to travel?", 10, 245);
      text("Have no fear, because PlanInCan is here.", 10, 270);
      text("Whether you are looking to budget a travel,", 10, 295);
      text("build a travel plan completely from scratch,", 10, 320);
      text("or are looking from activities to do on the trip,", 10, 345);
      canada_map = loadImage("Canada_Map.png");
      canada_map.resize(600, 300);
      image(canada_map, 380, 150);
      text("Click on the image of the Canada Map to view", 600, 450);
      text("specific cities!", 600, 475);
    }
    else if (page_num == 2) {
      home_page = loadImage("planInCan_Logo_transparent.png");
      home_page.resize(150, 75);
      image(home_page, 850, 0);
    }
    else if (page_num == 4) {
      canada_map = loadImage("Canada_Map.png");
      pushMatrix();
      canada_map.resize(int(1000*zoomFactor), int(550*zoomFactor));
      image(canada_map, width/2, height/2);
      popMatrix();
    }
  }
  
  void mouseClicked() {}
}
