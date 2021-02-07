argz <- commandArgs(trailingOnly=TRUE);
k <- read.delim(argz[1],sep="\n",quote="");
i <- 1;
while(i <= lengths(k))
{
    cat(sprintf(k[i,1]));
    cat(sprintf("\n"));
    i <- i + 1;
}
