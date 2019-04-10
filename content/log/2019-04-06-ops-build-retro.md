---
title: "Ops Build Retrospective"
date: 2019-04-06T19:35:58-07:00
tags: []
toc: true

---

<!--more-->

# Background

The [laps.run](https://laps.run) [operations website](https://ops.laps.run) [builds](https://travis-ci.com/lapsrun/ops.laps.run/builds) several times a week. The source code itself doesn't change often. Builds are triggered via the Travis CI API using the latest code in the repo. These builds render out the ops website based on build data automatically stored after each build.

# Errors

On March 21, there were three build errors, triggered by API calls.

The ops.laps.run codebase had not changed since [January 20](https://github.com/lapsrun/ops.laps.run/commit/5d70eac8f87a8660a02fb4884e8f6847264ad4e5). There had been many successful builds in the intervening time between January 20 and March 21.

## Build 894

[March 21 07:26:54](https://travis-ci.com/lapsrun/ops.laps.run/builds/105295324)

Error:

```
$ rake
rake aborted!
No Rakefile found (looking for: rakefile, Rakefile, rakefile.rb, Rakefile.rb)
/home/travis/.rvm/gems/ruby-2.4.1/bin/ruby_executable_hooks:15:in `eval'
/home/travis/.rvm/gems/ruby-2.4.1/bin/ruby_executable_hooks:15:in `<main>'
(See full trace by running task with --trace)
The command "rake" exited with 1.

Done. Your build exited with 1.
```

## Build 895

[March 21 07:49:53](https://travis-ci.com/lapsrun/ops.laps.run/builds/105299679)

Error:

```
$ rake
rake aborted!
No Rakefile found (looking for: rakefile, Rakefile, rakefile.rb, Rakefile.rb)
/home/travis/.rvm/gems/ruby-2.4.1/bin/ruby_executable_hooks:15:in `eval'
/home/travis/.rvm/gems/ruby-2.4.1/bin/ruby_executable_hooks:15:in `<main>'
(See full trace by running task with --trace)
The command "rake" exited with 1.

Done. Your build exited with 1.
```

## Build 896

[March 21 07:50:42](https://travis-ci.com/lapsrun/ops.laps.run/builds/105299722)

Error:

```
$ rake
rake aborted!
No Rakefile found (looking for: rakefile, Rakefile, rakefile.rb, Rakefile.rb)
/home/travis/.rvm/gems/ruby-2.4.1/bin/ruby_executable_hooks:15:in `eval'
/home/travis/.rvm/gems/ruby-2.4.1/bin/ruby_executable_hooks:15:in `<main>'
(See full trace by running task with --trace)
The command "rake" exited with 1.

Done. Your build exited with 1.
```

# Conclusion

There were no changes to source code, build config, or anything in the Travis CI web console which could have caused this. These were intermittent errors caused by Travis CI itself.
