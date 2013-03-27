# `require.config({
#     paths: {
#         'jquery': 'lib/jquery-1.9.1.min'
#         , 'underscore': 'lib/underscore-min'
#         , 'backbone': 'lib/backbone-min'
#         , 'handlebars': 'lib/handlebars'
#     }
#     , shim: {
#         'backbone':{
#             deps:['underscore', 'jquery']
#             , exports: 'Backbone'
#         }
#     }
# });`
require.config
    paths:
        'jquery': 'lib/jquery-1.9.1.min'
        'underscore': 'lib/underscore-min'
        'backbone': 'lib/backbone-min'
        'handlebars': 'lib/handlebars'
        'text': 'lib/text'
    shim:
        'backbone':
            deps: [
                'underscore'
                'jquery'
                'handlebars'
            ]
            exports: 'Backbone'

    config:
        text:
            useXhr: ->
                true