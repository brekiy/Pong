# Pong

super simple pong project for better understanding how to use signals to link together nodes in Godot

in the `Goalzone` script, a goal zone can emit 2 signals, `score` and `start_countdown` which are picked up by the main `Arena` scene which wraps everything. when `Arena` initializes it `connects` the `score` signal to the UI's `_on_scored()` function and the `start_countdown` signal to its own `_on_countdown_timer_start()` function.

signals in Godot will automatically call the connected functions when they emit a message, and can take a value. the signal `score` passes along the owner of the goal zone, which the UI sees and determines the correct player to credit with a goal. `start_countdown` just triggers the countdown timer in the `Arena` script to start the timer.
