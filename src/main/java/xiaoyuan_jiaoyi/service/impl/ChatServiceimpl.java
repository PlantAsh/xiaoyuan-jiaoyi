package xiaoyuan_jiaoyi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import xiaoyuan_jiaoyi.dao.MessageDAO;
import xiaoyuan_jiaoyi.entity.Message;
import xiaoyuan_jiaoyi.service.ChatService;

@Service("chatService")
public class ChatServiceimpl implements ChatService {
	
	@Resource
	private MessageDAO messageDAO;

	public List<Message> getMessage(String sendUser, String acceptUser) throws Exception {
		// TODO Auto-generated method stub
		try {
			List<Message> message = null;
			message = messageDAO.getMessage(sendUser, acceptUser);
			if(message != null) {
				messageDAO.updateState(sendUser, acceptUser);
			}
			return message;
		} catch(Exception e) {
			throw e;
		}
	}

	public List<Message> getUser(String acceptUser) throws Exception {
		// TODO Auto-generated method stub
		try {
			List<Message> message = null;
			message = messageDAO.getUser(acceptUser);
			return message;
		} catch(Exception e) {
			throw e;
		}
	}

	public String addMessage(Message message) throws Exception {
		// TODO Auto-generated method stub
		try {
			int i = messageDAO.addMessage(message);
			if(i == 0) {
				return "服务器错误";
			} else {
				return "success";
			}
		} catch(Exception e) {
			throw e;
		}
	}

	public int getCount(String acceptUser) throws Exception {
		// TODO Auto-generated method stub
		try {
			String messageState = "未读";
			int i = messageDAO.getCount(acceptUser, messageState);
			return i;
		} catch(Exception e) {
			throw e;
		}
	}

}
