<%@ Page Language="C#" AutoEventWireup="true" CodeFile="page1.aspx.cs" Inherits="page_page1" %>

<style>
    html, body {
        padding: 0px;
        margin: 0px;
    }

    #servicelist {
        margin: 20px;
    }

    .category-item {
        font-weight: bold;
        color: blue;
    }

    .service-item {
    }

    body.modal-open {
        overflow: hidden;
        position: fixed;
    }
      .border{
            text-align: center;
            border: 1px solid;
            margin-bottom: 15px;
            padding:15px;
        }
          body {
            font-size: 15px !important;
        }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Dokdo|Open+Sans" rel="stylesheet">
<%--<link rel="stylesheet" type="text/css" media="screen" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />--%>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<%--<script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>--%>

<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>

<!--<link href="../lib/dt/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />-->
<link href="https://divaspaapp.roofcode.com/page/css/index.css" rel="stylesheet" />
<link href="https://divaspaapp.roofcode.com/page/css/ios.css" rel="stylesheet" />
<!--<script src="../lib/dt/js/bootstrap-datetimepicker.min.js"></script>-->

<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css" rel="stylesheet">



<script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>

<script src="lib/owl2/owl.carousel.js"></script>

<link href="lib/font-awesome/css/fontawesome-all.css" rel="stylesheet" />
<link rel="stylesheet" href="lib/owl2/assets/owl.carousel.min.css">
<link rel="stylesheet" href="lib/owl2/assets/owl.theme.default.min.css">
<script src="lib/bootstrap/popper.min.js"></script>

<script src="lib/swal2/sweetalert2.all.js"></script>
<link href="lib/swal2/sweetalert2.min.css" rel="stylesheet" />
<link href="../vendor/bootstrap/bootstrap.min.css" rel="stylesheet" />
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0">
<%= page.description %>
