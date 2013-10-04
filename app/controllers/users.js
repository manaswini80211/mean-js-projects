(function() {
  var User, mongoose;

  mongoose = require('mongoose');

  User = mongoose.model('User');

  exports.authCallback = function(req, res, next) {
    return res.redirect('/');
  };

  exports.signin = function(req, res) {
    return res.render('users/signin', {
      title: 'Signin',
      message: req.flash('error')
    });
  };

  exports.signup = function(req, res) {
    return res.render('users/signup', {
      title: 'Sign up',
      user: new User()
    });
  };

  exports.signout = function(req, res) {
    req.logout();
    return res.redirect('/');
  };

  exports.session = function(req, res) {
    return res.redirect('/');
  };

  exports.create = function(req, res) {
    var user;
    user = new User(req.body);
    user.provider = 'local';
    return user.save(function(err) {
      if (err) {
        return res.render('users/signup', {
          errors: err.errors,
          user: users
        });
      }
      return req.logIn(user, function(err) {
        if (err) {
          return next(err);
        }
        return res.redirect('/');
      });
    });
  };

  exports.show = function(req, res) {
    var user;
    user = req.profile;
    return res.render('users/show', {
      title: user.name,
      user: user
    });
  };

  exports.me = function(req, res) {
    return res.jsonp(req.user || null);
  };

  exports.user = function(req, res, next, id) {
    return User.findOne({
      _id: id
    }).exec(function(err, user) {
      if (err) {
        return next(err);
      }
      if (!user) {
        return next(new Error('Failed to load User ' + id));
      }
      req.profile = user;
      next();
      return false;
    });
  };

}).call(this);
