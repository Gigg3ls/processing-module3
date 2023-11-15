color zwart = color(0);
color blauw = color(0, 0, 255);
color wit = color(255);
color groen = color(0, 255, 0);
color rood = color(255, 0, 0);

int packadgeStartKleur = wit;
int kleur = packadgeStartKleur;
int landingZoneStartY = 0;
int packageX = 0;
int packageSpeed = 2;
int packageHeight = 50;
int packageWidth = 50;
int packageDelay = 100;

float landingZoneStartX;
float landingZoneWidth;

void setup() {
  size(500, 500);
}

void draw() {
  background(zwart);
  // landing zone
   landingZoneStartX = 2 * width / 3;
   landingZoneWidth = width / 3;
  fill(blauw);
  rect(landingZoneStartX, landingZoneStartY, landingZoneWidth, height);
  
  // package
  fill(kleur);
  rect(packageX, height / 2 , packageWidth, packageHeight);
  packageX += packageSpeed;
  if (packageX > width + packageDelay) {
    packageX = -packageWidth;
    kleur = packadgeStartKleur;
    }
}

void mousePressed(){
  float landingZoneStart = landingZoneStartX - packageWidth;
  boolean mouseInPackage = mouseX >= packageX && mouseX <= packageX + packageWidth &&
                           mouseY >= height / 2 && mouseY <= height / 2 + packageHeight;
  
  if (mouseInPackage) {
      if (kleur == packadgeStartKleur) {
          kleur = rood;
      } else if (kleur == rood) {
                 kleur = packadgeStartKleur;
                }
      if (mouseInPackage && packageX >= landingZoneStart) {
          kleur = groen;
          }
      }
}
