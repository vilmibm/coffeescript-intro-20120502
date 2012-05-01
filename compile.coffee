#!/usr/local/bin/coffee
c = require 'coffee-script'

process.stdin.resume()
process.stdin.setEncoding('utf8')

process.stdin.on('data', (chunk) ->
    process.stdout.write("#{chunk}\n\n`#{c.compile chunk}`")
)
