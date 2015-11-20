# [2015-11-09] Challenge #240 [Easy] Typoglycemia
# https://www.reddit.com/r/dailyprogrammer/comments/3s4nyq/20151109_challenge_240_easy_typoglycemia/

readline = require 'readline'
rl = readline.createInterface
    input: process.stdin
    output: process.stdout

# https://gist.github.com/ddgromit/859699#gistcomment-783800
# Fisher-Yates Array Shuffle
shuffle = (a) ->
    for i in [a.length-1..1]
        j = Math.floor Math.random() * (i + 1)
        [a[i], a[j]] = [a[j], a[i]]
    a

await rl.question 'Text input: ', defer text
output = ''
splitText = text.split ' '
typoList = splitText.map (word) ->
    splitWord = word.split ''
    lastChar = splitWord.pop()[0]
    firstChar = splitWord.shift()[0]
    return firstChar + shuffle(splitWord).join('') + lastChar

console.log typoList.join ' '
process.exit()
