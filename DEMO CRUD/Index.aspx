<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DEMO_CRUD.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <style>
        .action_button {
            margin-top:10px;
            margin-bottom: 10px;
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
                    <input class="form-control" type="text" id="id" class="id" name="id" value="" />
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Fullname</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" id="fullname" class="fullname" name="fullname" value=""/>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Email</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" id="email" class="email" name="email" value=""/>
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Phone number</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" id="phone" class="phone" name="phone" value="" />
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Faculty</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" id="faculty" class="faculty" name="faculty" value="" />
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
                    CssClass="table table-condensed table-hover" Width="75%">
                </asp:GridView>
            </table>
            

        </div>
    </form>
</body>
</html>
