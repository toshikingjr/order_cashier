$(function(){
  function buildHTML(menu_order) {
    var html = `<div class="menu_output menu_order" data-id= ${menu_order.id} >
                ${menu_order.menu_name} × ${menu_order.quantity}個 No. ${menu_order.table_num} 
               </div>`
    return html;
  }
  $(function(){
    setInterval(update, 10000);
  });
  function update(){
    if($('.menu_order')[0]){
      var menu_order_id = $('.menu_order:last').data('id');
    }else{
      clearInterval();
    }
    $.ajax({
      url: '/menu_orders',
      type: 'GET',
      data: {
        menu_order: {id: menu_order_id}
      },
      dataType: 'json'
    })
    .done(function(data){
      if (data.length){
        $.each(data, function(i, data){
          var html = buildHTML(data);
          $('.menu_orders').append(html);
        });
      }
    });
  };
});