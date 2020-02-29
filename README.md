# Agda on Github Pages

Template repo demonstrating Literate Agda Markdown with Github Pages (/Jekyll)

## Demo

[https://ednutting.github.io/github-pages-agda/](https://ednutting.github.io/github-pages-agda/)

## How to use this template

### Overview

1. Create your own repo from this template, customise it
1. Generate your Docker image used for building the site inside Github Actions (continuous integration)
1. Push your site's content to `develop` branch.
1. Github Actions compiles your site and pushes the result to `master` branch
1. You see the results on your Github Pages site

### Details

1. Get set up
    1. Create your own repo and clone it.
        * Don't clone or fork this repo directly - it's a template - copy stuff from it.
        * Include a note somewhere in your repo that it's based off this template - as per the included MIT license.
    1. You will need a [Docker Hub](https://hub.docker.com/) account.
        * This hosts the Docker Image which Github Actions downloads in order to build your website
        * The Docker Image contains all the packages necessary to build your site - pre-installed. It saves you installing them every time the CI runs, which would be slow (and potentially expensive if you're not on a free account).
    1. You will need to login to Docker Hub before using the Docker `push` command/script.
        * On the command line: `docker login` - do this once after your system starts.
        * On Windows, you can also sign in using the Docker Settings app from the notification tray.
1. Make sure you are on a branch called `develop`
    1. `git branch develop && git checkout develop`
    1. The Github Actions workflow only runs for commits on `develop`.
        * You can configure this in `./.github/workflows/jekyll.yml` - but make sure it never, ever runs for commits to `master` or *all the bad things will happen*.
    1. When you push to `develop`, the `jekyll` workflow runs, builds your site, and pushes the compiled site to `master`.
        * Github Pages then uses the contents of `master` as the source for your site.
1. Make sure Github Pages is enabled in your repo's settings on Github.
    1. Ensure the site is using the `master` branch as the source of the site's content. No subfolder.
        * This is the only option for personal sites on Github Pages.
        * Other options for project sites can be configured - just remember to modify the `./github/jekyll.yml` file accordingly.
1. Set up the [environment variables as set out below](#environment-variables).
    * You will need to [create the Docker repo](https://hub.docker.com/repository/create) in Docker Hub with the same name that you use in `dockerRepo`.
1. Set up `/github/workflows/jekyll.yml` as per note in *Environment variables* below.
1. This templates puts `*.lagda.md` files in `./_agda`
    * An example is provided in `./_agda/simple.lagda.md`
    * You can specify a `layout` in front-matter of these `lagda` files and it will be passed through to Jekyll. E.g. you may want to use `blog` layout.
    * Literate Agda Markdown files are built with `--safe` by default (change `agda_opts` in `./_docker/run.sh`)
    * Literate Agda Markdown files are compiled to `./agda/` directory in your website by default.
    * To link to a Literate Agda Markdown file: e.g. `{{ "/agda/MY.AGDA.MODULE.NAME" | relative_url }}`
        * Note: Github Pages URLs are case-sensitive!
        * Note: `./agda/` is the default output directory for this template.
1. Create your website - don't forget to edit the Jekyll config: `_config.yml`
    1. Any folders you create you will probably want to add to `.dockerignore` to make sure Docker doesn't try to use them.
1. Customise `./_docker/run.sh` to match your needs.
1. Run `./_docker/build` to build your site's Docker image.
    * If this fails, first try increasing the RAM limit for Docker in Docker settings. (This does not apply on Linux).
    * By default, this inherits from [the `latest` tag of EdNutting's Jekyll-Agda image](https://github.com/EdNutting/docker-jekyll-agda)
        * At the moment, this will mean the latest release of Agda.
            * Other tags are available for other versions of Agda e.g. `2.6.0.1 `
                * See the list of tags [on the Docker Hub](https://hub.docker.com/repository/docker/ednutting/jekyll-agda).
                * Use the `AGDA_VERSION` argument in the Dockerfile to configure the Agda version you want to use.
                * If you need a version not currently available, you should clone [the Jekyll-Agda repo](https://github.com/EdNutting/docker-jekyll-agda) and build your own image - or create an issue on the Jekyll-Agda repo requesting the version you need.
        * Do this after you've got your basic site working.
1. Run `./_docker/test` to build your website locally using the Docker image you just built.
    1. Check the `./_site` directory to see whether your files built properly.
1. If everything worked OK, run `./_docker/push` to push your Docker build image to Docker hub.
1. Git `push` your changes to `develop`
1. Check your repo's *Actions* tab in Github to see the workflow run.
    * It should *'just work'*.
    * You can see the build log if anything goes wrong.
1. Check your Github repo's settings - it should now say *"Your site is available at..."*
1. head to the site's URL and hopefully your content appears.

## Environment variables

Set the following values as environment variables when using the scripts in `./_docker` (these variables are specific to this template repo - they aren't a Docker thing - just what my scripts are set up to use to make things a little easier.)

| Name | Description | Example value |
|------|-------------|----|
| `dockerUsername` | Your username on Docker Hub. | `ednutting` |
| `dockerRepo` | The name of the repository to use for your website's build image. | `personal-website` |
| `workspaceFolder` | The absolute path to the directory of your Jekyll site (no trailing `/`). See note below re. VSCode. | `/home/ed/github-pages-agda` |

**Important:** When you change `dockerUsername` and `dockerRepo`, you must manually change them in `/github/workflows/jekyll.yml`. A comment in that file explains.

## VSCode

Note: `workspaceFolder` derives from the VSCode variable of the same name. In your VSCode global settings, you can use the following to pass the `workspaceFolder` variable from the integrated terminal to the docker script (restart any integrated terminals after changing), as well as the other environment vars.

```js
{
    // ...other settings...
    "terminal.integrated.env.linux": {
        "workspaceFolder": "${workspaceFolder}",
        "dockerUsername": "ednutting",
        "dockerRepo": "github-pages-agda"
    },
    "terminal.integrated.env.windows": {
        "workspaceFolder": "${workspaceFolder}",
        "dockerUsername": "ednutting",
        "dockerRepo": "github-pages-agda"
    }
}
```
