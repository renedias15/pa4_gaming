<%-- 
    Document   : AjaxPage
    Created on : Jul 25, 2020, 8:29:38 PM
    Author     : rene
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import ="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajax request Page</title>
    </head>
    <body>
        <div class="container-fluid">
            <%
                String email = request.getParameter("email");
                String opinion = request.getParameter("opinion");
            %>
            <div class="panel-primary">
                <div class="panel-heading">
                    <h4 class="panel-title">COMMENTS</h4>
                </div>
                <div class="panel-body">
                    <%
                        String message = "";
                        try {
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:oracle", "system", "root");
                            PreparedStatement ps = con.prepareStatement("INSERT INTO FEEDBACK(email,opinion) VALUES(?,?);");
                            ps.setString(1, email);
                            ps.setString(2, opinion);
                            ps.executeUpdate();
                    %>
                    <strong>
                        USERNAME : <%=email%><br>
                        FEEDBACK :<%=opinion%>
                    </strong>
                    <%con.close();
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %>
                </div>
            </div>
        </div>


    </body>
</html>
