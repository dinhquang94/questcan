<%@ Page Language="C#" AutoEventWireup="true" CodeFile="task.aspx.cs" Inherits="task" %>

    <head>
    <title>QuestCan</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://questcan.com/vendor/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <script src="https://questcan.com/vendor/jquery/jquery.min.js"></script>
    <script src="https://questcan.com/vendor/bootstrap/js/bootstrap.min.js"></script>
    <style>
        .border {
            text-align: center;
            border: 1px solid;
            margin-bottom: 15px;
            padding: 15px;
        }

        body {
            font-size: 15px !important;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <br />
                <div class="row">
               <%-- get task --%>

                     <%foreach (var task in listtask) {%> 
                    <div class="col-6">
                        <div class="border">
                            <a href="https://questcan.com/detailtask.aspx?id=<%=task.id%>" style="text-decoration: none;">
                                <img src="https://questcan.com/<%=task.picture %>" style="width: 100%;" />
                                <span><%=task.title%></span>
                                <hr />
                                <span class="">0/9 Steps</span>
                            </a>
                        </div>
                    </div>
                    <%} %>
                </div>
            </div>
        </div>
    </div>
</body>