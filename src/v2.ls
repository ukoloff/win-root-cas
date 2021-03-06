exports <<< {all, each}

each.async = async

!function each
  upgradeAPI & params =
    unique: true
    ondata: !-> params.$cb? it

!function async
  upgradeAPI & params =
    async: true
    ondata: !-> params.$cb? void it
    onend:  !-> params.$cb?!

function all
  upgradeAPI & do
    ondata: result = []
  result

!function upgradeAPI(args, defaults)
  api = require \.
  format = args[0]

  defaults.unique ?= false
  defaults <<<
    format: format ? api.der2.x509
    $cb:   args[1] or format

  api defaults
