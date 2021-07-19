# Arquivo: libInsertTaglib.awk
# Descrição: Verifica a existência de uma determinada taglib e insere, caso 
#            não exista.
# == Exemplo de uso: ==
# /taglib/ {
#   insereTaglib();
# }
# /t:listView/ {
#  nextTagLib = "<%@ taglib prefix=\"n\" uri=\"http://www.nextframework.org/tag-lib/next\"%>";
#  checkTaglib(nextTagLib);

# == Lista de variáveis estáticas ==
# pjp_taglib: Instrução contendo a taglib que será procurada ou incluída.
# pjp_addTaglib: Variável que assume 1 quando se deve adicionar a libtag ou 0
#   caso contrário.
# pjp_checkTaglib: Variável que assume 1 se a procura pela taglib já foi
#   feita ou 0 caso contrário.

BEGINFILE {
  pjp_addTaglib;
  pjp_checkTaglib = "";
}

# Verifica a existência de 'taglib' e caso não exista faz os preparativos
# para inseri-la.
# Argumentos:
# * taglib: ex: <%@ taglib prefix="n" uri="http://www.nextframework.org/tag-lib/next"%>
# Retorno:
# * Retorna '1' caso a taglib é encontrada, '0', caso contrário e '-1' em caso haja erro.
function checkTaglib(taglib) {
  if (!pjp_checkTaglib) {
    pjp_taglib = taglib;
    uri = pjp_getUri();
    if (uri) {
      pjp_checkTaglib = 1;
      if (!pjp_existeTaglib(uri)) {
        pjp_addTaglib = 1;
        if ("inplace::begin" in FUNCTAB) {
          pjp_rewind();
        }
      }
    }
    else {
      print "Erro: Taglib não reconhecida";
      return -1;
    }
  }
  return !pjp_addTaglib;
}

# Adiciona a taglib abaixo da linha corrente.
function insereTaglib() {
  if (pjp_addTaglib) {
    $0 = sprintf("%s%s%s", $0, RT, pjp_taglib);
    pjp_addTaglib = "";
  }
}

# Adiciona novamente o arquivo de dados, para que seja possível adicionar a
# taglib no início do arquivo.
function pjp_rewind(  i) {
  for (i = ARGC; i > ARGIND; i--) {
    ARGV[i] = ARGV[i-1];
  }
  ARGC++;
  ARGV[ARGIND+1] = ARGV[ARGIND];
}

# Verifica a existẽncia da taglib.
# Argumentos:
# * uri: ex. http://www.nextframework.org/tag-lib/next
# Retorno:
# * Retorna '1' caso exista e '0', caso contrário
function pjp_existeTaglib(uri,   tmp, existeTaglib) {
  do {
    getline tmp < ARGV[ARGIND];
    if (tmp ~ uri) {
      existeTaglib = 1;
    }
  } while (tmp ~ "taglib")
  close(ARGV[ARGIND]);

  return existeTaglib;
}

# Obtém a uri da instrução de taglib.
function pjp_getUri(   uri) {
  if (split(pjp_taglib, splitedTag, "=") > 1) {
    for (i in splitedTag) {
      if (splitedTag[i] ~ "uri") {
        uri = splitedTag[i+1];
        uri = gensub(/("[^"]+")(.+)/,"\\1", 1, uri);
        gsub(/"/, "", uri);
      }
    }
    return uri;
  }
}
