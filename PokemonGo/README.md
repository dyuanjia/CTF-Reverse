# PokemonGo

## Description:

> 你好我是剛搬來隔壁的鄰居，我來自真新鎮，是這樣的，為了防止旅行中被盜刷，我把信用卡號跟 CVS 用程式鎖起來了，但是我忘記密碼了，怎麼會...

> 你看起來很亥客，可以幫我復原嗎？ 但是我也怕你盜走我的卡號，我只能給你程式的 trace

> 不要在 ctfd 爆搜，範圍在 A-Za-z0-9

## Solution:

The log file starts with a whole bunch of irrelevant lines of program initialization.

The lines of interest starts at:

```
Entering main.main at /home/terrynini38514/Desktop/PokemonV2.go:38:6.
```

Therefore, this is the trace of a go program. The line between `Entering fmt.Scanf` and `Leaving fmt.Scanf`, `Entering fmt.Println` and `Leaving fmt.Println` are also irrelevant.

At the start of `main`, the program takes in a string input, and pass it to the PikaCheck() function. In this function, it first initialized an array of size 20, then fills this $$arr[i]$$ with $$input[i]+input[(i+1)\%20]$$. The last part of this function subtracts each element in this array with a number, summed all the results, and check if it's 0.

To reverse, I brute forced all the possible combinations for each of these numbers. For example, the first number is 185, i.e $$input[0]+input[1] = 185$$. Since the characters are limited to A-Za-z0-9, brute force is very fast.

With all the possible combinations, I start with all the possible $$input[0]$$, and check if the corresponding $$input[1]$$ has an entry in the possible values for $$input[1]$$. I do the same all the way till $$input[19]$$. If its corresponding $$input[0]$$ is the same as the starting $$input[0]$$, the sequence is then a possible solution.

The printed out all of the solutions and the following one makes the most sense as a flag.

`FLAG{PikAPikApikaPikap1Ka}`
