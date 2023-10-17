package Sevlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaBean.Message;
import useBean.MessageDB;
import useBean.UserDB;

@WebServlet("/LeaveMessageServlet")
public class LeaveMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LeaveMessageServlet() {
		super();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String url ="/LeaveMessage.jsp";

		if(action.equals("leave"))
			url = leaveMessage(request,response);

		getServletContext().getRequestDispatcher(url).forward(request, response);
	}

	private String leaveMessage(HttpServletRequest request,HttpServletResponse response) {
		String title = request.getParameter("title");
		String context = request.getParameter("context");
		String userid="";
		String url="";
		HttpSession session = request.getSession();

		//??????Message??
		Message message = new Message();

		message.setuserid((String)session.getAttribute("userid"));
		message.settitle (title);
		message.setcontext(context);

		MessageDB.insert(message);

		Message messagess = MessageDB.selectMessage(userid);

		List<Message> mL = UserDB.selectU();
		request.setAttribute("MessageList", mL);
		url="/MessageList.jsp";

		return url;
	}
}
