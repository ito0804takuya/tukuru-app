$(document).on('turbolinks:load', function() {
  let fileField = $('#file');
  
  $(fileField).on('change', fileField, function(e) {
    file = e.target.files[0]
    
    reader = new FileReader(),
    $preview = $("#img_field");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "460px",
          height: "360px",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
    console.log("test")
  });
});