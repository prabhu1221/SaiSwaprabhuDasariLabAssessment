package com.greatlearning.app;

import java.util.Scanner;
import java.util.Stack;

public class balancingExpression {

	static boolean checkingBalancedExpression(String bracketExpression) {
		Stack<Character> stack = new Stack<Character>();
		
		for(int i= 0;i< bracketExpression.length();i++) {
			char character = bracketExpression.charAt(i);
			
			if (character == '(' || character == '[' || character == '{') {
				stack.push(character);
				continue;
			}
			if(stack.isEmpty()) {
				return false;
			}
			char c;;
			switch(character) {
			case '}':
				c = stack.pop();
				if(c== '(' || c == '[') {
					return false;
				}
				break;
				
			case ')':
				
				c= stack.pop();
				if(c=='{' || c== '[')
					return false;
				break;
			case ']':
				
				c = stack.pop();
				if(c=='(' || c== '{')
					return false;
				break;
			}
		}
		return (stack.isEmpty());
	}
	
	public static void main(String [] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Please enter the bracket Expression for verification");
		String bracketExpression = sc.nextLine();
		boolean result;
		result = checkingBalancedExpression(bracketExpression);
		
		if(result)
			System.out.println("The entered string has balanced Brackets");
		else
			System.out.println("The entered string does not contain Balanced Brackets Expression");
	}
}
