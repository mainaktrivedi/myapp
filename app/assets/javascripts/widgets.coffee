# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  data = 
	  name: "node1"
	  children: [
	    name: "child1"
	    name: "child2"
	     ]
	  name: "node2"
	  children: [
	    name: "child3"
	     ]

  tree = [
	  text: "node1"
	  nodes: [
	      {
	      	text: "child1"
	      	nodes: [
	      	  {text: "GrandChild1"}
	      	  {text: "GrandChild2"}
	      	]
	      }
	      {
	      	text: "child2"
	      	nodes: [
	      	  {text: "GrandChild3"}
	      	]

	      }
	      {
	      	text: "child3"
	      	nodes: [
	      	  {text: "GrandChild4"}
	      	]
	      }
	     ]    
	]        

  test = ->
	  $("#test2").treeview 
	     data: tree
	     levels: 3

  test()   	