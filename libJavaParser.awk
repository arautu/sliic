# Retorna o nome da classe.
# Argumentos:
# * classLine: Linha contendo o nome da classe.
# Ex: 'public abstract class MinhaClasse<Object> extends Aff {'
# * Retorna o nome da classe se existir ou nulo, caso contrário.
# ex: 'Minhaclasse'.
function getClass(classline,   i, arr) {
  if (jpa_validaClass(classline)) {
    split(classline, arr, "[ <]");
    for (i in arr) {
      if (arr[i] ~ "class") {
        break;
      }
    }
    return arr[i+1];
  }
}

# valida se a linha recebida como argumento contém a palavra especial class.
# argumentos:
# * classline: linha contendo o nome da classe.
# retorno:
# * retorna '1', caso a instrução 'class' seja encontrada ou nulo, caso 
# contrário.
function jpa_validaClass(classline) {
  if (classline !~ /^(public|private|protected) .*\<class\>/) {
    print "erro: nome da classe não encontrado." > "/dev/tty";
  } 
  return 1;
}

# Retorna o nome do enum.
# Argumentos:
# * enumLine: Linha contendo o nome do enum.
# Ex: 'public AreaEnum {'
# * Retorna o nome do enum se existir ou nulo, caso contrário.
# ex: 'AreaEnum'.
function getEnum(enumline) {
  if (jpa_validaEnum(enumline)) {
    split(enumline, arr, " ");
    for (i in arr) {
      if (arr[i] ~ "enum") {
        break;
      }
    }
    return arr[i+1];
  }
}

# valida se a linha recebida como argumento contém a palavra especial 'enum'.
# argumentos:
# * enumline: linha contendo o nome do enum.
# retorno:
# * retorna '1', caso a instrução 'enum' seja encontrada ou nulo, caso 
# contrário.
function jpa_validaEnum(enumline) {
  if (enumline !~ /^(public|private|protected) \<enum\>/) {
    print "erro: nome do enum não encontrado." > "/dev/tty";
  } 
  return 1;
}

# retorna o nome do package
# argumentos:
# * packline: linha contendo o package, ex: 'package com.la.bah;'
# retorno:
# * retorna somente o nome do package se ele existir ou nulo caso contrário.
#   ex: 'com.la.bah'
function getPackage(packline,   i, arr) {
  if(jpa_validaPackage(packline)) {
    split(packline, arr, "[ ;]");
    for (i in arr) {
      if (arr[i] ~ "package") {
        break;
      }
    }
    return arr[i+1];
  }
}

# valida se o registro recebido como argumento, contém a palavra especial
# 'package'.
# argumento:
# * packline: linha contendo o package.
# retorno:
# * retorna '1', caso a instrução 'package' seja encontrada ou nulo, caso 
# contrário.
function jpa_validaPackage(packLine) {
  if (packLine !~ /^\<package\>/) {
    print "Erro: Não encontrado o package do arquivo." > "/dev/tty";
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
