var Hapi = require('hapi'),
fs = require('fs');

var server = new Hapi.Server();
server.connection({ port: 8091 });

server.route({
  method: 'GET',
  path:'/events',
  handler: function (request, reply) {
    fs.readFile('./events.json', 'utf8', function(err,data) {
      if (err) {
        reply(err);
      } else {
        var obj = JSON.parse(data);
        reply(obj);
      }
    })
  }


server.route({
  method: 'GET',
  path:'/scouts',
  handler: function (request, reply) {
    fs.readFile('./scouts.json', 'utf8', function(err,data) {
      if (err) {
        reply(err);
      } else {
        var obj = JSON.parse(data);
        reply(obj);
      }
    })
  }
});


server.route({
  method: 'GET',
  path:'/event/{id}',
  handler: function (request, reply) {
    fs.readFile('./event' + encodeURIComponent(request.params.id) + '.json', 'utf8', function(err,data) {
      if (err) {
        reply(err);
      } else {
        var obj = JSON.parse(data);
        reply(obj);
      }
    })
  }
});

server.route({
  method: 'POST',
  path:'/event/{id}',
  handler: function (request, reply) {
        reply("success");
    })
  }
});


