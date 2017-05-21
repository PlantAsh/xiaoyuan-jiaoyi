package xiaoyuan_jiaoyi.service;

import java.util.List;

import xiaoyuan_jiaoyi.entity.Message;

public interface ChatService {
	public List<Message> getMessage (String sendUser, String acceptUser) throws Exception;
	
	public List<Message> getUser (String acceptUser) throws Exception;
	
	public String addMessage (Message message) throws Exception;
	
	public int getCount(String acceptUser) throws Exception;

}
