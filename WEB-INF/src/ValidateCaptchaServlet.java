import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/validate")
public class ValidateCaptchaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String captcha = request.getParameter("captcha");
        String captchaAnswer = (String) request.getSession().getAttribute("captcha");

        if (captcha != null && captcha.equals(captchaAnswer)) {
            response.sendRedirect("Success.html");
        } else {
            response.sendRedirect("Failed.html");
        }
    }
}
