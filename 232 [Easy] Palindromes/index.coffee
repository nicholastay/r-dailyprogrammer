# [2015-09-14] Challenge #232 [Easy] Palindromes
# https://www.reddit.com/r/dailyprogrammer/comments/3kx6oh/20150914_challenge_232_easy_palindromes/

fs = require 'fs'
readline = require 'readline'
rl = readline.createInterface
  input: fs.createReadStream 'input.txt'

onLine = 0
linesToRead = 0
bulkStr = ''
rl.on 'line', (line) ->
    if onLine is 0
        linesToRead = parseInt line
        onLine++
        return
    bulkStr += line.toLowerCase().trim().replace(/[^A-Za-z]/g, '') if onLine <= linesToRead
    onLine++

rl.on 'close', ->
    return console.log 'Palindrome' if bulkStr is bulkStr.split('').reverse().join('')
    console.log 'Not a palindrome'