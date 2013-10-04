(function() {
  var async, mongoose, _;

  mongoose = require('mongoose');

  async = require('async');

  _ = require('underscore');

  exports.render = function(req, res) {
    res.render('index', {
      user: req.user ? JSON.stringify(req.user) : "null"
    });
    return false;
  };

}).call(this);
