# Arquivo: libLocProperties.awk
# Descrição: Localizar um determinado arquivo de dicionário (.properties) de um projeto
@include "libMetaWsr"
@namespace "properties";


BEGIN {
  findFiles("src");

}

BEGINFILE{
#  splitFilename();
  main();
}


function main() {
 projeto = "Sliic_ERP_Modulo_Configuracao";
 fileProperties = "Messages-business.properties"; 
 wset = "Sliic_ERP";
 a[1] = "sliic-erp/Sliic_ERP/Sliic_ERP_Modulo_Configuracao/webapp/i18n/messages-view.properties"
 a[2] = "sliic-erp/Sliic_ERP/Sliic_ERP_Modulo_Configuracao/webapp/i18n/messages-beans-relatorio.properties"
 a[3] = "sliic-erp/Sliic_ERP/Sliic_ERP_Modulo_Configuracao/webapp/i18n/messages-business.properties"
 a[4] = "sliic-erp/Sliic_ERP/Sliic_ERP_Modulo_Configuracao/webapp/i18n/messages-beans-configuracao.properties"
 file = "sliic-erp/Sliic_ERP/Sliic_ERP_Modulo_Configuracao/src/com/sliic/sliicerp/configuracao/controller/EmailContaCrud.java"
 file1 = "/home/leandro/Sliic/git/sliic-erp/Sliic_ERP/Sliic_ERP_Modulo_GestaoSeguranca/src/com/sliic/sliicerp/gestaoseguranca/bean/dto/AvisosTreinamentosMotoristaDTO.java"

#  print getFileProperties(projeto, fileProperties);
  parserFilePath("/home/leandro/Sliic/git/sliic-rastreamento/Sliic_Gateway/webapp/erro.jsp");

  for (i in msgs_paths)
    for (j in msgs_paths[i]) {
      if (msgs_paths[i][j] ~ wset) {
#        @wset();
      }
    }
}

function parserFilePath(absPathFile,    i, aPathFile, project) {
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
  print absPathFile;
  if (aMetaFile["wset"] != "") {
    for (i in aMetaFile) {
      print i, aMetaFile[i];
    }
  }
  else {
    printf "O arquivo '%s', não pertence a nenhum working set conhecido do projeto Sliic.", absPathFile;
    return -1;
  }
  return 0;
}

function awk::Sliic_Gateway(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function awk::Sliic_ERP_Beans(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function awk::Sliic_ERP_Modulo_Cadastro(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function awk::Sliic_ERP_Modulo_Comercial(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function awk::Sliic_ERP_Modulo_Configuracao(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function awk::Sliic_ERP_Modulo_Expedicao(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function awk::Sliic_ERP_Modulo_GestaoComportamental(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function awk::Sliic_ERP_Modulo_GestaoSeguranca(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function awk::Sliic_ERP_Modulo_GestaoSocioambiental(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function awk::Sliic_ERP_Modulo_GestaoViaria(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function awk::Sliic_ERP_Modulo_Integracao(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function awk::Sliic_ERP_Modulo_Operacional(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function awk::Sliic_ERP_Modulo_Rastreamento(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function awk::Sliic_ERP_Modulo_Relatorio(aPathFile, idx, tipo) {
  return WSR(aPathFile, idx, tipo);
}

function findFiles(path) {
  find = sprintf("find %s -name \"messages-*.properties\" -not -path *bin*", path);
  print find |& "sh";
  close("sh", "to");
  i = 0;

  while (("sh" |& getline) > 0) {
    msgs_paths[i][0] = "";
    split($0, msgs_paths[i], "/");
    i++;
  }
  close ("sh");

#  for (i in msgs_paths)
#    for (j in msgs_paths[i])
#      print msgs_paths[i][j];
}
