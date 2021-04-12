package guest.service;

import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

import java.util.List;

public class ListMessageService {

	//-------------------------------------------------------------------
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 3;	// 한페이지당 레코드 수
	
	private static ListMessageService instance;
	
	public static ListMessageService	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new ListMessageService();
		}
		return instance;
	}
	
	private ListMessageService()
	{
		
	}
	
	// 페이지 번호에 의해 검색
	public List <Message> getMessageList(String pNum) throws MessageException
	{
		int pageNum = 1;
		if(pNum != null) pageNum = Integer.parseInt(pNum);
		int firstRow = 0, endRow = 0;
		/*	pageNum		1	2	3
		 * 	firstRow	1	4	7
		 * 	endRow		3	6	9
		 */
		endRow = pageNum * countPerPage;
		firstRow = (pageNum - 1) * 3 + 1; 
		
		// 전체 레코드를 검색해 온다면
		List <Message> mList = MessageDao.getInstance().selectList(firstRow, endRow);			
		return mList;
	}
	
	public int getTotalPage() throws MessageException{
		totalRecCount = MessageDao.getInstance().getTotalCount();			
		/*	totalRecCount -> pageTotalCount
		 * 		9				3
		 * 		10				4
		 */
		pageTotalCount = totalRecCount / countPerPage;
		if(totalRecCount % countPerPage > 0) pageTotalCount++;
		return pageTotalCount;
	}
}
