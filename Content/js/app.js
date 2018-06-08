
/**=========================================================
 * Module: panel-perform.js
 * Dismiss panels
 * [data-perform="panel-dismiss"]
 *
 * Requires animo.js
 =========================================================*/
(function ($, window, document) {
    'use strict';

    var panelSelector = '[data-perform="panel-dismiss"]',
        removeEvent = 'panel-remove',
        removedEvent = 'panel-removed';

    $(document).on('click', panelSelector, function () {

        // find the first parent panel
        var parent = $(this).closest('.panel');

        if ($.support.animation) {
            parent.animo({ animation: 'bounceOut' }, removeElement);
        }
        else removeElement();

        function removeElement() {
            // Trigger the event and finally remove the element
            $.when(parent.trigger(removeEvent, [parent]))
             .done(destroyPanel);
        }

        function destroyPanel() {
            var col = parent.parent();
            parent.remove();
            // remove the parent if it is a row and is empty and not a sortable (portlet)
            col
              .trigger(removedEvent) // An event to catch when the panel has been removed from DOM
              .filter(function () {
                  var el = $(this);
                  return (el.is('[class*="col-"]:not(.sortable)') && el.children('*').length === 0);
              }).remove();

        }

    });

}(jQuery, window, document));


/**
 * Collapse panels
 * [data-perform="panel-collapse"]
 *
 * Also uses browser storage to keep track
 * of panels collapsed state
 */
(function ($, window, document) {
    'use strict';
    var panelSelector = '[data-perform="panel-collapse"]',
        storageKeyName = 'panelState';

    // Prepare the panel to be collapsable and its events
    $(panelSelector).each(function () {
        // find the first parent panel
        var $this = $(this),
            parent = $this.closest('.panel'),
            wrapper = parent.find('.panel-wrapper'),
            collapseOpts = { toggle: false },
            iconElement = $this.children('em'),
            panelId = parent.attr('id');

        // if wrapper not added, add it
        // we need a wrapper to avoid jumping due to the paddings
        if (!wrapper.length) {
            wrapper =
              parent.children('.panel-heading').nextAll() //find('.panel-body, .panel-footer')
                .wrapAll('<div/>')
                .parent()
                .addClass('panel-wrapper');
            collapseOpts = {};
        }

        // Init collapse and bind events to switch icons
        wrapper
          .collapse(collapseOpts)
          .on('hide.bs.collapse', function () {
              setIconHide(iconElement);
              savePanelState(panelId, 'hide');
          })
          .on('show.bs.collapse', function () {
              setIconShow(iconElement);
              savePanelState(panelId, 'show');
          });

        // Load the saved state if exists
        var currentState = loadPanelState(panelId);
        if (currentState) {
            setTimeout(function () { wrapper.collapse(currentState); }, 0);
            savePanelState(panelId, currentState);
        }

    });

    // finally catch clicks to toggle panel collapse
    $(document).on('click', panelSelector, function () {

        var parent = $(this).closest('.panel');
        var wrapper = parent.find('.panel-wrapper');

        wrapper.collapse('toggle');

    });

    /////////////////////////////////////////////
    // Common use functions for panel collapse //
    /////////////////////////////////////////////
    function setIconShow(iconEl) {
        iconEl.removeClass('fa-plus').addClass('fa-minus');
    }

    function setIconHide(iconEl) {
        iconEl.removeClass('fa-minus').addClass('fa-plus');
    }

    function savePanelState(id, state) {
        if (!id || !store || !store.enabled) return false;
        var data = store.get(storageKeyName);
        if (!data) { data = {}; }
        data[id] = state;
        store.set(storageKeyName, data);
    }

    function loadPanelState(id) {
        if (!id || !store || !store.enabled) return false;
        var data = store.get(storageKeyName);
        if (data) {
            return data[id] || false;
        }
    }


}(jQuery, window, document));


/**
 * Refresh panels
 * [data-perform="panel-refresh"]
 * [data-spinner="standard"]
 */
(function ($, window, document) {
    'use strict';
    var panelSelector = '[data-perform="panel-refresh"]',
        refreshEvent = 'panel-refresh',
        csspinnerClass = 'whirl',
        defaultSpinner = 'standard';

    // method to clear the spinner when done
    function removeSpinner() {
        this.removeClass(csspinnerClass);
    }

    // catch clicks to toggle panel refresh
    $(document).on('click', panelSelector, function () {
        var $this = $(this),
            panel = $this.parents('.panel').eq(0),
            spinner = $this.data('spinner') || defaultSpinner
        ;

        // start showing the spinner
        panel.addClass(csspinnerClass + ' ' + spinner);

        // attach as public method
        panel.removeSpinner = removeSpinner;

        // Trigger the event and send the panel object
        $this.trigger(refreshEvent, [panel]);

    });


    /**
     * This function is only to show a demonstration
     * of how to use the panel refresh system via 
     * custom event. 
     * IMPORTANT: see how to remove the spinner.
     */

    $('.panel.panel-demo').on('panel-refresh', function (e, panel) {

        // perform any action when a .panel triggers a the refresh event
        setTimeout(function () {

            // when the action is done, just remove the spinner class
            panel.removeSpinner();

        }, 1000);

    });

}(jQuery, window, document));

/**=========================================================
 * Module: sidebar-menu.js
 * Provides a simple way to implement bootstrap collapse plugin using a target 
 * next to the current element (sibling)
 * Targeted elements must have [data-toggle="collapse-next"]
 =========================================================*/
(function ($, window, document) {
    'use strict';

    var collapseSelector = '[data-toggle="collapse-next"]',
        colllapsibles = $('.sidebar .collapse').collapse({ toggle: false }),
        toggledClass = 'aside-collapsed',
        $body = $('body'),
        phone_mq = 768; // media querie

    $(function () {

        $(document)
          .on('click', collapseSelector, function (e) {
              e.preventDefault();

              if ($(window).width() > phone_mq &&
                  $body.hasClass(toggledClass)) return;

              // Try to close all of the collapse areas first
              colllapsibles.collapse('hide');
              // ...then open just the one we want
              var $target = $(this).siblings('ul');
              $target.collapse('show');

          })
          // Submenu when aside is toggled
          .on('click', '.sidebar > .nav > li', function () {

              if ($body.hasClass(toggledClass) &&
                $(window).width() > phone_mq) {

                  $('.sidebar > .nav > li')
                    .not(this)
                    .removeClass('open')
                    .end()
                    .filter(this)
                    .toggleClass('open');
              }

          });

    });


}(jQuery, window, document));

/**=========================================================
 * Module: toggle-state.js
 * Toggle a classname from the BODY Useful to change a state that 
 * affects globally the entire layout or more than one item 
 * Targeted elements must have [data-toggle="CLASS-NAME-TO-TOGGLE"]
 =========================================================*/

(function ($, window, document) {
    'use strict';

    var SelectorToggle = '[data-toggle-state]',
        $body = $('body');

    $(document).on('click', SelectorToggle, function (e) {
        e.preventDefault();
        var classname = $(this).data('toggleState');

        if (classname)
            $body.toggleClass(classname);

    });



}(jQuery, window, document));



/**
 * Provides a start point to run plugins and other scripts
 */
(function ($, window, document) {
    'use strict';

    if (typeof $ === 'undefined') { throw new Error('This application\'s JavaScript requires jQuery'); }

    $(window).load(function () {



    })//.resize(adjustLayout);


    $(function () {



        // inhibits null links
        $('a[href="#"]').each(function () {
            this.href = 'javascript:void(0);';
        });

        // inhibits null links
        $('a[href="#!"]').each(function () {
            this.href = 'javascript:void(0);';
        });



    });

    // keeps the wrapper covering always the entire body
    // necessary when main content doesn't fill the viewport
    // (enable this behavior in the above code if necessary for your app)
    function adjustLayout() {
        $('.wrapper > section').css('min-height', $(window).height());
    }

}(jQuery, window, document));






(function ($, window, document) {
    'use strict';

    if (typeof $ === 'undefined') { throw new Error('This application\'s JavaScript requires jQuery'); }

    $(window).load(function () {



    })//.resize(adjustLayout);


  
}(jQuery, window, document));