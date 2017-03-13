SCRIPT_DIR=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )

# Make it possible to run the script from all locations
cd "$SCRIPT_DIR"
cd src

python manage.py migrate --no-input || exit 1
python manage.py collectstatic --noinput || exit 1

/usr/local/bin/uwsgi --ini /src/uwsgi.ini
