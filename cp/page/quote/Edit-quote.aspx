<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit-quote.aspx.cs" Inherits="cp_page_quote_Edit_quote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <form class="table-responsive">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item"><a href="#">Quotes</a></li>
            <li class="breadcrumb-item active">Edit Quotes</li>
        </ol>
        <div class="col-md-6 form-group">
            <label>Title <span style="color: red">*</span></label>
            <input type="text" id="txttitle" class="form-control" value="<%=quo.title %>" required />
        </div>

        <div class="col-md-12 form-group">
            <label>Content Rule<span style="color: red">*</span></label>
            <textarea id="txtcontentrule" class="form-control tinymce" required><%=quo.content %></textarea>
        </div>

        <div class="form-group">
            <a class="btn btn-danger" href="/cp/page/quote/quote.aspx">Cancel</a>
            <button class="btn btn-info" id="i_submit" onclick="Submit(this,<%=quo.id %>)">Submit</button>
        </div>
    </form>
        <script>
      
        function Submit(input, id) {
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            //ShowLoading();
            var title = $("#txttitle").val();
            var content = tinymce.get("txtcontentrule").getContent();

            if (title == "") {
                alert("Please enter Title");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txttitle").focus();
                return 0;
            }

            if (content == "") {
                alert("Please enter Point");
                $(input).prop("disabled", false);
                $(input).text("Submit");
                document.getElementById("txtcontentrule").focus();
                return 0;
            }


            else {
                $.ajax({
                    url: "/cp/do/quotations/edit-quotations.aspx",
                    method: "post",
                    data: {
                        id: id,
                        title: title,
                        content: content
                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.success == 1) {
                            swal("Edit Success!")
                            location.href = "/cp/page/quote/quote.aspx";

                        } else {
                            //console.log(data.error);
                            swal("Error. Please try again");
                        }
                        $(input).prop("disabled", false);
                        $(input).text("Submit");
                        //HideLoading();
                    },
                    error: function (error) {
                        $(input).prop("disabled", false);
                        console.log(error);
                        swal("Error. Please try again");
                        $(input).text("Submit");
                        //HideLoading();
                    }
                })
            }

        }
    </script>
</asp:Content>

