package lambda.app;

/**
 * 두 숫자를 다룰 수 있는 계산기가 있다.
 * 두 숫자를 받아 더하기, 빼기, 곱하기, 나누기, 나머지값을 구할 수 있는 프로그램을 구현하라
 */

interface Calculater{
	public int add(int num1, int num2);
	public int sub(int num1, int num2);
	public int mul(int num1, int num2);
	public int div(int num1, int num2);
	public int mod(int num1, int num2);
}

public class Calc implements Calculater{
	@Override
	public int add(int num1, int num2) { return num1 + num2; }
 	@Override
	public int sub(int num1, int num2) { return num1 - num2; }
	@Override
	public int mul(int num1, int num2) { return num1 * num2; }
	@Override
	public int div(int num1, int num2) { return num1 / num2; }
	@Override
	public int mod(int num1, int num2) { return num1 % num2; }
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calc cal = new Calc();
		System.out.println("두 수의 합은 : " + cal.add(5, 2));
		System.out.println("두 수의 차는 : " + cal.sub(5, 2));
		System.out.println("두 수의 곱은 : " + cal.mul(5, 2));
		System.out.println("두 수의 몫은 : " + cal.div(5, 2));
		System.out.println("두 수의 남은 : " + cal.mod(5, 2));
		
	}
}
