import java.io.IOException;
import java.security.InvalidKeyException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.crypto.BadPaddingException;

import org.apache.ibatis.binding.BindingException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.fasterxml.jackson.databind.exc.InvalidFormatException;

/* 전역 예외처리 컨트롤러 어드바이스 */
@RestControllerAdvice
public class GlobalExceptionHandler extends ResponseEntityExceptionHandler{
	/* Service의 메소드 단의 예외 메시지는 ExceptionAspect에서 처리하고
	 * 이후 넘어온 예외는 컨트롤러에서 직접적인 공용 예외처리 수행.
	 * ResponseEntityExceptionHandler를 상속받아서 공통 예외처리
	 * 포함되지 않는 예외는 아래에서 따로 처리
	 * */
	 
	 //상속받아 처리되는 예외를 처리할 handleExceptionInternal을 오버라이딩하여 알맞게 재정의.
	@Override
	protected ResponseEntity<Object> handleExceptionInternal(Exception ex, Object body, HttpHeaders headers,
			HttpStatus status, WebRequest request) {
		//body를 사용하여 처리할 일이 있을 경우 추후 코드 변경.
		HashMap<String, Object> result_map = new HashMap<String, Object>();	
		result_map.put("msg","관리자에게 문의하세요.<br>[Error Type : (1) "+ex.getClass().getSimpleName()+"]");
		return new ResponseEntity<>(result_map, headers, status);
	}
	
	//SQLException 예외 처리
	@ExceptionHandler({SQLException.class})
	public ResponseEntity<HashMap<String, Object>> errorHandler_SQLException(Exception e) {
		HashMap<String, Object> result_map = new HashMap<String, Object>();
		result_map.put("msg","관리자에게 문의하세요.<br>[Error Type : (2) "+e.getClass().getSimpleName()+"]");
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result_map);
	}
	
	//MyBatis BindingException 예외 처리
	@ExceptionHandler({BindingException.class})
	public ResponseEntity<HashMap<String, Object>> errorHandler_BindingException(Exception e) {
		HashMap<String, Object> result_map = new HashMap<String, Object>();
		result_map.put("msg","관리자에게 문의하세요.<br>[Error Type : (3) "+e.getClass().getSimpleName()+"]");
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result_map);
	}
	
	//IOException 예외 처리
	@ExceptionHandler({IOException.class})
	public ResponseEntity<HashMap<String, Object>> errorHandler_IOException(Exception e) {
		HashMap<String, Object> result_map = new HashMap<String, Object>();
		result_map.put("msg","관리자에게 문의하세요.<br>[Error Type : (4) "+e.getClass().getSimpleName()+"]");
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result_map);
	}
	
	//InvalidFormatException 예외 처리
	@ExceptionHandler({InvalidFormatException.class})
	public ResponseEntity<HashMap<String, Object>> errorHandler_InvalidFormatException(Exception e) {
		HashMap<String, Object> result_map = new HashMap<String, Object>();
		result_map.put("msg","유효하지 않는 값을 입력하셨습니다.<br>[Error Type : "+e.getClass().getSimpleName()+"]");
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result_map);
	}
	
	//IllegalArgumentException 예외 처리
	@ExceptionHandler({IllegalArgumentException.class})
	public ResponseEntity<HashMap<String, Object>> errorHandler_IllegalArgumentException(Exception e) {
		HashMap<String, Object> result_map = new HashMap<String, Object>();
		result_map.put("msg","부적절한 요청이 들어왔습니다.<br>[Error Type : "+e.getClass().getSimpleName()+"]");
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(result_map);
	}
	
	//암호,복호화 단계에서 일어나는 InvalidKeyException, BadPaddingException 예외 처리
	@ExceptionHandler({InvalidKeyException.class, BadPaddingException.class})
	public ResponseEntity<HashMap<String, Object>> errorHandler_Ecrypt(Exception e) {
		HashMap<String, Object> result_map = new HashMap<String, Object>();
		result_map.put("msg","암호화 검증중 문제가 생겼습니다.<br>다시 시도 바랍니다.");
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result_map);
	}
	
}

/* ResponseEntityExceptionHandler에서 포함하는 예외 정리
 * 
 * HttpRequestMethodNotSupportedException	/	요청 경로는 있으나 지원하지 않는 Method인 경우 발생					/	405 - Method Not Allowed
 * HttpMediaTypeNotSupportedException		/	요청의 Content Type을 핸들러가 지원하지 않는 경우 발생				/	415 - Unsupported Media Type
 * HttpMediaTypeNotAcceptableException		/	핸들러가 Client가 요청한 Type으로 응답을 내려줄 수 없는 경우 발생	/	406 - Not Acceptable
 * MissingPathVariableException				/	핸들러가 URL에서 기대한 Path Variable을 찾지 못한 경우 발생			/	500 - Internal Server Error
 * MissingServletRequestParameterException	/	핸들러가 기대한 요청 Parameter를 찾지 못한 경우 발생				/	400 - Bad Request
 * ServletRequestBindingException			/	복구 불가능한 치명적인 간주할 binding exception Filter 등의 
 												Servlet Resource에서 던지기 쉽도록 ServletException을 상속하고 있음	/	400 - Bad Request
 * ConversionNotSupportedException			/	bean property로 요청 내용을 변경하기 위한 editor 혹은 
												converter를 찾지 못한 경우 발생										/	500 - Internal Server Error
 * TypeMismatchException					/	bean property로 값을 변경할 때, 핸들러가 예상한 class로 
												변경할 수 없는 경우 발생											/	400 - Bad Request
 * HttpMessageNotReadableException			/	HttpMessageConverter에서 발생하며 read 메서드가 실패한 경우 발생	/	400 - Bad Request
 * HttpMessageNotWritableException			/	HttpMessageConverter에서 발생하며 write 메서드가 실패한 경우 발생	/	500 - Internal Server Error
 * MethodArgumentNotValidException			/	@Valid가 붙은 파라미터에 대해 검증 실패시 발생						/	400 - Bad Request
 * MissingServletRequestPartException		/	multipart/form-data 요청 일부가 손실(can’t be found)되었을 때 발생	/	400 - Bad Request
 * NoHandlerFoundException					/	Dispatcher Servlet에서 핸들러를 찾지 못한 경우
												기본적으로 404 응답을 내리지만 Dispatcher Servlet의 
												throwExceptionIfNoHandlerFound 값이 true인 경우 해당 예외를 발생	/	404 - Not Found
 * AsyncRequestTimeoutException				/	비동기 요청의 응답시간이 초과될 때 발생								/	503 - Service Unavailable 
 * 
 * */
