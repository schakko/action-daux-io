# daux.io

This Action wraps the documentation generator [https://github.com/dauxio/daux.io](daux.io).

## Configuration

No configuration available at this point.

## Example Workflow Files

### Create generation of daux.io package structure

```yml
name: Generate documentation
jobs:
  build_documentation:
    name: Build documentation
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: daux.io documentation generator
      uses: schakko/action-daux-io@stable
```