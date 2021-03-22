package lambda.cases;

@FunctionalInterface
interface MyFunction {
    void run();
}

public class LambdaUseCase {
    static void execute(MyFunction f) {
        f.run();
    }

    static MyFunction getMyFunction() {
        MyFunction f = () -> System.out.println("f3.run()");
        return f;
    }

    public static void main(String[] args) {
        // 1. 익명 클래스로 MyFunction.run() 구현(기존 방식)
        MyFunction f1 = new MyFunction() {
            @Override
            public void run() {
                System.out.println("f1.run()");
            }
        };

        // 2. 람다식으로 MyFunction.run() 구현
        MyFunction f2 = () -> System.out.println("f2.run()");

        // 3. 람다식을 반환하는 메소드 호출
        MyFunction f3 = getMyFunction();

        f1.run();
        f2.run();
        f3.run();

        execute(f1);    // 람다식을 참조하는 참조변수를 매개변수로 지정
        execute(f2);    // 
        execute(f3);    // 
        
        execute(() -> System.out.println("run()")); // 람다식을 직접 매개변수로 지정
    }
}