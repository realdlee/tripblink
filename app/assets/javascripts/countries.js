$(document).ready(function(){
// $(window).load(function(){
  $('.item img').hover(
    function(){
      $(this).addClass('fadeContainer');
    },
    function(){
      $(this).removeClass('fadeContainer');
    }
  );

  var $container = $('.items');
  $container.imagesLoaded(function(){
    $container.isotope({
      itemSelector : '.item',
      getSortData : {
        symbol : function( $elem ) {
          return $elem.attr('data-symbol');
        },
        // category : function( $elem ) {
        //   return $elem.attr('data-category');
        // },
        // number : function( $elem ) {
        //   return parseInt( $elem.find('.number').text(), 10 );
        // },
        // weight : function( $elem ) {
        //   return parseFloat( $elem.find('.weight').text().replace( /[\(\)]/g, '') );
        // },
        name : function ( $elem ) {
          // console.log($elem);
          return $elem.find('.name').text();
        }
      }
    });
  });

  var $optionSets = $('#options .option-set'),
      $optionLinks = $optionSets.find('a');

  // console.log($optionLinks);

  $optionLinks.click(function(){
    var $this = $(this);
    // don't proceed if already selected
    if ( $this.hasClass('selected') ) {
      return false;
    }
    var $optionSet = $this.parents('.option-set');
    $optionSet.find('.selected').removeClass('selected');
    $this.addClass('selected');

    // make option object dynamically, i.e. { filter: '.my-filter-class' }
    var options = {},
        key = $optionSet.attr('data-option-key'),
        value = $this.attr('data-option-value');
    // parse 'false' as false boolean
    value = value === 'false' ? false : value;
    options[ key ] = value;
    if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
      // changes in layout modes need extra logic
      changeLayoutMode( $this, options )
    } else {
      // otherwise, apply new options
      $container.isotope( options );
    }
    return false;
  });

  // $('#filters a').click(function(){
  //   var selector = $(this).attr('data-option-value');
  //   console.log(selector);
  //   $container.isotope({ filter: selector });
  //   return false;
  // });
});

