# [2015-10-26] Challenge #238 [Easy] Consonants and Vowels
# https://www.reddit.com/r/dailyprogrammer/comments/3q9vpn/20151026_challenge_238_easy_consonants_and_vowels/

process.stdin.resume()
process.stdin.setEncoding 'utf8'

# https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
getRandomInt = (min, max) -> return Math.floor(Math.random() * (max - min)) + min

consonants = 'bcdfghjklmnpqrstvwxyz'.split ''
vowels = 'aeiou'.split ''

finalStr = ''
process.stdin.on 'data', (text) ->
    text = text.trim() # Enter could be whitespace
    for letter in text
        switch letter
            when 'c' then finalStr += consonants[getRandomInt(0, consonants.length)].toLowerCase()
            when 'C' then finalStr += consonants[getRandomInt(0, consonants.length)].toUpperCase()
            when 'v' then finalStr += vowels[getRandomInt(0, vowels.length)].toLowerCase()
            when 'V' then finalStr += vowels[getRandomInt(0, vowels.length)].toUpperCase()
            else finalStr = 'Invalid characters in sequence.'
    console.log finalStr
    process.exit()