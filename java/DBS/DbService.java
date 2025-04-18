package com.dbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dto.Question;
import com.dto.Result;
import com.dto.UserDetails;


public class DbService {
	
	Connection con=null;
	
	public DbService() {
		//getting connections to database
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/onlineexamsystem?"
			+ "user=root&password=root");
			
//			System.out.println("connection successful");
		}
		catch (Exception e) 
		{
			System.out.println("Error in loading drivers and making connection");
		}
	}
	
	//register customer
		public int registerUser(UserDetails u) {
			int x=0;
			try 
			{
				PreparedStatement ps = con.prepareStatement(
				"insert into registeruserinfo values(?,?,?,?,?,?,?,?)");
				ps.setString(1, u.getUsername());
				ps.setString(2, u.getEmail());
				ps.setString(3, u.getRole());
				ps.setString(4, u.getDob());
				ps.setString(5, u.getQualification());
				ps.setString(6, u.getGender());
				ps.setString(7, u.getPassword());
				ps.setInt(8, u.getRollno());
				x = ps.executeUpdate();
			}
			catch (Exception e) 
			{
				System.out.println("error in SQL statement");
			}
			return x;
		}
	
	//validate user
	public boolean checkUser(UserDetails u)
	{
		boolean isValid=false;
		try 
		{
			PreparedStatement ps = con.prepareStatement(
			"select * from registeruserinfo"
			+ " where username = ? and password = ? and role = ?");
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getRole());
			ResultSet rs = ps.executeQuery();
			isValid = rs.next();
			
		}catch (Exception e) {
			System.out.println(e);
		}
		return isValid;
	}

	public boolean checkAdmin(UserDetails u) {
		if(u.username.equals("IAmAdmin") && u.password.equals("Admin001") && u.role.equals("Admin"))  return true;
		else return false;
	}
	
	

	public int addQuestion(Question question) {
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO questiontable (question, option1, option2, option3, option4, correct_option) VALUES (?, ?, ?, ?, ?, ?)");
			ps.setString(1, question.getQuestion());
            ps.setString(2, question.getOption1());
            ps.setString(3, question.getOption2());
            ps.setString(4, question.getOption3());
            ps.setString(5, question.getOption4());
            ps.setString(6, question.getCorrectOption());

			x = ps.executeUpdate();
		}
		catch (Exception e) 
		{
			System.out.println("error in SQL statement");
		}
		return x;
	}
	

	
	public List<Question> getAllQuestions() {
	    List<Question> questionsList = new ArrayList<>();
	    String SELECT_ALL_QUESTIONS_SQL = "SELECT * FROM questiontable";
	    try (
	         Statement statement = con.createStatement();
	         ResultSet rs = statement.executeQuery(SELECT_ALL_QUESTIONS_SQL)) {

	        while (rs.next()) {
	            Question question = new Question();
	            question.setId(rs.getInt("id"));
	            question.setQuestion(rs.getString("question"));
	            question.setOption1(rs.getString("option1"));
	            question.setOption2(rs.getString("option2"));
	            question.setOption3(rs.getString("option3"));
	            question.setOption4(rs.getString("option4"));
	            question.setCorrectOption(rs.getString("correct_option"));
	            questionsList.add(question);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return questionsList;
	}

	
	
	public List<UserDetails> getAllStudents() {
	    List<UserDetails> studentList = new ArrayList<>();
	    String SELECT_ALL_STUDENTS_SQL = "SELECT * FROM registeruserinfo";
	    try (
	         Statement statement = con.createStatement();
	         ResultSet rs = statement.executeQuery(SELECT_ALL_STUDENTS_SQL)) {

	        while (rs.next()) {
	        	UserDetails student = new UserDetails();
	            student.setRollno(rs.getInt("rollno"));
	            student.setUsername(rs.getString("username"));
	            student.setEmail(rs.getString("email"));
	            student.setRole(rs.getString("role"));
	            student.setDob(rs.getString("dob"));
	            student.setQualification(rs.getString("qualification"));
	            student.setGender(rs.getString("gender"));
	            student.setPassword(rs.getString("password"));
	          
	            studentList.add(student);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return studentList;
	}
	
	
	public boolean deleteQuestion(int id) {
	    String DELETE_QUESTION_SQL = "DELETE FROM questiontable WHERE id = ?";
	    boolean rowDeleted = false;
	    try (
	         PreparedStatement preparedStatement = con.prepareStatement(DELETE_QUESTION_SQL)) {
	        preparedStatement.setInt(1, id);
	        rowDeleted = preparedStatement.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return rowDeleted;
	}
	
	
	
	public Question getQuestionById(int id) {
	    Question question = null;
	    try {
	        String query = "SELECT * FROM questiontable WHERE id = ?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            question = new Question();
	            question.setId(rs.getInt("id"));
	            question.setQuestion(rs.getString("question"));
	            question.setOption1(rs.getString("option1"));
	            question.setOption2(rs.getString("option2"));
	            question.setOption3(rs.getString("option3"));
	            question.setOption4(rs.getString("option4"));
	            question.setCorrectOption(rs.getString("correct_option"));       
	        }
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return question;
	}

	public boolean updateQuestion(Question q) {
	    boolean result = false;
	    try {
	        String query = "UPDATE questiontable SET question = ?, option1 = ?, option2 = ?, option3 = ?, option4 = ?, correct_option = ? WHERE id = ?";
	        PreparedStatement ps = con.prepareStatement(query);

	        ps.setString(1, q.getQuestion());
	        ps.setString(2, q.getOption1());
	        ps.setString(3, q.getOption2());
	        ps.setString(4, q.getOption3());
	        ps.setString(5, q.getOption4());
	        ps.setString(6, q.getCorrectOption());
	        ps.setInt(7, q.getId());

	        int rowUpdated = ps.executeUpdate();
	        if (rowUpdated > 0) {
	            result = true;
	        }
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result;
	}
	
	
	public List<Result> getAllResults() {
	    List<Result> resultList = new ArrayList<>();
	    try {
	        String query = "SELECT student_name, marks, exam_date FROM exam_results ORDER BY exam_date DESC";
	        PreparedStatement ps = con.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Result r = new Result(
	                rs.getString("student_name"),
	                rs.getInt("marks"),
	                rs.getString("exam_date")
	            );
	            resultList.add(r);
	        }
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return resultList;
	}

	
	public void saveResult(String studentName, int marks) {
	    try {
	        String query = "INSERT INTO exam_results(student_name, marks, exam_date) VALUES (?, ?, NOW())";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, studentName);
	        ps.setInt(2, marks);
	        ps.executeUpdate();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	public List<Result> getStudentResults(String studentName) {
	    List<Result> results = new ArrayList<>();
	    try {
	        String query = "SELECT * FROM exam_results WHERE student_name = ? ORDER BY exam_date DESC";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, studentName);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	        	String dateTime = rs.getTimestamp("exam_date").toString();
	            Result result = new Result(rs.getString("student_name"),rs.getInt("marks"),dateTime);
	      
	            results.add(result);
	        }

	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return results;
	}

	
}
