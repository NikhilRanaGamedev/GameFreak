package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class newjsp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");

    // Read previous comments from session
    String comments = (String)session.getAttribute("comments");
    if(null == comments){
      comments = "";
    }
 
   // If this is a form submission, add the new comment
   // to the existing ones
   String comment  = request.getParameter("comment");
   if(null != comment){
     comments = comments + comment + "<br />";
     session.setAttribute("comments", comments);
     response.sendRedirect(request.getContextPath() + "/prg.jsp");
    return;
   }
 
      out.write("\n");
      out.write(" <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n");
      out.write(" <html>\n");
      out.write("   <head>\n");
      out.write("     <title>Simple Post Redirect Get Pattern</title>\n");
      out.write("     <meta http-equiv=\"Expires\"       content=\"Sat, 01 Dec 2001 00:00:00 GMT\" />\n");
      out.write("     <meta http-equiv=\"pragma\"        content=\"no-cache\" />\n");
      out.write("     <meta http-equiv=\"Cache-Control\" content=\"no-cache\" />\n");
      out.write("   </head>\n");
      out.write("  <body>\n");
      out.write("    <fieldset>\n");
      out.write("       <legend>Previous Comments</legend>\n");
      out.write("       ");
      out.print(comments);
      out.write("\n");
      out.write("     </fieldset>\n");
      out.write("     <form method=\"post\" action=\"");
      out.print(request.getContextPath());
      out.write("/prg.jsp\">\n");
      out.write("       <fieldset>\n");
      out.write("         <legend>Add a new comment</legend>\n");
      out.write("         <input type=\"text\" name=\"comment\" id=\"comment\" />\n");
      out.write("         <input type=\"submit\" name=\"enter_button\" id=\"Enter\" />\n");
      out.write("       </fieldset>\n");
      out.write("     </form>\n");
      out.write("   </body>\n");
      out.write(" </html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
