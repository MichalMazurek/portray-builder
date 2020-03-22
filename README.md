# portray-builder

Docker image for building documentation in your python project using [Portray](https://timothycrosley.github.io/portray/)
in your CI/CD pipeline.

## Python Installers Support

This docker image supports:

- Poetry (https://python-poetry.org)
- Pipenv (https://github.com/pypa/pipenv)

If it cannot find `poetry` or `pipenv` mentions, then it will just do:

```
pip install .
```

## Example Usage

Use this in your pipeline

```bash
docker run --rm -v $project_path:/in -v $out_dir:/out michalmazurek/portray-builder
```

## Known Issues

- If you try to run it locally with poetry and `.venv`, then poetry will try to use that venv, instead of the one created inside of the container.
