library(dplyr)
allstate_homework%>%
  inner_join(allstate_students, by ='student_id')%>%
  group_by(student_id)%>%
  summarise(student_firstname , avg_grade = mean(grade, na.rm = TRUE),completion_rate =  100*sum(!is.na(grade)) / (sum(is.na(grade))+sum(!is.na(grade))))%>%
  distinct(student_firstname,avg_grade,completion_rate)