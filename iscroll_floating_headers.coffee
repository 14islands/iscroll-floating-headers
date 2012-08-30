root = exports ? this

class root.iScrollFloatingHeaders

	AUTO_SCROLL_SPEED: 500
	SCROLL_TO_ELEMENT_OFFSET: 0
	PIXEL_OVERLAP: 1 #section headers - floating header overlap to prevent animation gaps
		
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
			hScroll: false
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

		@_updateFloatingHeader()
		@_enableQuickScroll()
	

	_onScrollStart: =>
		@_updateFloatingHeader()
		unless @scrolling
			@scrolling = true
			@_onScroll()


	_onScroll: =>
		setTimeout(@_onScroll, 0) if @scrolling
		unless @iscroll.y is @y
			@y = @iscroll.y
			@_updateFloatingHeader()
			

	_onScrollEnd: =>
		@scrolling = false
		# one final update to be sure we got a solid state
		@_updateFloatingHeader()
		@_setStickyText( @sticky?.text )


	_findHeaders: ->
		@$headers = $('header', @$el)
		@headerColor = @$headers.css('color')
		@headerBackground = @$headers.css('background-color')
		@headerHeight = @$headers.height() # height of headers
		# create sticky header
		@$sticky  = $('<header class="sticky">')
		@$el.append(@$sticky)


	# positions the sticky header and makes sure it shows correct text
	_updateFloatingHeader: ->
		# find current section heaer
		currentHeader = null
		for header in @headers
			currentHeader = header if header.y + @y <= 0

		# handle negative scroll
		if typeof @y is "undefined" or currentHeader is null
			@_setStickyText( @headers[0]?.text )
			@headers[0]?.$el.css('-webkit-transform', 'translate3d(0, 0, 0)')
			@$sticky.css('-webkit-transform', 'translate3d(0, -1000px, 0)')
			@hidden = true
			@sticky = undefined

		# switch to new floating header
		else if currentHeader isnt @sticky 		
			prevHeader = @sticky
			@sticky = currentHeader

			if @hidden or @iscroll.dirY > 0 # scrolling down
				@hidden = false if @hidden
				@_setStickyText(currentHeader?.text)
				setTimeout( =>
					currentHeader.$el.css('-webkit-transform', 'translate3d(100%, 0, 0)')
					@$sticky.css('-webkit-transform', 'translate3d(0, 0, 0)')
				, 0)
			else if @iscroll.dirY < 0 # scrolling uo
				prevHeader?.$el.css('-webkit-transform', 'translate3d(0, 0, 0)')
				@_setStickyText(currentHeader?.text)
			else
				# quick scroll without direction

			# FIND WAY TO SHOW HIDDEN HEADERS AFTER BOUNCEBACK AT BOTTOM
			#@$headers.not(@sticky?.$el).each( (i, item) ->
			#	$(item).css('-webkit-transform', 'translate3d(0, 0, 0)')
			#)
		
		# update animation if applicable
		if @sticky? and @headers.length > @sticky.i+1
			nextHeader = @headers[@sticky.i+1]
			delta = nextHeader.y + @y
			if delta > 0 and delta < @headerHeight
				@animating = true unless @animating
				yOffset = @headerHeight - delta - @PIXEL_OVERLAP
				@$sticky.css('-webkit-transform', 'translate3d(0, -' + yOffset + 'px, 0)')
			else if @animating
				@animating = false
				@$sticky.css('-webkit-transform', 'translate3d(0, 0, 0)') if @iscroll.dirY < 0
	

	# cache updates to the DOM
	_setStickyText: (text) ->
		unless @stickyText is text
			setTimeout( =>
				@$sticky.text( text )
				@stickyText = text
			, 0)


	_enableQuickScroll: ->
		@quickscroll = $('<sidebar>A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Å Ä Ö</sidebar>')
		@$el.append(@quickscroll)
		@quickscroll.on('touchmove', (e) =>
			e.stopPropagation()
			e.preventDefault()
			percentage = (e.touches[0].pageY - @quickscroll.offset().top) / @quickscroll.height()
			percentage = Math.min(1, Math.max(percentage, 0))
			scrollPos = - @scrollHeight * percentage
			@iscroll.dirY = 0
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
		
