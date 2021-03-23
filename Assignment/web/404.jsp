<!-- <%@page contentType="text/html" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<link rel="stylesheet" href="/public/css/app.css">
<script src="/public/vendor/jquery/jquery.min.js" defer></script>
<style>
    html{
        height: 100%;
    }
</style>
<html>
    <head>
        <title>ERROR 404 - PAGE NOT FOUND!</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body class="container-fluid">
        <div class="d-flex align-items-center justify-content-center h-100 w-75 m-auto">
            <div class="w-50">
                <img src="/public/img/404.svg" alt="404 Not Found" class="w-100">
            </div>
            <div class="d-flex flex-column text-center w-50">
                <h2>ERROR 404</h2>
                <h3>Page Not Found!</h3>
                <div>
                    <button class="btn btn-primary" back-to-home>Back To Home Page ( <span id="count-down">10</span> )</button>
                    <button class="btn btn-default" reload>Relaod</button>
                </div>
            </div>
        </div>
    </body>
</html>
<script defer>
    let interval = setInterval(function(){
        $("#count-down").text( parseInt($("#count-down").text()) - 1 );
        if($("#count-down").text() === "0"){
            clearInterval(interval);
            location.replace("/");
        }
    },1000);

    $("[back-to-home]").click(()=>{
        clearInterval(interval);
        location.replace("/");
    });
    $("[reload]").click(()=>{
        clearInterval(interval);
        location.reload();
    });
</script>