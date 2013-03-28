// Generated by CoffeeScript 1.6.2
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(function() {
    var Map, _ref;

    return Map = (function(_super) {
      __extends(Map, _super);

      function Map() {
        this.destroy = __bind(this.destroy, this);
        this.save = __bind(this.save, this);        _ref = Map.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Map.prototype.save = function() {
        var mapString;

        mapString = JSON.stringify(this.toJSON());
        return localStorage.setItem(this.id, mapString);
      };

      Map.prototype.destroy = function() {
        return localStorage.removeItem(this.id);
      };

      return Map;

    })(Backbone.Model);
  });

}).call(this);