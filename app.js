const port = process.env.PORT || 3000
var express=require("express");
var bodyParser=require("body-parser");
var app=express()
app.use(bodyParser.json());
app.use(express.static('public'));
app.use(bodyParser.urlencoded({
	extended: true
}));
app.get('/',function(req,res){
res.set({
	'Access-control-Allow-Origin': '*'
	});
return res.redirect('index.html');
}).listen(3000)


console.log("server listening at port 3000");

