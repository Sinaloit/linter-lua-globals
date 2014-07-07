linterPath = atom.packages.getLoadedPackage("linter").path
Linter = require "#{linterPath}/lib/linter"

class LinterLuaGlobals extends Linter
  # The syntax that the linter handles. May be a string or
  # list/tuple of strings. Names should be all lowercase.
  @syntax: 'source.lua'

  linterName: 'lua-globals'

  defaultLevel: 'warning'

  # A regex pattern used to extract information from the executable's output.
  regex:
    '\\s*\\[(?<line>\\d+)\\]\\s+' +
    '((?<warning>G:)|(?<error>S:))(?<message>.*)'

  errorStream: 'stdout'

  constructor: (editor) ->
    super(editor)

    atom.config.observe 'linter-lua-globals.luacExecutablePath', =>
      @executablePath = atom.config.get 'linter-lua-globals.luaExecutablePath'
      @cmd = ('lua ' +
        atom.packages.resolvePackagePath('linter-lua-globals') +
        '/lua/findglobals.lua '+
        '@executablePath').replace('@executablePath', @executablePath)

  destroy: ->
    atom.config.unobserve 'linter-lua-globals.luaExecutablePath'

module.exports = LinterLuaGlobals
