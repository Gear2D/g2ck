/* This executable is created so we have a cross-platform way of asking the user the name
 * of its project */
#include <stdio.h>
#include <string.h>
#include <ctype.h>

/* read a string from stdin */
void readstring(char * target, unsigned int size);

/* check if a string is alpha numerical */
int isstralnum(const char * t);

int main(int argc, char ** argv) {
  char name[255];

  do {
    fprintf(stderr, "-- Type the name of your project (alpha numeric digits): ");
    readstring(name, sizeof(name));
    if (!isstralnum(name)) {
      fprintf(stderr, "-- Error: Use only alpha numerical digits!\n%s not accepted!\n", name);
      *name = '\0';
    }
  } while (*name == '\0');
  
  printf("%s", name);
  return 0;
}

/* ------ functions ------- */
void readstring(char * target, unsigned int size) {
  char * s = target;
  while (
    ((*s = fgetc(stdin)) != '\n') &&
    (*s != '\0')                  && 
    (!feof(stdin))                &&
    ++s < target + size -1
  );
  *s = 0;
}

int isstralnum(const char * t) {
  while (isalnum(*t) && (*t++ != '\0'));
  return *t == '\0'; // it is alphanumerical if we reached the end.
}
