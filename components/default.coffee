noflo = require 'noflo'

exports.getComponent = ->
  c = new noflo.Component
  
  rules = { "rules":[
  		   			  { "action": "runner/start", "url": "http://casperjs.org/" },
  		   			  { "action": "title" },
  		   			  { "action": "open", "url": "http://phantomjs.org" }
  		   			  { "action": "title" }
		 			]
  
  		  }
  
  
  c.inPorts.add 'in', {datatype:'bang'}, (event, payload) ->
    
    # Do something with the packet, then
    c.outPorts.out.send rules
 
  c.outPorts.add 'out', {datatype: "array"}
  
  c