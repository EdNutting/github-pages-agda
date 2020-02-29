#!/bin/bash

set -e

site_dir="/srv/jekyll" # Note: This must match the other _docker scripts, and the Github Actions workflow
agda_opts="--safe"
agda_src_dir=$site_dir/_agda
agda_dst_dir=$site_dir/agda
css_dst_dir=$site_dir/css

chmod 777 $site_dir

cd $agda_src_dir
find . -name "*.lagda.md" -print0 | while read -d $'\0' file
do
    echo "Compiling ${file}"
    agda --html --html-dir=$agda_dst_dir --html-highlight=code $agda_opts $file
done

cd $agda_dst_dir
mv Agda.css $css_dst_dir/Agda.css

cd $site_dir
jekyll build --future --trace

chown -R `stat -c "%u:%g" $site_dir` $site_dir/_site
chown -R `stat -c "%u:%g" $site_dir` $agda_dst_dir
