package lambda.basic;

@FunctionalInterface
interface Say{
    int someting(int a,int b);
}

public class Lambda04 {
	
	public static void main(String[] args) {
		
		class Person{
		    public void hi(Say line) {
			int number = line.someting(3,4);
			System.out.println("Number is "+number);
		    }
		}
		
		Person rin = new Person();		
		
		rin.hi(new Say() {
		    public int someting(int a, int b) {
			System.out.println("My Name is Coding-Factory");
			System.out.println("Nice to meet you");
			System.out.println("parameter number is "+a+","+b);
			return 7;
		    }
		});		
		
		Person rin2 = new Person();
		rin2.hi((a,b) ->{
			System.out.println("This is Coding-Factory!");
			System.out.println("Tank you Lamda");
			System.out.println("parameter number is "+a+","+b);
		    return 7;
		});
	}

}