package xiaoyuan_jiaoyi.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import net.sf.json.JSONObject;
import xiaoyuan_jiaoyi.entity.Article;
import xiaoyuan_jiaoyi.entity.InformationCode;
import xiaoyuan_jiaoyi.service.ArticleService;
import xiaoyuan_jiaoyi.service.InformationService;

@Controller
@RequestMapping("/article")
@SessionAttributes({ "articleFloor", "inFloor" })
public class ArticleController {
	
	@Resource
	private ArticleService articleService;
	@Resource
	private InformationService informationService;
	
	private int first;
	private int page;
	private int pagenumber;
	private int number;
	private String level;
	
	@RequestMapping(value = "/floor", method = RequestMethod.POST)
	public String Floor(HttpSession session, HttpServletResponse response, String articleFloor, ModelMap model) throws Exception {
		try {
			first = 0;
			number = 18;

			Article art = new Article();
			art.setArticleFloor(articleFloor);
			List<Article> at = null;
			model.addAttribute("articleFloor", art.getArticleFloor());
			at = articleService.loadArticle(art, first, number);
			page = articleService.getPage(art);
			if (page % number > 0) {
				pagenumber = page / number + 1;
			} else {
				pagenumber = page / number;
			}
			boolean flag = false;
			if(at.size() > 0) {
				flag = true;
			}
			
			for(int i = 0; i<at.size(); i++) {
				Article ar = at.get(i);
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String dateString = formatter.format(ar.getArticleDate());
				ar.setDate(dateString);
			}
			
			level = (String) session.getAttribute("userLevel");
			Map<String, Object> map = new HashMap<String, Object>();
	        map.put("flag", flag);
	        map.put("article", at);
	        map.put("pagenumber", pagenumber);
	        map.put("now", first / number + 1);
	        map.put("level", level);
	        String json = JSONObject.fromObject(map).toString();
	        //将数据返回
	        response.setCharacterEncoding("UTF-8");
	        response.flushBuffer();
	        response.getWriter().write(json);
	        response.getWriter().flush();
	        response.getWriter().close();
	        return null;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value = "/sell")
	public String Load(ModelMap model) throws Exception {
		try {
			List<InformationCode> inFloor = null;
			inFloor = informationService.loadByType("floor");
			model.addAttribute("inFloor", inFloor);
			return "trading/sell";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value = "/nextPage", method = RequestMethod.POST)
	public String nextPage(HttpSession session, HttpServletResponse response) throws Exception {
		try {
			if (first >= (page - number)) {
				return null;
			} else {
				first = first + number;
				Article art = new Article();
				String articleFloor = (String) session.getAttribute("articleFloor");
				art.setArticleFloor(articleFloor);
				List<Article> pt = null;
				pt = articleService.loadArticle(art, first, number);
				page = articleService.getPage(art);
				if (page % number > 0) {
					pagenumber = page / number + 1;
				} else {
					pagenumber = page / number;
				}
				boolean flag = false;
				if(pt.size() > 0) {
					flag = true;
				}
				
				for(int i = 0; i<pt.size(); i++) {
					Article up = pt.get(i);
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String dateString = formatter.format(up.getArticleDate());
					up.setDate(dateString);
				}
				
				Map<String, Object> map = new HashMap<String, Object>();
		        map.put("flag", flag);
		        map.put("article", pt);
		        map.put("pagenumber", pagenumber);
		        map.put("now", first / number + 1);
		        map.put("level", level);
		        String json = JSONObject.fromObject(map).toString();
		        //将数据返回
		        response.setCharacterEncoding("UTF-8");
		        response.flushBuffer();
		        response.getWriter().write(json);
		        response.getWriter().flush();
		        response.getWriter().close();
		        return null;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "/backPage", method = RequestMethod.POST)
	public String backPage(HttpServletResponse response, HttpSession session) throws Exception {
		try {
			if (first == 0) {
				return null;
			} else {
				first = first - number;
				Article art = new Article();
				String articleFloor = (String) session.getAttribute("articleFloor");
				art.setArticleFloor(articleFloor);
				List<Article> pt = null;
				pt = articleService.loadArticle(art, first, number);
				page = articleService.getPage(art);
				if (page % number > 0) {
					pagenumber = page / number + 1;
				} else {
					pagenumber = page / number;
				}
				boolean flag = false;
				if(pt.size() > 0) {
					flag = true;
				}
				
				for(int i = 0; i<pt.size(); i++) {
					Article up = pt.get(i);
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String dateString = formatter.format(up.getArticleDate());
					up.setDate(dateString);
				}
				
				Map<String, Object> map = new HashMap<String, Object>();
		        map.put("flag", flag);
		        map.put("article", pt);
		        map.put("pagenumber", pagenumber);
		        map.put("now", first / number + 1);
		        map.put("level", level);
		        String json = JSONObject.fromObject(map).toString();
		        //将数据返回
		        response.setCharacterEncoding("UTF-8");
		        response.flushBuffer();
		        response.getWriter().write(json);
		        response.getWriter().flush();
		        response.getWriter().close();
		        return null;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "/somePage", method = RequestMethod.POST)
	public String somePage(HttpServletResponse response, @RequestParam(value = "somePage")int somePage, HttpSession session) throws Exception {
		try {
			first = (somePage - 1) * number;
			Article art = new Article();
			String articleFloor = (String) session.getAttribute("articleFloor");
			art.setArticleFloor(articleFloor);
			List<Article> pt = null;
			pt = articleService.loadArticle(art, first, number);
			page = articleService.getPage(art);
			if (page % number > 0) {
				pagenumber = page / number + 1;
			} else {
				pagenumber = page / number;
			}
			boolean flag = false;
			if(pt.size() > 0) {
				flag = true;
			}
			
			for(int i = 0; i<pt.size(); i++) {
				Article up = pt.get(i);
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String dateString = formatter.format(up.getArticleDate());
				up.setDate(dateString);
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
	        map.put("flag", flag);
	        map.put("article", pt);
	        map.put("pagenumber", pagenumber);
	        map.put("now", first / number + 1);
	        map.put("level", level);
	        String json = JSONObject.fromObject(map).toString();
	        //将数据返回
	        response.setCharacterEncoding("UTF-8");
	        response.flushBuffer();
	        response.getWriter().write(json);
	        response.getWriter().flush();
	        response.getWriter().close();
	        return null;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

}
