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
      prop = "app-view";
      break;
    case "bean" :
      prop = "app-bean";
      break;
    default :
      prop = "app-business";
      break;
  }
  return "messages-" prop ".properties";
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
  return "messages-app-bean.properties";
}

function cpr_Sliic_ERP_Modulo_Cadastro(   prop) {
  switch (aMetaFile["useCase"]) {
    case "jsp" :
      prop = "-view";
      break;
    case "bean" :
      prop = "-bean";
      break;
    default :
      prop = "-business";
      break;
  }
  return "messages-" aMetaFile["module"] prop ".properties";
}

function cpr_Sliic_ERP_Modulo_Comercial() {
  return cpr_Sliic_ERP_Modulo_Cadastro();
}

function cpr_Sliic_ERP_Modulo_Configuracao(   prop, prefixo) {
  if (aMetaFile["module"] == "relatorio") {
    prefixo = "messages-configuracao-";
  } else {
    prefixo = "messages-";
  }
  switch (aMetaFile["useCase"]) {
    case "jsp" :
      prop = "-view";
      break;
    case "bean" :
      prop = "-bean";
      break;
    default :
      prop = "-business";
      break;
  }
  return prefixo aMetaFile["module"] prop ".properties";
}

function cpr_Sliic_ERP_Modulo_Expedicao() {
  return cpr_Sliic_ERP_Modulo_Cadastro();
}

function cpr_Sliic_ERP_Modulo_GestaoComportamental(   prop, prefixo) {
  if (aMetaFile["module"] == "relatorio") {
    prefixo = "messages-gestaocomportamental-";
  } else {
    prefixo = "messages-";
  }
  switch (aMetaFile["useCase"]) {
    case "jsp" :
      prop = "-view";
      break;
    case "bean" :
      prop = "-bean";
      break;
    default :
      prop = "-business";
      break;
  }
  return prefixo aMetaFile["module"] prop ".properties";
}

function cpr_Sliic_ERP_Modulo_GestaoSeguranca(  prop, prefixo) {
  if (aMetaFile["module"] == "relatorio") {
    prefixo = "messages-gestaoseguranca-";
  } else {
    prefixo = "messages-";
  }
  switch (aMetaFile["useCase"]) {
    case "jsp" :
      prop = "-view";
      break;
    case "bean" :
      prop = "-bean";
      break;
    default :
      prop = "-business";
      break;
  }
  return prefixo aMetaFile["module"] prop ".properties";
}

function cpr_Sliic_ERP_Modulo_GestaoSocioambiental(   prop, prefixo) {
  if (aMetaFile["module"] == "relatorio") {
    prefixo = "messages-gestaosocioambiental-";
  } else {
    prefixo = "messages-";
  }
  switch (aMetaFile["useCase"]) {
    case "jsp" :
      prop = "-view";
      break;
    case "bean" :
      prop = "-bean";
      break;
    default :
      prop = "-business";
      break;
  }
  return prefixo aMetaFile["module"] prop ".properties";
}

function cpr_Sliic_ERP_Modulo_GestaoViaria() {
  return cpr_Sliic_ERP_Modulo_Cadastro();
}

function cpr_Sliic_ERP_Modulo_Integracao() {
  return cpr_Sliic_ERP_Modulo_Cadastro();
}

function cpr_Sliic_ERP_Modulo_Operacional(  prop, prefixo) {
  if (aMetaFile["module"] == "relatorio") {
    prefixo = "messages-operacional-";
  } else {
    prefixo = "messages-";
  }
  switch (aMetaFile["useCase"]) {
    case "jsp" :
      prop = "-view";
      break;
    case "bean" :
      prop = "-bean";
      break;
    default :
      prop = "-business";
      break;
  }
  return prefixo aMetaFile["module"] prop ".properties";
}

function cpr_Sliic_ERP_Modulo_Rastreamento() {
  return cpr_Sliic_ERP_Modulo_Cadastro();
}

function cpr_Sliic_ERP_Modulo_Relatorio() {
  return cpr_Sliic_ERP_Modulo_Cadastro();
}

function cpr_Sliic_Solar(   prop, projeto) {
  projeto  = tolower(aMetaFile["project"]);

  switch (aMetaFile["useCase"]) {
    case "jsp" :
      prop = "-view";
      break;
    case "bean" :
      prop = "-bean";
      break;
    default :
      prop = "-business";
      break;
  }
  return "messages-" projeto prop ".properties";
}

function cpr_Sliic_Usiminas() {
  return cpr_Sliic_Solar();
}
