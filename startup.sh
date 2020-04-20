#! /bin/sh

# Wait for DB services
until nc -z -v -w30 db:3306; do
 echo 'Waiting for MySQL...'
 sleep 9
done
echo "MySQL is up and running!"

# Prepare DB (Migrate - If not? Create db & Migrate)
sh ./prepare-db.sh

# exec rspec fo test scenario
sh ./test.sh

# Start Application
bundle exec puma -C config/puma.rb
