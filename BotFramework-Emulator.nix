{
  lib,
  appimageTools,
  fetchurl,
}: let
  pname = "botframework-emulator";
  version = "4.15.1";

  src = fetchurl {
    url = "https://github.com/microsoft/BotFramework-Emulator/releases/download/v${version}/BotFramework-Emulator-${version}-linux-x86_64.AppImage";
    hash = "sha256-fhlZDCL5pyktiwKyLNNaAyBWJmgKElQ8t+JufcAoPNU=";
  };
in
  appimageTools.wrapType2 rec {
    inherit pname version src;

    # extraInstallCommands = ''
    #   substituteInPlace $out/share/applications/${pname}.desktop \
    #     --replace-fail 'Exec=AppRun' 'Exec=${meta.mainProgram}'
    # '';

    meta = {
      description = "Microsoft Bot Framework Emulator";
      homepage = "https://github.com/microsoft/BotFramework-Emulator";
      license = lib.licenses.mit;
      platforms = lib.platforms.linux;
    };
  }
