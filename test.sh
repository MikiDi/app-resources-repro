curl 'http://localhost/jobs' -X POST -H 'Accept: application/vnd.api+json' \
  -H 'Content-Type: application/vnd.api+json'\
  -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' \
  --data-raw $'{\n  "data": {\n    "type": "jobs",\n    "attributes": {\n        "used": [\n        "http://example.com/abc"\n      ]\n    }\n  }\n}'
  # --data-raw $'{\n  "data": {\n    "type": "jobs",\n    "attributes": {\n      "created": "2022-05-12T23:03:28"\n      "used": [\n        "http://example.com/abc"\n      ]\n    }\n  }\n}'