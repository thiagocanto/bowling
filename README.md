# Bowling scores

## See your bowling scores!

Steps
=========
<!--ts-->
  * [Installing needed gems](#settingUp)
  * [Testing](#testing)
  * [Running](#running)
<!--te-->

### Install

Although there is not a lot of gems, RSpec is used for testing, 
so it need to be installed to run the tests

```bash
# Run bundle install to setup
$ bundle install
```

Besides that, the bowling summary can run without any other gems.

### Testing

The project has some tests to validate pins score and info, use:

```bash
$ rspec --format doc
```

to run through the tests and validate project integrity


### Running

I've provided 3 example games to do an early simulation before using your
own game, they're on the `example_games` folder

To run the project and see the Bowling Summary of the passed game, just 
call the `main.rb` file with an `file` argument passing the desired game data

```bash
# Default game
$ ruby main.rb file=example_games/default_game.txt

# Perfect game
$ ruby main.rb file=example_games/perfect_game.txt

# Failed game
$ ruby main.rb file=example_games/lame_game.txt
```
