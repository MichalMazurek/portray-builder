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
docker run --rm -v $project_path:/in -v $out_dir:/out michalmazurek/portray-builder $UID
```

1. Make sure `$out_dir` is created before running the container
2. After docs are generated the `docs` directory in `$out_dir` will be chowned to `$UID`. This is optional. But can be helpful as the directories will be created by root and if you run this script from non-root user like gitlab-runner, then you won't be able to remove it as it will belong to root.
