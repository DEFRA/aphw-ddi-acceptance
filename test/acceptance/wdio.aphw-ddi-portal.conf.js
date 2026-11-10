const { ReportAggregator, HtmlReporter } = require('wdio-html-nice-reporter')
const log4js = require('@log4js-node/log4js-api')
const logger = log4js.getLogger('default')
const envRoot = (process.env.TEST_ENVIRONMENT_ROOT_URL || 'http://host.docker.internal:3002')
const enforcementEnvRoot = (process.env.ENFORCEMENT_TEST_ENVIRONMENT_ROOT_URL || 'http://host.docker.internal:3003')
const chromeArgs = process.env.CHROME_ARGS ? process.env.CHROME_ARGS.split(' ') : []
const maxInstances = process.env.MAX_INSTANCES ? Number(process.env.MAX_INSTANCES) : 5

exports.config = {
  hostname: 'selenium',
  port: 4444,
  path: '/wd/hub',
  specs: ['./features/aphw-ddi-portal/**/*.feature'],
  exclude: ['./scratch/**'],

  maxInstances: 1,
  capabilities: [
    {
      maxInstances,
      acceptInsecureCerts: true,
      browserName: 'chrome',
      'goog:chromeOptions': {
        args: chromeArgs
      }
    }
  ],
  // ===================
  // Test Configurations
  // ===================
  // Define all options that are relevant for the WebdriverIO instance here
  logLevel: 'warn',
  bail: 0,
  baseUrl: envRoot + '',
  enforcementBaseUrl: enforcementEnvRoot + '',
  waitforTimeout: 60000,
  connectionRetryTimeout: 90000,
  connectionRetryCount: 1,
  framework: 'cucumber',
  specFileRetries: 0,
  specFileRetriesDelay: 30,
  reporters: ['spec',
    [HtmlReporter, {
      debug: false,
      outputDir: './html-reports/',
      filename: 'feature-report.html',
      reportTitle: 'Feature Test Report',
      showInBrowser: false,
      useOnAfterCommandForScreenshot: false,
      LOG: logger
    }]
  ],
  // If you are using Cucumber you need to specify the location of your step definitions.
  cucumberOpts: {
    require: ['./steps/**/*.js'], // <string[]> (file/dir) require files before executing features
    backtrace: false, // <boolean> show full backtrace for errors
    requireModule: ['@babel/register'], // <string[]> ("extension:module") require files with the given EXTENSION after requiring MODULE (repeatable)
    dryRun: false, // <boolean> invoke formatters without executing steps
    failFast: false, // <boolean> abort the run on first failure
    snippets: true, // <boolean> hide step definition snippets for pending steps
    source: true, // <boolean> hide source uris
    strict: false, // <boolean> fail if there are any undefined or pending steps
    timeout: 90000, // <number> timeout for step definitions
    ignoreUndefinedDefinitions: false // <boolean> Enable this config to treat undefined definitions as warnings.
  },
  // ====
  // Hooks
  // =====
  onPrepare: function (config, capabilities) {
    console.log(`Running tests against ${envRoot}\n`)
    const reportAggregator = new ReportAggregator({
      outputDir: './html-reports/',
      filename: 'acceptance-test-suite-report.html',
      reportTitle: 'Acceptance Tests Report',
      browserName: 'chrome'
    })
    reportAggregator.clean()
    global.reportAggregator = reportAggregator
  },

  onComplete: async function (exitCode, config, capabilities, results) {
    await global.reportAggregator.createReport()
  },

  before: function () {
    const chai = require('chai')
    global.expect = chai.expect
    global.assert = chai.assert
  },

  afterStep: async function (step, scenario, result) {
    if (result.passed) {
      return
    }
    const path = require('path')
    const screenshotFileName = scenario.uri.split('.feature')[0].split(/[\\/]/).slice(-1)[0]
    const timestamp = new Date().toISOString().replace(/[-:]/g, '').replace('T', '-').replace('Z', '')
    const filepath = path.join('./html-reports/screenshots/', screenshotFileName + '-' + timestamp + '.png')
    await browser.saveScreenshot(filepath)
    process.emit('test:screenshot', filepath)
  }
}
