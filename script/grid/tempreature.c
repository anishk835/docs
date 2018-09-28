#include <stdio.h>

int main() {
  float t[31][31];
  int i, j, k;
  FILE * fin, * fout;
  fin = fopen("/Users/anishkumar/Downloads/Maxtemp_MaxT_2020.GRD", "rb"); // Input file
  fout = fopen("/Users/anishkumar/Downloads/Maxtemp_MaxT_2020.txt", "w"); // Output file
  fprintf(fout, "Max Tempereture for 2020\n");
  if (fin == NULL) {
    printf("Can't open file");
    return 0;
  }
  if (fout == NULL) {
    printf("Can't open file");
    return 0;
  }
  for (k = 0; k < 366; k++) {
    fread( & t, sizeof(t), 1, fin);
    if (k == 105) {
      for (i = 0; i < 31; i++) {
        fprintf(fout, "\n");
        for (j = 0; j < 31; j++)
          fprintf(fout, "%6.2f", t[i][j]);
      }
    }
  }
  fclose(fin);
  fclose(fout);
  return 0;
} /* end of main */