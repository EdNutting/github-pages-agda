# github-pages-agda

Template repo demonstrating Literate Agda Markdown with Github Pages (/Jekyll)

1. You will need a Docker Hub account.
1. You may need to log into Docker Hub before using the Docker `push` command/script. On the command line: `docker login`. On Windows, you can also sign in using the Docker Settings app from the notification tray.
1. Make sure you are on a branch called `develop`
    1. `git branch develop && git checkout develop`
    1. The Github Actions workflow only runs for commits to `develop`. You can configure this - but make sure it never, ever runs for commits to `master` or *all the bad things will happen*.
    1. When you push to `develop`, the `jekyll` workflow runs, builds your site, and pushes the compiled site to `master`.
        * Github Pages then uses the contents of `master` as the source for your site.
1. Make sure Github Pages is enabled in your repo's settings on Github.
    1. Ensure the site is using the `master` branch as the source of the site's content.
        * This is the only option for personal sites on Github Pages.
        * Other options for project sites can be configured - just remember to modify the `workflows/jekyll.yml` file accordingly.
1. Set up the environment variables as set out below.
1. Set up `workflows/jekyll.yml` as per note in *Environment variables* below.
1. This templates puts `*.lagda.md` files in `./_agda`
    1. You can specify a `layout` in front-matter of these `lagda` files and it will be passed through to Jekyll.
    1. Literate Agda Markdown files are built with `--safe` by default (change in `./_docker/run.sh`)
    1. Literate Agda Markdown files are compiled to `./agda` directory in your website by default.
1. You will want to customise `./_docker/run.sh` to match your website's needs.
1. Run `./_docker/build` to build your site's Docker image.
1. Run `./_docker/test` to build your website locally using the Docker image you just built.
    1. Check the `./_site` directory to see whether your files built properly.
1. If everything worked OK, run `./_docker/push` to push your Docker build image to Docker hub.
1. Git `push` your changes to `develop`
1. Check your repo's *Actions* tab in Github to see the workflow run.
    * It should *'just work'*.
    * You can see the build log if anything goes wrong.
1. Your site should now appear.

## Environment variables

Set the following values as environment variables when using the scripts in `_docker` (these variables are specific to this template repo - they aren't a docker thing - just what my scripts are set up to use to make things a little easier.)

| Name | Description | Example value |
|------|-------------|----|
| `dockerUsername` | Your username on Docker Hub. | `ednutting` |
| `dockerRepo` | The name of the repository to use for your website's build image. | `personal-website` |
| `workspaceFolder` | The absolute path to the directory of your Jekyll site (no trailing `/`). See note below re. VSCode. | `/home/ed/github-pages-agda` |

**Important:** When you change `dockerUsername` and `dockerRepo`, you must manually change them in `workflows/jekyll.yml`.

## VSCode

Note: `workspaceFolder` derives from the VSCode variable of the same name. In your VSCode global settings, you can use the following to pass the `workspaceFolder` variable from the integrated terminal to the docker script (restart any integrated terminals after changing), as well as the other environment vars.

```json
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
