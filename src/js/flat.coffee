class Flat

	constructor : () ->
		@$flat = $('[flat]')
		@$views = $('[view]')
		@$views.not(':first').hide()
		@attachEvents()
	
	attachEvents : () ->
		self = @
		#triggers
		$('[trigger]').on 'click', (e) ->
			el = $(this)
			view = el.attr('trigger')
			self.view(view)

	updateColor : (color) ->
		color = color or @$flat.attr('wireframer')
		@$flat.find('*').css 'borderColor' : color

	view : (view) ->
		@currentView = @$views.filter(':visible')
		@currentView.hide()
		$('[view="'+view+'"]').show()

$ ->
	wireframer = new WireFramer()
	possibleColors = [1,2,3,4,5,6,7,8,9,0,'a','b','c','d','e','f']

	window.setInterval ->
		color = ''
		for i in [0...6]
			color += possibleColors[Math.floor(Math.random() * possibleColors.length)]
		console.log color
		wireframer.updateColor('#' + color)
	, 2000


