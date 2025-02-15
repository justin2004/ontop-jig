# ontop jig (for testing ontop)

## setup

- have docker and docker-compose installed
  - the command on your machine can be `docker compose` or `docker-compose`
- run `docker-compose up -d ; docker-compose logs --follow`
- browse to `http://127.0.0.1:8083/`

## tear down

- run `docker-compose down ; docker-compose rm`

## works as expected

```sparql
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT * WHERE {
 ?s2 geo:asWKT_works ?wkt .
 ?s1 geo:asWKT_works ?wkt1 .
 #?s2 geo:asWKT_notworks ?wkt .
 #?s1 geo:asWKT_notworks ?wkt1 .
 #bind(geof:distance(?wkt,?wkt1,uom:metre) as ?dist)
 #bind(geof:sfWithin(?wkt,?wkt1) as ?la3)
  bind(geof:intersection(?wkt, ?wkt1) as ?intersection_output)
} 
LIMIT 10
```


## does not work

```
it.unibz.inf.ontop.exception.OntopReformulationException: it.unibz.inf.ontop.exception.MinorOntopInternalBugException: Was expecting a unique and known DB term type to be extracted for the SQL variable v3
```

```sparql
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT * WHERE {
 #?s2 geo:asWKT_works ?wkt .
 #?s1 geo:asWKT_works ?wkt1 .
 ?s2 geo:asWKT_notworks ?wkt .
 ?s1 geo:asWKT_notworks ?wkt1 .
 #bind(geof:distance(?wkt,?wkt1,uom:metre) as ?dist)
 #bind(geof:sfWithin(?wkt,?wkt1) as ?la3)
  bind(geof:intersection(?wkt, ?wkt1) as ?intersection_output)
} 
LIMIT 10
```


## does not work

```
it.unibz.inf.ontop.exception.OntopQueryEvaluationException: java.sql.SQLException: Query failed (#20250215_014223_00022_zd3zw): line 1:76: Function 'st_distancesphere' not registered
```
https://github.com/ontop/ontop/issues/836

```sparql
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT * WHERE {
 ?s2 geo:asWKT_works ?wkt .
 ?s1 geo:asWKT_works ?wkt1 .
 #?s2 geo:asWKT_notworks ?wkt .
 #?s1 geo:asWKT_notworks ?wkt1 .
bind(geof:distance(?wkt,?wkt1,uom:metre) as ?dist)
 #bind(geof:sfWithin(?wkt,?wkt1) as ?la3)
  #bind(geof:intersection(?wkt, ?wkt1) as ?intersection_output)
} 
LIMIT 10
```



## bug when lens table name and and base relation have the same last component

following from the naming conventions used [here](https://ontop-vkg.org/tutorial/lenses/basic-lens.html#projection)

```json
    {
      "name": [
        "lenses",
        "movement"
      ],
      "baseRelation": [
        "postgis",
        "public",
        "movement"
      ],
...
```


```
it.unibz.inf.ontop.exception.OntopQueryEvaluationException: java.sql.SQLException: Query failed (#20250215_014817_00009_t6wh4): line 4:68: mismatched input ';'. Expecting: ')', ',', '.', 'AS', 'CROSS', 'EXCEPT', 'FETCH', 'FOR', 'FULL', 'GROUP', 'HAVING', 'INNER', 'INTERSECT', 'JOIN', 'LEFT', 'LIMIT', 'MATCH_RECOGNIZE', 'NATURAL', 'OFFSET', 'ORDER', 'RIGHT', 'TABLESAMPLE', 'UNION', 'WHERE', 'WINDOW', <identifier>
```

```sparql
PREFIX uom: <http://www.opengis.net/def/uom/OGC/1.0/>
PREFIX geof: <http://www.opengis.net/def/function/geosparql/>
PREFIX geo: <http://www.opengis.net/ont/geosparql#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT * WHERE {
 ?s ?p ?o .
} 
```
