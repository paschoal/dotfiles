{ config, ... }:
{
  config = {
    xdg.configFile = {
      "lazydocker/config.yml".text = ''
        customCommands:
          containers:
            - name: 'up and watch'
              attach: false
              command: '{{ .DockerCompose }} up --watch {{ .ServiceName }}'
      '';
    };
  };
}
