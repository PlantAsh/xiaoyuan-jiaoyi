package xiaoyuan_jiaoyi.entity;

import java.util.Date;

public class Message {
    private Integer messageId;

    private String messageSend;

    private String messageAccept;

    private String message;

    private String messageDate;
    
    private String messageState;
    
    private String sendName;
    
    private String acceptName;

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public String getMessageSend() {
        return messageSend;
    }

    public void setMessageSend(String messageSend) {
        this.messageSend = messageSend == null ? null : messageSend.trim();
    }

    public String getMessageAccept() {
        return messageAccept;
    }

    public void setMessageAccept(String messageAccept) {
        this.messageAccept = messageAccept == null ? null : messageAccept.trim();
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message == null ? null : message.trim();
    }

    public String getMessageDate() {
        return messageDate;
    }

    public void setMessageDate(String messageDate) {
        this.messageDate = messageDate;
    }
    
    public String getMessageState() {
        return messageState;
    }

    public void setMessageState(String messageState) {
        this.messageState = messageState;
    }
    
    public String getSendName() {
        return sendName;
    }

    public void setSendName(String sendName) {
        this.sendName = sendName;
    }
    
    public String getAcceptName() {
        return acceptName;
    }

    public void setAcceptName(String acceptName) {
        this.acceptName = acceptName;
    }
}