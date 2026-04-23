-- how many avg reels usage and what is the overall attention
 SELECT 
    COUNT(*) AS total_users,
    ROUND(AVG(reels_watch_time_hours),2) AS avg_reels_time,
    ROUND(AVG(attention_span_score),2) AS avg_attention,
    ROUND(AVG(focus_level),2) AS avg_focus,
    ROUND(AVG(task_completion_rate),2) AS avg_productivity
FROM user_behavior;

-- Reels Usage vs Attention
-- did watch reel long time then attention  decreases or not 
SELECT 
    reels_watch_time_hours,
    ROUND(AVG(attention_span_score),2) AS avg_attention
FROM user_behavior
GROUP BY reels_watch_time_hours
ORDER BY reels_watch_time_hours desc;

-- Screen Time vs Focus 
select 
   ROUND(daily_screen_time_hours,1) AS screen_time,
   ROUND(AVG(focus_level),2) AS avg_focus
   from user_behavior
   GROUP BY screen_time
   ORDER BY screen_time desc; 

-- Sleep vs Productivity 
select sleep_hours,
ROUND(AVG(task_completion_rate),2) AS productivity
FROM user_behavior
GROUP BY sleep_hours
ORDER BY sleep_hours desc;

-- Stress Analysis 
select * from user_behavior; 

SELECT 
      stress_level,
      ROUND(AVG(daily_screen_time_hours),2) AS avg_screen_time,
      ROUND(AVG(attention_span_score),2) AS avg_attention
      FROM user_behavior
      GROUP BY stress_level;
-- Platform Comparison 
SELECT platform,
             ROUND(AVG(attention_span_score),2) AS attention,
             ROUND(AVG(focus_level),2) AS focus,
             ROUND(AVG(task_completion_rate),2) AS productivity
             FROM user_behavior
             GROUP BY platform;
             
             
-- Usage Category Analysis 
SELECT
     CASE
         WHEN reels_watch_time_hours < 1 THEN 'Low Usage'
         WHEN reels_watch_time_hours BETWEEN 1 AND 3 THEN 'Medium'
         ELSE 'High Usage'
	END AS usage_category,
    ROUND(AVG(attention_span_score),2) AS avg_attention,
    ROUND(AVG(focus_level),2) AS avg_focus
FROM user_behavior
GROUP BY usage_category;

-- High Performers Analysis 
SELECT 
  AVG(reels_watch_time_hours) AS avg_reels,
  AVG(sleep_hours) AS avg_sleep 
FROM user_behavior 
WHERE focus_level >=8;
 
   



 