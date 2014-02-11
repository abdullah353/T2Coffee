// Generated by CoffeeScript 1.6.3
var Resultd;

Resultd = Backbone.View.extend({
  id: 'graph',
  events: {
    'click .back': 'back'
  },
  initialize: function(option) {
    return this.data = option;
  },
  render: function() {
    this.$el.append("<button class='back navigation'>Back</button><div id='cg' style='width: 100%;min-height:650px'></div>");
    return this.trigger("rendered");
  },
  close: function() {
    this.remove();
    return this.unbind();
  },
  afterRender: function() {
    var dataSource;
    dataSource = this.data;
    return $("#cg").dxChart({
      dataSource: dataSource,
      commonSeriesSettings: {
        argumentField: "state",
        type: "bar",
        hoverMode: "allArgumentPoints",
        selectionMode: "allArgumentPoints",
        label: {
          connector: {
            visible: true
          },
          showForZeroValues: true,
          visible: true
        }
      },
      valueAxis: {
        title: 'Percentages Result'
      },
      series: [
        {
          valueField: "correct",
          name: "correct"
        }
      ],
      title: "Percentage Result Report",
      legend: {
        verticalAlignment: "bottom",
        horizontalAlignment: "center"
      },
      pointClick: function(point) {
        return this.select();
      },
      commonAxisSettings: {
        label: {
          font: {
            color: 'black',
            size: 15
          },
          overlappingBehavior: {
            mode: 'rotate',
            rotationAngle: 80
          }
        }
      }
    });
  },
  back: function() {
    Tangerine.router.navigate("", true);
    return false;
  }
});
