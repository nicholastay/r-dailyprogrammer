# [2015-10-28] Challenge #238 [Intermediate] Fallout Hacking Game
# https://www.reddit.com/r/dailyprogrammer/comments/3qjnil/20151028_challenge_238_intermediate_fallout/

wordlist = 'enable1.txt' # Wordlist file, each word delimited by a new line

fs = require 'fs'
readline = require 'readline'
getRandomInt = (min, max) -> return Math.floor(Math.random() * (max - min)) + min # https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random

dictionary = fs.readFileSync(wordlist).toString().split('\n')
rl = readline.createInterface
  input: process.stdin
  output: process.stdout

await rl.question 'Difficulty (1-5)? ', defer difficulty
if +difficulty > 5 or +difficulty < 1
    console.error 'Invalid difficulty.'
    process.exit 1

words = []
i = 0
while i < +difficulty*3 # level 5 = 15 words, level 1 = 3 words, scaled by *3
    word = ''
    wordLength = if +difficulty*3 < 4 then 4 else +difficulty*3 # 4 to 15 char long, 4 easiest 15 hardest scaled by *3 except for lv1 is 4
    while word.length isnt wordLength
        index = getRandomInt 0, dictionary.length
        if dictionary[index].trim() in words then continue else word = dictionary[index].trim() # no repeating words, trailing whitespace
    console.log word.toUpperCase()
    words.push word.toLowerCase()
    i++

wordToGuess = words[getRandomInt 0, words.length].split ''
guesses = 4
while guesses > 0
    await rl.question "Guess (#{guesses} left)? ", defer guess
    correctPositions = 0
    i = 0
    while i < wordToGuess.length
        if (wordToGuess[i] or guess[i]) and wordToGuess[i] is guess[i] then correctPositions++ # Check for invalid positions first and check for correct positions
        i++
    console.log "#{correctPositions}/#{wordToGuess.length} correct"
    if correctPositions is wordToGuess.length
        console.log 'You win!'
        process.exit()
    guesses--

console.log "You lose. The correct word was #{wordToGuess.join ''}."
process.exit()