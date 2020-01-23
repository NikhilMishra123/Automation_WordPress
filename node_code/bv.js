var express = require('express');
const bodyParser = require('body-parser');
const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
var results ={} ;

app.get('/', function (request, response) {
	var testNames = request.body.testSuites;
	var siteURL = request.body.siteURL;
	var testRegex = '**/?('+testNames+')\.(test|spec)\.[jt]s';
	const testConfig = {
    testMatch: [ testRegex ]
  }
	executeTest(testConfig).then(result => {
				JSON.stringify(results);
        response.send(results);
    });
});

var server = app.listen(8080, function () {
    console.log('Node server for testing_Website is running at port 8080....... ');
});

async function executeTest(testConfig) {
	process.env.BABEL_ENV = 'test';
	process.env.NODE_ENV = 'test';
	process.on( 'unhandledRejection', ( err ) => {
  	throw err;
	} );
	const jest = require('jest');
	const {
  	fromConfigRoot,
  	getArgFromCLI,
  	getArgsFromCLI,
  	hasArgInCLI,
  	hasProjectFile,
  	hasJestConfig,
	} = require( '../utils' );
	if ( ! hasProjectFile( 'jest-puppeteer.config.js' ) && ! process.env.JEST_PUPPETEER_CONFIG ) {
  	process.env.JEST_PUPPETEER_CONFIG = fromConfigRoot( 'puppeteer.config.js' );
	}
	process.env.PUPPETEER_HEADLESS = 'false';
	process.env.PUPPETEER_SLOWMO =  '--puppeteer-slowmo' ;
	const configsMapping = {
  	WP_BASE_URL: '--wordpress-base-url',
  	WP_USERNAME: '--wordpress-username',
  	WP_PASSWORD: '--wordpress-password',
	};

	Object.entries( configsMapping ).forEach( ( [ envKey, argName ] ) => {
  	if ( hasArgInCLI( argName ) ) {
    	process.env[ envKey ] = getArgFromCLI( argName );
  	}
	});
  //const con = require(fromConfigRoot('all-e2e.config.js'));
	const allConfig = require('./../../../../tests/e2e/all-e2e.config.js')
	const jestConfig = {
			...allConfig ,
			...testConfig
	}
	const projectRootPath = [ '/home/nikhil/wordpress-develop' ]
	const result = 	await jest.runCLI(jestConfig , projectRootPath);
	const testResults  = result.results.testResults;
	var testFileExtension = ".test.js"
	var extensionLength = testFileExtension.length
	for(var i =0;i< testResults.length;i++)
	{
		var testResult = testResults[i].numPassingTests ? 'Passed' : 'Failed'; 
		var testFilePath = testResults[i].testFilePath  ;
		var fileNameAt = testFilePath.lastIndexOf("/")+1;
		var fileName = testFilePath.substring(fileNameAt,testFilePath.length-extensionLength);
		results[fileName] =  testResult ;
	}
}
