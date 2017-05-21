package xiaoyuan_jiaoyi.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import xiaoyuan_jiaoyi.entity.Article;
import xiaoyuan_jiaoyi.entity.UserInformation;
import xiaoyuan_jiaoyi.service.ArticleService;

@Controller
@RequestMapping("/sell")
@SessionAttributes({ "article" })
public class SellController {
	
	@Resource
	private ArticleService articleService;
	
	@RequestMapping(value = "/addArticle", method = RequestMethod.POST)
	public String addArticle(HttpSession session, HttpServletResponse response, HttpServletRequest request, Article article, ModelMap model) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			Date date = new Date();
			article.setArticleDate(date);
			article.setArticleState("未交易");
			UserInformation usin = (UserInformation) session.getAttribute("userInformation");
			article.setUserAccount(usin.getUserAccount());
			article.setUserName(usin.getUserName());
			// 转型为MultipartHttpRequest(重点的所在)
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			// 获得第1张图片（根据前台的name名称得到上传的文件）
			MultipartFile imgFile = multipartRequest.getFile("Picture");
			// 保存第一张图片
			String file = null;
			if (!(imgFile.getOriginalFilename() == null || "".equals(imgFile.getOriginalFilename()))) {
				file = this.addPicture(imgFile,usin.getUserAccount());
			}

			if(file.equals("error")) {
				out.print("<script>alert('图片格式错误！')</script>");
				out.flush();
			}
			if(file != null && !file.equals("error")) {
				article.setArticlePicture(file);
			}
			if(article.getArticleDescribe() != null) {
				String text = article.getArticleDescribe();
				text = text.replace("\r\n", "<br/>");
				article.setArticleDescribe(text);
			}
			String result = articleService.addArticle(article);
			if(!result.equals("success")) {
				out.print("<script>alert('" + result + "')</script>");
				out.flush();
				return "trading/article";
			} else {
				return "trading/article";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value = "/getArticle")
	public String getArticle(HttpSession session, HttpServletResponse response, int articleId, ModelMap model) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			Article ar = new Article();
			ar = articleService.getArticle(articleId);
			if (ar == null) {
				out.print("<script>alert('无此页面')</script>");
				out.flush();
				return "/trading/article";
			} else {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String dateString = formatter.format(ar.getArticleDate());
				ar.setDate(dateString);
				model.addAttribute("article", ar);
				return "/trading/article_information";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	@RequestMapping(value = "/updateArticle", method = RequestMethod.POST)
	public String updateArticle(HttpSession session, HttpServletResponse response, HttpServletRequest request, Article article, ModelMap model) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			Article ar = (Article) session.getAttribute("article");
			article.setArticleId(ar.getArticleId());
			Date date = new Date();
			article.setModifyDate(date);
			String userAccount = (String) session.getAttribute("UserAccount");
			article.setArticleModify(userAccount);
			// 转型为MultipartHttpRequest(重点的所在)
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			// 获得第1张图片（根据前台的name名称得到上传的文件）
			MultipartFile imgFile = multipartRequest.getFile("Picture");
			// 保存第一张图片
			String file = null;
			if (!(imgFile.getOriginalFilename() == null || "".equals(imgFile.getOriginalFilename()))) {
				file = this.addPicture(imgFile,userAccount);
			}

			if(file.equals("error")) {
				out.print("<script>alert('图片格式错误！')</script>");
				out.flush();
			}
			if(file != null && !file.equals("error")) {
				article.setArticlePicture(file);
			}
			if(article.getArticleDescribe() != null) {
				String text = article.getArticleDescribe();
				text = text.replace("\r\n", "<br/>");
				article.setArticleDescribe(text);
			}
			String result = articleService.updateArticle(article);
			if(!result.equals("success")) {
				out.print("<script>alert('" + result + "')</script>");
				out.flush();
				return "trading/article_information";
			} else {
				model.addAttribute("article", article);
				return "trading/article_information";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value = "/deleteArticle")
	public String deleteArticle(HttpSession session, HttpServletResponse response, ModelMap model) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			Article ar = (Article) session.getAttribute("article");
			String result = articleService.deleteArticle(ar.getArticleId());
			if(!result.equals("success")) {
				out.print("<script>alert('" + result + "')</script>");
				out.flush();
				return "trading/article";
			} else {
				return "trading/article";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/*--------------------------------------------------------------------------*/

	@SuppressWarnings("unchecked")
	private String addPicture(MultipartFile imgFile, String userAccount) throws Exception {
		try {
			String fileName = imgFile.getOriginalFilename();
			// 获取上传文件类型的扩展名,先得到.的位置，再截取从.的下一个位置到文件的最后，最后得到扩展名
			String ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
			// 对扩展名进行小写转换
			ext = ext.toLowerCase();
			// 定义一个数组，用于保存可上传的文件类型
			List fileTypes = new ArrayList();
			fileTypes.add("jpg");
			fileTypes.add("jpeg");
			fileTypes.add("bmp");
			fileTypes.add("gif");
			fileTypes.add("png");

			String path = null;
			File file = null;
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss-SSS_");
			String dateString = formatter.format(date);
			String newName = dateString + fileName;
			if (fileTypes.contains(ext)) { // 如果扩展名属于允许上传的类型，则创建文件
				File secondFolder = new File("D:/tomcat/webapps/xiaoyuan-jiaoyi/article_image",userAccount);  
	            if(secondFolder.exists()) {                        //如果二级文件夹存在，则创建文件  
	            	file = new File(secondFolder,newName);
	            }else {                                            //如果二级文件夹不存在，则创建二级文件夹  
	                secondFolder.mkdir();
	                file = new File(secondFolder,newName);    //创建完二级文件夹后，再合建文件  
	            }
				try {
					imgFile.transferTo(file); // 保存上传的文件
					path = "article_image/" + userAccount + "/" + newName;
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				return "error";
			}
			return path;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
}
