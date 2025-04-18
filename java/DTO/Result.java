package com.dto;

public class Result {
    private String studentName;
    private int marks;
    private String examDate;

    
    public Result(String studentName, int marks, String examDate) {
        this.studentName = studentName;
        this.marks = marks;
        this.examDate = examDate;
    }

    public String getStudentName() {
        return studentName;
    }

    public int getMarks() {
        return marks;
    }

    public String getExamDate() {
        return examDate;
    }
}
