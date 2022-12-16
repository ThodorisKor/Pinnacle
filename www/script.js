var me={};
var game_status={};

$( function(){
   $('#login').click(login_to_game);
   $("#submit").click(action);
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
    $.ajax(
         {
            url: "requests.php/login/",
            success: check_count
         } 
      );
     }
function check_count(data){
   for(var i=0;i<data.length;i++){
      var o = data[i];
      $id = o.count;
   }   
   document.cookie = "count =" + $id;
} 

function deck_handle(){
   //url ajax 
   //succes go to other function store the variables 
   //remove all the content , and make a new content with a array for player 1 and player 2 , button ama to pataei dinei xarti
}

function login_result(data){
   me = data[0];
   status_info();
  
   alert("User Added!");
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
function status_info(){
   $.ajax({
      url: "pinnacle.php/status",
      success: get_status
   });
}
function get_status(data){
   game_status = data[0];
   update_info();
}
function update_info(){
   $('#game_info').html("I am Player: "+me.id+", my name is: "+me.username+"<br>Token: "+me.token+"<br>Game state: "+game_status.status+", " +game_status.p_turn+" must play now.");
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
 
