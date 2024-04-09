{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    dictionaries = [ pkgs.hunspellDictsChromium.en_US ];
    extensions = [
      { id = "ohnjgmpcibpbafdlkimncjhflgedgpam"; } # 4ChudX
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # Ublock Origin
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # Sponsor Block
      { id = "ejonaglbdpcfkgbcnidjlnjogfdgbofp"; } # Modern-Scroll
      { id = "enamippconapkdmgfgjchkhakpfinmaj"; } # Dearrow
      { id = "gebbhagfogifgggkldgodflihgfeippi"; } # Return YT Dislikes
      { id = "pobhoodpcipjmedfenaigbeloiidbflp"; } # Minimal Twitta Theme
      { id = "hfjbmagddngcpeloejdejnfgbamkjaeg"; } # Vimium C
      { id = "lcpclaffcdiihapebmfgcmmplphbkjmd"; } # No youtube maxxing
      { id = "jiaopdjbehhjgokpphdfgmapkobbnmjp"; } # attention maxxing
    ];
  };
}
