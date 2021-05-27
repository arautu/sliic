# Arquivo: libMetaWsr.awk
# Descrição: Colhe os metadados do projeto WSR.

# Verifica no path fornecido, os diretórios relevantes e chama as funções
# apropriadas para colher os metadados.
# Argumentos:
# * aPathFile - Array com pedaços do path.
# * idx - Índice de aPathFile, onde se encontra o nome do projeto.
# * tipo - Pode ser: "module" ou "useCase".
# Retorno:
# * Depende do argumento tipo. Se tipo = "module", então será retornado o
# módulo do projeto do qual o arquivo pertence. Se tipo = "useCase", retorna
# o caso de uso do mesmo arquivo.
function WSR(aPathFile, idx, tipo) {
  for (i in aPathFile) {
    switch (aPathFile[i]) {
      case /\<src\>/ :
        return getDetailsFromSrc(aPathFile, idx, tipo);
        break;
      case /\.jsp/:
        return getDetailsFromJsp(aPathFile, idx, tipo);
        break;
    }
  }
}

# Colhe os detalhes do diretório "src" do projeto.
# Argumentos:
# * aPathFile - Array com pedaços do path.
# * idx - Índice de aPathFile, onde se encontra o nome do projeto.
# * tipo - Pode ser: "module" ou "useCase".
# Retorno:
# * Depende do argumento tipo. Se tipo = "module", então será retornado o
# módulo do projeto do qual o arquivo pertence. Se tipo = "useCase", retorna
# o caso de uso do mesmo arquivo.
function getDetailsFromSrc(aPathFile, idx, tipo) {
  switch (tipo) {
    case "module" :
      if ((idx+5) >= length(aPathFile))
        return "";
      return aPathFile[idx+5];
    case "useCase" :
      if ((idx+6) >= length(aPathFile))
        return "";
      return aPathFile[idx+6];
    default :
      print "Erro: Módulo ou caso de uso não encontrado.";
      return "";
  }
}

# Colhe os detalhes do arquivo JSP.
# Argumentos:
# * aPathFile - Array com pedaços do path.
# * idx - Índice de aPathFile, onde se encontra o nome do projeto.
# * tipo - Pode ser: "module" ou "useCase".
# Retorno:
# * Depende do argumento tipo. Se tipo = "module", então será retornado o
# módulo do projeto do qual o arquivo pertence. Se tipo = "useCase", retorna
# o caso de uso do mesmo arquivo.
function getDetailsFromJsp(aPathFile, idx, tipo) {
  switch (tipo) {
    case "module" :
      if ((idx+4) >= length(aPathFile))
        return "";
      return aPathFile[idx+4];
    case "useCase" :
      return "jsp"; 
    default :
      print "Erro: Módulo ou caso de uso não encontrado.";
      return "";
  }
}
