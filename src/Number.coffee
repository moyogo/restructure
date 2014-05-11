DecodeStream = require './DecodeStream'

class NumberT
  constructor: (@type, @endian = 'BE') ->
    @fn = @type
    unless @type[@type.length - 1] is '8'
      @fn += @endian
      
  size: ->
    DecodeStream.TYPES[@type]
    
  decode: (stream) ->
    return stream['read' + @fn]()
    
  encode: (stream, val) ->
    stream['write' + @fn](val)
    
exports.Number = NumberT
exports.uint8 = new NumberT('UInt8')
exports.uint16 = new NumberT('UInt16')
exports.uint24 = new NumberT('UInt24')
exports.uint32 = new NumberT('UInt32')
exports.int8 = new NumberT('Int8')
exports.int16 = new NumberT('Int16')
exports.int24 = new NumberT('Int24')
exports.int32 = new NumberT('Int32')
exports.float = new NumberT('Float')
exports.double = new NumberT('Double')