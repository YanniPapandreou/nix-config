{ lib
, beautifulsoup4
, buildPythonPackage
, charset-normalizer
, fastcore
, fetchFromGitHub
, hatchling
, httpx
, humanize
, lxml
, markdownify
, pandas
, pyarrow
, pydantic
, pytest
, pytest-cov
, pytest-env
, pytestCheckHook
, pythonOlder
, rank-bm25
, retry
, rich
, textdistance
}:

buildPythonPackage rec {
  pname = "edgartools";
  version = "2.16.0";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "dgunning";
    repo = "edgartools";
    rev = "f1bf460f00653c1c37a4ac1a31bb9515a8551619";
    hash = "sha256-v1IHT2wmXEspCiVGxtmBZU5N91H/qsm9ZEqESnnqzsQ=";
  };

  nativeBuildInputs = [
    hatchling
  ];

  propagatedBuildInputs = [
    beautifulsoup4
    charset-normalizer
    fastcore
    httpx
    humanize
    lxml
    markdownify
    pandas
    pyarrow
    pydantic
    (rank-bm25.overridePythonAttrs (_: rec {
      version = "0.2.1";
      src = fetchFromGitHub {
        owner = "dorianbrown";
        repo = "rank_bm25";
        rev = "a87c8d997581a494517dc549b0ae479b7ccf254c";
        hash = "sha256-36+EZ2poY9IWdGPNeSPgYAshb1AdOgBL4aI3fMkZL/8=";
      };
    }))
    retry
    rich
    textdistance
  ];

  nativeCheckInputs = [
    pytest
    pytest-cov
    pytest-env
    pytestCheckHook
  ];

  pytestFlagsArray = [
    "--ignore=tests/test_attachments.py"
    "--ignore=tests/test_company.py"
    "--ignore=tests/test_company_reports.py"
    "--ignore=tests/test_core.py"
    "--ignore=tests/test_current_filings.py"
    "--ignore=tests/test_documents.py"
    "--ignore=tests/test_edgar.py"
    "--ignore=tests/test_effect.py"
    "--ignore=tests/test_eightK.py"
    "--ignore=tests/test_entity.py"
    "--ignore=tests/test_filing.py"
    "--ignore=tests/test_filing_header.py"
    "--ignore=tests/test_financials.py"
    "--ignore=tests/test_form144.py"
    "--ignore=tests/test_form_upload.py"
    "--ignore=tests/test_formc_offerings.py"
    "--ignore=tests/test_formd_offerings.py"
    "--ignore=tests/test_fundreports.py"
    "--ignore=tests/test_funds.py"
    "--ignore=tests/test_htmltools.py"
    "--ignore=tests/test_muni_advisors.py"
    "--ignore=tests/test_ownership.py"
    "--ignore=tests/test_search.py"
    "--ignore=tests/test_sgml.py"
    "--ignore=tests/test_shelf.py"
    "--ignore=tests/test_thirteenf.py"
    "--ignore=tests/test_xbrl.py"
  ];

  pythonImportsCheck = [
    "edgar"
  ];

  meta = with lib; {
    description = "Python library for working with SEC Edgar";
    homepage = "https://github.com/dgunning/edgartools";
    license = licenses.mit;
    maintainers = with maintainers; [ yannip ];
  };
}


