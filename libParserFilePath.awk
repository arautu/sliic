# Arquivo: libParserFilePath.awk
  
@include "libMetaWsr"

# Analisa o caminho do arquivo, retornando um array de metadados do path.
# Argumentos:
# * absPathFile - caminho absoluto para o nome do arquivo, no formato: xxx/yyy/arquivo.ttt 
# Retorno: 
# * aMetaFile - Array com os metadados do arquivo.
function parserFilePath(absPathFile, aMetaFile,    i, aPathFile, project) {
  split(absPathFile, aPathFile, "/");
  for (i in aPathFile) {
    if (aPathFile[i] ~ /(\<Sliic_ERP\>|\<Sliic_ERP_Clientes\>|\<mirror-nextframework\>|\<sliic-auxiliares\>|\<sliic-frameworks\>|\<sliic-rastreamento\>)/) {
      aMetaFile["wset"] = aPathFile[i++];
      project = aMetaFile["project"] = aPathFile[i];
      aMetaFile["module"] = @project(aPathFile, i, "module");
      aMetaFile["useCase"] = @project(aPathFile, i, "useCase");
      aMetaFile["file"] = aPathFile[length(aPathFile)];
      break;
    }
  }
  if (aMetaFile["wset"] == "") {
    printf "O arquivo '%s', não pertence a nenhum working set conhecido do projeto Sliic.", absPathFile;
    exit 1;
  }
  return 0;
}

# Completa os metadados com os detalhes do projeto em questão.
# Argumentos:
# * aPathFile - Array com pedaços do path.
# * idx - Índice de aPathFile, onde se encontra o nome do projeto.
# * tipo - Pode ser: "module" ou "useCase".
# Retorno:
# * Depende do argumento tipo. Se tipo = "module", então será retornado o
# módulo do projeto do qual o arquivo pertence. Se tipo = "useCase", retorna
# o caso de uso do mesmo arquivo.
#
# **Observe** que ela usa a função WSR(), porém, caso haja alguma diferença,
# deve-se criar uma lib semelhante à libMetaWsr. 
function Sliic_Gateway(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function Sliic_ERP_Beans(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function Sliic_ERP_Modulo_Cadastro(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function Sliic_ERP_Modulo_Comercial(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function Sliic_ERP_Modulo_Configuracao(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function Sliic_ERP_Modulo_Expedicao(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function Sliic_ERP_Modulo_GestaoComportamental(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function Sliic_ERP_Modulo_GestaoSeguranca(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function Sliic_ERP_Modulo_GestaoSocioambiental(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function Sliic_ERP_Modulo_GestaoViaria(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function Sliic_ERP_Modulo_Integracao(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function Sliic_ERP_Modulo_Operacional(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function Sliic_ERP_Modulo_Rastreamento(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function Sliic_ERP_Modulo_Relatorio(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}
