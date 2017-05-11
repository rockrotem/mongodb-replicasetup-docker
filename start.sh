#!/bin/bash

echo "sleeping until mongo starts"

sleep 15

echo "Starting...."

mongo --host mongo1 --port 27020 <<EOF
rs.initiate(
   {
      _id: "rstests",
      version: 1,
      members: [
         { _id: 0, host : "mongo1:27020" },
         { _id: 1, host : "mongo2:27018" },
         { _id: 2, host : "mongo3:27019" }
      ]
   }
)
EOF

echo "Hopefully works!!!"

exit
