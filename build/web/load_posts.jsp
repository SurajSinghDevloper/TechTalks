<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<style>
    body    {
        background: url(img/pexels-dids.jpg);
        background-size: cover;
        background-attachment: fixed;
    }
</style>

<div class="conatiner row  ">
    <%
        Thread.sleep(200); 
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        int cid=Integer.parseInt(request.getParameter("cid"));
        List<Post> post=null;
        if(cid==0){
        post=d.getAllPost();
        }else{
            post=d.getPostByCatId(cid);
        }
        if(post.size()==0){
            out.println("<h4 class='display-3 text-center'>Opps! Currently No posts avilable yet</h4>");
            return;
        }
    
        for(Post p: post)
        {

    %>
    
        <div class="col-md-6 mt-2">
            
            <div class="card">
                <img class="card-img-top" src="blog_pic/<%=p.getpPic()%>" alt="Card image cap">
                <div class="card-body">
                    <b><%=p.getpTitle()%></b>
                    <p><%=p.getpContent()%></p>
                </div>
                <div class="card-fotter text-center bg-primary" style="height: 40px">
                    <div class="conatiner mt-1">
                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>11</span></a>

                        <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read More!</a>

                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>21</span></a>

                    </div>
                </div>
            </div>
        </div>    

        <%
        }
        %>
    
</div>