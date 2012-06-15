    // jQuery plugin to save individual form fields each time something changes.
    // Usage: `$('#MyForm').autosave(url, options);`
    // where `url` defaults to form.method
    // and `options` defaults to $.fn.autosave.defaultOptions
    // (UNTESTED)
    ;(function($) {
    $.fn.autosave = function(url, options) {
    // build options based on defaultOptions and passed options
    options = $.extend({}, $.fn.autosave.defaultOptions, options || {});
    // `this` is the jQuery collection
    return this.each(function() {
    // `this` is the <form> element
    if (!this.elements) {
    return;
    }
    url = url || this.action;
    options.method = options.method || this.method;
    var $idElement = $(options.idElement || this.elements[options.idElementName]);
    if ($idElement.length == 0) {
    return;
    }
    $(this.elements).change(function() {
    // `this` is the input element that changed
    var queryString =
    options.idField + '=' + encodeURIComponent($idElement.val()) +
    options.columnField + '=' + encodeURIComponent(this.name) +
    options.valueField + '=' + encodeURIComponent($(this).val())
    ;
    if (options.useImage) {
    var img = new Image(url + '?' + queryString);
    }
    else {
    $.ajax($.extend({
    url: url,
    method: options.method,
    data: queryString
    }, options.ajaxOptions));
    }
    });
    });
    };
    $.fn.autosave.defaultOptions = {
    idElement: null,
    idElementName: 'id',
    idField: 'id',
    columnField: 'column',
    valueField: 'value',
    method: null,
    ajaxOptions: {},
    useImage: false
    };
    })(jQuery);