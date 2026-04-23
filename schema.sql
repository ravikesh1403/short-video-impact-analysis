 CREATE DATABASE shorts_analysis;
USE shorts_analysis;
CREATE TABLE user_behavior (
    user_id INT PRIMARY KEY,
    age INT,
    reels_watch_time_hours FLOAT,
    daily_screen_time_hours FLOAT,
    sleep_hours FLOAT,
    attention_span_score INT,
    focus_level INT,
    task_completion_rate FLOAT,
    stress_level VARCHAR(10),
    platform VARCHAR(50)
);