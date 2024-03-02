{ lib
, buildPythonPackage
, fetchFromGitHub
, multiprocess
, pandas
, pandas-stubs
, poetry-core
, pydantic
, pytestCheckHook
, pythonOlder
}:

buildPythonPackage rec {
  pname = "pandantic";
  version = "0.3.0";
  pyproject = true;

  disabled = pythonOlder "3.10";

  src = fetchFromGitHub {
    owner = "wesselhuising";
    repo = "pandantic";
    rev = "f0d749459876a17bd5db53a69ffdfe3bbfc197f5";
    hash = "sha256-RXonAk9iy+SFvYtkI2AFIZBogIUDmQfUwKc1Da13viM=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    multiprocess
    pandas
    pandas-stubs
    pydantic
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "pandantic"
  ];

  disabledTests  = [
    "test_read_with_lxml_dtype_backend"
  ];

  meta = with lib; {
    description = "About
Enriches the Pydantic BaseModel class by adding the ability to validate dataframes using the schema and custom validators of the same BaseModel class.";
    homepage = "https://github.com/wesselhuising/pandantic";
    license = licenses.mit;
    maintainers = with maintainers; [ yannip ];
  };
}
