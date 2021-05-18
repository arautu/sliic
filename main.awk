#!/bin/awk -f

@include "libConvIsoUtf";

BEGIN {
  print "opa";
}

BEGINFILE {
  print "main.awk";
  convertUtf8ToIso8859();
  
  for (i in ARGV) {
    
    printf "ARGV[%d]=%s\n", i, ARGV[i];
    
  }
  printf "ARGC=%d\n",ARGC;
  printf "ARGIND=%s\n",ARGIND;
}
