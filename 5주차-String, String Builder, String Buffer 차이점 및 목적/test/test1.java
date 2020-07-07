package test;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.Executors;
import com.google.gson.*;

public class test1 {	
	private int seq;				//반복회수 조정
	private boolean flag;			//hashCode 출력 여부 (주의 : 각 반복횟수당 출력임)
	private boolean logType;		//로그 출력 방식
	private static int isRun = 0;	//프로그램 종료 플래그
	
	public test1() {			//기본생성자
		this.seq = 10;
		this.flag = true;
		this.logType = false;
	}
	
	/*
	private static void sleep(int time) {
		try {
			Thread.sleep(time);
		} catch (Throwable e) {}
	}
	*/
	
	public static void main(String[] args) {
		test1 test1 = new test1();
		
		Executors.newSingleThreadExecutor().execute(()->{
			test1.test();
		});

		/*
		Executors.newSingleThreadExecutor().execute(new Runnable() {
			@Override
			public void run() {
				test1.generator1();
			}
		});
		Executors.newSingleThreadExecutor().execute(()->{
			test1.generator1();
		});
		Executors.newSingleThreadExecutor().execute(()->{
			test1.generator2();
		});
		Executors.newSingleThreadExecutor().execute(()->{
			test1.generator3();
		});
		*/
		
//		if(isRun == 3) System.exit(0); //프로그램 종료
//		test1.exitProgram();
	}
	
	public void test() {//net.sf.json 에서 gson 으로 변경시 형을 알 수 없는는 Object 처리 테스트
		try {
			Gson gson = new Gson();
			JsonObject json = new JsonObject();
			json = gson.fromJson("{\"HOLDAT\":\"20200301\",\"DATNAM\":\"삼일절\",\"ROWSEQ\":0,\"NUMBER\":1}", JsonObject.class);
			System.out.println(json.toString());
			Iterator<String> keys = json.keySet().iterator();
			
			while(keys.hasNext()) {
				String key = keys.next();
				if(json.get(key).getAsJsonPrimitive().isString()) {
					System.out.println("String" + "\t\t" + json.get(key));
				}else if(json.get(key).getAsJsonPrimitive().isNumber()) {
					System.out.println("Number" + "\t\t" + json.get(key));
				}else if(json.get(key).getAsJsonPrimitive().isBoolean()) {
					System.out.println("Boolean" + "\t\t" + json.get(key));
				}else {
					System.out.println("뭔지모르겠음" + "\t\t" + json.get(key));
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
//			isRun++;
			System.out.println("프로그램 종료");
			System.exit(0);
		}
	}

	
	public void generator1() {
		try {
			StringBuffer log = new StringBuffer();
			if(logType)	log.append("Gernerator1 start - String\n");
			else		System.out.println("Gernerator1 start - String\n");
			String temp = new String();
			Random rnd = new Random();
			
			if(flag) {
				if(logType)	log.append("init String : ").append(temp.hashCode()).append("\n");
				else		System.out.println("init String : " + temp.hashCode());
			}
			long start = System.currentTimeMillis();
			for (int i = 0; i < seq; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:// a-z
			        temp += (char) ((int) (rnd.nextInt(26)) + 97);
			        break;
			    case 1:// A-Z
			        temp += (char) ((int) (rnd.nextInt(26)) + 65);
			        break;
			    case 2:// 0-9
			        temp += (rnd.nextInt(10));
			        break;
			    }
			    /**  Memory에서 가진 해쉬 주소값을 출력  */
			    if(flag) {
			    	if(logType)	log.append("String Hash : ").append(temp.hashCode()).append("\n");
			    	else		System.out.println("String Hash : " + temp.hashCode());
			    }
			}
			long end = System.currentTimeMillis();
			if(logType)	{ log.append("Gernerator1 end - String [").append(end - start).append("]\n"); System.out.println(log.toString()); }
			else		System.out.println("Gernerator1 end - String [" + (end - start) + "]\n");
		}catch (Exception e) {
			e.printStackTrace(System.out);
		}finally {
			isRun++;
		}
	}
	
	public void generator2() {
		try {
			StringBuffer log = new StringBuffer();
			if(logType)	log.append("Gernerator2 start - StringBuffer\n");
			else		System.out.println("Gernerator2 start - StringBuffer\n");
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			
			if(flag) {
				if(logType)	log.append("init StringBuffer : ").append(temp.hashCode()).append("\n");
				else		System.out.println("init StringBuffer : " + temp.hashCode());
			}
			long start = System.currentTimeMillis();
			for (int i = 0; i < seq; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:// a-z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:// A-Z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 2:// 0-9
			        temp.append((rnd.nextInt(10)));
			        break;
			    }
			    /**  Memory에서 가진 해쉬 주소값을 출력  */
			    if(flag) {
			    	if(logType)	log.append("StringBuffer Hash : ").append(temp.hashCode()).append("\n");
			    	else		System.out.println("StringBuffer Hash : " + temp.hashCode());
			    }
			}
			long end = System.currentTimeMillis();
			if(logType)	{ log.append("Gernerator2 end - StringBuffer [").append(end-start).append("]\n"); System.out.println(log.toString()); }
			else		System.out.println("Gernerator2 end - StringBuffer [" + (end - start) + "]\n");
		} catch (Exception e) {
			e.printStackTrace(System.out);
		} finally {
			isRun++;
		}
	}
	
	public void generator3() {
		try {
			StringBuffer log = new StringBuffer();
			if(logType)	log.append("Gernerator3 start - StringBuilder\n");
			else		System.out.println("Gernerator3 start - StringBuilder\n");
			StringBuilder temp = new StringBuilder();
			Random rnd = new Random();
			
			if(flag) {
				if(logType)	log.append("init StringBuilder : ").append(temp.hashCode()).append("\n");
				else		System.out.println("init StringBuilder : " + temp.hashCode());
			}
			long start = System.currentTimeMillis();
			for (int i = 0; i < seq; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:// a-z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:// A-Z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 2:// 0-9
			        temp.append((rnd.nextInt(10)));
			        break;
			    }
			    /**  Memory에서 가진 해쉬 주소값을 출력  */
			    if(flag) {
			    	if(logType)	log.append("StringBuilder Hash : ").append(temp.hashCode()).append("\n");
			    	else		System.out.println("StringBuilder Hash : " + temp.hashCode());
			    }
			}
			long end = System.currentTimeMillis();
			if(logType)	{ log.append("Gernerator3 end - StringBuilder [").append(end-start).append("]\n"); System.out.println(log.toString()); }
			else		System.out.println("Gernerator3 end - StringBuilder [" + (end - start) + "]\n");
		} catch (Exception e) {
			e.printStackTrace(System.out);
		} finally {
			isRun++;
		}
	}
	
	public void exitProgram() {
		while(true) {
			try { Thread.sleep(100); } catch (InterruptedException e) { e.printStackTrace(); }
			if(isRun == 3) {
				System.out.println("프로그램 종료");
				System.exit(0);
			}
		}
	}
}
