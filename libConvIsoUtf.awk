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

# Converte encodes de UTF-8 para ISO8859-1
function convertUtf8ToIso8859(  oldfilename) {
  if (FILENAME ~ ".utf8") {
    oldfilename = ARGV[ARGIND - 1];
    printf "iconv -c -f utf8 -t iso-8859-1 %1$s.utf8 > %1$s\n", oldfilename | "sh";
    printf "rm %s", FILENAME | "sh";
    close ("sh");
  }
}
