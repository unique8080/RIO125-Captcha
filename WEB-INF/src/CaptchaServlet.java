import nl.captcha.Captcha;
import nl.captcha.text.producer.DefaultTextProducer;
import nl.captcha.servlet.CaptchaServletUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/captcha")
public class CaptchaServlet extends HttpServlet {
    private static final int WIDTH = 200;
    private static final int HEIGHT = 50;
    private static final String CAPTCHA_SESSION_KEY = "captcha";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Captcha captcha = new Captcha.Builder(WIDTH, HEIGHT)
                .addText(new DefaultTextProducer(8, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".toCharArray()))
                .addBackground()
                .addNoise()
                .build();

        // Store the CAPTCHA text in the session
        request.getSession().setAttribute(CAPTCHA_SESSION_KEY, captcha.getAnswer());

        // Write the CAPTCHA image to the response
        CaptchaServletUtil.writeImage(response, captcha.getImage());
    }
}
