// =========================================================
// Check Special Cases

function IsValidEmail(email) {
    var ree = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    if (!ree.test(email)) return true;
    return false;
}

// ==========================================================
// Check String

// null or empty
function IsString(string) {
    if (string == null || string.length == 0) return false;
    return true;
}

function IsString(string, minLength, maxLength) {
    if (string == null || string.length == 0) return false;
    if (string.length < minLength) return false;
    if (string.length > maxLength) return false;
    return true;
}

// same
function IsStringSame(stringA, stringB) {
    if (stringA !== stringB) return false;
    else return true;
}

// contain subString
function IsStringContain(string, subString) {
    if (string.indexOf(subString) === -1) return false;
    else return true;
}

// ==========================================================
// Check Number

function IsNumber(number) {
    if (number !== parseFloat(number, 10)) return false;
    else return true;
}

function IsNumber(number, min, max) {
    if (number !== parseFloat(number, 10)) return false;
    if (number < parseFloat(min, 10)) return false;
    if (number > parseFloat(max, 10)) return false;
    else return true;
}

function IsNumberInteger(number) {
    if (number !== parseInt(number, 10)) return false;
    else return true;
}

// ==========================================================
// 
function CheckFieldEmpty(selector) {
    $(selector).find('input.required').each(function () {
        if ($(this).val() == "") {
            $(this).addClass('error');
        }
    });
}

function CheckFielError() {
    var flag = 0;
    $('input').each(function () {
        if ($(this).hasClass('error')) {
            flag = 1;
        }
    });

    if (flag == 1) return "You must fill in blank.<br>";
    else return "";
}

function CheckPasswordMatch(password, rePassword) {
    if (password != rePassword) return "Password doesn't match. <br>";
    return "";
}

function CheckPasswordValid(password) {
    if (password.length < 6) return "Your password must have at least 6 characters.";
    else return "";
}