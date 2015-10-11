@Presentations = new Mongo.Collection 'presentations'

Presentations.deny
  insert: -> true
  update: -> true
  remove: -> true
