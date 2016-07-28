var page = require('webpage').create(),
    system = require('system');

browser_width = 2560
browser_height = browser_width / 297 * 210

page.viewportSize = { width: browser_width, height: browser_height };
page.settings.webSecurityEnabled = false
page.settings.resourceTimeout = 5000
page.settings.localToRemoteUrlAccessEnabled = true

if (system.args.length !== 4) {
  console.log('Usage: '+system.args[0]+' <zoom> <lat> <lon>');
  phantom.exit();
}

var url = [
  'http://openfiremap.org/',
  '?zoom=', system.args[1],
  '&lat=', system.args[2],
  '&lon=', system.args[3],
  '&layers=B0000TF',
].join('');

console.log("Fetching URL " + url);

page.open(url, function(status) {
  if (status !== 'success') {
    console.log('Unable to load the address!');
    phantom.exit();
  } else {
    window.setTimeout(function () {
      page.render('/data/shot.png');
      phantom.exit();
    }, 5000); // Change timeout as required to allow sufficient time
  }
});
