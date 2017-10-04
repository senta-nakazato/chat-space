$(document).on('turbolinks:load', function() {
  function buildHTML(message){
    var messageImage = message.image ? '<img src="' + message.image + '" alt="' + message.image + '">' : '';
    var html =
          '<div class="mainpage__body_content">' +
            '<div class="mainpage__body_content__user_name">' +
              message.name +
            '</div>' +
            '<div class="mainpage__body_content__date">' +
              message.created_at +
            '</div>' +
            '<div class="mainpage__body_contetn__message">' +
              message.text +
              messageImage +
            '</div>' +
          '</div>';
    return html;
  };

  $('.mainpage__bottom_form').on("submit", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href;
    $.ajax({
      url: href,
      type: 'POST',
      data: formData,
      processData: false,
      contentType: false,
      dataType: 'json',
    })
    .done(function(data){
      $('.mainpage__body').append(buildHTML(data));
    })
    .fail (function(data){
      alert('メッセージを入力してください。');
    });
    this.reset();
    return false;
  });

 setInterval(function(){
    var input = $(".message").length;
    var href = window.location.href;
    if (input !== 0){
      $.ajax({
        type: 'GET',
        url: href,
        dataType: 'json',
      })
      .done(function(data){
        var html = "";
        $('.mainpage__body').empty();
        $.each(data, function(i, message) {
          html += buildHTML(message);
        });
        $(".mainpage__body").html(html);
      })
      .fail(function(){
        alert("自動更新失敗");
      });
    }
  }, 5000);
});

