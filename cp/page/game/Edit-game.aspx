<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit-game.aspx.cs" Inherits="cp_page_game_Edit_game" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
        .fileUpload {
            position: relative;
            width: fit-content;
        }

            .fileUpload .upload {
                position: absolute;
                top: 0;
                left: 0;
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                cursor: pointer;
                opacity: 0;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="#">Game</a></li>
        <li class="breadcrumb-item active">Edit Game</li>
    </ol>
      <div class="col-md-6 form-group">
        <label>Name</label>
        <input type="text" id="txtname" class="form-control" value="<%=game.name %>" />
    </div>
    
    <div class="col-md-6 form-group">
        <label>Banner</label>
        <img src="<%=game.banner %>" id="preview" width="100%" />
        <div class="fileUpload btn btn-info btn-upload">
            <span>+ Edit Image</span>
            <input type="file" onchange="Preview(event,this)" accept="image/*" class="upload" />
        </div>
    </div>
     <div class="col-md-6 form-group">
        <label>Link</label>
        <input type="text" id="txtlink" class="form-control" value="<%=game.link %>" />
    </div>
     <div class="col-md-12 form-group">
        <label>Description</label>
         <textarea class="form-control tinymce" id="txtdesc"><%=game.description %></textarea>
    </div>
     <div class="col-md-12 form-group">
        <label>Content</label>
         <textarea class="form-control tinymce" id="txtcont"><%=game.content %></textarea>
    </div>
    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/game/game.aspx">Cancel</a>
        <button class="btn btn-info" onclick="Submit(this,<%=game.id %>)">Submit</button>
    </div>
    <script>
        var base64 = "";
        function Preview(event) {
            var input = event.target;
            if (input.files) {
                var reader = new FileReader();
                reader.fileName = input.files[0].name;
                reader.onload = function (e) {
                    base64 = e.target.result.replace(/^data:image\/[a-z]+;base64,/, "");
                    $("#preview").attr("src", e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        };
        function Submit(input, id) {
             $(input).prop("disabled", true);
            $(input).text("Submitting");
            var name = $("#txtname").val();
            var desc = tinymce.get("txtdesc").getContent();
            var cont = tinymce.get("txtcont").getContent();
            var link = $("#txtlink").val();
            $.ajax({
                url: "/cp/do/game/edit-game.aspx",
                method: "post",
                data: {
                    id:id,
                     base64: base64,
                    name: name,
                    desc: desc,
                    cont: cont,
                    link:link
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        //console.log(data.error);
                        alertify.error("Error. Please try again");
                    } else {
                        swal("Edit Success!");
                        location.href = "/cp/page/game/game.aspx";
                    }
                    $(input).prop("disabled", false);
                    $(input).text("Submit");
                    //HideLoading();
                },
                error: function (error) {
                    $(input).prop("disabled", false);
                    $(input).text("Submit");
                    console.log(error);
                    alertify.error("Error. Please try again");
                    //HideLoading();
                }
            })
        }
    </script>
</asp:Content>

