# Arquivo: l_Wsr.awk
# Descrição: Colhe os metadados do projeto WSR.
BEGINFILE {
  wsr_initSubsep("@");

# O array aTipo mantém a contagem de subdiretórios para o "módulo" ou
# "useCase", em relação ao nome do projeto. Exemplo:
# Sliic_ERP_Modulo_Configuracao/webapp/WEB-INF/jsp/configuracao/
# avisoGeralEntrada.jsp.utf8
# Módulo está a 4 subdiretórios.
# useCase está a 3 subdiretórios.
  aTipo["src", "module"] = 5;
  aTipo["src", "useCase"] = 6;
  aTipo["jsp", "module"] = 4;
  aTipo["jsp", "useCase"] = 3;

  wsr_endSubsep();
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
function WSR(aPathFile, tipo,    idx, result) {
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
# wsr_save_subsep.
# Argumentos:
# * subsep - O valor de SUBSEP.
function wsr_initSubsep(subsep) {
  if (SUBSEP) {
    wsr_save_subsep = SUBSEP;
  }
  SUBSEP = subsep;
}

# Devolve o valor anterior de SUBSEP, através de wsr_save_subsep.
function wsr_endSubsep() {
  if (wsr_save_subsep) {
    SUBSEP = wsr_save_subsep;
  }
}
