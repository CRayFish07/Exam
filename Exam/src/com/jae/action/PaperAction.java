package com.jae.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;



import com.jae.dao.PaperDao;
import com.jae.model.Paper;
import com.jae.model.Question;
import com.opensymphony.xwork2.ActionSupport;


public class PaperAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private PaperDao paperDao = new PaperDao();
	
	private String mainPage;
	private List<Paper> papers = new ArrayList<Paper>();
	private String paperId;
	private Paper paper;
	private List<Question> squestions = new ArrayList<Question>();
	private List<Question> mquestions = new ArrayList<Question>();




	

	public void setPaper(Paper paper) {
		this.paper = paper;
	}



	public List<Question> getSquestions() {
		return squestions;
	}



	public void setSquestions(List<Question> squestions) {
		this.squestions = squestions;
	}



	public List<Question> getMquestions() {
		return mquestions;
	}



	public void setMquestions(List<Question> mquestions) {
		this.mquestions = mquestions;
	}



	public String getPaperId() {
		return paperId;
	}



	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}



	public List<Paper> getPapers() {
		return papers;
	}



	public void setPapers(List<Paper> papers) {
		this.papers = papers;
	}



	public String getMainPage() {
		return mainPage;
	}



	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}


	
	public String list(){
		mainPage="exam/selectPaper.jsp";
		papers=paperDao.list();
		return SUCCESS;
	}
	
	public String getPaper(){
		paper=paperDao.getPaper(paperId);
		Set<Question> questions = paper.getQuestions();
		Iterator<Question> iterator = questions.iterator();
		while(iterator.hasNext()){
			Question question = iterator.next();
			if(question.getType().equals("1")){
				squestions.add(question);
			}else if(question.getType().equals("2")){
				mquestions.add(question);
			}
		}
		
		squestions = this.getQuestion(squestions, 3);
		mquestions = this.getQuestion(mquestions, 3);
		mainPage="exam/paper.jsp";
		return SUCCESS;
	}
	
	private List<Question> getQuestion(List<Question> questions,int num){
		List<Question> resultQuestions = new ArrayList<Question>();
		Random random = new Random();
		for(int i=0;i<num;i++){
			int n = random.nextInt(questions.size());
			Question question = questions.get(n);
			if(resultQuestions.contains(question)){
				i--;
			}else{
				resultQuestions.add(question);
			}
		}
		return resultQuestions;
	}

	
}