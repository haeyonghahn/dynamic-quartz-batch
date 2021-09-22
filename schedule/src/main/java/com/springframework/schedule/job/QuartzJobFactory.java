package com.springframework.schedule.job;

import java.util.List;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.configuration.JobLocator;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.google.common.collect.Lists;
import com.springframework.schedule.models.ScheduleJob;

public class QuartzJobFactory extends QuartzJobBean {
	
	@Autowired
	private JobLauncher jobLauncher;
	
	@Autowired
	private JobLocator jobLocator;
	
	@Autowired
	public JobBuilderFactory jobBuilderFactory;

	public static List<ScheduleJob> jobList = Lists.newArrayList();

	public static List<ScheduleJob> getInitAllJobs() {
		return jobList;
	}

	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		ScheduleJob scheduleJob = (ScheduleJob)context.getMergedJobDataMap().get("scheduleJob");
		String jobName = scheduleJob.getJobName();
		System.err.println(jobName);
		
		JobParameters jobParameters = new JobParametersBuilder().addLong("time", System.currentTimeMillis()).toJobParameters();
		try {		
			Job job = jobLocator.getJob(jobName);
			JobExecution jobExecution = jobLauncher.run(job, jobParameters);
			System.err.println("########### Status: " + jobExecution.getStatus());		
		} catch(Exception  e) {
			e.printStackTrace();
		}
	}
}
