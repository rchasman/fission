modelView = require '../src/modelView'
model = require '../src/model'
domino = require 'domino'

React = null
utils = null

global.window = domino.createWindow '<html><body></body></html>'
global.document = window.document
global.navigator = window.navigator


module.exports =

  "#modelView should produce a React view": =>

    m = model 
      url: '/v1/foo'
      name: 'foo'
      fetch: ->
        @set
          foo: 'bar'

    @v = modelView
      model: m
      render: -> console.log "RENDER"

    @v.should.have.property 'componentConstructor'
    @v.should.have.property 'originalSpec'

  "#modelView should ...": =>
    React = require 'react/addons'
    utils = React.addons.TestUtils
    #console.log document
    vu = utils.renderIntoDocument @v(model: 'foo')
    console.log vu

    #mock = React.addons.TestUtils.mockComponent @v
    #console.log mock.mockComponent()