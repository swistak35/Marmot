//= require panel/jquery.tokeninput
$(document).ready($(function() {
  $("#parcel_tag_tokens").tokenInput("/panel/tags.json", {
    prePopulate: $("#parcel_tag_tokens").data("pre"),
    hintText: "Wpisz tag",
    noResultsText: "Brak wynikow",
    searchingText: "Szukam...",
    preventDuplicates: true,
    searchDelay: 150,
    theme: "facebook"
  });
}));

$(document).ready($(function() {
  $("#post_tag_tokens").tokenInput("/panel/tags.json", {
    prePopulate: $("#post_tag_tokens").data("pre"),
    hintText: "Wpisz tag",
    noResultsText: "Brak wynikow",
    searchingText: "Szukam...",
    preventDuplicates: true,
    searchDelay: 150,
    theme: "facebook"
  });
}));


