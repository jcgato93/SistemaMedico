<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SistemaMedico.Views.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login Page</title>
    <script>
        $(document).ready(function () {
            $('.forgot-pass').click(function (event) {
                $(".pr-wrap").toggleClass("show-pass-reset");
            });

            $('.pass-reset-submit').click(function (event) {
                $(".pr-wrap").removeClass("show-pass-reset");
            });
        });
    </script>

    <link href="../Content/LoginStyle.css" rel="stylesheet" type="text/css" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
   <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="pr-wrap">
                <div class="pass-reset">
                    <label>
                        Enter the email you signed up with</label>
                    <input type="email" placeholder="Email" />
                    <input type="submit" value="Submit" class="pass-reset-submit btn btn-success btn-sm" />
                </div>
            </div>
            
            <div class="panel-body">
                <p 
                    class="form-title">
                    Login

                </p>
                <form class="login" id="formLogin" method="post">
                <input type="email" placeholder="Email" class="form-control"  required="required"/>
                    <br />
                <input type="password" placeholder="Password" class="form-control" required="required"/>
                <input type="submit" value="Sign In" class="btn btn-success btn-sm" />
                
                    <div class="remember-forgot">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"  />
                                    Remember Me
                                </label>
                            </div>
                        </div>
                        <div class="col-md-6 forgot-pass-content">
                            <a href="javascription:void(0)" class="forgot-pass">Forgot Password</a>
                        </div>
                    </div>
                </div>
                </form>
            </div>
          </div>
    </div>
   </div>
</body>
</html>
