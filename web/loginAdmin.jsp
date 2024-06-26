<%-- 
    Document   : loginAdmin
    Created on : Aug 21, 2023, 9:27:17 AM
    Author     : Raiku
--%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login Admin</title>
        <link rel="stylesheet" href="material-design-iconic-font.min.css">
        <link rel="stylesheet" href="css/register.css" >
        <link href="img/favicon.png" rel="icon">
        <style>
            .form-submit {
                margin-bottom: 10px;
            }
            .loginhere {
                margin-top: 5px;
            }
        </style>
    </head>

    <body style="background-image: url(img/Fpt02.jpg);">
        <div class="main">

            <section class="signup">

                <div class="container">
                    <div class="signup-content">
                        <form action="login" method="POST" class="signin-form">
                            <input type="hidden" name="role" value="admin">
                            <h2 class="form-title">Login Admin</h2>
                            <div class="form-group">
                                <input name ="user" type="text" class="form-input" placeholder="Username" required>
                            </div>
                            <div class="form-group">
                                <input name="pass" id="password-field" type="password" class="form-input" placeholder="Password" required>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="form-submit">Log in</button>
                            </div>
                            <p class="text-danger" style="font-size: 26px;">
                                ${message}
                            </p>
                        </form>

                    </div>
                </div>
            </section>

        </div>   
    </body>
</html>

