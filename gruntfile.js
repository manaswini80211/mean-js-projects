module.exports = function(grunt) {
    // Project Configuration
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        watch: {
            jade: {
                files: ['app/views/**'],
                options: {
                    livereload: true,
                },
            },
            js: {
                files: ['public/js/**', 'app/**/*.js'],
                tasks: ['jshint'],
                options: {
                    livereload: true,
                },
            },
            coffee: {
                files: ['public/coffee/**', 'app/**/*.coffee'],
                tasks: ['coffee'],
                options: {
                    livereload: true,
                },
            },
            html: {
                files: ['public/views/**'],
                options: {
                    livereload: true,
                },
            },
            css: {
                files: ['public/css/**'],
                options: {
                    livereload: true
                }
            }
        },
        coffee: {
            compileJoined: {
                options: {
                    join: true
                },
                files: {
                    'public/js/app.js': 'public/coffee/app.coffee', // 1:1 compile
                    'public/js/config.js': 'public/coffee/config.coffee', // 1:1 compile
                    'public/js/filters.js': 'public/coffee/filters.coffee', // 1:1 compile
                    'public/js/init.js': 'public/coffee/init.coffee', // 1:1 compile
                    'public/js/controllers.js': ['public/coffee/controllers/*.coffee'], // concat then compile into single file
                    'public/js/services.js': ['public/coffee/services/*.coffee'], // concat then compile into single file
                    'public/js/directives.js': ['public/coffee/directives/*.coffee'], // concat then compile into single file
                    // 'path/to/result.js': 'path/to/source.coffee', // 1:1 compile, identical output to join = false
                    // 'path/to/another.js': ['path/to/sources/*.coffee', 'path/to/more/*.coffee'] // concat then compile into single file
                }
            }
        },
        jshint: {
            all: ['gruntfile.js', 'public/js/**/*.js', 'test/**/*.js', 'app/**/*.js']
        },
        nodemon: {
            dev: {
                options: {
                    file: 'server.js',
                    args: [],
                    ignoredFiles: ['README.md', 'node_modules/**', '.DS_Store'],
                    watchedExtensions: ['js'],
                    watchedFolders: ['app', 'config'],
                    debug: true,
                    delayTime: 1,
                    env: {
                        PORT: 3000
                    },
                    cwd: __dirname
                }
            }
        },
        concurrent: {
            tasks: ['nodemon', 'watch'], 
            options: {
                logConcurrentOutput: true
            }
        },
        mochaTest: {
            options: {
                reporter: 'spec'
            },
            src: ['test/**/*.js']
        },
        bower: {
            install: {
                options: {
                    targetDir: './public/lib',
                    layout: 'byComponent',
                    install: true,
                    verbose: true,
                    cleanBowerDir: true
                }
            }
        }
    });

    //Load NPM tasks 
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-mocha-test');
    grunt.loadNpmTasks('grunt-nodemon');
    grunt.loadNpmTasks('grunt-concurrent');
    grunt.loadNpmTasks('grunt-bower-task');

    //Making grunt default to force in order not to break the project.
    grunt.option('force', true);

    //Default task(s).
    grunt.registerTask('default', ['jshint', 'concurrent']);

    //Test task.
    grunt.registerTask('test', ['mochaTest']);

    //Bower task.
    grunt.registerTask('install', ['bower']);
};