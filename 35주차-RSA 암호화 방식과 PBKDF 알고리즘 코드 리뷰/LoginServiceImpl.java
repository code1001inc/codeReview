package com.KDTR.service;

import java.security.PrivateKey;
import java.util.HashMap;

import javax.crypto.Cipher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KDTR.common.PBKDF;
import com.KDTR.dao.LoginDao;
import com.KDTR.login.domain.ZOPR01_VO;

@Service("LoginService")
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDao LoginDao;
	
	@Override
	public HashMap<String, Object> doDecrypt(PrivateKey privateKey, String securedUSERID, String securedPASSWD) {
		String userid = "", password = "";
		HashMap<String, Object> result_map = new HashMap<String, Object>();
		String msg = "로그인에 성공하였습니다.";
    	boolean proc_status = false;
    	
    	if (privateKey == null) {
        	System.out.println("암호화 비밀키 정보를 찾을 수 없습니다.");
        	//AOP를 통해 키 재발급이 들어감.
    		result_map.put("msg","로그인 인증이 만료되었습니다.<br>다시 로그인 바랍니다.");
    		return result_map;
        }
    	
    	try {
        	//복호화 프로세스
            userid = decryptRsa(privateKey, securedUSERID).toUpperCase();
            password = decryptRsa(privateKey, securedPASSWD);
            //복호화 한 ID 체크
    	    ZOPR01_VO ZOPR01_bean = LoginDao.getLoginInfo(userid);
            //ID가 체크되면 비밀번호 검사
        	if(ZOPR01_bean == null) {
        		msg = "존재하지 않는 사용자 계정입니다.";
        	}else {
    			/* PBKDF 암호화 알고리즘 */
   	       		 /**
   	   	 	     * @param   alg     HMAC algorithm to use.
   	   	 	     * @param   P       Password.
   	   	 	     * @param   S       Salt.
   	   	 	     * @param   c       Iteration count.
   	   	 	     * @param   dkLen   Intended length, in octets, of the derived key.
   	   	 	     */
   	   	 		String alg ="HmacSHA256";
   	   	 		byte[] byte_Pass = password.getBytes("UTF-8");
   	   	 		byte[] byte_Id = userid.getBytes("UTF-8");
   	   	 		
   	   	 		/* PBKDF2.v1 */
   	   	 		int c = 10000;
   	   	 		int dkLen = 60;
   	   	 		byte[] r1 = PBKDF.pbkdf2(alg, byte_Pass, byte_Id, c, dkLen);
   	   	 		//암호화 알고리즘을 돌린 password와 db값이 같으면 통과
   	   	 		if(!ZOPR01_bean.getPASSWD().equals(makeMD5(new String(r1, "UTF-8")))) {
   	   	 			//암호 불일치
   	   	 			msg = "비밀번호가 틀렸습니다.";
   	   	 		}else {
   	   	 			//암호 일치, 로그인 성공
   	   	 			proc_status = true;
   	   	 			result_map.put("user_bean",ZOPR01_bean);
   	   	 		}
        	}
        } catch (Exception e) {
        	System.out.println(e.getMessage());
			msg = "사용자 인증 중 오류가 발생하였습니다.";
        }
    	result_map.put("proc_status",proc_status);
    	result_map.put("msg",msg);
    	return result_map; 
	}
	
	
	
	/* 로그인용 모듈 */
    //복호화 메소드
    private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
    }

    /**
     * 16진 문자열을 byte 배열로 변환한다.
     */
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) {
            return new byte[]{};
        }

        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }
    
    // md5 생성
    public String makeMD5(String param) {
		StringBuffer md5 = new StringBuffer();
		try {
			byte[] digest = java.security.MessageDigest.getInstance("MD5")
					.digest(param.getBytes());
			for (int i = 0; i < digest.length; i++) {
				md5.append(Integer.toString((digest[i] & 0xf0) >> 4, 16));
				md5.append(Integer.toString(digest[i] & 0x0f, 16));
			}
		} catch (java.security.NoSuchAlgorithmException ne) {
			ne.printStackTrace();
		}
		return md5.toString().toUpperCase();
	}
}
