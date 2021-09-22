package com.springframework.schedule.tasklet;

import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.scope.context.ChunkContext;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.batch.repeat.RepeatStatus;

public class SampleTasklet03 implements Tasklet {

	@Override
	public RepeatStatus execute(StepContribution contribution, ChunkContext chunkContext) throws Exception {
		System.out.println("####### SampleTasklet03");
		return RepeatStatus.FINISHED;
	}
	
	private String getParamValue(ChunkContext chunkContext, String key) {
		return chunkContext.getStepContext().getStepExecution().getJobParameters().getString(key);
	}
}
