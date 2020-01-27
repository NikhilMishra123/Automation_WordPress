var express = require('express');
const bodyParser = require('body-parser');
const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
var results={} 

app.get('/', function (request, response) {
	var testNames = request.body.testSuites;
	if(testNames.length==0)
	{
		response.send("No testsuite find ")
	}
	var regexTestName=""
	testNames.forEach( ( testName ) => {
		regexTestName = regexTestName.concat(testName)
		regexTestName	= regexTestName.concat('|')
	});
	var siteURL = request.body.siteURL;
	var testRegex = '**/?('+regexTestName+')\.(test|spec)\.[jt]s';
	const testConfig = {
		testMatch: [ testRegex ]
	}
	runTest(testConfig, siteURL ).then(result => {
	    JSON.stringify(results);
				response.send(results);
	  });
});

var server = app.listen(8080, function () {
    console.log('Server Running at port 8080....... ');
});

async function runTest(testConfig, siteURL)
{
  var execute = require('./process-test.js');
  results =  await execute.executeTest(testConfig, siteURL);
}


