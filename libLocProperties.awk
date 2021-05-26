# Arquivo: libLocProperties.awk
# Descrição: Localizar um determinado arquivo de dicionário (.properties) de um projeto
@include "libParserFilePath";
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
  awk::parserFilePath("/home/leandro/Sliic/git/sliic-rastreamento/Sliic_Gateway/webapp/erro.jsp");

  for (i in msgs_paths)
    for (j in msgs_paths[i]) {
      if (msgs_paths[i][j] ~ wset) {
#        @wset();
      }
    }
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
