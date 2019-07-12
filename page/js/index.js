//var API_URL = "http://localhost:61577/";
var API_URL = "http://reward.tuscript.com/";

var color = [];
var UserEmail = "";
var selectedColor = 0;
var selectedColorName = "";
var x = 0;
var y = 0;
document.addEventListener("deviceready", function () {
    $.ajax({
        url: 'http://reward.tuscript.com/app/index.html',
        async: false,
        success: function (resp) {
            $("body").html(resp);
        },
        error: function () { }
    });


    for (var i = 1; i < 32; i++) {
        $("#txt-date-birthday").append(`<option value="${i}">${i}</option>`);
    }

    for (var i = 1; i < 13; i++) {
        $("#txt-month-birthday").append(`<option value="${i}">${i}</option>`);
    }

    for (var i = 1950; i < 2000; i++) {
        $("#txt-year-birthday").append(`<option value="${i}">${i}</option>`);
    }

    if (device.version.split(".")[0] >= 11 || device.platform == "Android") {
        $("#link-css").attr("href", "http://reward.tuscript.com/app/css/index.css");
    } else {
        $("#link-css").attr("href", "http://reward.tuscript.com/app/css/ios.css");
    }
    if (IsOnline()) {
        y = $(window).outerHeight() - ($("#btn-container").position().top + ($(window).outerWidth() * 0.2));
        x = $(window).outerWidth() - ($("#btn-container").position().left + ($(window).outerWidth() * 0.2));
        $("#owl-slider").owlCarousel({
            items: 1,
            dots: false,
        });
        $("#picker-color").owlCarousel({
            items: 1,
            dots: false
        })
        MenuClick(0);
        SubMenuClick(0);

        //slider
        $.getJSON(API_URL + "api2/page/get-slider.ashx", data => {
            var text = "";
            data.result.forEach(element => {
                text += `<img src="${element}">`;
            });
            $("#owl-slider").trigger("replace.owl.carousel", text).trigger("refresh.owl.carousel");
        })
        //home
        $.get(API_URL + "api2/page/get-by-ID.ashx?id=5", data => {
            $("#home-content").html(data);
        })
        //service
        $.get(API_URL + "api2/page/get-by-ID.ashx?id=3", data => {
            $("#service-content").html(data);
        });
        //price
        $.get(API_URL + "api2/page/get-by-ID.ashx?id=6", data => {
            $("#price-content").html(data);
        })
        //news
        $.getJSON(API_URL + "api2/page/get-page-news.ashx", data => {
            data.result.forEach(element => {
                var text = `<div class="item">
                            <div class="pageTitle page-title-news">
                               ${element.NewsName}
                            </div>
                            <div class="item-page-content">
                                <div class="pageNarrative">
                                    ${element.NewsContent} 
                                </div>
                            </div>
                        </div>`;
                $("#news-content").append(text);
            });

        });
        //appointment
        $.post(API_URL + "api2/page/get-by-ID.ashx?id=15", data => {
            $("#appointment-content").html(data);
            $("#datetimepicker4").datetimepicker({
                format: 'MM/DD/YYYY hh:mm A',
                ignoreReadonly: true,
                defaultDate: moment().format("MM/DD/YYYY hh:mm"),
                allowInputToggle: true,
                minDate: moment().format("MM/DD/YYYY hh:mm"),
            });
            if (localStorage.getItem("token") != null) {
                $.post(API_URL + "api2/account/get-info-by-token.ashx", {
                    token: localStorage.getItem("token")
                }, data => {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        console.log(data.error);
                    } else {
                        $("#txtName").val(`${data.fName} ${data.lName}`);
                        $("#txtEmail").val(`${data.email}`);
                        $("#txtPhone").val(`${data.phone}`);

                    }
                });
            }
        });
        $.getJSON(API_URL + "api/color/get-all.ashx", data => {
            if (data.success == 1) {
                color = data.result;
                data.result.forEach(brand => {
                    brand.list_color.forEach(color => {
                        $("#txtColor").append(`<option value="${color.id}">${color.name}</option>`);
                    });
                });
            }
        })

        var uluru = {
            lat: 35.4188693,
            lng: -80.7429025
        };
        try {
            var map = new google.maps.Map(
                document.getElementById('map'), {
                    zoom: 15,
                    center: uluru
                });
            var marker = new google.maps.Marker({
                position: uluru,
                map: map
            });
        } catch (error) {
            console.error(error);
        }
        $("#btn-container").blur(function () {
            $("#sub-btn").hide();
        });

        localStorage.setItem("device_id", device.uuid);
        FCMPlugin.getToken(token => {
            localStorage.setItem("register_id", token);
            var t = "";

            if (localStorage.getItem("token") != null) {
                t = localStorage.getItem("token");
            }
            $.post(API_URL + "api2/notify/add-registerID.ashx", {
                deviceID: localStorage.getItem("device_id"),
                registerID: localStorage.getItem("register_id"),
                token: t
            }, data => {
                data = JSON.parse(data);
                if (data.success == -1) {
                    console.log(data.error);
                } else {
                    console.log("Update successfully.");
                }
            })
        })

        //$("#txtchangeBithday").datetimepicker({
        //    format: 'MM/DD/YYYY',
        //    ignoreReadonly: true,
        //    allowInputToggle: true,
        //    maxDate: moment().format("MM/DD/YYYY"),
        //})

        //$("#txtReBithday1").datetimepicker({
        //    format: 'MM/DD/YYYY',
        //    ignoreReadonly: true,
        //    allowInputToggle: true,
        //    maxDate: moment().format("MM/DD/YYYY"),
        //})

        $("#owl-color .item:nth-child(1)").on("click", function () {
            $("#arrow-img").fadeIn();
            setTimeout(() => {
                $("#arrow-img").fadeOut();
            }, 2000);
        })
    } else {
        swal("", "Network is disabled. Please enable network");
    }
}, false)

document.addEventListener("resume", function () {
    location.reload();
}, false);

function IsOnline() {
    var networkState = navigator.connection.type;
    if (networkState !== Connection.NONE) {
        return true;
    }
    return false;
}


function MenuClick(page) {
    $(".page").hide();
    $(".page").eq(page).fadeIn();
    $(".menu-item").removeClass("menu-active");
    $(".menu-item").eq(page).addClass("menu-active");
    if (page == 3) {
        $("#arrow-img").fadeIn();
        setTimeout(() => {
            $("#arrow-img").fadeOut();
        }, 3000);
        $("#txtBrand").html("");
        $("#owl-color").owlCarousel({
            items: 1,
            autoHeight: true,
            dots: false,
        })
        $(".image-preview").css("height", $(".image-preview img").height());
        $(".image-preview div").css("height", $(".image-preview img").height());
        $.getJSON(API_URL + "api2/color/get-all.ashx", data => {
            if (data.success == 1) {
                color = data.result;
                data.result.forEach(element => {
                    $("#txtBrand").append(`<option value="${element.brand_id}">${element.brand_name}</option>`);
                });
                $("#name-product").text(data.result[0].list_color[0].name);
                $(".bg-color").css("background-color", data.result[0].list_color[0].code);
                $("#name-product").text(data.result[0].list_color[0].name);
                selectedColor = parseInt(data.result[0].list_color[0].id);
                selectedColorName = data.result[0].list_color[0].name;
                var text = "";
                var len = data.result[0].list_color.length;
                for (let i = 0; i < len; i++) {
                    if (i == 0) {
                        text += `<div class="item">`;
                    } else if (i % 6 == 0) {
                        if (i == len - 1) {
                            text += `<div class="color-item right-arrow"><i class="fas fa-chevron-right"></i></div>`;
                            text += `</div>`;
                            continue;
                        } else {
                            text += `<div class="color-item right-arrow"><i class="fas fa-chevron-right"></i></div>`;
                            text += `</div><div class="item">`;
                        }
                    } else if (i == len - 1) {
                        text += `<div class="color-item right-arrow"><i class="fas fa-chevron-right"></i></div>`;
                        text += `</div>`;
                        continue;
                    }
                    text += `<div class="color-item" data-id="${data.result[0].list_color[i].id}" data-name="${data.result[0].list_color[i].name}" onclick='Pick("${data.result[0].list_color[i].code}",this)' style="background-color: ${data.result[0].list_color[i].code}"></div>`;
                }
                text += `<div class="item text-center color-info" style="padding:10px;">Please inquire us for more colors</div>`;
                $("#picker-color").trigger("replace.owl.carousel", text).trigger("refresh.owl.carousel");
            }
        })
    }
}

function Start(e) {
    //  x = e.changedTouches[0].clientX + x;
    //  y = e.changedTouches[0].clientY + y;
    console.log("x start = " + x);
    console.log("y start = " + y);
}

function MoveButton(ev) {
    var x1 = $(window).outerWidth() - ev.changedTouches[0].clientX; //x + $(window).outerWidth() - ev.changedTouches[0].clientX;
    var y1 = $(window).height() - ev.changedTouches[0].clientY; // y + $(window).outerHeight() - ev.changedTouches[0].clientY;
    $("#btn-container").css("right", x1);
    $("#btn-container").css("bottom", y1);
}

function End(e) {
    // y = e.changedTouches[0].clientY;
    // x = e.changedTouches[0].clientX;
    //   y = $(window).outerHeight() - ($("#btn-container").position().top + ($(window).outerWidth() * 0.2));
    // x = $(window).outerWidth() - ($("#btn-container").position().left + ($(window).outerWidth() * 0.2));
}

function SubMenuClick(tab) {
    $(".btnx").removeClass("btnx-active");
    $(".btnx").eq(tab).addClass("btnx-active");
    if (tab == 0) {
        $("#service-content").show();
        $("#price-content").hide();
    } else {
        $("#service-content").hide();
        $("#price-content").show();
    }
}

function Pick(color, input) {
    $(".bg-color").css("background-color", color);
    $("#name-product").text($(input).data("name"));
    selectedColor = parseInt($(input).data("id"));
    selectedColorName = $(input).data("name");
}

function ChangeBrand() {
    var brandID = parseInt($("#txtBrand").val());
    var brand = $.grep(color, element => {
        return element.brand_id == brandID;
    });

    if (brand[0].list_color.length == 0) {
        $("#picker-color").trigger("replace.owl.carousel", "Not found color").trigger("refresh.owl.carousel");
    } else {
        $("#name-product").text(brand[0].list_color[0].name);
        $(".bg-color").css("background-color", brand[0].list_color[0].code);
        selectedColor = parseInt(brand[0].list_color[0].id);
        selectedColorName = brand[0].list_color[0].name;
        var text = "";
        var len = brand[0].list_color.length;

        for (let i = 0; i < len; i++) {
            if (i == 0) {
                text += `<div class="item">`;
            } else if (i % 6 == 0) {
                if (i == len - 1) {
                    text += `<div class="color-item right-arrow"><i class="fas fa-chevron-right"></i></div>`;
                    text += `</div>`;
                    continue;
                } else {
                    text += `<div class="color-item right-arrow"><i class="fas fa-chevron-right"></i></div>`;
                    text += `</div><div class="item">`;
                }
            } else if (i == len - 1) {
                text += `<div class="color-item right-arrow"><i class="fas fa-chevron-right"></i></div>`;
                text += `</div>`;
                continue;
            }
            text += `<div class="color-item" data-id="${brand[0].list_color[i].id}" data-name="${brand[0].list_color[i].name}" onclick='Pick("${brand[0].list_color[i].code}",this)' style="background-color: ${brand[0].list_color[i].code}"></div>`;
        }
        text += `<div class="item text-center color-info" style="padding:10px;">Please inquire us for more colors</div>`;
        $("#picker-color").trigger("replace.owl.carousel", text).trigger("refresh.owl.carousel");
    }
}

function BookOnline() {

    var name = $("#txtName").val();
    var email = $("#txtEmail").val();
    var phone = $("#txtPhone").val();
    var date = $("#datetimepicker4").val();
    var nailtech = $("#slNailtech").val();
    var slservice = $("#slService1").val();
    var slservice2 = $("#slService2").val();
    var slservice3 = $("#slService3").val();
    var color = $("#txtColor").val();
    var today = new Date();
    var d = new Date(date);

    today.setHours(0, 0, 0, 0);
    d.setHours(0, 0, 0, 0);

    if (today.getTime() > d.getTime()) {
        swal("", "Cannot set event this day.");
    } else if (slservice == null && slservice2 == null && slservice3 == null) {
        swal("", "You must select at least one  the service", "error");
    } else if (nailtech == null) {
        swal("", "Please select technician", "error");
    } else {
        var re =
            /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        if (name.trim().length == 0) {
            swal("", "Please enter your name!");
        } else if (name.trim().length < 2 || name.trim().length > 100) {
            swal("", "Name more than 2 and less than 100 characters.");
        } else if (email.trim().length == 0) {
            swal("", "Please enter your email address!");
        } else if (!re.test(email)) {
            swal("", "Not a valid email address.");
        } else if (phone.trim().length == 0) {
            swal("", "Please enter your Phone.");
        } else if (date.trim().length == 0) {
            swal("", "Please select date!");
        } else {
            window.plugins.spinnerDialog.show(null, "Please wait....");
            $.post(API_URL + "api2/booking/send-mail.ashx", {
                date: date,
                stylist: nailtech,
                slservice: slservice,
                slservice2: slservice2,
                slservice3: slservice3,
                name: name,
                phone: phone,
                email: email,
                color: color
            }, function (data) {
                data = JSON.parse(data);
                if (data.success == -1) {
                    swal("Error. Please try again", "error");
                } else {
                    swal("", "Thank you for using our online booking system. We will contact you soon! ");
                    MenuClick(0);
                }
                window.plugins.spinnerDialog.hide();
            });
        }
    }
}

function Show() {
    TabProfile(0);
    if (localStorage.getItem("token") == null) {
        $("#sub-btn").slideToggle();
        $("#btn-container").focus();
    } else {
        $(".wrap").eq(0).hide();
        $(".wrap").eq(1).fadeIn();
        window.plugins.spinnerDialog.show(null, "Please wait...");
        $.post(API_URL + "api2/account/get-info-by-token.ashx", {
            token: localStorage.getItem("token")
        }, data => {
            data = JSON.parse(data);
            if (data.success == -1) {
                swal("", "Error occur. Please check your internet");
                console.log(data.error);
            } else {
                UserEmail = data.email;
                var text = `<h4>My info</h4>
                            <p>User name: ${data.fName} ${data.lName}</p>
                            <p>User level: ${data.level}</p>
                            <p>Email: ${data.email}</p>
                            <p>Phone: ${data.phone}</p>
                            <p>Birthday: ${data.birthday}</p>
                            <p>Reward: ${data.reward}</p>`;
                $(".info").html(text);
                $("#txtchangefName").val(data.fName);
                $("#txtchangelName").val(data.lName);
                $("#txtchangePhoneNumber").val(data.phone);
                //$("#txtchangeBithday").val(data.birthday);
                $(".my-voucher").css("height", $(".tab").height() - $(".reward").height());
                text = "<h4 class='col-12'>Voucher</h4>"
                if (data.voucher.length > 0) {
                    data.voucher.forEach((element, index) => {
                        text += `  <div class="voucher-item">
                                        <p>Voucher number ${index + 1}</p>
                                        <p>Voucher price: $${element.price}</p>
                                        <p>Voucher code: ${element.code}</p>
                                    </div>`
                    });
                } else {
                    text += "<div class='text-center'>You have no voucher yet! <br/> You can redeem voucher by reward point at our Nail Spa.<br/> </div>"
                }
                $(".my-voucher").html(text);
                window.plugins.spinnerDialog.hide();
            }
        });
    }
}

function BottomClick(id) {
    $("#sub-btn").slideToggle();
    if (id == 1) {
        $("#mdLogin").modal();
    } else if (id == 2) {
        $("#mdRegister").modal();
    }
}

function BackToHome() {
    $(".wrap").eq(0).fadeIn();
    $(".wrap").eq(1).hide();
}

function ResetPassword() {
    var email = $("#txtEmailReset").val();
    if (email.trim().length == 0) {
        swal("Please enter your email.");
    } else {
        window.plugins.spinnerDialog.show(null, "Please wait...");
        $.getJSON(API_URL + "/api2/account/send-mail-reset-pass.ashx", {
            email: email
        }, data => {
            if (data.success == -1) {
                console.log(data.error);
                swal("", "Error occur. Please try again");
            } else if (data.success == 0) {
                swal("", "Email not register yet, please enter other email.");
            } else {
                swal("", "Please check your email inbox.", "success");
                $("#mdForgotPassword").modal("hide");
            }
            window.plugins.spinnerDialog.hide();
        });
    }
}

function Login() {

    var fl = true;
    var email = $("#txtLoginUserEmail1").val();
    var password = $("#txtLoginUserPassword1").val();
    var error = "";
    var regex = /^(\([0-9]{3}\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}$/;
    if (email.trim().length == 0) {
        error += "Please enter email !\n";
        fl = false;
    }
    if (password.trim().length == 0) {
        error += "Please enter Password !\n";
        fl = false;
    }
    if (fl) {
        window.plugins.spinnerDialog.show(null, "Please wait");
        $.post(API_URL + "api2/account/login.ashx", {
            email: email,
            password: password,
        }, function (data) {
            data = JSON.parse(data);
            if (data.success == -1) {
                swal("", "Error occur.", "error");
                console.log(data.error);
            } else if (data.success == 0) {
                swal("", data.message, "error");
            } else {
                localStorage.setItem("token", data.token);
                location.reload();
            }
            window.plugins.spinnerDialog.hide();
        });
    } else {
        swal("", "Login error", error);
    }
}

function Register() {
    var fl = true;
    var fname = $("#txtfName1").val();
    var lname = $("#txtlName1").val();
    var email = $("#txtReEmail1").val();
    var phonenumber = $("#txtRePhoneNumber1").val();
    var password = $("#txtRePassword1").val();
    var Repassword = $("#txtRetypePassword1").val();
    var birthday = $("#txt-month-birthday").val() + "/" + $("#txt-date-birthday").val() + "/" + $("#txt-year-birthday").val();


    var check = document.getElementById("myCheck1").checked;

    var error = "";

    var regex = /^(\([0-9]{3}\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}$/;

    if (fname.trim().length == 0) {
        error += "Please enter first name !\n";
        fl = false;
    } else if (fname.trim().length < 2 || fname.trim().length > 100) {
        error += "Fist name more than 2 and less than 100 characters\n";
        fl = false;
    }
    if (lname.trim().length == 0) {
        error += "Please enter last name !\n";
        fl = false;
    } else if (lname.trim().length < 2 || lname.trim().length > 100) {
        error += "Last name more than 2 and less than 100 characters\n";
        fl = false;
    }
    if (password.trim().length == 0 || Repassword.trim().length == 0) {
        error += "Please enter password.\n";
        fl = false;
    }
    if (password.trim() != Repassword.trim()) {
        error += "Confirm password invalid.\n "
        fl = false;
    }
    if (password.trim().length < 8) {
        error += "Password must more than 8 character. \n "
        fl = false;
    }
    var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    if (email.trim().length == 0) {
        error += "Please enter your email address!\n";
        fl = false;
    } else if (!re.test(email)) {
        error += "Not a valid email address\n";
        fl = false;
    }
    if (phonenumber.trim().length == 0) {
        error += "Please enter your Phone.\n";
        fl = false;
    }
    if (!moment(birthday, "MM/DD/YYYY").isValid()) {
        //error += "Please enter your birthday!\n";
        //fl = false;
        birthday = "1/1/1970";
    }
    if (check == false) {
        error += "Please check Agree with Our Terms & Conditions.";
        fl = false;
    }
    if (fl) {
        window.plugins.spinnerDialog.show(null, "Please wait");
        $.post(API_URL + "api2/account/register.ashx", {
            fname: fname,
            lname: lname,
            password: password,
            email: email,
            phonenumber: phonenumber,
            birthday: birthday,
        }, function (data) {
            data = JSON.parse(data);
            if (data.success == -1) {
                swal("", "Error occur", "error");
                console.log(data.error);
            } else if (data.success == 0) {
                swal("", "Email used. Please enter other Email.!");
            } else if (data.success == 1) {
                swal("", "Register successfully", 'success');
                localStorage.setItem("token", data.token);
                location.reload();
            }
            window.plugins.spinnerDialog.hide();
        });
    } else {
        swal("", error, "error");
    }
}

function GetHistory() {
    $("#mdHistory").modal();
    window.plugins.spinnerDialog.show(null, "Please wait...");
    $.post(API_URL + "api2/account/get-reward-by-token.aspx", {
        token: localStorage.getItem("token")
    }, function (data) {
        if (data != "") {
            $("#viewreward").html(data);
        } else {
            $("#viewreward").html("NO RESULT.");
        }
        window.plugins.spinnerDialog.hide();
    });
}

function GetVoucher(id) {
    var ctext = 0;
    if (id == 1) {
        ctext = 100;
    }
    if (id == 2) {
        ctext = 200;
    }
    if (id == 3) {
        ctext = 300;
    }
    if (id == 4) {
        ctext = 400;
    }
    swal({
        title: 'Are you sure?',
        text: "You will be subtracted " + ctext + " Reward Point!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#DD6B55',
        confirmButtonText: "Yes",
    }).then(result => {
        if (result.value) {
            window.plugins.spinnerDialog.show(null, "Please wait...");
            $.post(API_URL + "api2/reward/add-new-reward.ashx", {
                type: id,
                token: localStorage.getItem("token")
            }, function (data) {
                console.log(data);
                data = JSON.parse(data);
                if (data.success == -1) {
                    swal("", "Error occur. Please try again", "error");
                    console.log(data.error);
                } else if (data.success == 0) {
                    swal("", "Not enough reward point. ");
                } else {
                    swal("", "Success", "success");
                    Show();
                    $("#mdRedeem").modal('hide');
                }
                window.plugins.spinnerDialog.hide();
            });
        }
    });
}

function GiftCardDetail(id) {
    $("#mdGiftCardDetail").modal();
    $("#mdGiftCard").modal("hide");
    $("#txtUserEmail").val(UserEmail);
    $("#pay-now").attr("onclick", `PayNow(${id})`)
}

function PayNow(Id) {
    var emailto = $("#txtToEmail").val();
    var emailfrom = UserEmail;
    var note = $("#txtGiftCardNote").val();
    var receiptPhone = $("#txtReceiptPhone").val();
    var fnameReceipt = $("#txtReceiptfName").val();
    var lnameReceipt = $("#txtReceiptlName").val();
    var flag = true;
    var error = "";
    var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

    if (emailto.trim().length == 0) {
        error += "* Please enter user email to.\n";
        flag = false;
    } else if (!re.test(emailto)) {
        error += "* Not a valid email address\n";
        flag = false;
    }
    if (receiptPhone.trim().length == 0) {
        error += "* Please enter user receipt phone.\n";
        flag = false;
    }
    if (note.trim().length == 0) {
        error += "* Please enter your note.\n";
        flag = false;
    }
    if (fnameReceipt.trim().length == 0) {
        error += "* Please enter receipt first name.\n";
        flag = false;
    }
    if (lnameReceipt.trim().length == 0) {
        error += "* Please enter receipt last name.\n";
        flag = false;
    }
    if (flag == true) {
        location.href = API_URL + "/paypal/generate-cart.aspx?id=" + Id + "&&emailfrom=" + emailfrom + "&&emailto=" + emailto + "&&note=" + note + "&&token=" + localStorage.getItem("token") + "&&fnameReceipt=" + fnameReceipt + "&&lnameReceipt=" + lnameReceipt + "&&receiptPhone=" + receiptPhone;
    } else {
        swal("error", error);
    }

}

function TabProfile(tab) {
    $(".btn-profile").removeClass("btn-profile-active");
    $(".btn-profile").eq(tab).addClass("btn-profile-active");
    $(".tab").hide();
    $(".tab").eq(tab).show();
}

function SaveProfile() {

    var error = "";
    var flag = true;
    var changefName = $("#txtchangefName").val();
    var changelName = $("#txtchangelName").val();
    var changePhoneNumber = $("#txtchangePhoneNumber").val();
    //var changeBirthday = $("#txtchangeBithday").val();
    if (changefName.trim().length == 0) {
        error += "First Name not blank.\n";
        flag = false;
    }
    if (changelName.trim().length == 0) {
        error += "Last Name not blank.\n";
        flag = false;
    }
    if (changePhoneNumber.trim().length == 0) {
        error += "Phone Number not blank.\n";
        flag = false;
    }
    if (flag == false) {
        swal("", error);
    } else {
        window.plugins.spinnerDialog.show(null, "Please wait...");
        $.post(API_URL + "/api2/account/change-profile.ashx", {
            token: localStorage.getItem("token"),
            changePhoneNumber: changePhoneNumber,
            changefName: changefName,
            changelName: changelName,
            changeBirthday: changeBirthday
        },
            function (data) {
                data = JSON.parse(data);
                if (data.success == -1) {
                    swal("Sorry", "Change fail, please try again");
                    console.log(data.error);
                } else {
                    swal("", "Change successfully", "success");
                    $("#mdChangeProfile").modal('hide');
                    location.reload();
                }
                window.plugins.spinnerDialog.hide();
            });
    }
}

function ChangePassword() {
    var error = "";
    var oldpass = $("#txtoldPassword").val();
    var newpass = $("#txtnewPassword").val();
    var newpass2 = $("#txtreNewPassword").val();

    if (oldpass.trim().length == 0) {
        error += "Please enter old password.\n";
    }
    if (newpass.trim() == "") {
        error += "Please enter new password.\n";
    } else {
        if (newpass.trim().length < 8) {
            error += "Password must have at least 8 characters.\n";
        }
    }
    if (newpass2.trim().length == 0) {
        error += "Please enter confirm password.\n";
    } else if (newpass2.trim() != newpass) {
        error += "Invalid confirm password.\n";
    }

    if (error == "") {
        window.plugins.spinnerDialog.show(null, "Please wait...");
        $.post(API_URL + "/api2/account/change-password.ashx", {
            token: localStorage.getItem("token"),
            oldpass: oldpass,
            newpass: newpass
        }, data => {
            data = JSON.parse(data);
            if (data.success == -1) {
                swal("", "Error occur. Please try again", "error");
            } else if (data.success == 0) {
                swal("", "Old password wrong. Please try again", "error");
            } else {
                swal("", "Change successfully", 'success');
                localStorage.removeItem("token");
                location.reload();
            }
            window.plugins.spinnerDialog.hide();
        });
    } else {
        swal("Change password", error);
    }
}


function Logout() {
    swal({
        title: 'Are you sure?',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#DD6B55',
        confirmButtonText: "Yes",
    }).then(result => {
        if (result.value) {
            $.post(API_URL + "api2/notify/remove-device.ashx", {
                deviceID: localStorage.getItem("device_id")
            }, function (data) {
                console.log(data);
            })
            localStorage.removeItem("token");
            location.reload();
        }
    });
}

function OpenBooking() {
    if (selectedColor == 0) {
        swal("", "Please select color.");
    } else {
        MenuClick(4);
        $("#txtColor").val(selectedColor).change();
    }
}

function OpenMiniGame() {
    if (localStorage.getItem("token") == null)
        swal("", "Please login to continue.");
    else {
        $.ajax({
            url: API_URL + "api2/game/check-available.ashx",
            method: "post",
            data: {
                token: localStorage.getItem("token")
            },
            success: function (data) {
                data = JSON.parse(data);
                if (data.success == -1) {
                    console.log(data.error);
                }
                else if (data.success == 1) {
                    if (data.times >= 2) {
                        swal("", "You can only play twice a day");
                    } else {
                        $("#mdChristmasGame").modal();
                    }
                }
            },
            error: function (error) {
                console.log(error);
                swal("", "Please try again later");
            }
        })
    }
}

function OpenGiftBox(input) {
    var credit = Math.floor((Math.random() * 4) + 1);
    credit *= 10;
    $(input).find("img").attr("src", "http://reward.tuscript.com/img/gift-box1.gif");
    $.ajax({
        url: API_URL + "api2/game/save-result.ashx",
        method: "post",
        data: {
            token: localStorage.getItem("token"),
            credit: credit
        },
        success: function (data) {
            data = JSON.parse(data);
            if (data.success == -1) {
                console.log(data.error);
            }
            else if (data.success == 1) {
                $("#mdChristmasGame").modal("hide");
                swal("Congratulations", "You received " + credit + " points from lucky gift");
            }
            $(input).find("img").attr("src", "http://reward.tuscript.com/img/gift-box1.jpg");
        },
        error: function (error) {
            $(input).find("img").attr("src", "http://reward.tuscript.com/img/gift-box1.jpg");
            console.log(error);
            swal("", "Please try again later");
        }
    })
}