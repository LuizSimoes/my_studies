/***************************************************\
|  Classic game theme                               |
|  -> Super Mario Bros                              |
|                                                   |
|  -> 8-ohm speaker from digital pino 11 e o terra; |
|                                                   |
|                                                   |
\***************************************************/

#include "pitches.h"

// Indica a duraÃ§Ã£o das notas, ex: colcheia -> tr = 4, ...
#define se 6
#define tr 4
#define co 3
// Define a velocidade de reprodução, quanto menor mais rÃ¡pido...
#define SMbpm 150

// As notas...
int tonesA[] = {NOTE_E5, NOTE_E5,0,NOTE_E5,0, NOTE_C5, NOTE_E5,0, NOTE_G5,0,0, NOTE_G4,0,0};
int tonesB[] = {NOTE_C5,0,0, NOTE_G4,0,NOTE_E4,0,0,NOTE_A4,0, NOTE_B4,0,NOTE_AS4, NOTE_A4,0,NOTE_G4,NOTE_E5,NOTE_G5,NOTE_A5,0,NOTE_F5,NOTE_G5,0,NOTE_E5,0,NOTE_C5,NOTE_D5,NOTE_B4,0};
int tonesC[] = {NOTE_C3,0,NOTE_G5,NOTE_FS5,NOTE_F5,NOTE_DS5,NOTE_C4,NOTE_E5,NOTE_F3,NOTE_GS4,NOTE_A4,NOTE_C5,NOTE_C4,NOTE_A4,NOTE_C5,NOTE_D5};
int tonesD[] = {NOTE_C3,0,NOTE_G5,NOTE_FS5,NOTE_F5,NOTE_DS5,NOTE_G3,NOTE_E5,0,NOTE_C6,0,NOTE_C6,NOTE_C6,0,NOTE_G3,0};
int tonesE[] = {NOTE_C3,0,NOTE_DS5,0,0,NOTE_D5,0,NOTE_C5,0,0,NOTE_G3,NOTE_G3,0,NOTE_C3,0};
int tonesF[] = {NOTE_C5,NOTE_C5,0,NOTE_C5,0,NOTE_C5,NOTE_D5,0,NOTE_E5,NOTE_C5,0,NOTE_A4,NOTE_G4,0,NOTE_G2,0};
int tonesG[] = {NOTE_C5,NOTE_C5,0,NOTE_C5,0,NOTE_C5,NOTE_D5,NOTE_E5,NOTE_F3,0,0,NOTE_C3,0,NOTE_G2,0};
int tonesH[] = {NOTE_E5,NOTE_E5,0,NOTE_E5,0,NOTE_C5,NOTE_E5,0,NOTE_G5,0,0,NOTE_G4,0,0};
int tonesI[] = {NOTE_E5,NOTE_C5,0,NOTE_G4,NOTE_G3,0,NOTE_GS4,0,NOTE_A4,NOTE_F5,NOTE_F3,NOTE_F5,NOTE_A4,NOTE_C4,NOTE_F3,0};
int tonesJ[] = {NOTE_B4,NOTE_A5,NOTE_A5,NOTE_A5,NOTE_G5,NOTE_F5,NOTE_E5,NOTE_C5,NOTE_G3,NOTE_A4,NOTE_G4,NOTE_C4,NOTE_G3,0};
int tonesK[] = {NOTE_B4,NOTE_F5,0,NOTE_F5,NOTE_F5,NOTE_E5,NOTE_D5,NOTE_C5,NOTE_E4,NOTE_G3,NOTE_E4,NOTE_C4,0,0};

// ... e respectivas durações
int durationA[] = {co,co,co,co,co,co,co,co,co,co,se,co,co,se};
int durationB[] = {co,co,co,co,se,co,co,co,co,co,co,co,co,co,co,tr,tr,tr,co,co,co,co,co,co,co,co,co,co,se};
int durationC[] = {co,co,co,co,co,co,co,co,co,co,co,co,co,co,co,co};
int durationD[] = {co,co,co,co,co,co,co,co,co,co,co,co,co,co,co,co};
int durationE[] = {co,co,co,co,co,co,se,co,co,co,co,co,co,co,co};
int durationF[] = {co,co,co,co,co,co,co,co,co,co,co,co,co,co,co,co};
int durationG[] = {co,co,co,co,co,co,co,co,co,co,co,co,se,co,co};
int durationH[] = {co,co,co,co,co,co,co,co,co,co,se,co,co,se};
int durationI[] = {co,co,co,co,co,co,co,co,co,co,co,co,co,co,co,co};
int durationJ[] = {tr,tr,tr,tr,tr,tr,co,co,co,co,co,co,co,co};
int durationK[] = {co,co,co,co,tr,tr,tr,co,co,co,co,co,co,se};

// Melodia do Super Mario em termos de faixas
char melody[] = "abbcdcecdcefgfhbbijikijikfgfhijik";

// Número de notas
int numberA = 14;
int numberB = 29;
int numberC = 16;
int numberD = 16;
int numberE = 15;
int numberF = 16;
int numberG = 15;
int numberH = 14;
int numberI = 16;
int numberJ = 14;
int numberK = 14;
int melodynum = 33;

// Define o pin para ligar o piezo
int piezopin = 11; 

// FunÃ§Ã£o que recebe uma faixa (notas e durações) e o número de notas
void play(int tones[], int duration[], int number, int bpm){
  int i;
  
  for (i = 0; i < number; i++) {

    int lenght = bpm*duration[i];
    tone(piezopin, tones[i],lenght);

    // Pausas para que as notas nÃ£o fiquem coladas umas Ã s outras
    if(duration[i]==se)
      delay(bpm/0.5);
    if(duration[i]==tr)
      delay(bpm/.75);
    if(duration[i]==co)
      delay(bpm);
    
    // PÃ¡ra de tocar a nota
    noTone(piezopin);
   }
}

// FunÃ§Ã£o que recebe uma string que contÃ©m as faixas para criar uma música (e o seu tamanho)
void playall(char melody[], int num){
  
  int i;
  
  for(i=0;i<num;i++){
  
    if(melody[i]=='a')
      play(tonesA, durationA, numberA, SMbpm);
    if(melody[i]=='b')
      play(tonesB, durationB, numberB, SMbpm);
    if(melody[i]=='c')
      play(tonesC, durationC, numberC, SMbpm);
    if(melody[i]=='d')
      play(tonesD, durationD, numberD, SMbpm);
    if(melody[i]=='e')
      play(tonesE, durationE, numberE, SMbpm);
    if(melody[i]=='f')
      play(tonesF, durationF, numberF, SMbpm);
    if(melody[i]=='g')
      play(tonesG, durationG, numberG, SMbpm);
    if(melody[i]=='h')
      play(tonesH, durationH, numberH, SMbpm);
    if(melody[i]=='i')
      play(tonesI, durationI, numberI, SMbpm);
    if(melody[i]=='j')
      play(tonesJ, durationJ, numberJ, SMbpm);
    if(melody[i]=='k')
      play(tonesK, durationK, numberK, SMbpm);
    }
}

void setup() {
  playall(melody,melodynum);  
}

void loop() {
}
