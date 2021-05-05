#include <stdio.h>
#include <dirent.h>

void listOf(char * k)
{
  struct dirent *x;
  DIR *toLS = opendir(k);
  if(toLS)
  {
    for(int i = 0; i < 2; i++) // The first two (2) entries,
      readdir(toLS);           // ../ and ./, are junked.
    while((x = readdir(toLS)) != NULL) // The program stops after reading all
      printf("%s\n", x->d_name);       // directory entries.
    closedir(toLS);
  }
  else
    perror("1");
  //The program throws a fit if an invalid directory is specified.
}

int main(int argc, char ** argv)
{
  if(argc > 1)
    for(unsigned int i = 0; i < argc; i++)
        listOf(argv[i]);
  else
    listOf(".");
  return 0;
}
