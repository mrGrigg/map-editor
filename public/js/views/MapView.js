// Generated by CoffeeScript 1.6.2
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['views/NodeView', 'models/NodeCollection', 'models/Node'], function(NodeView, NodeCollection, Node) {
    var MapView, _ref;

    return MapView = (function(_super) {
      __extends(MapView, _super);

      function MapView() {
        this.addNode = __bind(this.addNode, this);
        this.drawNodes = __bind(this.drawNodes, this);
        this.generateNodeArray = __bind(this.generateNodeArray, this);
        this.setMapDimensions = __bind(this.setMapDimensions, this);
        this.render = __bind(this.render, this);
        this.initialize = __bind(this.initialize, this);        _ref = MapView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      MapView.prototype.className = 'map-canvas';

      MapView.prototype.initialize = function() {
        Backbone.Events.on('node:create', this.addNode, this);
        this.nodeCollection = new NodeCollection();
        this.nodeCollection.url("_" + this.model.id + "-collection");
        return this.nodeCollection.fetch();
      };

      MapView.prototype.render = function() {
        this.setMapDimensions();
        return this;
      };

      MapView.prototype.setMapDimensions = function() {
        var nodeArray;

        this.$el.css({
          'width': this.model.width * 32,
          'height': this.model.height * 32
        });
        nodeArray = this.generateNodeArray(this.model.width, this.model.height);
        return this.drawNodes(nodeArray);
      };

      MapView.prototype.generateNodeArray = function(width, height) {
        var mapId, nodeArray, y, _fn, _i, _ref1;

        nodeArray = new Array(height);
        mapId = this.model.id;
        _fn = function(y) {
          var x, _fn1, _j, _ref2;

          nodeArray[y] = new Array(width);
          _fn1 = function(x) {
            var node;

            node = new Node({
              x: x,
              y: y,
              mapId: mapId
            });
            nodeArray[y][x] = new NodeView({
              model: node
            });
          };
          for (x = _j = 0, _ref2 = width - 1; 0 <= _ref2 ? _j <= _ref2 : _j >= _ref2; x = 0 <= _ref2 ? ++_j : --_j) {
            _fn1(x);
          }
        };
        for (y = _i = 0, _ref1 = height - 1; 0 <= _ref1 ? _i <= _ref1 : _i >= _ref1; y = 0 <= _ref1 ? ++_i : --_i) {
          _fn(y);
        }
        return nodeArray;
      };

      MapView.prototype.drawNodes = function(nodeArray) {
        var map, row, _fn, _i, _len;

        map = document.createElement('div');
        _fn = function(row) {
          var node, _j, _len1, _results;

          _results = [];
          for (_j = 0, _len1 = row.length; _j < _len1; _j++) {
            node = row[_j];
            _results.push((function(node) {
              return map.appendChild(node.render().el);
            })(node));
          }
          return _results;
        };
        for (_i = 0, _len = nodeArray.length; _i < _len; _i++) {
          row = nodeArray[_i];
          _fn(row);
        }
        this.$el.append(map);
        return this;
      };

      MapView.prototype.addNode = function(node) {
        this.nodeCollection.add(node);
        console.log(this.nodeCollection.toJSON());
        return this;
      };

      return MapView;

    })(Backbone.View);
  });

}).call(this);
