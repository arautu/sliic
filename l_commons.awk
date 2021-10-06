# Arquivo: l_commons.awk
# Descrição: Funções comuns

# Define a variável SUBSEP, salvando se preciso o valor anterior em
# cmm_subsep.
# Argumentos:
# * subsep - O valor de SUBSEP.

function initSubsep(subsep) {
  if (SUBSEP) {
    cmm_subsep = SUBSEP;
  }
  SUBSEP = subsep;
}

# Devolve o valor anterior de SUBSEP, através de cmm_subsep.
function endSubsep() {
  if (cmm_subsep) {
    SUBSEP = cmm_subsep;
  }
}
