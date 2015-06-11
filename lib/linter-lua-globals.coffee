linterPath = atom.packages.getLoadedPackage("linter").path
Linter = require "#{linterPath}/lib/linter"
path = require 'path'

class LinterLuaGlobals extends Linter
  # The syntax that the linter handles. May be a string or
  # list/tuple of strings. Names should be all lowercase.
  @syntax: 'source.lua'

  linterName: 'lua-globals'

  defaultLevel: 'warning'

  # A regex pattern used to extract information from the executable's output.
  regex:
    '\\s*\\[(?<line>\\d+)\\]\\s+' +
    '((?<warning>G:)|(?<error>S:))' +
    '(?<message>.+?(?::\\s(?<near>.*)|$))'

  errorStream: 'stdout'

  constructor: (editor) ->
    super(editor)

    @configSubscription = atom.config.observe 'linter-lua-globals.luaExecutablePath', =>
      @executablePath = atom.config.get 'linter-lua-globals.luaExecutablePath'
      @cmd = [
        'lua',
        path.join(atom.packages.resolvePackagePath('linter-lua-globals'),
          'lua','findglobals.lua'),
        @executablePath
      ]

  # Have to override because windows paths can contain spaces
  getCmdAndArgs: (filePath) ->
    #Duplicate cmd array so we don't change the original
    cmd_list = @cmd.slice(0)
    cmd_list.push filePath

    if @executablePath
      cmd_list[0] = path.join(@executablePath, cmd_list[0])

    # if there are "@filename" placeholders, replace them with real file path
    cmd_list = cmd_list.map (cmd_item) ->
      if /@filename/i.test(cmd_item)
        return cmd_item.replace(/@filename/gi, filePath)
      else
        return cmd_item

    if atom.config.get('linter.lintDebug')
      console.log 'command and arguments', cmd_list

    {
      command: cmd_list[0],
      args: cmd_list.slice(1)
    }

  destroy: ->
    super
    @configSubscription.dispose()

module.exports = LinterLuaGlobals
