
var express = require('express');
var app = express();
var session = require('express-session');
var bodyParser = require('body-parser');
var port = process.env.PORT || 3000;

app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: false }));
app.set('port', port);
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
require('./routes/allroutes')(app);
app.listen(port);
console.log('3000 is the magic port');
