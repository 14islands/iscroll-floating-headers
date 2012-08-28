root = exports ? this

class root.iScrollFloatingHeaders

	AUTO_SCROLL_SPEED: 500
	SCROLL_TO_ELEMENT_OFFSET: 0
		
	y: undefined

	scrolling: false
	animating: false
	hidden:    false

	headers: [] # all header meta data
	sticky:  null #current sticky header

	constructor: (@el) ->
		@$el = $(@el)
		@_findHeaders()
		@SCROLL_TO_ELEMENT_OFFSET = @$el.height() * 0.33
		@scrollHeight = @$el.children(':first-child').height() - @$el.height()

		# build list
		@$headers.each( (i, item) =>
			@headers.push(
				$el: $(item)
				y: $(item).offset().top - @$el.offset().top
				text: $(item).text()
				i: i
			)
		)

		# init scroll
		@iscroll = new iScroll(@el,
			vScrollbar: false
			hScrollbar: false
			useTransition: false #doesnt update Y-coordinate on every frame
			onBeforeScrollStart: (e) ->
				# allow input elements to get events
				target = e.target
				while target.nodeType isnt 1
					target = target.parentNode
				if target.tagName isnt 'SELECT' and target.tagName isnt 'INPUT' and target.tagName isnt 'TEXTAREA'
					e.preventDefault()
				else
					e.stopPropagation()

			onScrollStart: @_onScrollStart
			onScrollEnd:   @_onScrollEnd
		)

		@_updateHeaders()
		@_enableQuickScroll()
	

	_onScrollStart: =>
		unless @scrolling
			@scrolling = true
			@_onScroll()


	_onScrollEnd: =>
		@scrolling = false
		@_onScroll()
		@_setStickyText( @sticky?.text ) # one final update to be sure


	_findHeaders: ->
		# create sticky header
		@$sticky  = $('<label class="sticky">')
		@$el.append(@$sticky)
		@$headers = $('li.header', @$el)
		@headerColor = @$headers.css('color')
		@headerBackground = @$headers.css('background-color')
		@headerHeight = @$headers.height() # height of headers


	# positions the sticky header and makes sure it shows correct text
	_updateHeaders: ->
		if @sticky? and @headers.length > @sticky.i+1
			nextHeader = @headers[@sticky.i+1]
			delta = nextHeader.y + @y
			
			if delta > 0 and delta <= @headerHeight
				@animating = true unless @animating
				 
				nextHeader.$el.css('color', @headerColor)
				@$sticky.css('-webkit-transform', 'translate3d(0, -'+(@headerHeight-delta-2)+'px, 0)')
				
				if delta <= @headerHeight * 0.25
					if @iscroll.dirY > 0
						@_setStickyText( nextHeader.text )
					else if @iscroll.dirY < 0
						@_setStickyText( @sticky.text )
				
			else
				if @animating
					@$sticky.css('-webkit-transform', 'none')
					@animating = false

		currentHeader = null
		for header in @headers
			currentHeader = header if header.y + @y < 0
		
		if typeof @y is "undefined" or currentHeader is null
			@headers[0]?.$el.css('color', @headerColor)
			setTimeout( =>
				if @hidden
					@$sticky.css('visibility', 'hidden')
					@_setStickyText( @headers[0]?.text )
			, 10)
			@hidden = true
			@sticky = undefined

		else if currentHeader isnt @sticky
			if @hidden
				@$sticky.css('visibility', 'visible')
				@hidden = false
				
			unless @animating
				@_setStickyText(currentHeader?.text)
				@sticky.$el.css('color', @headerColor) if @sticky?
				
			@sticky = currentHeader
			@sticky.$el.css('color', @headerBackground)
			

	# caches updates to the DOM
	_setStickyText: (text) ->
		unless @stickyText is text
			setTimeout( =>
				@$sticky.text( text )
				@stickyText = text
			, 0)


	_onScroll: =>
		@y = @iscroll.y
		@_updateHeaders()
		requestAnimationFrame(@_onScroll, 0) if @scrolling


	_enableQuickScroll: ->
		@quickscroll = $('<sidebar>A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Å Ä Ö</sidebar>')
		@$el.append(@quickscroll)
		@quickscroll.on('touchmove', (e) =>
			e.stopPropagation()
			e.preventDefault()
			percentage = (e.touches[0].pageY - @quickscroll.offset().top) / @quickscroll.height()
			percentage = Math.min(1, Math.max(percentage, 0))
			scrollPos = - @scrollHeight * percentage
			@_onScrollStart() #not triggered by default by scrollTo()
			@iscroll.scrollTo(0, scrollPos, 0)
		)
	

	### Public functions
	###

	refresh: ->
		setTimeout( =>
			@iscroll.refresh()
		, 0)


	scrollTo: (pos, delay = 0) ->
		setTimeout( =>
			@iscroll.scrollTo(0, pos, @AUTO_SCROLL_SPEED)
		, delay)


	scrollToTop: ->
		@$sticky.css('visibility', 'hidden')
		@scrollTo(0)


	# scroll element to middle of screen if possible
	scrollToElement: (el, delay = 0) ->
		setTimeout( =>
			# instant scroll to top of element
			@iscroll.scrollToElement(el, 0)
			setTimeout( =>
				# check if enough space at top, otherwise only scroll to top
				if @iscroll.y + @SCROLL_TO_ELEMENT_OFFSET > 0
					@_onScrollStart() #not triggered by default by scrollTo()
					@iscroll.scrollTo(0, 0, @AUTO_SCROLL_SPEED)
				# check if scrolled to bottom - if so stay there
				else if @iscroll.y + @scrollHeight > 0
					@_onScrollStart() #not triggered by default by scrollTo()
					@iscroll.scrollTo(0, @iscroll.y + @SCROLL_TO_ELEMENT_OFFSET, @AUTO_SCROLL_SPEED)
			, delay)
		, 0)
		
