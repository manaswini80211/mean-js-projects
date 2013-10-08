# Module dependencies.
mongoose = require 'mongoose'
async = require 'async'
Project = mongoose.model 'Project'
_ = require 'underscore'

# Find project by id
exports.project = (req, res, next, id)->
	Project.load id, (err, project)->
		if err
			return next err
		if not project
			return next new Error('Failed to load project ' + id)
		req.project = project
		next()
		no

# Create a project
exports.create = (req, res)->
	project = new Project req.body
	project.user = req.user

	project.save (err)->
		if err
			return res.send 'users/signup',
				errors: err.errors
				project: project
		else
			res.jsonp project
		no

# Update a project
exports.update = (req, res)->
	project = req.project

	project = _.extend project, req.body

	project.save (err)->
		res.jsonp project

# Delete an project
exports.destroy = (req, res)->
	project = req.project

	project.remove (err)->
		if  err
			res.render 'error',
				status: 500
		else
			res.jsonp project

# Show an project
exports.show = (req, res)->
	res.jsonp req.project

# List of Projects
exports.all = (req, res)->
	Project.find()
	.sort('-created')
	.populate('user', 'name username')
	.exec (err, projects)->
		if err
			res.render 'error',
				status: 500
		else
			res.jsonp projects