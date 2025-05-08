#!/bin/sh

# Aguarda o PostgreSQL estar pronto
/app/wait-for-it.sh db:5432 --timeout=60 --strict -- echo "Postgres está pronto"

# Executa a criação das tabelas explicitamente
python -c "from app import db, app; app.app_context().push(); db.create_all()"

# Inicia o servidor Flask
exec flask run --host=0.0.0.0
