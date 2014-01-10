Collections = Backbone.Collection.extend()
collections = new Collections()
results = new Results()
results.fetch
  success: (data) ->
    ob ={} 
    data.each (model,index) ->
      ob[index] = model.get "subtestData"

    _.each ob, (items,index)-> 
      name = ''
      correct = 0
      incorrect = 0
      _.each items , (item)->
        if item.prototype is "location"
          name = item.data['location'].join()
        if item.prototype is "survey"
          g= item.data
          if g[Object.keys(g)[0]] is '1' then correct++ else incorrect++
      collections.add
        'state': name
        'correct': correct
        'incorrect': incorrect