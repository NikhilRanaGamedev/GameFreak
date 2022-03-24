<%-- 
    Document   : send_otp
    Created on : Dec 31, 2018, 6:47:12 PM
    Author     : NightPredetor
--%>

<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.lang.String"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    int length = 4;
    String s_otp = "";
    String email = "";
    
    char[] OTP(int len) 
    {  
        // Using numeric values 
        String numbers = "0123456789"; 
  
        // Using random method 
        Random rndm_method = new Random(); 
  
        char[] otp = new char[len]; 
  
        for (int i = 0; i < len; i++) 
        { 
            // Use of charAt() method : to get character value 
            // Use of nextInt() as it is scanning the value as int 
            otp[i] = 
             numbers.charAt(rndm_method.nextInt(numbers.length())); 
        } 
        s_otp = String.valueOf(otp);
        return otp; 
    }

    String callURL(String myURL) {
        System.out.println("Requested URL:" + myURL);
        StringBuilder sb = new StringBuilder();
        URLConnection urlConn = null;
        InputStreamReader in = null;
        try {
            URL url = new URL(myURL);
            urlConn = url.openConnection();
            if (urlConn != null)
                    urlConn.setReadTimeout(60 * 1000);
            if (urlConn != null && urlConn.getInputStream() != null) {
                in = new InputStreamReader(urlConn.getInputStream(),
                Charset.defaultCharset());
                BufferedReader bufferedReader = new BufferedReader(in);
                if (bufferedReader != null) {
                    int cp;
                    while ((cp = bufferedReader.read()) != -1) {
                        sb.append((char) cp);
                    }
                bufferedReader.close();
                }
            }
            in.close();
        } catch (Exception e) {
            throw new RuntimeException("Exception while calling URL:"+ myURL, e);
        } 

        return sb.toString();
        }
%>
<%
    String user_id = (String)session.getAttribute("user_id");
    String address_id = request.getParameter("address");
    session.setAttribute("address_checkout", address_id);
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");
    
    PreparedStatement sql = con.prepareStatement("SELECT * FROM `user_info` WHERE `user_id` = ?");

    sql.setString(1, user_id);

    ResultSet rs = sql.executeQuery();
    if(rs.next()) {
        email = rs.getString("email");
    }
    
    String from = "GameFreak";
    String subject = URLEncoder.encode("OTP", "UTF-8");
    String message = URLEncoder.encode("Your GameFreak OTP is: ", "UTF-8");
    
    out.println(OTP(length));
    out.println(s_otp);
    
    session.setAttribute("otp", s_otp);
    
    String otp_url = "http://dmail.isolpro.in/mail?from="+from+"&to="+email+"&sub="+subject+"&mess="+message+s_otp;
    
    out.println(otp_url);
    callURL(otp_url);
    response.sendRedirect("otp.jsp");
%>
