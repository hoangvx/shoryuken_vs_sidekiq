# Shoryuken vs sidekiq speed test

## Install

```bash
cd [working dir]
# install gem
bundle install
```

##### start redis for sidekiq test

```
docker-compose up -d redis
```

##### config your environment for aws

https://github.com/phstc/shoryuken/wiki/Configure-the-AWS-Client

##### Create bucket via https://putsreq.com/

## start testing

#### sidekiq

```bash
# queue job
bundle exec rake sidekiq:polulate

# worker execute
BUCKET_URL=[pustreq sidekiq bucket url] bundle exec sidekiq
```

#### shoryuken

```bash
# queue job
bundle exec rake shoryuken:polulate

# worker execute
BUCKET_URL=[pustreq shoryuken bucket url] bundle exec shoryuken -q default -r ./app/workers/shoryuken_worker.rb
```
