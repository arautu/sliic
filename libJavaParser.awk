# A função retorna o nome da classe.
# Sendo:
# 'classLine = public class EmailMensagemCrud extends SliicCrudController {'
# O retorno será 'EmailMensagemCrud'.
function getClass(classLine) {
  split(classLine, arr, " ");
  for (i in arr) {
    if (match(arr[i], "class")) {
      sub(/<.*/, "", arr[i+1])
      return arr[i+1];
    }
  }
}

# Valida se o registro atual contém o package.
function validaPackage() {
  if ($0 !~ /\<package\>/) {
    print "Epa! Não encontrado o package do arquivo."
  }
  return 1;
}

# Remove identação de uma linha.
function removerIdentacao(fmt) {
  gsub(/^[ \t]*/, "", fmt)
  return fmt;
}

# Em um determinado 'texto', verifica se o número de ocorrências de dois
# elementos ('p1' e 'p2') sao iguais. Se verdadeiro, retorna '1', senão,
# retorna '0'.
# Ex. determinaParidade($0, "\\(", "\\)")
function determinaParidade(texto, p1, p2, i) {
  vp1 = vp2 = 0;
  split(texto, vetor, "");
  for (i in vetor) {
    if (vetor[i] ~ p1)
      vp1++
    if (vetor[i] ~ p2)
      vp2++   
  }
  if (vp1 == vp2)
    return 1;
  else
    return 0;
}
