package in.ineuron.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.env.IModule.IService;

import in.ineuron.dto.Student;
import in.ineuron.service.IStudentService;
import in.ineuron.servicefactory.StudentServiceFactory;

@WebServlet("/controller/*")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request, response);

	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		IStudentService stdService = StudentServiceFactory.getStudentService();
//		System.out.println("URI ::"+ request.getRequestURI());
//		System.out.println("PATH INFO::"+request.getPathInfo());
		Student student = null;
		PrintWriter out = null;
		RequestDispatcher requestDispatcher = null;
		if (request.getRequestURI().endsWith("addform")) {

			student = new Student();
			student.setSname(request.getParameter("sname"));
			student.setSage(Integer.parseInt(request.getParameter("sage")));
			student.setSaddress((request.getParameter("saddr")));

			String status = stdService.addStudent(student);
			request.setAttribute("status", status);
			requestDispatcher = request.getRequestDispatcher("/addresult.jsp");
			requestDispatcher.forward(request, response);

		}

		if (request.getRequestURI().endsWith("searchform")) {

			Student std = stdService.searchStudent(Integer.parseInt(request.getParameter("sid")));
			out = response.getWriter();
			request.setAttribute("std", std);
			request.setAttribute("id", request.getParameter("sid"));
			requestDispatcher = request.getRequestDispatcher("/searchresult.jsp");
			requestDispatcher.forward(request, response);

		}

		if (request.getRequestURI().endsWith("deleteform")) {
			String deleteStudent = stdService.deleteStudent(Integer.parseInt(request.getParameter("sid")));
			request.setAttribute("status", deleteStudent);
			requestDispatcher = request.getRequestDispatcher("/deleteresult.jsp");
			requestDispatcher.forward(request, response);

		}

		if (request.getRequestURI().endsWith("editform")) {

			student = stdService.searchStudent(Integer.parseInt(request.getParameter("sid")));
			request.setAttribute("std", student);
			request.setAttribute("id", request.getParameter("sid"));
			out = response.getWriter();
			requestDispatcher = request.getRequestDispatcher("/editform.jsp");
			requestDispatcher.forward(request, response);

		}

		if (request.getRequestURI().endsWith("updateRecord")) {

			student = new Student();
			student.setSid(Integer.parseInt(request.getParameter("sid")));
			student.setSname(request.getParameter("sname"));
			student.setSaddress(request.getParameter("saddr"));
			student.setSage(Integer.parseInt(request.getParameter("sage")));

			String status = stdService.updateStudent(student);
			request.setAttribute("status", status);
			requestDispatcher = request.getRequestDispatcher("/updateresult.jsp");
			requestDispatcher.forward(request, response);

		}
	}

}
