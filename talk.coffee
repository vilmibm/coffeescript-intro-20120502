#                d'b  d'b                                    o          o
#                8    8                                                 8
# .oPYo. .oPYo. o8P  o8P  .oPYo. .oPYo. .oPYo. .oPYo. oPYo. o8 .oPYo.  o8P
# 8    ' 8    8  8    8   8oooo8 8oooo8 Yb..   8    ' 8  `'  8 8    8   8
# 8    . 8    8  8    8   8.     8.       'Yb. 8    . 8      8 8    8   8
# `YooP' `YooP'  8    8   `Yooo' `Yooo' `YooP' `YooP' 8      8 8YooP'   8
# :.....::.....::..:::..:::.....::.....::.....::.....:..:::::..8 ....:::..:
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::8 ::::::::::
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::..::::::::::
#
#                             nate smith
#                               cmgdst
#                            may 2nd, 2012














#                                 8
#                                 8
# .oPYo. .oPYo. .oPYo. odYo. .oPYo8 .oPYo.
# .oooo8 8    8 8oooo8 8' `8 8    8 .oooo8
# 8    8 8    8 8.     8   8 8    8 8    8
# `YooP8 `YooP8 `Yooo' 8   8 `YooP' `YooP8
# :.....::....8 :.....:..::..:.....::.....:
# :::::::::ooP'.:::::::::::::::::::::::::::
# :::::::::...:::::::::::::::::::::::::::::
# 
# 1. brief intro (5 min)
# 2. overview of language (30 min)
# 3. workflow (20 min)
# 4. q,a (5 min)














#                                     8
#                                     8
# .oPYo. `o  o' .oPYo. ooYoYo. .oPYo. 8 .oPYo. .oPYo.
# 8oooo8  `bd'  .oooo8 8' 8  8 8    8 8 8oooo8 Yb..  
# 8.      d'`b  8    8 8  8  8 8    8 8 8.       'Yb.
# `Yooo' o'  `o `YooP8 8  8  8 8YooP' 8 `Yooo' `YooP'
# :.....:..:::..:.....:..:..:..8 ....:..:.....::.....:
# :::::::::::::::::::::::::::::8 :::::::::::::::::::::
# :::::::::::::::::::::::::::::..:::::::::::::::::::::
"""
1. types and variables

    * No need to use var
    * trailing commas are great
    * yaml style object literals (and old style)
    * variable interpolation
    * destructuring
"""

sq = 'hello'

tdq = """
Dear John,

stuff and things.

    don't call, Jane
"""

olhs =
    name: "jonah"
    occupation: "author"
    address: "funky town"

olos = {hi:'there', how:'are', you:'all',}

l = ['hi', 'there',]

x = 'disagreeable nonsense'

interpolated = "politics is all #{x}"

[x,y] = [1,2]
console.log x,y











"""
2. functions: writing and calling

    * A sane, abbreviated function syntax
    * has scope-keeping operator
    * implicit return
    * explicit variable parity
    * optional parens when calling (be careful)
"""

# minimum viable function.
->

square = (x) -> x * x

multiline = (a,b,c) ->
    a += 1
    b.toUpperCase()
    delete c.hi
    return "All done."

# variable parity
splat = (p, xs...) -> console.log p, xs

outer = (x) ->
    # @ is a synonym for this
    @.hello = x
    inner_one = () -> console.log @.hello
    inner_two = () => console.log @.hello

    inner_one()
    inner_two()

outer.call({}, 'goodness')

# this is dangerous. only use when it's very obvious.
console.log 'hi'












"""
3. objects

    * friendly literal syntax as above
    * helpers for prototypal programming
    * "class" sugar (sugar is bad for you, mm'kay)
"""

a_long_obj =
    brother:
        name: "Max"
        age: 11
        interests: ["painting", "singing",]
    sister:
        name: "Ida"
        age: 13
        interests: ["programming", "data mining",]


# extends and ::
res = send: (o,c) -> console.log ("#{c} #{o.type} #{o.msg}")

Error = (msg, type) ->
    @.msg = msg or 'unknown error'
    @.type = type or 'error'
    @.code = 500
Error::finish = (res) -> res.send({msg:@.msg, type:@.type}, @.code)

NotFoundError = (identifier) ->
    @.type = 'not_found'
    @.msg = "not found: #{identifier}"
    @.code = 404
NotFoundError extends Error

(new Error()).finish(res)
(new NotFoundError('/bad/path')).finish(res)












"""
4. Arrays and Comprehensions

    * trailing comma okay as we've seen (yay)
    * list and object comprehensions
    * slicing, splicing, ranges
    * a lot like python
"""

map = (p, xs) -> p x for x in xs
filter = (p, xs) -> x for x in xs when p x

evens = (x for x in [1,2,3,4,5] when x % 2 is 0)
caps = (x.toUpperCase() for x in ['hi', 'there'])

console.log evens
console.log caps

# object comprehensions
tuples = ([x,y] for x,y of {hi:'there', you:'all'})
console.log tuples

# slice and splice
somethings = [1,2,3,4,5]
somethings[0..1]
somethings[0..2] = ['in', 'yr', 'list']
console.log somethings












"""
5. loops

    * "for own" keyword
    * they are expressions
"""

years_old = max: 11, ida: 13, tim: 5

ages = []
for own child, age of years_old
    ages.push "#{child} is #{age}"

console.log ages

# can capture result as expression
ages = for own child, age of years_old
    "#{child} is #{age}"

console.log ages

# (or just use a comp)
ages = ("#{child} is #{age}" for own child, age of years_old)
console.log ages

# also while, until, do while












"""
6. Conditionals

    * like a mutant python and perl child
"""

a = true
b = false
c = undefined
d = null
e = ''
f = []

if a and b
    console.log 'oops, logic broke'
else
    console.log 'safe for now'

unless c or d
    console.log 'same level of truthi- and falsi-ness'

g = if e then 'moo' else 'oink'
console.log g












"""
7. Operators

    * existential
    * null soaker (tm)
    * chained comparisons
    * is
    * in
    * of
"""

# existential operator
a = undefined
b = a?
console.log b

# null soaker
a =
    hi:'there'
    you:
        guys:'how are you'

console.log a.you.guys.how?.are

# chained comparisons
number_of_rainbows = 5
unless 100 > number_of_rainbows > 10
    console.log "#{number_of_rainbows} rainbows is not enough rainbows."

# is
console.log 'a' is 'a'
console.log '1' == 1

# in
console.log 'a' in 'hallo'
console.log 1 in [1,2,3]

# of
console.log 'x' of x:1












"""
8. "Real world"

    * a node example
    * a browser example
"""


# Backend (expressjs app route)

# note succinct callback passing
app.get('/data/browse/:category_slug.json', (req, res, next) ->

    category_slug = req.params.category_slug

    # yaml style is nice for passing objs as arguments
    Text.find(category_slug:category_slug).run((e, texts) ->

        # note lack of parens and post-fix if for brevity
        return next new DBError(e) if e

        # unless is nice sometimes
        return res.send([]) unless texts

        # for something like this i always use {}
        fac = (t) -> {slug:t.slug, revision_idx:t.revisions.length, desc:t.desc}
        ts = (fac t for t in texts)

        # yaml again. nice right?
        res.send(category:texts[0].category, texts:ts)
    )
)


# Frontend (sammyjs)
app.bind('save_made', (e, data) ->
    # sure it's ugly, but it's worse when it's compiled ;)
    count = 0
    for r in app._data.ranges
        for s in r.suggestions
           count = count + 1 if s.status is 'new'

    if count > 0
        $('#suggestions_left_warning').dialog(
            autoOpen:true
            title:"#{count} suggestion#{if count > 1 then 's' else ''} remain#{if count > 1 then '' else 's'}"
            # this is pleasant
            buttons:
                Ok: -> $(@).dialog('close')
        )
        return

    # deduce whether we're coming from a textarea or a list of inline edits
    # and set new_text accordingly
    if $('textarea.text').length > 0
        new_text = $('textarea.text').val()
    else
        new_text = $('div.text').html().replace(/&nbsp;/g, '\n').replace(/(<([^>]+)>)/ig,"")

    console.error('panic, no text found') unless new_text

    # much more terse than typical JS.
    $.ajax(
        url:durl('/save')
        context:@
        type:'post'
        data:
            text_id: app.store.get('meta').text_id
            new_text: new_text
        success: (data) ->
            $('#saving').dialog('close')
            console.log('success')
            console.log(data)
            @.redirect("#/thing/#{data.slug}/#{data.revision_idx}")
        error: (data) -> console.error(data)
    )
)














#                        8       d'b 8
#                        8       8   8
# o   o   o .oPYo. oPYo. 8  .o  o8P  8 .oPYo. o   o   o
# Y. .P. .P 8    8 8  `' 8oP'    8   8 8    8 Y. .P. .P
# `b.d'b.d' 8    8 8     8 `b.   8   8 8    8 `b.d'b.d'
#  `Y' `Y'  `YooP' 8     8  `o.  8   8 `YooP'  `Y' `Y'
# ::..::..:::.....:..::::..::...:..::..:.....:::..::..::
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::

"""

so you want to use coffeescript.

# Caveats

    * A solid understanding of javascript is crucial.
    * This is not a magic bullet for learning JS.

# Building

    * npm install -g coffee-script
    * coffee myscript.coffee
    * coffee --compile myscript.coffee
    * coffee --watch --compile myscript.coffee

# Playing

    * just running `coffee` gives you a REPL
    * use Ctrl-V for multiline input

# Debugging

    * Compilation errors are straightforward and tell you exact line nums.
    * Runtime errors map very cleanly to the Javascript source.
    * _this is a reason why it is crucial to understand javascript._

# Editing

    * vim: https://github.com/kchmck/vim-coffee-script
    * emacs: https://github.com/defunkt/coffee-mode
    * eclipse: https://github.com/aptana/studio3
    * other: wait, what?

"""













#  d'b  o
#  8
# o8P  o8 odYo.
#  8    8 8' `8
#  8    8 8   8
#  8    8 8   8
# :..:::....::.
# ::::::::::::::
# ::::::::::::::

"""

thanks!

questions?

"""




# that font was jazmine from http://www.network-science.de/ascii/
