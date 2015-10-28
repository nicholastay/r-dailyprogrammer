# [easy] challenge #1
# https://www.reddit.com/r/dailyprogrammer/comments/pih8x/easy_challenge_1/

fs = require 'fs'
readline = require 'readline'

rl = readline.createInterface
  input: process.stdin
  output: process.stdout

await rl.question 'Name?: ', defer name
await rl.question 'Age?: ', defer age
await rl.question 'Reddit Username?: ', defer username

console.log "your name is #{name}, you are #{age} years old, and your username is #{username}"
fs.appendFile 'users.log', "'#{name}','#{age}','#{username}'" # log it as csv style
process.exit()