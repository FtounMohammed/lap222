public class Main {
    public static void main(String[] args) {
        // 1. Declare two Student objects
        Student s1 = new Student("Mona Ali", 1002, 3);
        Student s2 = new Student("May Omar", 1001, 4);

        // 2. Display info for first object
        s1.displayInfo();

        // 3. Read grades for second object
        s2.readGrades();

        // 4. Display info for second object
        s2.displayInfo();
    }
}
import java.util.Scanner;

public class Student {
    // Attributes
    private String name;
    private int id;
    private int numOfCourses;
    private char[] grades;

    // Constructor
    public Student(String name, int id, int numOfCourses) {
        this.name = name;
        this.id = id;
        this.numOfCourses = numOfCourses;
        grades = new char[numOfCourses]; // Initialize array
        for (int i = 0; i < numOfCourses; i++) {
            grades[i] = '-'; // default: not entered yet
        }
    }

    // Getters and Setters
    public String getName() { return name; }
    public int getId() { return id; }
    public int getNumOfCourses() { return numOfCourses; }
    public char[] getGrades() { return grades; }

    public void setName(String name) { this.name = name; }
    public void setId(int id) { this.id = id; }
    public void setNumOfCourses(int numOfCourses) { this.numOfCourses = numOfCourses; }

    // Display student info
    public void displayInfo() {
        System.out.println("--- Student Information ---");
        System.out.println("Name: " + name);
        System.out.println("ID: " + id);
        System.out.println("Number of Courses: " + numOfCourses);
        System.out.print("Grades: ");
        for (int i = 0; i < numOfCourses; i++) {
            if (grades[i] == '-') {
                System.out.print("Course " + (i + 1) + ": None, ");
            } else {
                System.out.print("Course " + (i + 1) + ": " + Character.toUpperCase(grades[i]) + ", ");
            }
        }
        System.out.println();
    }

    // Read grades and print best grade
    public void readGrades() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter grades for " + name + ":");
        for (int i = 0; i < numOfCourses; i++) {
            System.out.print("Enter grade for course " + (i + 1) + " : ");
            grades[i] = sc.next().toUpperCase().charAt(0);
        }

        char bestGrade = findBestGrade();
        System.out.println("Best grade: " + bestGrade);
    }

    // Helper to find best grade (A is best)
    private char findBestGrade() {
        char best = 'F';
        for (char g : grades) {
            if (g < best) best = g; // Because 'A' < 'B' < 'C' in ASCII
        }
        return best;
    }
}
