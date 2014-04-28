(function() {
  define(function(require) {
    var $, Main_VM, ko;
    ko = require('knockout');
    $ = require("jquery");
    return Main_VM = (function() {
      function Main_VM() {
        this.title = ko.observable("Hello");
        return;
      }

      return Main_VM;

    })();
  });

}).call(this);
