(function() {
  exports.requiresLogin = function(req, res, next) {
    if (!req.isAuthenticated) {
      return res.send(401, 'User is not authorized');
    }
    next();
    return false;
  };

  exports.user = {
    hasAuthorization: function(req, res, next) {
      if (req.profile.id !== req.user.id) {
        return res.send(401, 'User is not authorized');
      }
      next();
      return false;
    }
  };

  exports.article = {
    hasAuthorization: function(req, res, next) {
      if (req.article.id !== req.user.id) {
        return res.send(401, 'User is not authorized');
      }
      next();
      return false;
    }
  };

}).call(this);
