# Arquivo: libConvIsoUtf.awk
# Descrição: Trata da conversão do tipo de encode do arquivo.

function convertUtf8ToIso8859() {
    
  printf "iconv -c -f iso-8859-1 -t utf8 %1$s > %1$s.utf8\n", FILENAME | "sh";
  close ("sh");
  
}

function convertIso8859ToUtf8() {
  
  printf "iconv -c -f utf8 -t iso-8859-1 %1$s.utf8 > %1$s\n", FILENAME | "sh";
  close ("sh");
  
}

  
