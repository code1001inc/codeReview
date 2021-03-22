package lambda.app;

//인터페이스
interface Goods {
	public void getPrice(int a);
}

public class Computer implements Goods{
	// 인터페이스 구현
	@Override
	public void getPrice(int a) {
		// TODO Auto-generated method stub
		System.out.println("컴퓨터의 가격은 " +  a + "달러 입니다.");
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub	
		
		// 오버라이드 메서드 사용
		Computer com = new Computer();
		com.getPrice(10);
		
		System.out.println("-----------------");
		
		// 익명객체 생성
		Goods com2 = new Goods() {
			public void getPrice(int a) {
				System.out.println("가격은 " +  a + "달러 입니다.");
			}
		};
		com2.getPrice(10);
		
		Goods com3 = new Goods() {
			public void getPrice(int a) {
				System.out.println("The Price is " +  a + "$");
			}
		};
		com3.getPrice(10);		
		
		System.out.println("-----------------");
		
		// 람다식 사용
		Goods com4 = (a) -> System.out.println("가격은 " +  a + "달러 입니다.");
		com4.getPrice(10);
		
		Goods com5 = (a) -> System.out.println("The Price is " +  a + "$");
		com5.getPrice(10);		
	}
}
