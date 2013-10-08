# Module dependencies.
mongoose = require 'mongoose'
config = require '../../config/config'
Schema = mongoose.Schema

# Project Schema
ProjectSchema = new Schema
    created:
        type: Date
        default: Date.now
    name:
        type: String
        default: ''
        trim: yes
    description:
        type: String
        default: ''
        trim: yes
    site:
        type: String
        default: ''
        trim: yes
    user:
        type: Schema.ObjectId
        ref: 'User'

# Validations
ProjectSchema.path('name').validate (name)->
    name.length
, 'Name cannot be blank'

ProjectSchema.path('site').validate (site)->
    site.length
, 'Site cannot be blank'

# Statics
ProjectSchema.statics =
    load: (id, cb)->
        @findOne
            _id: id
        .populate('user', 'user username')
        .exec(cb)

mongoose.model 'Project', ProjectSchema