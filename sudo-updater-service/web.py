from flask import jsonify, request
from sudo_query import update as sudo_update

@app.route("/")
def hello():
    return "service is alive and kicking 😎"

@app.route("/update", methods=["POST"])
def update():
    sudo_update("""
PREFIX cogs: <http://vocab.deri.ie/cogs#>
PREFIX prov: <http://www.w3.org/ns/prov#>
INSERT {
    GRAPH ?g {
        $job prov:startedAtTime ?startedNow .
    }
}
WHERE {
    GRAPH ?g {
        ?job a cogs:Job .
        BIND(NOW() AS ?startedNow)
        FILTER NOT EXISTS { ?job prov:startedAtTime ?t }
    }
}""")

    return jsonify({"message": "Updated startedAtTime."})
