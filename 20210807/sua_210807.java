package dongdaemun_study;

public class sua_210807 {

	static int price = 3;
	static int money = 20;
	static int count = 4;
	
	public static void main(String[] args) {
		System.out.println(solution(price, money, count));
	}
	
	public static long solution(int price, int money, int count) {
		long answer = -1;
	    int total = 0;
	    
	    System.out.println("start");
	    
	    for ( int N=1; money > total; N++ ){
	       total = total + total_sum(price, N, count);
	       System.out.println("total "+N+" = "+total);
	       
	       count--;
	       if(count<=0) {
	    	   answer = total - money;
	    	   System.out.println("answer = "+answer);
	       }
	    }

	    return answer;
	}

	static int total_sum(int price, int N, int count){
	    int cnt_price = 0;
		cnt_price = price * N;
		System.out.println("cnt_price = " +cnt_price);
	    return cnt_price;
	}
}
