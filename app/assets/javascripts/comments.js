// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function toggle(element, tog_element) {
    document.getElementById(element).style.display = (document.getElementById(element).style.display == "none") ? "" : "none";
    document.getElementById(tog_element).childNodes[0].nodeValue = (document.getElementById(tog_element).childNodes[0].nodeValue == "Mostrar comentarios") ? "Ocultar comentarios" : "Mostrar comentarios";
}