# Arquivo: libAbsolutePath.awk
# Descrição: Encontra o caminho absoluto para os projetos Sliic. 

# Verifica se todos os arquivos fontes estão em absPath. 
# Parâmetros:
# * filePath - Caminho de um arquivo usado como referência.
# Retorno:
# * Retorna o path absoluto para os projetos Sliic. 
function absolutePath(filePath) {
  absPath = aba_pathToSliicProjects(filePath);
  if (!absPath) {
    return "";
  }
  for (i=1; i<ARGC; i++) {
    if (match(ARGV[i], absPath) == 0) {
      printf "Erro: Arquivo %s não pertence ao path %s\n", ARGV[i], absPath;
    }
    else {
      return absPath;
    }
  }
}

# Obtém o path comum para os projetos Sliic.
# Parâmetros:
# * filePath - Caminho de um arquivo usado como referência.
# Retorno:
# * Path até os projetos Sliic. 
function aba_pathToSliicProjects(filePath) {
  if (match(filePath, /\<Sliic_ERP\>|\<Sliic_ERP_Clientes\>|\<sliic-rastreamento\>/)) {
    absPath = substr(filePath, 1, RSTART-1);
    gsub(/(\/$)|\s/, "", absPath);
  }
  else {
    print "Erro:Não é um projeto sliic."
  }
  return absPath;
}
