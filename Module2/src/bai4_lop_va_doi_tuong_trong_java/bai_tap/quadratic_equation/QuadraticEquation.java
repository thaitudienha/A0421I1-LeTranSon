package bai4_lop_va_doi_tuong_trong_java.bai_tap.quadratic_equation;

public class QuadraticEquation {
    private double a,b,c;


    public QuadraticEquation(){

    }


    public QuadraticEquation(double a, double b , double c){
        double delta = b*b - 4*a*c;
    }

    public double getRoot1(double delta){
        return (-b + Math.sqrt(delta))/(2*a);
    }

    public double getRoot2(double delta){
        return (-b - Math.sqrt(delta))/(2*a);
    }
}