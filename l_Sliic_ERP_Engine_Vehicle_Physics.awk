# Arquivo: l_Sliic_ERP_Engine_Vehicle_Physics.awk  
# Descrição: Colhe os metadados do projeto Sliic_ERP_Engine_Vehicle_Physics.
BEGINFILE {
  phy_initSubsep("@");

# O array aTipo mantém a contagem de subdiretórios para o "módulo" ou
# "useCase", em relação ao nome do projeto. Exemplo:
# Sliic_ERP_Engine_Vehicle_Physics/src/com/sliic/vphysics/bean/ComposicaoVeiculos.java
# Módulo está a 4 subdiretórios.
# useCase está a 3 subdiretórios.
  aTipo["src", "module"] = 4;
  aTipo["src", "useCase"] = 5;

  phy_endSubsep();
}

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
  for (i in aPathFile) {
    if (!idx) {
      idx = i;
    }
    switch (aPathFile[i]) {
      case /\<src\>/ :
        result = aPathFile[idx + aTipo["src@"tipo]];
        break;
      case /\.jsp/ :
        result = aPathFile[idx + aTipo["jsp@"tipo]];
        break;
    }
  }
  return result;
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
