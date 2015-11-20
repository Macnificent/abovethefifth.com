module.exports = (grunt) ->

	require("load-grunt-tasks")(grunt)

	grunt.initConfig
		path: 
			src: "source"
			dest: "public"
			tmp: "temp"

		jade: 
			compile:
				src: '<%= path.src %>/main.jade'
				dest: '<%= path.dest %>/index.html'

		stylus:
			all:
				options:
					compress: true
					linenos: false
					firebug: false
					"include css": true 

				src: '<%= path.src %>/css/main.styl'
				dest: '<%= path.dest %>/css/main.css'

		clean:
			all: [
				'<%= path.dest %>'
				'<%= path.tmp %>'
			]

		copy:
			img:
				expand: true
				cwd: '<%= path.src %>/img'
				src: [
					'**/*.png'
					'**/*.svg'
					'**/*.gif'
					'**/*.jpg'
					'**/*.PNG'
					'**/*.SVG'
					'**/*.GIF'
					'**/*.JPG'
				]
				dest: '<%= path.dest %>/img'

		watch:
			options:
				atBegin: true
				true: [ '<%= path.dest %>/index.html' ]

			'dev':
				files: [
					'<%= path.src %>/css/**/*.styl'
					'<%= path.src %>/main.jade'
				]
				tasks: [
				  'clean:all'
				  "copy:img"
				  'jade'
				  'stylus'
				]

		grunt.registerTask "watch-dev", ["watch:dev"]