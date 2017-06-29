$(document).on('turbolinks:load', function(){
  function searchUserResult(user) {
   var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name">
                  ${ user.name }
                  <div class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id= ${ user.id } data-user-name= ${ user.name }>
                    追加
                  </div>
                </p>
              </div>`;
   return html;
  }

  function addUserList(id, name){
    var html = `<div class="chat-group-user clearfix" id="chat-group-user-${ id }">
               <input type="hidden" name="group[user_ids][]" value="${ id }">
                 <p class="chat-group-user__name">
                   ${ name }
                   <div class="user-search-remove chat-group-user__btn chat-group-user__btn--remove" data-user-id=${ id }>
                     削除
                   </div>
                 </p>
             </div>`;
   return html;
  }

  $("#user-search-field").on("keyup", function() {
    var input = $(this).val();
    if (input !== "") {
      $.ajax({
        type: 'GET',
        url: '/users/search',
        data: { keyword: input },
        dataType: 'json'
      })
      .done(function(users) {
       if (users.length !== 0) {
        var html = "";
        $.each(users, function(index, user){
           html += searchUserResult(user);
           $("#user-search-result").empty();
         });
         $("#user-search-result").html(html);
       }
      })
      .fail(function() {
        alert('名前がありません');
      });
    }
  });


  $(document).on('click', '.user-search-add', function(){
    var id = $(this).data('user-id');
    var name = $(this).data('user-name');
    $(this).parent().remove();
    var html = addUserList(id, name);
    $('#user-search-result').append(html);
  });

  $(document).on('click', '.user-search-remove', function(){
    $(this).parent().remove();
  });
});

