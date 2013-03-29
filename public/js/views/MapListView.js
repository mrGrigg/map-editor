// Generated by CoffeeScript 1.6.2
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['models/MapCollection', 'views/MapListItem', 'views/NewMapModal', 'text!templates/mapList.html'], function(MapCollection, MapListItem, NewMapModal, template) {
    var MapListView, _ref;

    return MapListView = (function(_super) {
      __extends(MapListView, _super);

      function MapListView() {
        this.addMapToCollection = __bind(this.addMapToCollection, this);
        this.showNewMapDialog = __bind(this.showNewMapDialog, this);
        this.renderMapListItem = __bind(this.renderMapListItem, this);
        this.renderList = __bind(this.renderList, this);
        this.render = __bind(this.render, this);
        this.initialize = __bind(this.initialize, this);        _ref = MapListView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      MapListView.prototype.events = {
        'click .create-new': 'showNewMapDialog'
      };

      MapListView.prototype.initialize = function() {
        this.collection = new MapCollection;
        this.listenTo(this.collection, 'reset', this.renderList);
        this.listenTo(this.collection, 'add', this.renderMapListItem);
        return Backbone.Events.on('map:create', this.addMapToCollection);
      };

      MapListView.prototype.render = function() {
        var listTemplate;

        listTemplate = Handlebars.compile(template);
        this.$el.html(listTemplate);
        this.collection.fetch();
        return this;
      };

      MapListView.prototype.renderList = function() {
        var list;

        list = document.createElement('ul');
        return this.collection.each(this.renderMapListItem);
      };

      MapListView.prototype.renderMapListItem = function(map) {
        var mapListItem;

        mapListItem = new MapListItem({
          model: map
        });
        this.$('.map-list').append(mapListItem.render().el);
        return this;
      };

      MapListView.prototype.showNewMapDialog = function() {
        Backbone.Events.trigger('modal:show', NewMapModal);
        return this;
      };

      MapListView.prototype.addMapToCollection = function(map) {
        var mapModel;

        this.collection.add(map);
        mapModel = this.collection.last();
        mapModel.save();
        return Backbone.history.navigate("/edit/" + map.id, true);
      };

      return MapListView;

    })(Backbone.View);
  });

}).call(this);
