/* Create a new object prototype with a constructor function */

function Search(form) {
  this.form = form;
  
  this.queue = function(query){
    if (this.timer){
      clearTimeout(this.timer);
    }
    var self = this;
    this.timer = setTimeout(function () {
      self.search(query);
    }, 150);
  };

  this.search = function(query){
    var self = this;
    jQuery.ajax({
      url: this.form.action,
      type: this.form.method,
      data: {'query': query},
      success: function(results) {self.render(results)},
      dataType: 'html'
    });
  };

  this.render = function(results){  
    $('#main-input-area').html(results);
  };
}

/* 
jQuery.fn is an alias for jQuery.prototype and allows
us to dynamically extend the jQuery prototype. We're defining
a new method on jQuery called search 
*/
jQuery.fn.search = function() {
  /* 
  We iterate over each of the jQuery objects associated with the
  current jQuery object (actually in this case will be just one) 
  */ 
  this.each(function () {
    /* Create an object using the prototype constructor */
    var search = new Search(this);
    
    $('input[type=text]').on('keyup', function () {
      search.queue(this.value);
    });
  });
};

/* 
The "ready" event is fired when the DOM is built.
However, to deal with turbolinks we also need to bind
to the "page:change" event. This is because Turbolinks
uses Ajax to just update the body part
of a DOM tree when you click a link. So without "page:change" 
or "page:load" your JS functions would not be rebound to the updated
part of the DOM. The "page:change" event will be fired by Turbolinks when the 
body element of the DOM is changed 
*/
jQuery(document).on('ready page:change', function(){ 
  jQuery('#search').search();
});
