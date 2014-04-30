package net.eyelock.sakila.filters;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * http://jpgmr.wordpress.com/2013/12/12/cross-origin-resource-sharing-cors-
 * requests-with-spring-mvc/
 * 
 * @author dcollie
 * 
 */
@Component
public class CORSFilter extends OncePerRequestFilter {

    private Properties prop = new Properties();

    @Override
    protected void doFilterInternal(HttpServletRequest request,
	    HttpServletResponse response, FilterChain filterChain)
	    throws ServletException, IOException {
	InputStream in = getClass().getResourceAsStream(
		"/META-INF/app.properties");
	prop.load(in);
	in.close();

	Set<String> allowedOrigins = new HashSet<String>(Arrays.asList(prop
		.getProperty("allowed.origins").split(",")));

	String originHeader = request.getHeader("Origin");

	if (allowedOrigins.contains(request.getHeader("Origin")))
	    response.addHeader("Access-Control-Allow-Origin", originHeader);

	response.addHeader("Access-Control-Allow-Methods",
		"GET, POST, PUT, DELETE");
	response.addHeader("Access-Control-Allow-Headers", "Content-Type");
	response.addHeader("Access-Control-Max-Age", "1800");

	filterChain.doFilter(request, response);
    }
}
