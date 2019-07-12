<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detailtask.aspx.cs" Inherits="detailtask" %>

<head>
    <title>QuestCan</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="vendor/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <style>
        body {
            font-size: 15px !important;
        }

        .btnn {
            /*margin-left: -14px !important;
                font-size: 15px;
                padding: 15px 30px  !important;
                letter-spacing: 2px !important;*/
            font-weight: unset !important;
            font-family: Lora,Times New Roman,serif !important;
        }

        .list-group-item {
            padding: 0.1rem !important;
            border: unset !important;
        }

        .border2 {
            display: block;
            border-left: none !important;
            border-top: none !important;
            border-right: none !important;
        }

        .boder3 {
            border-right: 1px !important;
        }

        .boder4 {
            border-top: none !important;
            border-right: none !important;
            border-bottom: none !important;
            padding: unset;
        }

        .name {
            text-align: center;
        }

        .desc {
            margin-top: -20px;
        }

        .ab {
            border-top: none !important;
            border-left: none !important;
            border-bottom: none !important;
        }

        .r {
            margin-top: 1rem;
            margin-left: 1rem;
        }

        .body2 {
            margin-left: 1px !important;
            margin-right: 1px !important;
        }

        .but {
            max-width: 45%;
            background-color: #17a2b8;
        }

        .btn-info:focus {
            box-shadow: none !important;
        }

        .step {
            margin-top: 10px !important;
        }

        .head {
            margin-left: 5px;
        }

        .cont {
            margin: 22px 5px 5px 13px !important;
        }

        .bttt:hover {
            background-color: unset !important;
            border-color: #17a2b8 !important;
        }

        .bttt:focus {
            border-color: #17a2b8 !important;
        }

        .bttt {
            margin-left: -6px;
        }

        .imgg {
            width: 70%;
        }

        .backk {
            font-size: 30px;
            margin-top: 5px;
            margin-left: -14px;
        }

        .aback:hover {
            text-decoration: none !important;
        }

        .stepp {
            text-align: center;
            margin: auto;
        }

        .headq {
            position: fixed;
            z-index: 1;
            background-color: white;
            margin-top: -10px;
            max-width: 91%;
        }

        @media (min-width: 767px) {
            .imgg {
                width: 30% !important;
            }

            .but {
                max-width: 47.5%;
            }

            .r {
                text-align: center;
            }
        }

         /*@media (max-width: 766px) {
            .imgg {
                width: 30% !important;
            }

            .but {
                max-width: 46.5%;
            }

            .r {
                text-align: center;
            }
        }*/


        @media (min-width: 1024px) {
            .imgg {
                width: 30% !important;
            }

            .but {
                max-width: 48%;
            }

            .r {
                text-align: center;
            }
        }

        @media (min-width: 1366px) {


            .but {
                max-width: 48.5%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2></h2>
        <ul class="list-group">
            <li class="list-group-item">
                <div class="row">
                    <div class="col-12">

                        <div class="col-12 headq">

                            <a href="https://api.questcan.com/page/page1.aspx?id=3" class="aback">
                                <span class="backk">&larr;</span></a> <span class="head"><%=task.title %></span>
                        </div>
                        <br />
                        <hr />

                        <%for (int i = 0; i < listrule.Count; i++)
                            {%>
                        <div class="row border body2">
                            <div class="col-3 stepp">
                                <%if (i == 0)
                                    {%>
                                <img class="imgg" src="https://questcan.com/<%=task.picture %>" />
                                <br />
                                <%} %>
                                <span class="step"><%=listrule[i].name %> </span>
                            </div>
                            <div class="col-9 border boder4">
                                <div class="border border2 name"><span><%=listrule[i].step %></span></div>
                                <div class="border border2 desc">
                                    <p class="cont"><%=listrule[i].content.Replace("<p>","").Replace("</p>","") %></p>
                                </div>
                                <div class="border2">
                                    <div class="row">
                                        <div class="col-6 border ab">
                                            <div class="r">R: <%=listrule[i].point %> QC </div>
                                        </div>
                                        <div class="col-6 but">
                                            <button type="button" class="btn btn-info btnn bttt btn-block" data-toggle="modal" data-target="#myModal<%=i %>">Check</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <%} %>
                    </div>
                </div>
            </li>
        </ul>
        <br />
        <div class="col-sm-12" style="text-align: center">
            <button type="button" class="btn btn-info btnn" data-toggle="modal" data-target="#myModalz" style="text-decoration: none;">Description Game</button>
        </div>
        <br />

        <div class="col-sm-12" style="text-align: center">
            <a href="<%=task.link %>" style="text-decoration: none;">
                <button type="button" class="btn btn-info btnn">Test IT</button></a>
        </div>
        <br />
    </div>
    <%for (int i = 0; i < listrule.Count; i++)
        {%>
    <div class="container">
        <!-- The Modal -->
        <div class="modal" id="myModal<%=i %>">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title"><%=listrule[i].name%></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <%=listrule[i].description %>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-group" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <%} %>

    <%-- popup 2 --%>

    <div class="container">
        <!-- The Modal -->
        <div class="modal" id="myModalz">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Description</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <%=task.description %>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-group" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
    </div>

</body>


