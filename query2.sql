SELECT lpad(trn_teacher.id,'8-0','T000000') AS `ID`, 
trn_teacher.nickname,  
SUM(CASE WHEN trn_time_table.status = 1 THEN trn_time_table.status ELSE 0 END) as `Open`,
SUM(CASE WHEN trn_time_table.status = 3 THEN trn_time_table.status ELSE 0 END) as `Reserved`,
SUM(CASE WHEN trn_evaluation.result = 1 THEN trn_evaluation.result ELSE 0 END) as `Taught`,
SUM(CASE WHEN trn_evaluation.result = 2 THEN trn_evaluation.result ELSE 0 END) as `No Show`,
FROM trn_teacher,
INNER JOIN trn_teacher_role ON
trn_teacher_role.teacher_id = trn_teacher.id
LEFT JOIN  trn_time_table ON
trn_time_table.teacher_id = trn_teacher.id
LEFT JOIN trn_evaluation ON
trn_evaluation.teacher_id = trn_teacher.id
