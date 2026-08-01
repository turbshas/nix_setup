{
    pkgs
}:
let
    src = builtins.fetchurl {
        url = "https://updates.signal.org/desktop/signal-desktop.AppImage";
        sha256 = "1dldfixk8h4d3gbj3gxiy5kjxgiyj4zxgb3x929fkan308ad3kgr";
    };
    desktopItemName = "signal-desktop";
    pname = "signal";
    version = "8.21.0";
    appimageContents = pkgs.appimageTools.extract { inherit pname version src; };
in
pkgs.appimageTools.wrapType2 {
    inherit pname version src appimageContents;
    
    extraInstallCommands = ''
        install -Dm444 ${appimageContents}/${desktopItemName}.desktop -t $out/share/applications/
        install -Dm444 ${appimageContents}/${desktopItemName}.png -t $out/share/icons/hicolor/1024x1024/apps/
        substituteInPlace $out/share/applications/${desktopItemName}.desktop \
            --replace-fail 'Exec=AppRun' 'Exec=${pname}'
    '';
}
