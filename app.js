var os = require('os');
require('http').createServer((req, res) => {
 res.end("My Hostname is " +os.hostname())
}).listen(8080)
