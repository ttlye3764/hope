package kr.or.ddit.globalexception;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

public class CustomExceptionResolver extends SimpleMappingExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request,
									     HttpServletResponse response, 
									     Object handler, 
									     Exception ex) {
		// �겢�씪�씠�뼵�듃 �꽌踰� ���긽 �슂泥��떆 �꽌踰� �궡 寃쎈웾�솕�맂 �벐�젅�뱶 �깮�꽦(�쓳�떟 �쟾�넚�떆 GC)
		String currentThread = Thread.currentThread().getName();
		
		// �씡�뀎�뀡 諛쒖깮 硫붿꽌�뱶�� �빐�떦 硫붿꽌�뱶瑜� �룷�븿�븯�뒗 �겢�옒�뒪紐� 異붿텧
		HandlerMethod handlerMethod = (HandlerMethod)handler;
		String exceptionOccuredClazz = handlerMethod.getBean().getClass().getName();
		String exceptionOccuredMethod = handlerMethod.getMethod().getName();
		int lineNumber = ex.getStackTrace()[0].getLineNumber();
		String exceptionType = ex.getClass().getName();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY/MM/DD kk:mm:ss");
		System.out.println("�뿉�윭諛쒖깮 : " + currentThread + 
							" | �겢�옒�뒪 : " + exceptionOccuredClazz +
							" | 硫붿꽌�뱶 : " + exceptionOccuredMethod +
							" | �씪�씤 : " + lineNumber +
							" | �씡�뀎�뀡 ���엯 : " + exceptionType +
							" | 諛쒖깮�떆媛� : " + dateFormat.format(new Date()));
		
		
		return super.resolveException(request, response, handler, ex);
	}
	
}
