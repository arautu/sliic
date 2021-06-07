# Arquivo: libConvIsoUtf.awk
# Descrição: Trata da conversão do tipo de encode do arquivo.

# Converte encodes de ISO8859-1 para UTF-8.
function convertIso8859ToUtf8() {
  if (FILENAME !~ ".utf8") {
    printf "iconv -c -f iso-8859-1 -t utf8 %1$s > %1$s.utf8\n", FILENAME | "sh";
    close ("sh");
    rewind();
  }
}

# Coloca a versão utf-8 do mesmo arquivo no array ARGV.
function rewind(  i) {
  for (i = ARGC; i > ARGIND; i--) {
    ARGV[i] = ARGV[i-1];
  }
  ARGC++
  ARGV[ARGIND+1] = FILENAME ".utf8";
  nextfile;
}

function renameFiles() {
  

}

# Converte encodes de UTF-8 para ISO8859-1
function convertUtf8ToIso8859(  i) {
  for (i = 0; i <= ARGC; i++) {
    if (ARGV[i] ~ ".utf8") {
      printf "iconv -c -f utf8 -t iso-8859-1 %s > %s\n", ARGV[i], ARGV[i-1] | "sh";
      printf "rm %s", ARGV[i] | "sh";
      close ("sh");
    }
  }
}
