// custom JavaScript


jQuery.fn.highlight = function (str, className) {
    var regex = new RegExp(str, "gi");
    return this.each(function () {
        this.innerHTML = this.innerHTML.replace(regex, function(matched) {return "<span class=\"" + className + "\">" + matched + "</span>";});
    });
};

// highlight word in search page
$(function() {
  var source_word = $("#find-query").text();
  if(source_word.length > 0){
    $('.show-post').highlight(source_word, "highlight")
  }
});