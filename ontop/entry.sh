#!/usr/bin/bash

cd /src
echo waiting a little bit for trino
sleep 10 # wait the first time for trino to fully start
while true
do
    # this is in case a synax error is introduced in an obda file -- we just want ontop to start back up since we are likely editing the file
    java -cp $(ls -1 /app/lib/* | tr '\n' ':') -agentlib:jdwp=transport=dt_socket,server=y,address=0.0.0.0:9092,suspend=n it.unibz.inf.ontop.cli.Ontop endpoint --dev  -p /src/trino.properties -m /src/trino.obda --lenses /src/lenses.json
    sleep 2
done

