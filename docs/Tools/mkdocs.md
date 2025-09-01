# MkDocs
## Deployment of MkDocs site on GitHub Pages
- Install [MkDocs](https://www.mkdocs.org/)
- Create a new github repository
- In the `main` branch, create a new mkdocs project
- Run it locally `mkdocs serve`, check it out at [http://127.0.0.1:8000/](http://127.0.0.1:8000/)
- In `mkdocs.yml` file, ensure
```yml
site_url: https://your-username.github.io/your-repo-name/
```
- In GitHub > Settings > Pages,
    - set Source to "deploy from a branch"
    - select branch `gh-deploy` at `/(root)`
- Deploy using `mkdocs gh-deploy --clean`
- The site is accessible !
