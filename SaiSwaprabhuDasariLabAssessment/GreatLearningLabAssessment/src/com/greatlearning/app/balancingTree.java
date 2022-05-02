package com.greatlearning.app;

import java.util.HashSet;
import java.util.Scanner;

public class balancingTree {
	static class Node {
		int data;
		Node left,right;
		Node(int data){
			this.data = data;
			left = null;
			right = null;
		}
	}
	static boolean traversal(Node node,HashSet<Integer> interation,int sum) {
		if (node == null) {
			return false;
		}
		if(traversal(node.left,interation,sum)) {
			return true;
		}
		if(interation.contains(sum-node.data)) {
		    System.out.println("Pair exists (" +(sum - node.data) + "," + node.data + ")" );
			return true;
		}
		else {
			interation.add(node.data);
		}
		if(traversal(node.right,interation,sum)) {
			return true;
		}
		return false;
	}

	public static void main(String[] args) {
		  HashSet<Integer> interation = new HashSet<Integer>();
		  Scanner sc = new Scanner(System.in);
		  System.out.println("Please enter the root value for the binary tree");
          Node root = new Node(sc.nextInt());
          System.out.println("Please enter the left node value ");
          Node left = new Node(sc.nextInt());
          if(root.data < left.data) {
        	  System.out.println("Please enter the correct values for the binary tree.");
        	  System.exit(0);
          }
          System.out.println("Please enter the right node value ");
          Node right = new Node(sc.nextInt());
          if(root.data > right.data) {
        	  System.out.println("Please enter the correct values for the binary tree.");
        	  System.exit(0);
          }
          root.left = left;
          root.right = right;
          System.out.println("Please enter the sum:");
          int sum = sc.nextInt();
          boolean binearySearch = traversal(root,interation,sum);
          if(binearySearch == false) {
        	  System.out.println("Pair does not exists");
          }
          
	}

}
