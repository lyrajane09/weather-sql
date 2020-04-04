SELECT trn_teacher.nickname, 
CASE
    WHEN trn_teacher.status = 0 THEN `discontinued`
    WHEN trn_teacher.status = 1 THEN `Active`
    WHEN trn_teacher.status = 2 THEN `Deactivated`
END AS `status`,
CASE
    WHEN trn_teacher_role.role = 1 THEN `trainer`
    WHEN trn_teacher_role.role = 2 THEN `assessor`
    WHEN trn_teacher_role.role = 3 THEN `staff`
END AS `roles`,
lpad(trn_teacher.id,'8-0','T000000') AS `ID` FROM trn_teacher
INNER JOIN trn_teacher_role ON
trn_teacher_role.teacher_id = trn_teacher.id
