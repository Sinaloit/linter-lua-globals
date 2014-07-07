linterPath = atom.packages.getLoadedPackage("linter").path
Linter = require "#{linterPath}/lib/linter"

class LinterLuaGlobals extends Linter
  # The syntax that the linter handles. May be a string or
  # list/tuple of strings. Names should be all lowercase.
  @syntax: 'source.lua'

  linterName: 'lua-globals'

  defaultLevel: 'warning'

  cmd: 'lua ' + atom.packages.resolvePackagePath('linter-lua-globals') + '/lua/findglobals.lua'

  # A regex pattern used to extract information from the executable's output.
  regex:
    '\\s*\\[(?<line>\\d+)\\]\\s+' +
    '((?<warning>G:)|(?<error>S:))(?<message>.*)'

  errorStream: 'stdout'

  constructor: (editor) ->
    super(editor)

    atom.config.observe 'linter-lua-globals.luacExecutablePath', =>
      @executablePath = atom.config.get 'linter-lua-globals.luaExecutablePath'

    #atom.config.observe 'linter-lua-globals.script', =>
    #  @script = atom.config.get 'linter-lua-globals.script'
    #  @cmd = 'lua @script'.replace('@script', @script)

  destroy: ->
    atom.config.unobserve 'linter-lua-globals.luaExecutablePath'
    atom.config.unobserve 'linter-lua-globals.script'

module.exports = LinterLuaGlobals
