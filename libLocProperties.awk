# Arquivo: libLocProperties.awk
# Descrição: Localizar um determinado arquivo de dicionário (.properties) de um projeto
@include "libParserFilePath";
@include "libChooseProperties";

BEGIN {
  findFiles("src", msgs_paths);
}

BEGINFILE{
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

  locProperties("/home/leandro/Sliic/git/sliic-erp/Sliic_ERP/Sliic_ERP_Modulo_Configuracao/src/com/sliic/sliicerp/configuracao/bean/dto/AvisoDTO.java");
}

function locProperties(absPathFile,     fileProperties, pathFileProperties) {
  parserFilePath(absPathFile, aMetaFile);
  fileProperties = chooseProperties(aMetaFile);
  for (i in msgs_paths) {
    if (msgs_paths[i] ~ aMetaFile["project"] && msgs_paths[i] ~ fileProperties) {
      pathFileProperties = msgs_paths[i];
    }
  }
  print "pathFileProperties", pathFileProperties;
}

function findFiles(path, msgs_paths,    i) {
  find = sprintf("find %s -name \"messages-*.properties\" -not -path *bin*", path);
  print find |& "sh";
  close("sh", "to");

  while (("sh" |& getline) > 0) {
    msgs_paths[i++] = $0
  }
  close ("sh");
}
