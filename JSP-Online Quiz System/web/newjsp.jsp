<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang='java' import='java.sql.*'>
        <title>ONLINE EXAMINATION</title>
    </head>
    <body>
        <%
            response.setContentType("text/html;charset=UTF-8");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            try {
                String dburl = "jdbc:derby://localhost:1527/IP-lab-6";
                Connection conn = DriverManager.getConnection(dburl, "sonal", "sonal");
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM USERSDETAILS WHERE USERNAME='" + username + "'");
                while(rs.next())
                {
                    String retreivedpassword = rs.getString(1);

                    if(retreivedpassword.equals(password)) {

                        Cookie ck1 = new Cookie("username", username);
                        Cookie ck2 = new Cookie("password", password);
                        response.addCookie(ck1);
                        response.addCookie(ck2);

                        out.println("<html><head><title>ONLINE EXANIMATION</title></head>");
                        out.println("<body style='text-align:center; margin: auto 50px;'>");
                        out.println("<h2>Multiple Choice Questions</h2>");

                        out.println("<form action='newjsp1.jsp'>");

                        out.println("<h3>Who is the first Prime Minister of India?</h3><br>");
                        out.println("<input type='radio' name='ans1' value='jawaharlalnehru'><label>Jawaharlal Nehru</label><br>");
                        out.println("<input type='radio' name='ans1' value='mahatmagandhi'><label>Mahatma Gandhi</label><br>");
                        out.println("<input type='radio' name='ans1' value='subhashchandrabose'><label>Subhash Chandra Bose</label><br><br>");

                        out.println("<h3>Which is the capital of India?</h3><br>");
                        out.println("<input type='radio' name='ans2' value='tamilnadu'><label>Tamil Nadu</label><br>");
                        out.println("<input type='radio' name='ans2' value='newdelhi'><label>New Delhi</label><br>");
                        out.println("<input type='radio' name='ans2' value='maharastra'><label>Maharastra</label><br><br>");

                        out.println("<h3>Pick the odd one out</h3><br>");
                        out.println("<input type='radio' name='ans3' value='lovestory'><label>Love story</label><br>");
                        out.println("<input type='radio' name='ans3' value='blankspace'><label>Blank space</label><br>");
                        out.println("<input type='radio' name='ans3' value='takitaki'><label>Taki Taki</label><br><br><BR>");

                        out.println("<input type='submit' value='SUBMIT'>");

                        out.println("</form>");
                    } else {
                        out.println("<h3>Incorrect Username or Password ! </h3>");
                    }
                    out.println("</body></html>");
                }
            } catch(Exception e) {
                System.out.println(e);
            } finally {
                out.close();
            }
                   
        %>
    </body>
</html>
