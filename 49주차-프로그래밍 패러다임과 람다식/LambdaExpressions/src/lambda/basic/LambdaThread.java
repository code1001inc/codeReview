package lambda.basic;

public class LambdaThread {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Thread(new Runnable() {
			public void run() {
				System.out.println("전통적인 방식의 일회용 스레드 생성");
			}
		}).start();
		
		new Thread(()->{
			System.out.println("람다 표현식을 사용한 일회용 스레드 생성");
		}).start();
	}
}
