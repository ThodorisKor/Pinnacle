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