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
                files: ['dev/**'],
                tasks: ['coffee'],
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
            compile: {
                files: [{
                    expand: true,
                    cwd: 'dev/app',
                    src: ['**/*.coffee'],
                    dest: 'app',
                    ext: '.js'
                }, {
                    expand: true,
                    cwd: 'dev/config',
                    src: ['**/*.coffee'],
                    dest: 'config',
                    ext: '.js'
                }, {
                    'public/js/app.js': 'dev/public/app.coffee', // 1:1 compile
                    'public/js/config.js': 'dev/public/config.coffee', // 1:1 compile
                    'public/js/filters.js': 'dev/public/filters.coffee', // 1:1 compile
                    'public/js/init.js': 'dev/public/init.coffee', // 1:1 compile
                }]
            },
            compileJoined: {
                options: {
                    join: true
                },
                files: {
                    'public/js/controllers.js': ['dev/public/controllers/*.coffee'], // concat then compile into single file
                    'public/js/services.js': ['dev/public/services/*.coffee'], // concat then compile into single file
                    'public/js/directives.js': ['dev/public/directives/*.coffee'], // concat then compile into single file
                }
            },
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
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-mocha-test');
    grunt.loadNpmTasks('grunt-nodemon');
    grunt.loadNpmTasks('grunt-concurrent');
    grunt.loadNpmTasks('grunt-bower-task');

    //Making grunt default to force in order not to break the project.
    grunt.option('force', true);

    //Default task(s).
    grunt.registerTask('default', ['jshint', 'concurrent', 'coffee']);

    //Test task.
    grunt.registerTask('test', ['mochaTest']);

    //Bower task.
    grunt.registerTask('install', ['bower']);
};