# Arquivo: libParserFilePath.awk
  
@include "sliic/libMetaWsr"

# Analisa o caminho do arquivo, retornando um array de metadados do path.
# Argumentos:
# * absPathFile - caminho absoluto para o nome do arquivo, no formato: xxx/yyy/arquivo.ttt 
# Retorno: 
# * aMetaFile - Array com os metadados do arquivo.
#   + aMetaFile["wset"] - working set que o arquivo pertence.
#   + aMetaFile["project"] - projeto que o arquivo pertence.
#   + aMetaFile["module"] - Módulo que o arquivo pertence.
#   + aMetaFile["useCase"] - Caso de uso do arquivo.
#   + aMetaFile["file"] - Nome do arquivo.
function parserFilePath(absPathFile, aMetaFile,    i, aPathFile, project) {
  pfp_init();
  split(absPathFile, aPathFile, "/");
  for (i = 1; i < length(aPathFile); i++) {
    if (aPathFile[i] ~ /(\<Sliic_ERP\>|\<Sliic_ERP_Clientes\>|\<mirror-nextframework\>|\<sliic-auxiliares\>|\<sliic-frameworks\>|\<sliic-rastreamento\>)/) {
      break;
    }
    else {
      delete aPathFile[i];
    }
  }
  aMetaFile["wset"] = aPathFile[i];
  delete aPathFile[i++];
  project = aMetaFile["project"] = aPathFile[i];
  aMetaFile["module"] = @project(aPathFile, "module");
  aMetaFile["useCase"] = @project(aPathFile, "useCase");
  aMetaFile["file"] = aPathFile[i + length(aPathFile) - 1];
  sub(/\..*/, "", aMetaFile["file"]);
  if (aMetaFile["wset"] == "") {
    printf "O arquivo '%s', não pertence a nenhum working set conhecido do projeto Sliic.\n",
           absPathFile > "/dev/tty";
    return -1;
  }
  pfp_end();
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
function Sliic_Gateway(aPathFile, tipo) {
  return WSR(aPathFile, tipo);
}

function Sliic_ERP_Beans(aPathFile, tipo) {
  return WSR(aPathFile, tipo);
}

function Sliic_ERP_Modulo_Cadastro(aPathFile, tipo) {
  return WSR(aPathFile, tipo);
}

function Sliic_ERP_Modulo_Comercial(aPathFile, tipo) {
  return WSR(aPathFile, tipo);
}

function Sliic_ERP_Modulo_Configuracao(aPathFile, tipo) {
  return WSR(aPathFile, tipo);
}

function Sliic_ERP_Modulo_Expedicao(aPathFile, tipo) {
  return WSR(aPathFile, tipo);
}

function Sliic_ERP_Modulo_GestaoComportamental(aPathFile, tipo) {
  return WSR(aPathFile, tipo);
}

function Sliic_ERP_Modulo_GestaoSeguranca(aPathFile, tipo) {
  return WSR(aPathFile, tipo);
}

function Sliic_ERP_Modulo_GestaoSocioambiental(aPathFile, tipo) {
  return WSR(aPathFile, tipo);
}

function Sliic_ERP_Modulo_GestaoViaria(aPathFile, tipo) {
  return WSR(aPathFile, tipo);
}

function Sliic_ERP_Modulo_Integracao(aPathFile, tipo) {
  return WSR(aPathFile, tipo);
}

function Sliic_ERP_Modulo_Operacional(aPathFile, tipo) {
  return WSR(aPathFile, tipo);
}

function Sliic_ERP_Modulo_Rastreamento(aPathFile, tipo) {
  return WSR(aPathFile, tipo);
}

function Sliic_ERP_Modulo_Relatorio(aPathFile, tipo) {
  return WSR(aPathFile, tipo);
}

function pfp_init() {
  if ("sorted_in" in PROCINFO) {
    pfp_save_sorted = PROCINFO["sorted_in"];
    PROCINFO["sorted_in"] = "@ind_num_asc"; 
  }
}

function pfp_end() {
  if (save_sorted) {
    PROCINFO["sorted_in"] = save_sorted;
  }
}
