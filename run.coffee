#!/usr/local/bin/coffee
c = require 'coffee-script'

process.stdin.resume()
process.stdin.setEncoding('utf8')

process.stdin.on('data', (chunk) ->
    process.stdout.write("#{chunk}\n")
    process.stdout.write('"""\n\n')
    ret = c.eval chunk
    # do something with ret?
    # process.stdout.write("\n#{ret}\n\"\"\"")
    process.stdout.write('\n"""')
)
