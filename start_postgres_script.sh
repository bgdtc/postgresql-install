#!/bin/bash

sudo -u postgres bash << EOF

if pgrep -x "postgres" > /dev/null

then
    
    echo "PostgreSQL est déjà en cours d'exécution."
else
   
    echo "Démarrage de PostgreSQL..."
        /usr/local/pgsql/bin/pg_ctl start -D /usr/local/pgsql/data
fi

EOF
