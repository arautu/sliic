# Arquivo: libLocProperties.awk
# Descrição: Localizar um determinado arquivo de dicionário (.properties) de um projeto

BEGIN {
  findFiles("src")
}

function findFiles(path) {

  find = sprintf("find %s -name \"messages-*.properties\" -not -path *bin*", path);
  print find |& "sh";
  close("sh", "to");

  while (("sh" |& getline) > 0) {
    print $0;
  }
  close ("sh");
}





