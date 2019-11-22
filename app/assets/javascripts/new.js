// window.addEventListener("load", function () {
// $(function(){
// $(document).on('turbolinks:load', function() {
window.onload = function(){
// window.onload = jQuery(function($){ 
  console.log("test")
  let fileField = $('#file');
  
  // 選択された画像を取得し表示
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
  });
};