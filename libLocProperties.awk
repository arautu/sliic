# Arquivo: libLocProperties.awk
# Descrição: Localizar um determinado arquivo de dicionário (.properties)
# de um projeto
@include "sliic/libParserFilePath";
@include "sliic/libChooseProperties";

# Retorna o nome e o caminho completo para o arquivo de dicionário
# correspondente ao endereço do arquivo, recebido como parâmetro.
# Parâmetros:
# * absPathFile - caminho absoluto do arquivo que se deseja achar o arquivo
#   dicionário correspondente.
# Retorno:
# * Nome e caminho completo do arquivo dicionário.
function locProperties(absPathFile,     fileProperties, pathFileProperties) {
  parserFilePath(absPathFile, aMetaFile);
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
# Parâmetros:
# * path - Caminho para o diretório, onde estão os projetos.
# Retorno:
# * msgs_paths - Array com nome e caminho dos arquivos dicionários.
function findFiles(path, msgs_paths,    i) {
  find = sprintf("find %s -name \"messages-*.properties\" -not -path *bin*", path);
  print find |& "sh";
  close("sh", "to");

  while (("sh" |& getline) > 0) {
    msgs_paths[i++] = $0
  }
  close ("sh");
}
