# Arquivo: libLocProperties.awk
# Descrição: Localizar um determinado arquivo de dicionário (.properties)
# de um projeto
@include "sliic/libChooseProperties";
@include "sliic/libAbsolutePath";

# Retorna o nome e o caminho completo para o arquivo de dicionário
# correspondente ao endereço do arquivo, recebido como parâmetro.
# Parâmetros:
# * aMetaFile - Array com os metadados do arquivo.
# Retorno:
# * Nome e caminho completo do arquivo dicionário.
function locProperties(aMetaFile, msgs_paths,     fileProperties, pathFileProperties) {
  fileProperties = chooseProperties(aMetaFile);
  for (i in msgs_paths) {
    if (msgs_paths[i] ~ aMetaFile["project"] && msgs_paths[i] ~ fileProperties) {
      pathFileProperties = msgs_paths[i];
    }
  }
  return pathFileProperties;
}

# Lança o comando shell find para procurar todos os arquivos de dicionário,
# presentes no projeto
# Retorno:
# * msgs_paths - Array com nome e caminho dos arquivos dicionários.
function findFiles(msgs_paths,    i, tmp, Oldrs) {
  Oldrs = RS;
  RS = "\n";

  absPath = absolutePath(ARGV[1]);
  if (!absPath) {
    exit 1;
  }
  find = sprintf("find %s -name \"messages-*.properties\" -not -path *bin*", absPath);
  print find |& "sh";
  close("sh", "to");

  while (("sh" |& getline tmp) > 0) {
    msgs_paths[i++] = tmp
  }
  close("sh");
  
  RS = Oldrs;
}
