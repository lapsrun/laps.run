# venues.run
[![Build Status](https://travis-ci.org/tphummel/laps.run.svg?branch=master)](https://travis-ci.org/tphummel/laps.run)

### setup

```
brew update
brew install hugo
```

### dev

```
hugo server -D -w
```

### publish

```
rm -rf public/
hugo
aws s3 sync --delete public/ s3://my-bucket/
```
