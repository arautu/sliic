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
      prop = cp_sliicGateway();
      break;
    case "WSR" :
      prop = cp_wsr();
      break;
    case "Sliic_ERP_Beans" :
      prop = cp_sliicErpBeans();
      break;
    case "Sliic_ERP_Engine_Comportamento" :
      prop = cp_sliicEEngineComportamento();
      break;
    case "Sliic_ERP_Modulo_Cadastro" :
      prop = cp_sliicEModuloCadastro();
      break;
    case "Sliic_ERP_Modulo_Comercial" :
      prop = cp_sliicEModuloComercial();
      break;
    case "Sliic_ERP_Modulo_Configuracao" :
      prop = cp_sliicEModuloConfiguracao();
      break;
    case "Sliic_ERP_Modulo_Expedicao" :
      prop = cp_sliicEModuloExpedicao();
      break;
    case "Sliic_ERP_Modulo_GestaoComportamental" :
      prop = cp_sliicEModuloGComportamental();
  }
  return prop;
}

# Retorna o arquivo de dicionário apropriado do projeto em questão.
# Retorno
# * Nome do arquivo de dicionário
function cp_sliicGateway(   prop) {
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

function cp_wsr(   prop) {
  return cp_sliicGateway();
}

function cp_sliicErpBeans() {
  return "messages-beans-" aMetaFile["module"] ".properties"
}

function cp_sliicEEngineComportamento(   prop) {
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

function cp_sliicEModuloCadastro() {
  return cp_sliicEEngineComportamento();
}

function cp_sliicEModuloComercial() {
  return cp_sliicEEngineComportamento();
}

function cp_sliicEModuloConfiguracao(   prop) {
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

function cp_sliicEModuloExpedicao() {
  return cp_sliicEEngineComportamento();
}

function cp_sliicEModuloGComportamental() {
  switch (aMetaFile["useCase"]) {
    case "bean" :
      prop = "messages-beans-" aMetaFile["module"] ".properties";
      break;
    default :
      prop = "messages-business.properties";
      break;
  }
  return prop;
}

function cp_sliicEModuloGSeguranca() {
  return cp_sliicEModuloGComportamental();
}

function cp_sliicEModuloGSAmbiental() {
  return cp_sliicErpBeans();
}
