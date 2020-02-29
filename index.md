---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
---

# Welcome to this template...

This template demonstrates how to integrate Agda with Github Pages to automatically compile
Literate Agda Markdown files for inclusion in the website.

## *Prove* it works

{% comment %}Note: This link goes to the compiled Markdown file, not the source!{% endcomment %}
An example [compiled lagda file here]({{ "/agda/simple" | relative_url }}).

## Why would you do this?

If you're writing blog posts about Agda and want to have the posts themselves be valid Agda files.
This ensure no copy-paste errors between your Agda code and your posts.

This also serves to demonstrate how Agda can be fully integrated with Github Actions tos- you
could use a similar setup to automatically typecheck/compile/run your Agda whenever you push.
