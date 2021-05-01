#include <stdio.h>
#include <dirent.h>

void listOf(char * k)
{
  struct dirent *x;
  DIR *toLS = opendir(k);
  if(toLS)
  {
    for(int i = 0; i < 2; i++)
      readdir(toLS);
    while((x = readdir(toLS)) != NULL)
      printf("%s\n", x->d_name);
    closedir(toLS);
  }
  else
    perror("1");
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
