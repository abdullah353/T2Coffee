Resultd = Backbone.View.extend
  id: 'graph'

  initialize:(id)->
    console.log "Created View"
    @id = id
    console.log @id

  render:()->
    console.log "Rendering"
    $('#content').slideUp()
    Collections = Backbone.Collection.extend()
    collections = new Collections()
    results = new Results()
    total = 0
    Tangerine.$db.view 'tangerine/questionsCountByAssessmentId?key="'+@id+'"', success: (data) -> 
      total = data.rows[0].value
      results.fetch
        key: @id
        success: (data) ->
          $('#graph').slideDown()
          ob ={} 
          data.each (model,index) ->
            ob[index] = model.get "subtestData"
          _.each ob, (items,index)-> 
            name = ''
            correct = 0
            incorrect = 0
            if _.last(items).prototype is "complete"
              _.each items , (item)->
                if item.prototype is "location"
                  name = item.data['location'].join()
                if item.prototype is "survey"
                  g= item.data
                  console.log "G which is item.data"
                  console.log g

                  console.log "correct"
                  console.log correct
                  correct += Number( g[Object.keys(g)[0]] )
              dt = on
              collections.each (collection)->
                dt = off if collection.get('state') == name
              if dt then collections.add
                'state': name
                'correct': Number ((correct / total) * 100).toFixed(2)
          dataSource =  collections.toJSON()
          console.log "Data for graph"
          console.log dataSource
          $("#chartContainer").dxChart
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