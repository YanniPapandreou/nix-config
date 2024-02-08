{ lib
, buildPythonPackage
, fetchFromGitHub
, flit-core
, pyrate-limiter
, pytestCheckHook
, pythonOlder
, requests
}:

buildPythonPackage rec {
  pname = "sec-edgar-downloader";
  version = "5.0.2";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "jadchaar";
    repo = "sec-edgar-downloader";
    # rev = "refs/tags/v${version}";
    rev = "4e5d1006c63c441c1ac467dd9e5b016d66aab3a6";
    hash = "sha256-FRmL8fpL5YHR3OIP0gw/K/6BldnOynxi7/CPKNcTcBg=";
  };

  nativeBuildInputs = [
    flit-core
  ];

  propagatedBuildInputs = [
    # pyrate-limiter
    (pyrate-limiter.overridePythonAttrs (_: rec {
      version = "3.1.0";
      src = fetchFromGitHub {
        owner = "vutran1710";
        repo = "PyrateLimiter";
        rev = "v${version}";
        hash = "sha256-WL+nNk68NaK36Lwalj23ugiSuB5acSLumLJGQaXE06A=";
      };
    }))
    requests
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pytestFlagsArray = [
    "--ignore=tests/test_end_to_end_integration.py"
  ];


  pythonImportsCheck = [
    "sec_edgar_downloader"
  ];

  meta = with lib; {
    description = "Download filings from the SEC EDGAR database using Python";
    homepage = "https://github.com/jadchaar/sec-edgar-downloader";
    license = licenses.mit;
    maintainers = with maintainers; [ yannip ];
  };
}


