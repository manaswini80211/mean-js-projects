# Generic require login routing middleware
exports.requiresLogin = (req, res, next)->
    if not req.isAuthenticated
        return res.send 401, 'User is not authorized'
    next()
    no

# User authorizations routing middleware
exports.user =
    hasAuthorization: (req, res, next)->
        if req.profile.id isnt req.user.id
            return res.send 401, 'User is not authorized'
        next()
        no

#  Article authorizations routing middleware
exports.article =
    hasAuthorization: (req, res, next)->
        if req.article.id isnt req.user.id
            return res.send 401, 'User is not authorized'
        next()
        no

#  Project authorizations routing middleware
exports.project =
    hasAuthorization: (req, res, next)->
        if req.project.user.id isnt req.user.id
            return res.send 401, 'User is not authorized'
        next()
        no