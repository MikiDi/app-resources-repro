echo "######## Inserting a new job via resources, returns:"
echo ""

curl 'http://localhost:4321/jobs' -X POST -H 'Accept: application/vnd.api+json' \
  -H 'Content-Type: application/vnd.api+json'\
  -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' \
  --data-raw $'{\n  "data": {\n    "type": "jobs",\n    "attributes": {\n        "used": [\n        "http://example.com/abc"\n      ]\n    }\n  }\n}'
  # --data-raw $'{\n  "data": {\n    "type": "jobs",\n    "attributes": {\n      "created": "2022-05-12T23:03:28"\n      "used": [\n        "http://example.com/abc"\n      ]\n    }\n  }\n}'

echo ""
echo ""
echo "######## Waiting for changes to propagate"
echo ""

sleep 5

echo "######## Using a sudo service to set the 'time-started' property on the job we just created (and didn't set when creating)"
echo ""

curl 'http://localhost:1351/update' -X POST

sleep 5

docker-compose logs --tail=100 delta-notifier resource cache database

echo "######## Above logs show that delta-notifier sends its updates to resources"
echo ""
echo "######## However, when you now [GET] the job resource, the 'time-started'-property still doesn't show"
echo ""
echo "######## Only after restarting the 'resource' service, the problem is resolved"
echo ""
echo "######## Note that this problem only poses itself with (setf *cache-model-properties-p* t)"
echo "######## Since the resources Readme mentions 'Internal cache ... Note that this currently assumes mu-cl-resources is the only service altering the resources',"
echo "######## All of this might be expected. If this would be the case, the readme needs to be clarified expliciting that property-cache doesn't"
echo "######## get invalidated through deltas"
echo ""

sleep 2

echo "now do: curl http://localhost:4321/jobs/id-you-just-got-in-post-call-at-top"
echo "######## The result from the call above doesn't contain a 'time-started' although you would expect one"
