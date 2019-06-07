// Attach file pagination.css và pagination.js vào MasterPage
// Cuối table (ngoài div table) thêm dòng html sau: <div id="pagination"></div>
// Script gọi hàm: 
// $(document).ready(function) { Pagination(records_per_page, container_id); }
// Nếu không truyền vào tham số, mặc định là 10 records 1 page
// container_id để xác định table nằm trong div nào cần phân trang
// Ex: Pagination(20, 'paging-table');

var $tr = "";
var req_num_row = 0;
var num_pages = 0;
var current_page = 1;
var button_count = 1;
var container = "";

function Pagination(record_per_page = 10, container_id) {
    container = $('#' + container_id);
    $tr = container.find('tbody:not(".sub-table") tr');
    req_num_row = record_per_page;
    var total_num_row = $tr.length;
    num_pages = 0;
    if (total_num_row % req_num_row == 0) {
        num_pages = total_num_row / req_num_row;
    }
    if (total_num_row % req_num_row >= 1) {
        num_pages = total_num_row / req_num_row;
        num_pages++;
        num_pages = Math.floor(num_pages++);
    }

    // Customize pagination button
    container.find('#pagination').append('<ul>');

    InitPagination();

    $tr.each(function (i) {
        $(this).hide();
        if (i + 1 <= req_num_row) {
            $tr.eq(i).show();
        }

    });

    container.find('#pagination li').click(function (e) {
        ShowActivePage($(this));
    });
}

function InitPagination() {
    container.find('#pagination ul').append('<li id="first-page"><a><i class="fas fa-angle-double-left"></i></a></li>');

    for (var i = 1; i <= num_pages; i++) {
        container.find('#pagination ul').append("<li><a>" + i + "</a></li>");
        button_count++;

        if (button_count == 4) break;
    }

    container.find('#pagination ul').append('<li id="last-page"><a><i class="fas fa-angle-double-right"></i></a></li>');

    if (num_pages > 1) {
        container.find('#pagination ul #last-page').show();
    }

    button_count = 0;

    container.find('#pagination li:nth-child(2)').addClass('active');
}

function ShowActivePage(selector) {
    $tr.hide();
    // Xóa class active cũ
    container.find('#pagination li').each(function () {
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
        }
    });

    // Page
    var page = 0;

    if (selector.attr('id') == 'first-page') {
        page = 1;
    } else if (selector.attr('id') == 'last-page') {
        page = num_pages;
    } else {
        page = selector.text();
    }

    RefreshPaginationBar(page);
}

function RefreshPaginationBar(selected_page) {
    selected_page = parseInt(selected_page);
    container.find('#pagination ul li').remove();


    if (selected_page == 1) {
        InitPagination();
    } else if (selected_page == num_pages) {
        container.find('#pagination ul').append('<li id="first-page"><a><i class="fas fa-angle-double-left"></i></a></li>');
        container.find('#pagination ul #first-page').show();

        for (var i = (selected_page - 2); i <= selected_page; i++) {
            if (i == 0) {
                continue;
            }
            else if (i == selected_page) {
                container.find('#pagination ul').append("<li class='active'><a>" + i + "</a></li>");
            } else {
                container.find('#pagination ul').append("<li><a>" + i + "</a></li>");
            }
        }
    } else {
        container.find('#pagination ul').append('<li id="first-page"><a><i class="fas fa-angle-double-left"></i></a></li>');

        for (var i = (selected_page - 1); i <= selected_page + 1; i++) {
            if (i == selected_page) {
                container.find('#pagination ul').append("<li class='active'><a>" + i + "</a></li>");
            } else {
                container.find('#pagination ul').append("<li><a>" + i + "</a></li>");
            }
        }

        container.find('#pagination ul').append('<li id="last-page"><a><i class="fas fa-angle-double-right"></i></a></li>');

        container.find('#pagination ul #first-page').show();
        container.find('#pagination ul #last-page').show();
    }

    var temp = selected_page - 1;
    var start = temp * req_num_row;

    for (var i = 0; i < req_num_row; i++) {
        $tr.eq(start + i).show();
    }

    BindingHandler();
}

function BindingHandler() {
    container.find('#pagination li').click(function (e) {
        ShowActivePage($(this));
    });
}