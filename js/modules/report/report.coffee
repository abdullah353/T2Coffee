Resultd = Backbone.View.extend
  id: 'graph'
  events:
    'click .back'   : 'back'
  initialize:(option)->
    @data = option
    

  render:()->
    @$el.append "<button class='back navigation'>Back</button><div id='cg' style='width: 100%;min-height:650px'></div>"
    @trigger "rendered"

  close: ()->
    @remove()
    @unbind()

  afterRender:()->
    dataSource = @data
    $("#cg").dxChart
      dataSource: dataSource
      commonSeriesSettings:
        argumentField: "state"
        type: "bar"
        hoverMode: "allArgumentPoints"
        selectionMode: "allArgumentPoints"
        label:
          connector: visible: true 
          showForZeroValues: true
          visible: true
      valueAxis:
        title: 'Percentages Result'
      series: [
        valueField: "correct"
        name: "correct"
      ]
      title: "Percentage Result Report"
      legend:
        verticalAlignment: "bottom"
        horizontalAlignment: "center"
      pointClick: (point)->
        this.select()
      commonAxisSettings:
        label:
          font: 
            color: 'black'
            size: 15
          overlappingBehavior:
            mode: 'rotate'
            rotationAngle: 80

  back: ->
    Tangerine.router.navigate "", true
    false
