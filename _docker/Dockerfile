# Start from the official Jekyll 'Builder' image
# which contains everything we need to run Jekyll
# normally. Jekyll Builder is built upon Ruby's image
# which is built upon Alpine Linux.

ARG JEKYLL_BASE_IMAGE=jekyll/builder:latest
ARG JEKYLL_AGDA_IMAGE=ednutting/jekyll-agda:latest

FROM $JEKYLL_AGDA_IMAGE as agda
FROM $JEKYLL_BASE_IMAGE

WORKDIR /

ENV PATH=/root/.local/bin:$PATH
COPY --from=agda  /agda/.stack-work/install /agda/.stack-work/install
COPY --from=agda /root/.local/bin/agda /root/.local/bin/agda

# Extend the Jekyll setup
ADD Gemfile /host/Gemfile
ADD Gemfile.lock /host/Gemfile.lock

RUN gem install bundler
RUN bundle config set path '/'
RUN cd /host/ && bundle install
