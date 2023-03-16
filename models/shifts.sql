WITH shifts AS (SELECT employee_id,
                       shift_date,
                       shift
                FROM tbd.stg_shifts
                ),
     shift_details AS (SELECT shift AS shift_name,
                              start_time,
                              end_time
                       FROM tbd.shift_hours
                       )

SELECT s.employee_id AS employee_id,
       s.shift AS shift,
       datetime(s.shift_date, sd.start_time) AS shift_start,
       datetime(s.shift_date, sd.end_time)   AS shift_end
FROM shifts s
         INNER JOIN shift_details sd
                    ON s.shift = sd.shift_name
