<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DEMO_CRUD.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/JQuery-3.6.0.min.js" type="text/javascript"></script> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .action_button {
            margin-top:5px;
            margin-bottom: 5px;
        }
        #message{
            color: forestgreen;
        }
    </style>
</head>
<body style="height: 366px">
    <h2 class="text-center mt-3 mb-3">Manage Students</h2>
    <form id="form" runat="server" class="" style="margin-left: 220px; ">
        <asp:ScriptManager runat="server" id="sm1" EnablePageMethods="true"></asp:ScriptManager>
        <div>
            <script type="text/javascript">
                function addStudent() {
                    var id = $('.id').val();
                    var fullname = $('.fullname').val();
                    var email = $('.email').val();
                    var phone = $('.phone').val();
                    var faculty = $('.faculty').val();
                    var msg = "Add student successfully";
                    PageMethods.AddStudent(id, fullname, email, phone, faculty, success(msg), fail);                   
                }
                function updateStudent() {
                    var id = $('.id').val();
                    var fullname = $('.fullname').val();
                    var email = $('.email').val();
                    var phone = $('.phone').val();
                    var faculty = $('.faculty').val();
                    var msg = "Update student successfully";
                    PageMethods.UpdateStudent(id, fullname, email, phone, faculty, success(msg), fail);
                }
                function deleteStudent() {
                    var id = $('.id').val();
                    var msg = "Delete student successfully";
                    PageMethods.DeleteStudent(id, success(msg), fail);
                }
                function success(msg) {
                    $('#message').html(msg).fadeOut(3000);
                    $(".id").val('');
                    $('.fullname').val('');
                    $('.email').val('');
                    $('.phone').val('');
                    $('.faculty').val('');
                } 
                function fail(msg) {
                    alert(msg.get_message());
                } 
            </script>

            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">ID</label>
                <div class="col-sm-6">
                    <input class="form-control id" type="text" id="id" name="id" value="" />
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Fullname</label>
                <div class="col-sm-6">
                    <input class="form-control fullname" type="text" id="fullname" name="fullname" value=""/>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Email</label>
                <div class="col-sm-6">
                    <input class="form-control email" type="text" id="email"name="email" value=""/>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Phone number</label>
                <div class="col-sm-6">
                    <input class="form-control phone" type="text" id="phone" name="phone" value="" />
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Faculty</label>
                <div class="col-sm-6">
                    <input class="form-control faculty" type="text" id="faculty" name="faculty" value="" />
                </div>
            </div>
            
            <div class="row mb-3">
                <div class="offset-sm-3 col-sm-2 d-grid">
                    <input type="button" onclick="addStudent();" class="btn btn-success action_button" value="Add" />
                </div>

                <div class="col-sm-2 d-grid">
                    <input type="button" onclick="updateStudent();" class="btn btn-primary action_button" value="Update" />
                </div>

                <div class="col-sm-2 d-grid">
                    <input type="button" onclick="deleteStudent();" class="btn btn-danger action_button" value="Delete" />
                </div>
            </div>

            <div id="message"></div>

            <table class="">
                <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                    CssClass="table table-condensed table-hover" Width="75%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                    <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>

                    <RowStyle ForeColor="#000066"></RowStyle>

                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </table>
            

        </div>
    </form>
</body>
</html>
