# Arquivo: locController.awk
# Descrição: Localiza o controller correspondente a um determinado view.

# Procura no diretório "projectPath" pelo arquivo controller, correspondente ao
# arquivo "filename".
# Argumentos:
# * projectPath - endereço do diretório de pesquisa.
# * filename - nome do arquivo usado como referência para achar o correspondente
# arquivo controller.
# Retorno:
# * Endereço e nome do arquivo controller.
function locController(projectPath, filename,    oldfilename, paths, i) {
  do {
    lco_findJavaFiles(projectPath, filename, paths);
    oldfilename = filename;
    filename = lco_divideNome(toupper(substr(filename,1,1)) substr(filename, 2));
  } while (!isarray(paths) && (filename != oldfilename))

  if (length(paths) > 1) {
    print "Erro: Encontrado mais de 1 arquivo controller correspondente a %s", nome;
    for (i in paths) {
      print "Encontrado: %s", paths[i];
    }
    exit 1;
  }
  else {
    return paths[0];
  }
}

# Procura por arquivos java, no diretório "projectPath" que correspondam com o
# nome de arquivo fileName.
# Argumentos:
# * projectPath - Caminho para o diretório onde será realizada a pesquisa.
# * fileName - Nome completo ou parcial do arquivo que será procurado.
# Retorno:
# * paths - Retorna o array "paths" com o endereço e nome de arquivos que
# correspondem a pesquisa.
function lco_findJavaFiles(projectPath, fileName, paths,i) {
  find = sprintf("find %s -name \"%s*.java\"", projectPath, fileName);
  print find |& "sh";
  close("sh", "to");

  while (("sh" |& getline) > 0) {
    if ($0 != "") {
      paths[i++] = $0;
    }
  }
  close ("sh");
}

# Remove a última palavra de um nome que está no formato "camel case",
# usando como separador, a letra em maiúsculo. ex:
# AvisoGeralCrud -> AvisoGeral
# Argumentos:
# * nome -> Nome no formato camel case
# Retorno:
# * Retorno o nome sem a última palavra. Se não houver palavras para
# serem divididas, retorna o próprio nome.
function lco_divideNome(nome,    nomeAlternativo) {
  split(nome, frags, /[A-Z]/, seps);
  delete frags[length(frags)];
  delete seps[length(seps)];

  if (length(frags) <= 1) {
    nomeAlternativo = nome;
  }
  else {
    for (i=0; i<length(frags); i++) {
      nomeAlternativo = nomeAlternativo frags[i] seps[i];
    }
  }
  return nomeAlternativo;
}
