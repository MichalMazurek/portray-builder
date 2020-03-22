#!/bin/sh

cd /in

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
        exit 0
    fi
elif
then
    pipenv install -e .
    pipenv install portray
    pipenv run portray as_html --overwrite -o /out/docs
    exit 0
else
    pip install .
fi

portray as_html --overwrite -o /out/docs