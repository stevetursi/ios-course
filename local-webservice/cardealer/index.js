var Hapi = require('hapi'),
    fs = require('fs');

var server = new Hapi.Server();
server.connection({ port: 8091 });

server.route({
  method: 'GET',
  path:'/inventory',
  handler: function (request, reply) {
    fs.readFile('./inventory.json', 'utf8', function(err,data) {
      if (err) {
        reply(err);
      } else {
        var obj = JSON.parse(data);
        reply(obj);
      }
    })
  }
});


// Start the server
server.start(function () {
  console.log('Server running at:', server.info.uri);
});
