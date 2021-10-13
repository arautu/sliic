# Arquivo: libChooseProperties.awk 
# Descrição: Escolhe entre os arquivos de dicionário, 
# "messages-view.properties", "messages-business.properties, etc, dependendo do
# projeto, módulo e caso de uso que o arquivo de dados pertence.

# Levando em consideração o projeto o qual o arquivo pertence, a função
# chama a função correspondente que vai saber qual arquivo de dicionário
# usar.
# Argumentos:
# * aMetaFile - Array com os meta dados obtidos do path do arquvivo.
# Retorno:
# * O nome do arquivo properties adequado para o arquivo presente em aMetaFile.
function chooseProperties(aMetaFile,     projeto) {
   projeto = "cpr_" aMetaFile["project"];
   return @projeto();
}

# Retorna o arquivo de dicionário apropriado do projeto em questão.
# Retorno
# * Nome do arquivo de dicionário
function cpr_Sliic_Gateway(   prop) {
  switch (aMetaFile["useCase"]) {
    case "jsp" :
      prop = "messages-app-view.properties";
      break;
    case "bean" :
      prop = "messages-app-bean.properties";
      break;
    default :
      prop = "messages-app-business.properties";
      break;
  }
  return prop;
}

function cpr_WSR(   prop) {
  return cpr_Sliic_Gateway();
}

function cpr_Sliic_ERP_Beans() {
  return "messages-commons" aMetaFile["module"] "-bean.properties"
}

function cpr_Sliic_ERP_Engine_Comportamento(   prop) {
  return cpr_Sliic_Gateway();
}

function cpr_Sliic_ERP_Engine_Vehicle_Physics(   prop) {
  switch (aMetaFile["useCase"]) {
    case "bean" :
      prop = "messages-app-bean.properties";
      break;
    default :
      prop = "messages-app-bean.properties";
      break;
  }
  return prop;
}

function cpr_Sliic_ERP_Modulo_Cadastro() {
  return cpr_Sliic_ERP_Modulo_Configuracao();
}

function cpr_Sliic_ERP_Modulo_Comercial() {
  return cpr_Sliic_ERP_Modulo_Configuracao();
}

function cpr_Sliic_ERP_Modulo_Configuracao(   prop) {
  switch (aMetaFile["useCase"]) {
    case "jsp" :
      prop = "messages-" aMetaFile["module"] "-view.properties";
      break;
    case "bean" :
      prop = "messages-" aMetaFile["module"] "-bean.properties";
      break;
    default :
      prop = "messages-" aMetaFile["module"] "-business.properties";
      break;
  }
  return prop;
}

function cpr_Sliic_ERP_Modulo_Expedicao() {
  return cpr_Sliic_ERP_Modulo_Configuracao();
}

function cpr_Sliic_ERP_Modulo_GestaoComportamental() {
  return cpr_Sliic_ERP_Modulo_Configuracao();
}

function cpr_Sliic_ERP_Modulo_GestaoSeguranca() {
  return cpr_Sliic_ERP_Modulo_Configuracao();
}

function cpr_Sliic_ERP_Modulo_GestaoSocioambiental() {
  return cpr_Sliic_ERP_Modulo_Configuracao();
}

function cpr_Sliic_ERP_Modulo_GestaoViaria() {
  return cpr_Sliic_Gateway();
}

function cpr_Sliic_ERP_Modulo_Integracao() {
  return cpr_Sliic_Gateway();
}

function cpr_Sliic_ERP_Modulo_Operacional() {
  return cpr_Sliic_ERP_Modulo_Configuracao();
}

function cpr_Sliic_ERP_Modulo_Rastreamento() {
  return cpr_Sliic_Gateway();
}

function cpr_Sliic_ERP_Modulo_Relatorio() {
  return cpr_Sliic_Gateway();
}
