module.exports =
  configDefaults:
    luaExecutablePath: null
    script: 'findglobals.lua'

  activate: ->
    console.log 'activate linter-lua-globals'
