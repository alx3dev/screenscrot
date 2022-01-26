# ScreenScrot

Linux terminal recording with Ruby and Scrot.

![preview](https://github.com/alx3dev/kolorit/blob/main/demo.gif)

# Install

```bash
git clone https://www.github.com/alx3dev/screenscrot \
cd screenscrot \
bin/setup
```
This will install SCROT.

# How to use

```ruby
# argument 1 == number of seconds to record (default 30)
# argument 2 == directory and gif title (default ScreenScrot)

# argument 3 can be:
#   --all (record everything)
#   --select (select with mouse)
#
# if no third argument, active window will be recorded.

  ruby bin/screenscrot 90 simple_test

  ruby bin/screenscrot 60 test_recording --all
```
