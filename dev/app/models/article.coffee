# /**
#  * Module dependencies.
#  */
# var mongoose = require('mongoose'),
#     config = require('../../config/config'),
#     Schema = mongoose.Schema;

# Module dependencies.
mongoose = require 'mongoose'
config = require '../../config/config'
Schema = mongoose.Schema

# /**
#  * Article Schema
#  */
# var ArticleSchema = new Schema({
#     created: {
#         type: Date,
#         default: Date.now
#     },
#     title: {
#         type: String,
#         default: '',
#         trim: true
#     },
#     content: {
#         type: String,
#         default: '',
#         trim: true
#     },
#     user: {
#         type: Schema.ObjectId,
#         ref: 'User'
#     }
# });

# Article Schema
ArticleSchema = new Schema
    created:
        type: Date
        default: Date.now
    title:
        type: String
        default: ''
        trim: yes
    content:
        type: String
        default: ''
        trim: yes
    user:
        type: Schema.ObjectId
        ref: 'User'

# /**
#  * Validations
#  */
# ArticleSchema.path('title').validate(function(title) {
#     return title.length;
# }, 'Title cannot be blank');

# Validations
ArticleSchema.path('title').validate (title)->
    title.length
, 'Title cannot be blank'

# /**
#  * Statics
#  */
# ArticleSchema.statics = {
#     load: function(id, cb) {
#         this.findOne({
#             _id: id
#         }).populate('user').exec(cb);
#     }
# };

# Statics
ArticleSchema.statics =
    load: (id, cb)->
        this.findOne
            _id: id
        .populate('user')
        .exec(cb)

# mongoose.model('Article', ArticleSchema);

mongoose.model 'Article', ArticleSchema