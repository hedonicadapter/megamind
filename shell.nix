let
  pkgs = import <nixpkgs> {config.allowUnfree = true;};
in
  pkgs.mkShell {
    packages = with pkgs; [
      vscode
      azure-cli
      bun

      # running the bot emulator doesnt really work
      # (pkgs.callPackage ./BotFramework-Emulator.nix {})
      # appimage-run
    ];

    shellHook = ''
      bun install -g yo
      bun install -g generator-botbuilder

      export PATH="/home/hedonicadapter/.bun/bin:$PATH"
    '';
  }
