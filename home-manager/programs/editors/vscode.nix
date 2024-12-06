{ pkgs, ... }:
{

  home.packages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions =
        with vscode-extensions;
        [
          catppuccin.catppuccin-vsc
          eamodio.gitlens
          gruntfuggly.todo-tree
          ms-python.python
          reditorsupport.r
          usernamehw.errorlens
        ]
        ++ vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "vscode-modaledit";
            publisher = "johtela";
            version = "2.1.0";
            sha256 = "sha256-WggF90Kgr8X9oV6UEwvMd1TUvbDvtOajoZwLAxrltGQ=";
          }
          {
            name = "nix-ide";
            publisher = "jnoortheen";
            version = "0.3.5";
            sha256 = "sha256-hiyFZVsZkxpc2Kh0zi3NGwA/FUbetAS9khWxYesxT4s=";
          }
          {
            name = "r-debugger";
            publisher = "RDebugger";
            version = "0.5.5";
            sha256 = "sha256-RR+atslAnb1KZxgH3Vm2OmfGGNtU06sJxbQ9fNlyhWw=";
          }
          {
            name = "find-it-faster";
            publisher = "TomRijndorp";
            version = "0.0.39";
            sha256 = "sha256-Rr1EKYSYmY52FfG4ClSQyikr0fd4cFKjphNxpzhiraw=";
          }
          {
            name = "leap";
            publisher = "MurlocCra4ler";
            version = "0.0.4";
            sha256 = "sha256-6QjJXJSthFX8EJ+wgJmEbE3hh/5dBIUcOoIzY/+NxO4=";
          }
          {
            name = "path-autocomplete";
            publisher = "ionutvmi";
            version = "1.25.0";
            sha256 = "sha256-iz32o1znwKpbJSdrDYf+GDPC++uGvsCdUuGaQu6AWEo=";
          }
          {
            name = "vscode-wakatime";
            publisher = "WakaTime";
            version = "24.9.1";
            sha256 = "sha256-VY8n9yjRVwz+cgnY4M7kZPCwA9MAIUKQaNFiycOs5GY=";
          }
          {
            name = "latex-workshop";
            publisher = "James-Yu";
            version = "10.5.6";
            sha256 = "sha256-49sxhmMVKUw+++7wGeK0G5rXNBBynf9SPU2at7TJ4tM=";
          }
          {
            name = "rust-analyzer";
            publisher = "rust-lang";
            version = "0.4.2202";
            sha256 = "sha256-mS6NDP5wl8PNQS0ql9P63YDr6SOO//YxBhLgzqrdCjc=";
          }
          {
            name = "vscode-pdf";
            publisher = "mathematic"; 
            version = "0.0.6";
            sha256 = "sha256-I4y1tzktH4wvD+g4CPeVpqA0S2ZgQ7KyDy6k2Ao4HKU=";
          }
          {
            name = "quarto";
            publisher = "quarto";
            version = "1.117.0";
            sha256 = "sha256-8bqXVjK2I1ZX61DWllBpLaX45dpiuWG3dKkm0MuQx1E=";
          }
          {
            name = "extension-test-runner";
            publisher = "ms-vscode";
            version = "0.0.12";
            sha256 = "sha256-sXu4rVqQlo//xxjVbqui7FNq0bmWvwOHwN+s/vnsdAg=";
          }
          {
            name = "vscode-eslint";
            publisher = "dbaeumer";
            version = "3.0.13";
            sha256 = "sha256-l5VvhQPxPaQsPhXUbFW2yGJjaqnNvijn4QkXPjf1WXo=";
          }
          {
            name = "code-spell-checker";
            publisher = "streetsidesoftware";
            version = "4.0.21";
            sha256 = "sha256-AcZAhmJeAD4nGDhBXieUxldzNZhTPCOg6W44Sc7W4H0=";
          }
        ];
    })
  ];

}
