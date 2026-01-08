{ fetchurl }:

{
  project,
  file,
  game,
  name,
  ...
}@args:

let
  curseforgeUrl = "https://www.curseforge.com/api/v1/mods/${project}/files/${file}/download";
  fetcher = fetchurl;

  passthruAttrs = removeAttrs args [ "project" "file" "version" "game" "name" ];

  fetcherArgs = {
    url = curseforgeUrl;
  } // passthruAttrs;

in
  fetcher fetcherArgs
