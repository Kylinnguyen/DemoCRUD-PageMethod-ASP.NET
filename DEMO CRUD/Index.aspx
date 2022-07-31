<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DEMO_CRUD.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
    <form id="form" runat="server">
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

            <div>
                <label class="">ID</label>
                <div class="">
                    <input type="text" id="id" class="id" name="id" value="" />
                </div>
            </div>

            <div>
                <label class="">Fullname</label>
                <div class="">
                    <input type="text" id="fullname" class="fullname" name="fullname" value=""/>
                </div>
            </div>
            <div>
                <label class="">Email</label>
                <div class="">
                    <input type="text" id="email" class="email" name="email" value=""/>
                </div>
            </div>

            <div>
                <label class="">Phone number</label>
                <div class="">
                    <input type="text" id="phone" class="phone" name="phone" value="" />
                </div>
            </div>

            <div>
                <label class="">Faculty</label>
                <div class="">
                    <input type="text" id="faculty" class="faculty" name="faculty" value="" />
                </div>
            </div>
            
            <div class="">
                <div class="">
                    <input type="button" onclick="addStudent();" class="action_button" value="Add"/>
                    <input type="button" onclick="updateStudent();" class="action_button" value="Update"/>
                    <input type="button" onclick="deleteStudent();" class="action_button" value="Delete"/>
                </div>
            </div>

            <div id="message"></div>

            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            </asp:GridView>

        </div>
    </form>
</body>
</html>
