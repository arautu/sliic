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
function chooseProperties(aMetaFile,     prop) {
  switch (aMetaFile["project"]) {
    case "Sliic_Gateway" :
      prop = cpr_Sliic_Gateway();
      break;
    case "WSR" :
      prop = cpr_WSR();
      break;
    case "Sliic_ERP_Beans" :
      prop = cpr_Sliic_ERP_Beans();
      break;
    case "Sliic_ERP_Engine_Comportamento" :
      prop = cpr_Sliic_ERP_Engine_Comportamento();
      break;
    case "Sliic_ERP_Modulo_Cadastro" :
      prop = cpr_Sliic_ERP_Modulo_Cadastro();
      break;
    case "Sliic_ERP_Modulo_Comercial" :
      prop = cpr_Sliic_ERP_Modulo_Comercial();
      break;
    case "Sliic_ERP_Modulo_Configuracao" :
      prop = cpr_Sliic_ERP_Modulo_Configuracao();
      break;
    case "Sliic_ERP_Modulo_Expedicao" :
      prop = cpr_Sliic_ERP_Modulo_Expedicao();
      break;
    case "Sliic_ERP_Modulo_GestaoComportamental" :
      prop = cpr_Sliic_ERP_Modulo_GestaoComportamental();
      break;
    case "Sliic_ERP_Modulo_GestaoSeguranca" :
      prop = cpr_Sliic_ERP_Modulo_GestaoSeguranca();
      break;
    case "Sliic_ERP_Modulo_GestaoSocioambiental" :
      prop = cpr_Sliic_ERP_Modulo_GestaoSocioambiental();
      break;
    case "Sliic_ERP_Modulo_GestaoViaria" :
      prop = cpr_Sliic_ERP_Modulo_GestaoViaria();
      break;
    case "Sliic_ERP_Modulo_Integracao" :
      prop = cpr_Sliic_ERP_Modulo_Integracao();
      break;
    case "Sliic_ERP_Modulo_Operacional" :
      prop = cpr_Sliic_ERP_Modulo_Operacional();
      break;
    case "Sliic_ERP_Modulo_Rastreamento" :
      prop = cpr_Sliic_ERP_Modulo_Rastreamento();
      break;
    case "Sliic_ERP_Modulo_Relatorio" :
      prop = cpr_Sliic_ERP_Modulo_Relatorio();
      break;
  }
  return prop;
}

# Retorna o arquivo de dicionário apropriado do projeto em questão.
# Retorno
# * Nome do arquivo de dicionário
function cpr_Sliic_Gateway(   prop) {
  switch (aMetaFile["useCase"]) {
    case "jsp" :
      prop = "messages-view.properties";
      break;
    case "bean" :
      prop = "messages-bean.properties";
      break;
    default :
      prop = "messages-business.properties";
      break;
  }
  return prop;
}

function cpr_WSR(   prop) {
  return cpr_Sliic_Gateway();
}

function cpr_Sliic_ERP_Beans() {
  return "messages-beans-" aMetaFile["module"] ".properties"
}

function cpr_Sliic_ERP_Engine_Comportamento(   prop) {
  switch (aMetaFile["useCase"]) {
    case "bean" :
      prop = "messages-beans.properties";
      break;
    default :
      prop = "messages-business.properties";
      break;
  }
  return prop;
}

function cpr_Sliic_ERP_Modulo_Cadastro() {
  return cpr_Sliic_Gateway();
}

function cpr_Sliic_ERP_Modulo_Comercial() {
  return cpr_Sliic_Gateway();
}

function cpr_Sliic_ERP_Modulo_Configuracao(   prop) {
  switch (aMetaFile["useCase"]) {
    case "jsp" :
      prop = "messages-view.properties";
      break;
    case "bean" :
      prop = "messages-beans-" aMetaFile["module"] ".properties";
      break;
    default :
      prop = "messages-business.properties";
      break;
  }
  return prop;
}

function cpr_Sliic_ERP_Modulo_Expedicao() {
  return cpr_Sliic_Gateway();
}

function cpr_Sliic_ERP_Modulo_GestaoComportamental() {
  return cpr_Sliic_ERP_Modulo_Configuracao();
}

function cpr_Sliic_ERP_Modulo_GestaoSeguranca() {
  return cpr_Sliic_ERP_Modulo_Configuracao();
}

function cpr_Sliic_ERP_Modulo_GestaoSocioambiental() {
  switch (aMetaFile["useCase"]) {
    case "jsp" :
      prop = "messages-view.properties";
      break;
    case "bean" :
      prop = "messages-beans-" aMetaFile["module"] ".properties";
      break;
  }
  return prop;
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
