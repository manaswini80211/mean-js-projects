# window.bootstrap = function() {
#     angular.bootstrap(document, ['project']);
# };

# window.init = function() {
#     window.bootstrap();
# };

# $(document).ready(function() {
#     //Fixing facebook bug with redirect
#     if (window.location.hash == "#_=_") window.location.hash = "";

#     //Then init the app
#     window.init();
# });

window.bootstrap = ->
	angular.bootstrap document, ['project']

window.init = ->
	window.bootstrap()

$(document).ready ()->
	# Fixing facebook bug with redirect
	window.location.hash = "" if window.location.hash is "#_=_"

	# Then init the app
	window.init()

	no