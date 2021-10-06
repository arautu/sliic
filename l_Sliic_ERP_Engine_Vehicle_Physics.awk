# Arquivo: l_Sliic_ERP_Engine_Vehicle_Physics.awk  
# Descrição: Colhe os metadados do projeto Sliic_ERP_Engine_Vehicle_Physics.

# Verifica no path fornecido, os diretórios relevantes e chama as funções
# apropriadas para colher os metadados.
# Argumentos:
# * aPathFile - Array com pedaços do path.
# * tipo - Pode ser: "module" ou "useCase".
# Retorno:
# * Depende do argumento tipo. Se tipo = "module", então será retornado o
# módulo do projeto do qual o arquivo pertence. Se tipo = "useCase", retorna
# o caso de uso do mesmo arquivo.
function Sliic_ERP_Engine_Vehicle_Physics(aPathFile, tipo,    idx, result) {
  phy_referencia(aTipo);
  for (i in aPathFile) {
    result = aPathFile[i + aTipo["src@"tipo]];
    break;
  }
}

# Retorna um array contendo a contagem de subdiretórios a partir do nome
# do projeto até um subdiretório específico, por exemplo, o subdiretório
# do módulo ou caso de uso.
# Exemplo:
# Sliic_ERP_Modulo_Configuracao/webapp/WEB-INF/jsp/configuracao/
# avisoGeralEntrada.jsp.utf8
# Módulo está a 4 subdiretórios.
# useCase está a 3 subdiretórios.
# Argumentos:
# * array - Array com o resultado de interesse em relação ao projeto.
function phy_referencia(array) {
  initSubsep("@");
  
  array["src", "module"] = 4;
  array["src", "useCase"] = 5;

  endSubsep();
}

# Define a variável SUBSEP, salvando se preciso o valor anterior em
# phy_save_subsep.
# Argumentos:
# * subsep - O valor de SUBSEP.
function phy_initSubsep(subsep) {
  if (SUBSEP) {
    phy_save_subsep = SUBSEP;
  }
  SUBSEP = subsep;
}

# Devolve o valor anterior de SUBSEP, através de phy_save_subsep.
function phy_endSubsep() {
  if (phy_save_subsep) {
    SUBSEP = phy_save_subsep;
  }
}
