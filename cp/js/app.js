function DisableButton(button) {
    $(this).prop('disabled', true);
}

function EnableButton(button) {
    $(button).prop('disabled', false);
}

function setActiveTab(index) {
    //$('#side-menu li').each(function () {
    //    $(this).find('a').removeClass('active');
    //});


    //$('#side-menu li:nth-of-type(' + index + ') a').addClass('active');
}

function Logout() {
    // post login
    $.post("/cp/do/admin/logout-admin.ashx", {},
        function (data) {
            if (data == 1) {
                location.href = "/teacher-login";
            } else {
                alertify.alert(data);
            }
        })
}

function ShowLoading() {
    $('#loading-screen').css('display', 'flex');
}

function HideLoading() {
    $('#loading-screen').hide();
}

$(function () {
    $('input').focus(function () {
        $(this).removeClass('error');
    });
})

function ResetChangePasswordForm() {
    $('#changePasswordModal input').each(function () {
        $(this).val('');
    });
}

function ChangePassword() {
    // get values
    var oldPassword = $('#txtOldPassword').val();
    var newPassword = $('#txtNewPassword').val();
    var retypePassword = $('#txtRetypePassword').val();

    CheckFieldEmpty('#changePasswordModal');
    var error = CheckFielError();
    error += CheckPasswordMatch(newPassword, retypePassword);
    error += CheckPasswordValid(newPassword);

    if (error != "") {
        alertify.alert("Error", error);
    } else {
        ShowLoading();

        $.post("/cp/do/teacher/change-teacher-password.aspx", {
            oldPassword: oldPassword,
            newPassword: newPassword,
        }, function (data) {
            HideLoading();

            console.log(data);

            if (data == 0) {
                alertify.alert("Error", "Your old password is not correct. Please try again.");
            } else if (data != 1) {
                alertify.alert("Error", data);
            } else {
                ResetChangePasswordForm();
                $('#changePasswordModal').modal('hide');

                alertify.success("Successful.");

                Logout();
            }
        });
    }
}