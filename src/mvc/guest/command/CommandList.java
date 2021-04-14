package mvc.guest.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.guest.model.Message;
import mvc.guest.model.MessageDao;
import mvc.guest.model.MessageException;

public class CommandList implements Command 
{
	private String next;

	public CommandList( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException{
		try{

		    List <Message> mList = MessageDao.getInstance().selectList();	
		    // 중요
		    // 화면으로 넘길 데이터 request에 속성으로 저장
		    request.setAttribute("param", mList );

		}catch( MessageException ex ){
			throw new CommandException("CommandList.java < 목록보기시 > " + ex.toString() ); 
		}
		
		return next;
	}
}
