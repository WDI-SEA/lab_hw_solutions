'use strict';

var HashIds = require('hashids');
var hashids = new HashIds("This is a salt and I like it", 6, 'usUSncNC0123456789');

module.exports = function(sequelize, DataTypes) {
  var link = sequelize.define('link', {
    url: DataTypes.STRING
  }, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
      }
    },
    hooks: {
      beforeCreate: function(link, options, callback) {
        this.findAndCountAll().then(function(links) {
          link.id = hashids.encode(links.count + 1);
          callback(null, link);
        });
      }
    }
  });
  return link;
};