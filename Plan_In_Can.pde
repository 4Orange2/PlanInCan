import g4p_controls.*;
Page display_item;

int page_num = 1;
int previous_page = 0;
boolean home_open = false;
boolean recommended_open = false;

void setup(){
  size(1000, 550);
  display_item = new Page();
}



void draw(){
  background(255);
  if (page_num != previous_page) {
    createGUI(page_num);
    previous_page = page_num;
  }
  else if (page_num == previous_page) {}
  display_item.displayPage(page_num);
  delay(1000);
}

void mouseClicked() {
  if (((mouseX > 600) && (mouseX < 980)) && ((mouseY > 300) && (mouseY < 450))) {
    page_num = 4;
  }
}

float zoomFactor = 1;


void mouseWheel(MouseEvent event) {
  int delta = event.getCount();  // Get the scroll amount (delta)
  if (delta > 0) {
    // Zoom in (positive delta)
    zoomFactor += 0.1; // Adjust zoom level (example: +0.1)
  } 
  else if (delta < 0) {
      // Zoom out (negative delta)
      if ((zoomFactor - delta) >= 1) {
        zoomFactor -= 0.1; // Adjust zoom level (example: -0.1)
      }
      else {}
    }
  }
