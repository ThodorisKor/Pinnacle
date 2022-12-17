var me={};
var game_status={};
$( function(){
   $('#start').prop('disabled', true);
   $('#center_card').hide()
   $.ajax(
      {
         url: "pinnacle.php/deck",
         method: "POST",
         success: center_cards
      }
   )
   $('#login').click(login_to_game);
   //Gia thn emfanish xartiwn
    action();
    $("#id").change(function(){
      document.getElementById("cards").innerHTML="";
      action();
   });

   $("#cards").hide();
   $('#play_card').hide();
   $("#combination_div").hide();

   $("#start").click(function(){
      deck_handle();
      document.getElementById("started").classList.add('fixed-bottom');
      document.getElementById("started").classList.add('mb-5');
      $('#game_info').hide();
      $('#game_info').show(1000);
      $('#play_card').show(1000);
      $("#head").hide(1000);
      $(".hide").hide(1000);
      $("#combination_div").show(1000);
      $("#cards").show(1000);
      $('#center_card').show(1000);    
      //$("#login").hide();
   }) ; 
});
 

function login_to_game(){
   if($("#username").val()==''){
      alert("ERROR!Empty fields not allowed!");
     /* document.getElementById("alert").innerHTML+=
                   '<div class="container">'+
                       '<div class="alert text-center alert-danger alert-dismissible fade show">'+
                            '<button type="button" class="btn-close bg-danger bg-opacity-25" data-dismiss="alert"></button>'+
                             '<strong>ERROR!</strong> Empty fields not allowed!'+
                         '</div>'+
                   '</div>'; */
     return;
   }
   
   var p_id=$("#id").val();
   
   $.ajax({
      url: "pinnacle.php/player/"+p_id,
      method: 'PUT',
      dataType: "json",
      contentType: 'application/json',
      data: JSON.stringify(  {username: $("#username").val(), id: p_id }),
      success: login_result,
      error: login_error
   });
   
}

function action(){
   var p_id=$("#id").val();
    $.ajax(
         {
            url: "pinnacle.php/deck/player "+p_id,
            success: show_deck
         } 
      );
     }
function show_deck(data){
   for(var i=0;i<data.length;i++){
      var o = data[i];
      var number = o.number;
      var shape = o. shape;
      var node = document.createElement("option");
      var textnode = document.createTextNode(number +"");
      $('#cards').append("<option>" + number + " " + shape + "</option>");
      //document.getElementById("cards").innerHTML+="<option>" + number + " " + shape + "</option>";
   }   
} 

function deck_handle(){
   //url ajax 
   //succes go to other function store the variables 
   //show the center card on the page
  
}

function login_result(data){
   alert("User Added!");
   $('#start').prop('disabled', false);
   me = data[0]; 
   update_info();
   game_status_update();
  
   
   //bootstrap alert parakatw
   /*
   document.getElementById("alert").innerHTML+=
      '<div class="container">'+
                       '<div class="alert text-center alert-success alert-dismissible fade show">'+
                            '<button type="button" class="btn-close bg-success bg-opacity-25" data-dismiss="alert"></button>'+
                             '<strong>Success!</strong> User Added!'+
                         '</div>'+
                   '</div>'; 
   */
}
 
 
function update_info(){
   $('#game_info').html("<p>" + "I am Player: "+me.id+", my name is: "+me.username+"<br>Token: "+me.token+"<br>Game state: "+game_status.status+", " +game_status.p_turn+" must play now." + "</p>");
   //fixing this and adding a button to play a card
   
}

function center_cards(){
   $.ajax(
      {
         url: "pinnacle.php/center",
         success: get_center_card
      }
   );
}
function get_center_card(data){
   var number;
   var shape;
   for (var i = 0; i < data.length; i++) {
      number = data[i].number;
      shape = data[i].shape;
   }
   $('#center_card').html("<h6>" + number + " " + shape + "</h6>");
   document.getElementById("center_card").classList.add('bg-info');
}
function login_error(data,y,z,c){
   var x= data.responseJSON;
   alert(x.errormesg);
   //bootstrap alert parakatw
     /* document.getElementById("alert").innerHTML+=
                     '<div class="container">'+
                       '<div class="alert text-center alert-danger alert-dismissible fade show">'+
                            '<button type="button" class="btn-close bg-danger bg-opacity-25" data-dismiss="alert"></button>'+
                             '<strong>ERROR!</strong>'+x.errormesg+
                         '</div>'+
                     '</div>'; */
       
}
function game_status_update(){
   $.ajax({url: "pinnacle.php/status/", success: update_status});
}

function update_status(data){
   game_status= data[0];
   update_info();
    if(game_status.p_turn=="player "+me.id && me.id!=null){
      x=0;
      // do play
      $("#combination_div").show(1000);
      setTimeout(function(){ game_status_update();}, 10000);
    }
    else{
      // must wait for something
      $("#combination_div").hide(1000);
      setTimeout(function(){ game_status_update();}, 2000);
    }
}
 
