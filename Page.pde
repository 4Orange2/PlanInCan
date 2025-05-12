PImage home_page;
class Page {
  //FIELDS
  int page_num;
  boolean zoom;
  
  //CONSTRUCTOR
  Page() {
  }
  
  //Methods
  void displayPage() {
    home_page = loadImage("planInCan_Logo.jpg");
    home_page.resize(1000,550);
    image(home_page, 0, 0);
    
  
}
  
  
  
  void mouseClicked() {
  
  }


}
