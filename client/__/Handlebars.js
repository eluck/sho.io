Handlebars.registerHelper("Session", function(key, compare) {
  console.log('compare', compare);
  return Session.get(key);
});

Handlebars.registerHelper("equal", function(value1, value2) {
  return _.isEqual(value1, value2);
});

Handlebars.registerHelper("here", function(value) {
	return !!value;
});