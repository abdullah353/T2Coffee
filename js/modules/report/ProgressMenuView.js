// Generated by CoffeeScript 1.6.3
var ProgressMenuView, _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

ProgressMenuView = (function(_super) {
  __extends(ProgressMenuView, _super);

  function ProgressMenuView() {
    _ref = ProgressMenuView.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  ProgressMenuView.prototype.events = {
    'change .student_selector': 'gotoProgressTable'
  };

  ProgressMenuView.prototype.gotoProgressTable = function(event) {
    return Tangerine.router.navigate("report/progress/" + this.$el.find(event.target).find(":selected").attr("data-studentId"), true);
  };

  ProgressMenuView.prototype.initialize = function(options) {
    var allStudents,
      _this = this;
    this.parent = options.parent;
    this.klass = this.parent.options.klass;
    this.curricula = this.parent.options.curricula;
    allStudents = new Students;
    return allStudents.fetch({
      success: function(collection) {
        _this.students = collection.where({
          klassId: _this.klass.id
        });
        _this.ready = true;
        return _this.render();
      }
    });
  };

  ProgressMenuView.prototype.render = function() {
    var html, student, _i, _len, _ref1;
    if (this.ready) {
      html = "        <select class='student_selector'>          <option disabled='disabled' selected='selected'>" + (t('select a student')) + "</option>          ";
      _ref1 = this.students;
      for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
        student = _ref1[_i];
        html += "<option data-studentId='" + student.id + "'>" + (student.get('name')) + "</option>";
      }
      html += "</select>";
      return this.$el.html(html);
    } else {
      return this.$el.html("<img src='images/loading.gif' class='loading'>");
    }
  };

  return ProgressMenuView;

})(Backbone.View);