// Generated by CoffeeScript 1.6.3
var KlassResult, _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

KlassResult = (function(_super) {
  __extends(KlassResult, _super);

  function KlassResult() {
    _ref = KlassResult.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  KlassResult.prototype.url = "result";

  KlassResult.prototype.initialize = function(options) {
    return this.set({
      'timestamp': (new Date()).getTime()
    });
  };

  KlassResult.prototype.add = function(subtestDataElement) {
    return this.save({
      'subtestData': subtestDataElement
    });
  };

  return KlassResult;

})(Backbone.Model);