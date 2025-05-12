PImage home_page;
class Page {
  //FIELDS
  int page_num;
  boolean zoom;
  
  //CONSTRUCTOR
  Page() {
  }
  
  void displayPage(int page_num) {
   if(page_num == 1){
    home_page = loadImage("planInCan_Logo.jpg");
    home_page.resize(1000,550);
    image(home_page, 0, 0);
   }
  }
  void mouseClicked() {
  
  }


}
