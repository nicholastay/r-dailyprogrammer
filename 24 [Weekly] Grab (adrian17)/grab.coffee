# [Weekly #24] Mini Challenges - Grab (by adrian17)
# https://www.reddit.com/r/dailyprogrammer/comments/3o4tpz/weekly_24_mini_challenges/cvu1763

fs = require 'fs'
readline = require 'readline'
args = process.argv
args.splice 0, 2 # Default first few args not relevant
if args.length < 2
    console.error 'Too few arguments given, usage: coffee grab.coffee [string to find...] [file name]'
    process.exit 1

filename = args.pop()
rl = readline.createInterface
    input: fs.createReadStream filename

strRegex = new RegExp args.join ' '
upToLine = 1
rl.on 'line', (line) ->
    if line.match strRegex then console.log "#{upToLine}: #{line}"
    upToLine++

rl.on 'close', -> process.exit()