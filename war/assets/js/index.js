$.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

var Contacts = Backbone.Collection.extend({
    url: '/Contact/Contact'
});

var Contact = Backbone.Model.extend({
    urlRoot: '/Contact/add',
});

var ContactList = Backbone.View.extend({
    el: '#primary-content',

    render: function(options) {
        var that = this;
        var contacts = new Contacts();
        var template = _.template($('#indexTemplate').html());
        that.$el.html(template({
            contacts: this.collection.models
        }));
        contacts.fetch({
            success: function(contacts) {
            	var obj = {};
            	obj.contacts = contacts;
                var template = _.template($('#indexTemplate').html());
                that.$el.html(template({
                    contacts: obj.contacts.models
                    
                }));
                Backbone.history.navigate("", {
                    trigger: true
                }, 100);
            }
        })
    },
    events: {
    	"submit .search-entry" : "searchEntry"
    },
    
});

var Create = Backbone.View.extend({
    el: '#primary-content',
    render: function() {
        var template = _.template($('#formTemplate').html());
        this.$el.html(template);
        

    },
    events: {
        "submit .add-entry": "addContact",
    },
    addContact: function(ev) {
        var contactEntry = $(ev.currentTarget).serializeObject();
        var entry = new Contact();
        entry.save(contactEntry);
        setTimeout(function() {

			var simplebar = new Nanobar();
			simplebar.go(100);
        Backbone.history.navigate("", {
            trigger: true
        })},3200);
        return false;
    }
});


var UpdateEntry = Backbone.View.extend({
    el: '#primary-content',
    render: function(options) {
    	var that = this;
         var contact = new Contact({
            id: options.id
        });
        contact.fetch({
            success: function(contact) {

                var template = _.template($('#editTemplate').html());
                that.$el.html(template({
                    contact: contact
                }));
            }
        });
        setTimeout(function() {
            tinymce.remove();
            tinymce.init({
            	selector: 'textarea',
            	  height: 150,
            	  theme: 'modern',
            	  plugins: [
            	        "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
            	        "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
            	        "contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern"
            	  ],
            	templates: [{
            	    title: 'Test template 1',
            	    content: 'Test 1'
            	  }, {
            	    title: 'Test template 2',
            	    content: 'Test 2'
            	  }],
            	toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect fontselect fontsizeselect",
            	toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image media code | insertdatetime preview | forecolor backcolor",
            	toolbar3: "hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft",
            	image_advtab: true,
            	  content_css: [
            	    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
            	    '//www.tinymce.com/css/codepen.min.css'
            	  ]
            });
        }, 1100);
        
    },
});

var ViewEntry = Backbone.View.extend({
    el: '#primary-content',
    render: function(options) {
        var that = this;
        var contact = new Contact({
            id: options.id
        });
        contact.fetch({
            success: function(contact) {
            	var obj = {};
            	obj.contact = contact;
                var template = _.template($('#viewTemplate').html());
                that.$el.html(template({
                    contact: obj.contact
                }));
            }
        });
    },
});


var RemoveEntry = Backbone.View.extend({
    el: '#primary-content',
    render: function(options) {
        var that = this;
        var contact = new Contact({
            id: options.id
        });
        contact.destroy();
        setTimeout(function() {
			var simplebar = new Nanobar();
			simplebar.go(100);
        Backbone.history.navigate("", {
            trigger: true
        })}, 3200);


    },
});



var Router = Backbone.Router.extend({
    routes: {
        '': 'home',
        'new': 'Create',
        'edit/:id': 'UpdateEntry',
        'Details/:id': 'ViewEntry',
        'remove/:id': 'RemoveEntry',


    },
    initialize: function() {
        this.contacts = new Contacts();
        this.listenTo(this.contacts, 'change', this.home);
        this.contacts.fetch();

        this.contactList = new ContactList({
            collection: this.contacts
        });

    },
    home: function() {
        this.contactList.render();
    }
});




var create = new Create();
var update = new UpdateEntry();
var view = new ViewEntry();
var router = new Router();
var remove = new RemoveEntry();

router.on('route:Create', function() {
    create.render();    
});

router.on('route:UpdateEntry', function(id) {
    update.render({
        id: id 
        });
});

router.on('route:ViewEntry', function(id) {
    view.render({
        id: id
    });
    
});

router.on('route:RemoveEntry', function(id) {
    remove.render({
        id: id
    });
    
});





Backbone.history.start();


