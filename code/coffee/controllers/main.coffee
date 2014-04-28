define (require) ->
  ko = require 'knockout'
  $ = require "jquery"

  class Main_VM
    constructor: ->
      @title = ko.observable "Hello"   
      return