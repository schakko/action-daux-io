# daux.io

This GitHub Action wraps the documentation generator [https://github.com/dauxio/daux.io](daux.io).

The documentation is inside the `static/` folder which can then be easily copied to your webhost.

## Configuration

No configuration available at this point.

## Example Workflow Files

### Generate documentation and deploy it with rsync

```yml
name: Generate documentation
jobs:
  build_documentation:
    name: Build documentation
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master

    - name: daux.io documentation generator
      uses: schakko/action-daux-io@main

    - name: Synchronize documentation to webhost
      uses: AEnterprise/rsync-deploy@v1.0
      env:
        DEPLOY_KEY: ${{ secrets.SSH_RSYNC_KEY }}
        ARGS: "-a -e -c -r --delete"
        SERVER_PORT: 22
        # just copy the documentation from the folder "static/" which is specified by the custom daux.io builder
        FOLDER: "static/"
        SERVER_IP:  ${{ secrets.SSH_HOST }}
        USERNAME: ${{ secrets.SSH_USERNAME }}
        # we don't need an absolute destination as SSH_RSYNC_KEY is already restricted to the target directory with help of rrsync
        SERVER_DESTINATION: ""
```