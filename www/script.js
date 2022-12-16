$(document).ready(onclick);

function onclick(){
   $("#submit").click(action)
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