module.exports = function(grunt) {
  grunt.initConfig({

    //JS Uglifier
    uglify: {
      my_target: {
        files: {
          'public/js/main.min.js': ['public/js/bootstrap.min.js', 'public/js/datatables.js', 'public/js/main.js']
        }
      }
      },
    cssmin: {
      options: {
        shorthandCompacting: false,
        roundingPrecision: -1
      },
      target: {
        files: {
          'public/css/style.min.css': ['public/css/bootstrap.min.css', 'public/css/datatables.min.css', 'public/css/style.css']
        }
      }
    }

  });

  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-uglify');
};
