$(function () {
    document.getElementById('txtSearch').onkeyup = function (event) {
        if (event.keyCode == 13) {
            Search();
        }
    }
});