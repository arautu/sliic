# Arquivo: l_Wsr.awk
# Descrição: Colhe os metadados do projeto WSR.
@include "sliic/l_commons.awk"

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
  wsr_referencia(aTipo);

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
function wsr_referencia(array) {
  initSubsep("@");

  array["src", "module"] = 5;
  array["src", "useCase"] = 6;
  array["jsp", "module"] = 4;
  array["jsp", "useCase"] = 3;

  endSubsep();
}

