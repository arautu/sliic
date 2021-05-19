#!/bin/awk -f

@include "libConvIsoUtf";

BEGIN {
  print "opa";
}

BEGINFILE {
  if (FILENAME !~ ".utf8") {
    convertIso8859ToUtf8();
    rewind();
  }
  
  for (i in ARGV) {
    
    printf "ARGV[%d]=%s\n", i, ARGV[i];
    
  }
  printf "ARGC=%d\n",ARGC;
  printf "ARGIND=%s\n",ARGIND;
}

ENDFILE {
  convertUtf8ToIso8859();
}
