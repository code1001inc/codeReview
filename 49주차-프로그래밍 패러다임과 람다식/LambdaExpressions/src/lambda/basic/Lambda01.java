package lambda.basic;

@FunctionalInterface //함수형 인터페이스 체크 어노테이션
interface getPrintRansdomService {
	public void getPrint();	
}

public class Lambda01 {
	static void getPrintRandomNum1() {
		System.out.println("랜덤 값(0~9, 기본) : " + (int)(Math.random()*10));
	}
	static void getPrintRandomNum2() {
		System.out.println("랜덤 값(0~99, 기본): " + (int)(Math.random()*100));
	}
	static void getPrintRandomNum3() {
		System.out.println("랜덤 값(0~999, 기본): " + (int)(Math.random()*1000));
	}	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 랜덤값 출력(기본)
		getPrintRandomNum1();		
		getPrintRandomNum2();
		getPrintRandomNum3();

		// 랜덤값 출력(람다)
//		getPrintRansdomService getPrintRandomService1 = () -> { System.out.println("랜덤 값(람다) : " + (int)(Math.random()*10)); };
		getPrintRansdomService getPrintRandomService1 = () -> { System.out.println("랜덤 값(0~9, 람다) : " + (int)(Math.random()* 10));  };		
		getPrintRansdomService getPrintRandomService2 = () -> { System.out.println("랜덤 값(0~99, 람다) : " + (int)(Math.random()*100)); };
		getPrintRansdomService getPrintRandomService3 = () -> { System.out.println("랜덤 값(0~999, 람다) : " + (int)(Math.random()*100)); };
		getPrintRandomService1.getPrint();
		getPrintRandomService2.getPrint();
		getPrintRandomService3.getPrint();
	}
}
