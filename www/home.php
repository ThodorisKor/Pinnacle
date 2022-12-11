<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS only -->
    <!--bootstrap link-->
    <link  rel="stylesheet" type="text/css" href="main2.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>Pinnacle</title>
</head>
<body>
    <div class="container text-center pt-5" >
        <div class="row justify-content-center pt-5">
            <div class="col-md-5">
                <h2 class="text-info">Welcome to Pinnacle Game!</h2>
                <form action="log.php" method="get">
                    <div class="form-group">
                        <label class="mt-4 mb-4">Login</label>
                            <h5  id="error" class="error text-danger text-opacity-50 bg-danger bg-opacity-25 rounded"><?php echo $_GET['helloooo'];?></h5>                   
                        <input placeholder="username" id="input" type="text" name="user" class="form-control mt-4 ">
                        <input placeholder="username" id="input" type="text" name="user2" class="form-control mt-4 ">
                    </div>
                    <button type="submit" name="sumbit" class="btn btn-primary mt-4">Login</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>