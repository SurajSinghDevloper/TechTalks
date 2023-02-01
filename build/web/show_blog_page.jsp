<%-- 
    Document   : show_blog_page
    Created on : 24-Aug-2022, 8:13:18 pm
    Author     : suraj
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page  errorPage="error_page.jsp" %>
<%
User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>
<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postId);
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- BootStrap Link -->
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">

        <!-- Css Part -->
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css" />
        <style>
            .banner-background {
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 82%, 70% 100%, 25% 87%, 0 100%, 0 0);
            }
            .post-title{
                    font-weight: 100;
                    font-size: 30px;
            }
            .post-content{
                    font-weight: 100px;
                    font-size: 20px;
                    color: blue;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-weight: 100px;
                font-size: 20px;
                 
            }
            body{
                background: url(img/pexels-uzunov-rostisla.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
        <title><%=p.getpTitle()%></title>
    </head>
    <body>


        <!--nav bar begin-->
        <nav class="navbar navbar-expand-lg navbar-light  primary-background">
            <a class="navbar-brand text-white" href="index.jsp"><span
                    class="fa fa-asterisk"></span>Tech Tactic</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active"><a class="nav-link text-white"
                                                   href="profile.jsp"><span class="fa fa-television"></span>Learn Codings! <span
                                class="sr-only">(current)</span> </a></li>

                    <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle text-white" href="#"
                            id="navbarDropdown" role="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false"><samp
                                class="fa fa-sitemap"></samp> Categories </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item " href="#">Programing
                                Language</a> <a class="dropdown-item " href="#">Project
                                Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item " href="#">Data Structure</a>
                        </div></li>
                    <li class="nav-item"><a class="nav-link text-white" href="#"><span
                                class="	fa fa-users"></span>Contacts</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="#" data-toggle="modal" data-target="#add-post-modal"><span
                                class="	fa fa-credit-card">&nbsp;</span>Post</a></li>


                </ul>

                <ul class="navbar-nav mr-right">

                    <li class="nav-item"><a class="nav-link text-white" href="#!" data-toggle="modal" data-target="#profileModal"><span
                                class="	fa fa-user-circle"></span>&nbsp;<%=user.getName()%></a></li>

                    <li class="nav-item"><a class="nav-link text-white" href="LogoutServlet"><span
                                class="	fa fa-mail-reply-all"></span>Log-Out</a></li>

                </ul>
            </div>
        </nav>

        <!--nav bar end-->

        <!--Main content of the Body begin-->


        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-background text-white text-center">

                            <h4 class="post-title"><%=p.getpTitle()%></h4>

                        </div>
                        <div class="card-body">
                            <img class="card-img-top" src="blog_pic/<%=p.getpPic()%>" alt="Card image cap">
                            <div class="row my-2">
                                <div class="col-md-8">
                                     
                                        <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%>
                                    
                                    <p class="post-user-info"><a href="#!"> <%= ud.getUserByUserId(p.getUserId()).getName()%> </a>has posted</p>
                                </div>
                                <div class="col-md-4">
                                    <p class="post-date"><%=p.getpDate().toLocaleString()%></p>
                                </div>
                            </div>
                            <p class="post-content"><%=p.getpContent()%></p>
                            <br>
                            <br>
                            <div class="post-code">
                                <pre><%=p.getpCode()%></pre>
                            </div>
                        </div>
                        <div class="card-fotter text-center bg-primary" style="height: 40px">
                            <div class="conatiner mt-1">
                                 <%
                                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                                %>
                                <a href="#!" onclick="doLike(<%=p.getPid()%>,<%=p.getUserId()%>)" class="btn btn-outline-light btn-sm"><span class="fa fa-thumbs-o-up"> <%=ld.countLikeOnPost(p.getPid())%> </span></a>
                                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>21</span></a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!--Main content of the Body end-->


        <!--profile modal begin-->
        <!-- Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px"/>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
                            <!--Details of user-->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID: </th>
                                            <td><%=user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email: </th>
                                            <td><%=user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender: </th>
                                            <td><%=user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">About: </th>
                                            <td><%=user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Register On: </th>
                                            <td><%=user.getDatetime()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile editable program-->
                            <div id="profile-edit" style="display: none">
                                <h5 class="mt-2">Please Edit Carefully</h5>
                                <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <th scope="row">ID: </th>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email: </th>
                                            <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"/></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Name: </th>
                                            <td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>"/></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Password: </th>
                                            <td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"/></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender: </th>
                                            <td><%=user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">About: </th>
                                            <td><input type="text" class="form-control" name="user_about" value="<%=user.getAbout()%>"/></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">New pic: </th>
                                            <td><input type="file" class="form-control" name="user_image"/></td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn-outline-success" style="width: 90px">Save</button>
                                    </div>
                                </form>

                            </div>



                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit !</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end of profile modal-->

        <!--begin of post modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide The Post detail.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <!--post Body Modal-->

                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="POST">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control"  placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control"  placeholder="Enter your program (if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic..</label>
                                <br>
                                <input type="file" name="pic"  >
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post </button>
                            </div>

                        </form>
                    </div>


                </div>
            </div>
        </div>


        <!--end of post modal-->

        <!-- Here is the JavaScript Url -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" 
                integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" 
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
            $(document).ready(function ()
            {
                let editStatus = false;
                $('#edit-profile-button').click(function () {
                    if (editStatus == false)
                    {
                        $('#profile-details').hide();
                        $('#profile-edit').show();
                        editStatus = true;
                        $(this).text("Back");

                    } else
                    {
                        $('#profile-details').show();
                        $('#profile-edit').hide();
                        editStatus = false;
                        $(this).text("Edit!");
                    }
                });
            });

        </script>




        <!--now add post js-->

        <script>

            $(document).ready(function (e) {
                //
                $('#add-post-form').on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..");
                    let form = new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "Saved Successfuly", "success");
                            } else {
                                swal("Opps...!", "Something went wrong", "error");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            console.log(jqXHR);
                            swal("Opps...!", "Something went wrong", "error");

                        },
                        processData: false,
                        contentType: false
                    });
                });
            });


        </script>
        <!--loading post using ajax-->
        <script>
            function getPosts(catId, temp) {
                $('#loader').show();
                $('#post-container').hide();
                $('.c-link').removeClass('active');
                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $('#loader').hide();
                        $('#post-container').show();
                        $('#post-container').html(data);
                        $(temp).addClass('active');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    }
                });
            }
            $(document).ready(function (e) {
                let allPostref = $('.c-link')[0];
                getPosts(0, allPostref);
            });
        </script>




    </body>
</html>
