<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="cp_Login" %>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<div class="container">
    <p></p>
    <div class="row">
        <div class="col-xs-12">
            <h2>SaiGon Heat</h2>

            <!---- Partner Login Block --->
            <div class="row">
                <div class="col-xs-12 col-md-4 col-md-offset-4">
                    <div class="panel panel-default valign">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-group"></i>
                                Partner Sign in</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group input-group">
                                <div class="input-group-addon"><i class="fa fa-file-o fa-fw"></i></div>
                                <input class="form-control" placeholder="Username" type="text" id="txtEmail" />
                            </div>
                            <div class="form-group input-group">
                                <div class="input-group-addon"><i class="fa fa-lock fa-fw"></i></div>
                                <input class="form-control" placeholder="Password" id="txtPassword" type="password" />
                            </div>
                            <div class="form-group">
                                <button class="btn btn-success btn-lg btn-block" id="btnLogin">Sign in</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./ Partner Login Block -->

            <hr />
        </div>
    </div>
</div>
<div id="result"></div>
<script>
    $("#btnLogin").click(function () {
        

        $.ajax({
            method: 'post',
            url: '/cp/do/admin/login.aspx',
            data: {
                username: $("#txtEmail").val(),
                password: $("#txtPassword").val()
            },
            success: function (data) {
                $(this).prop("disabled", true);
                data = JSON.parse(data);
                if (data.success == -1) {
                    console.log(data.error);
                    alert("Error. Please try again");
                } else if (data.success == 0) {
                    alert(data.message);
                } else {
                    location.href = "/cp/page/user/user.aspx";
                }
            },
            error: function (error) {
                $(this).prop("disabled", true);
                console.log(error);
                alert("Error. Please try again");
            }
        });
    });

</script>
