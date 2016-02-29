import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserFilter implements Filter
{
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain)throws IOException, ServletException
    {
        HttpServletResponse res= (HttpServletResponse) response;
        HttpServletRequest  req= (HttpServletRequest ) request ;
        HttpSession session = req.getSession();
        String s= (String) session.getAttribute("eid");
        String s2= (String) session.getAttribute("rid");
        if(s==null && s2==null)
            res.sendRedirect("index.html");
        else
            chain.doFilter(request, response);
    }

    @Override
    public void destroy()
    {
    }

    @Override
    public void init(FilterConfig filterConfig)
    {
    }
}
