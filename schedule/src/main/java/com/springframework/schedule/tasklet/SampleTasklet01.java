package com.springframework.schedule.tasklet;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.scope.context.ChunkContext;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.beans.factory.annotation.Autowired;

import com.springframework.schedule.models.Employees;

public class SampleTasklet01 implements Tasklet {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public RepeatStatus execute(StepContribution contribution, ChunkContext chunkContext) throws Exception {
		System.out.println("####### SampleTasklet01");
		
		List<Employees> list = sqlSession.selectList("employees.select_employees");
		
		System.out.println("employees : " + list.toString());
		
		chunkContext.getStepContext().getStepExecution().getJobExecution().getExecutionContext().put("SIZE", 0);
		return RepeatStatus.FINISHED;
	}
	
	private String getParamValue(ChunkContext chunkContext, String key) {
		return chunkContext.getStepContext().getStepExecution().getJobParameters().getString(key);
	}
}
