Template.showerBody.show = function () {
  return !__.pathname();
}

Template.showerBody.$backToList = function () {
  Session.set('keynoteEdit', false);
  Session.set('keynoteEditURL', false);
  Session.set('keynoteURL', false);
  Session.set('keynoteURLState', false);
  Session.set('keynoteToRemove', false);
  Session.set('keynoteToRemoveSlide', false);
  Session.set('keynoteCurrentSlideNumber', false);
  Session.set('_keynoteUnsaved', false);
  Session.set('keynoteShow', false);

  __.scrollToTop(100);
}

Template.showerBody.keynoteURL = function () {
  return Template.keynoteEdit.url.call(Template.keynoteEdit.keynote());
}

Template.showerBody.helpers({
  knoteUrlState: function() {
    return Session.get('keynoteURLState');
  }
});

Template.showerBody.events({
  'click .navbar': function (e) {
    if ($(e.target).is('.js-scroll-top')) {
      __.scrollToTop();
    }
  },
  'click .js-back': function (e) {
    e.preventDefault();

    __.waitFor(function () {
      return !Session.get('keynoteUnsaved')
    }, function () {
      Template.showerBody.$backToList();
    });
  },
  'click .js-new': function () {
    var _id = Keynotes.insert(__.keynotes.emptyKeynote(), function (err) {
      if (err) {
        console.log(err);
        Template.showerBody.$backToList();
      }
    });

    Session.set('keynoteEdit', _id);
    Session.set('keynoteFirstFocus', true);
  },
  'click .js-save': function () {
    $('form input').change();
  }
});

Template.showerBody.rendered = function () {
  var pathname = __.pathname();

  if (!pathname) {
    __.$html.addClass('bootstrap');
  }

  Session.set('keynoteShow', __.pathname());
}