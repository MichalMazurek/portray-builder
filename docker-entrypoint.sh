#!/bin/sh

echo "Copying source to container."

cp -r /in /source

cd /source

if [ -d ".venv" ]
then
    rm -rf .venv
fi

export PYTHONUNBUFFERED=1

if [ -e "./install-extra.sh" ]
then
    . ./install-extra.sh
fi

if [ -e "./pyproject.toml" ]
then
    echo "Found pyproject.toml."
    if `grep -Fxq '[tool.poetry]' pyproject.toml`
    then
        echo "Poetry present, installing through poetry..."
        poetry install
        poetry add portray
        poetry run portray as_html --overwrite -o /out/docs
    fi
elif [ -e "./Pipfile" ]
then
    pipenv install -e .
    pipenv install portray
    pipenv run portray as_html --overwrite -o /out/docs
else
    pip install .
    portray as_html --overwrite -o /out/docs
fi

if [ ! -z $1 ]
then
    echo "Chaging UID of docs to $1"
    chown -R $1:$1 /out/docs
    chmod -R a+rwx /out/docs
fi