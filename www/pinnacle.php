<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS only -->
    <!--bootstrap link-->
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="script.js"></script>
    <title>Pinnacle</title>
 
</head>
<body>
 <?php 
  require_once "../lib/dbConnect.php";
  require_once "../lib/login.php"; 
?>
 <div id="alert">
    <div class="container text-center pt-5" >
        <div class="row justify-content-center pt-5">
            <div class="col-md-5">
                <h2 id="head" class="text-info">Welcome to Pinnacle Game!</h2>
                <form method="get">
                    <div class="form-group">
                        <label class="mt-4 mb-4">Login</label>
                            <h5  id="error" class="error text-danger text-opacity-50 bg-danger bg-opacity-25 rounded"></h5>                   
                        <input placeholder="Enter Username" id="input" type="text" name="user" class="form-control mt-4 ">                     
                    </div>
                    <!-- AN PATISW TO KOUMPI THA EKTELESTHEI O KWDIKAS TOU login.php -->
                    <button type="submit" id="submit" name="sumbit" class="btn btn-primary mt-4">Login</button>
                </form>
            </div>
        </div>
    </div>

</div>
 
  
  

 
</body>
</html>

