package lambda.basic;

@FunctionalInterface
interface Lambda02Service1 {
	int getNum(int num1, int num2);
}

@FunctionalInterface
interface Lambda02Service2 {
	String getAgeAlias(int num1);
}

public class Lambda02 {
	static int max(int x, int y) {
		int val=0;
		
		if(x<y) 
			val = y;
		else 
			val = x;
		
		return val;
	}
	
	static int min(int x, int y) {
		int val=0;
		
		if(x<y) 
			val = x;
		else 
			val = y;
		
		return val;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int getMaxValByImpl = max(3,4);
		int getMinValByImpl = min(3,4);
		System.out.println("명령형 Max : " + getMaxValByImpl);
		System.out.println("명령형 Min : " + getMinValByImpl);
					
		Lambda02Service1 getMaxValByDecl = (x,y)->x>y?x:y;
		Lambda02Service1 getMinValByDecl = (x,y)->x<y?x:y;
		Lambda02Service2 getValByDecl = (int x) -> { if(x > 30)
											         	return "아재아재바라아재";
											         else
											        	return "아니아니아직아재아니재";
											       };  
		System.out.println("함수형 Max : " + getMaxValByDecl.getNum(3, 4));
		System.out.println("함수형 Min : " + getMinValByDecl.getNum(3, 4));
		System.out.println(getValByDecl.getAgeAlias(31));
		
		//Interface 분리
		Lambda02Service3 getMaxValByDecl2 = (x,y)->x>y?x:y;
		System.out.println("함수형 Max(Interface 분리) : " + getMaxValByDecl2.getNum(3, 4));
       
	}

}
