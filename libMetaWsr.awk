# Arquivo: libMetaWsr.awk
# Descrição: Colhe os metadados do projeto WSR.
@namespace "wsr";

# Verifica no path fornecido, os diretórios relevantes e chama as funções
# apropriadas para colher os metadados.
function awk::WSR(aPathFile, idx, tipo) {
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
