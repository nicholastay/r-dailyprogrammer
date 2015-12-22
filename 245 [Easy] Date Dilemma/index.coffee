# [2015-12-14] Challenge # 245 [Easy] Date Dilemma
# https://www.reddit.com/r/dailyprogrammer/comments/3wshp7/20151214_challenge_245_easy_date_dilemma/

fs = require 'fs'
input = fs.readFileSync('./input.txt').toString().replace(/\r/g, '').split('\n') # gotta remove \r character zzz

formatYear = (year) -> return if year.length > 2 then year else '20' + year
formatMonth = (month) -> return if month.length > 1 then month else '0' + month
formatDay = (day) -> return if day.length > 1 then day else '0' + day

finalDates = []
for line in input
    date = line.split /[- \/]/
    # YMD or MDY
    if date[0].length > 2 then date = [date[0], date[1], date[2]] else date = [date[2], date[0], date[1]]
    finalDates.push "#{formatYear date[0]}-#{formatMonth date[1]}-#{formatDay date[2]}"
console.log finalDates.join '\n'