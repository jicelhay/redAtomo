// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('page:change ajax:success', function() {
   $('.materialboxed').materialbox();
 });
