package xiaoyuan_jiaoyi.dao;

import java.util.List;

import xiaoyuan_jiaoyi.entity.Message;

public interface MessageDAO {
	List<Message> getMessage(String messageSend, String messageAccept);
	
	List<Message> getUser(String messageAccept);
	
	int addMessage(Message message);
    
    int getCount(String messageAccept, String messageState);
    
    int updateState(String messageSend, String messageAccept);
}