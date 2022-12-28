from tkinter import *
from tkinter import ttk
import database_all_functions as dbf

window = Tk()

new = dbf.db()
def get_attendance(student_name,course_name):
    query = "select attendance from student s,courses c,enrolledin e where s.sname = '"+student_name+"' and c.cname = '"+course_name+"' and c.cnum = e.cnum and s.pnum = e.snum"
    print(new.select_query(query))
    # print(query)

def get_cgpa(student_name):
    query = "select cgpa from student s where s.sname = '"+student_name+"'"
    print(new.select_query(query))

def get_assessment_marks(student_name,course_name):
    query = "select anum, marks_obtained from student s,courses c,studentassessment a where s.sname = '"+student_name+"' and c.cname = '"+course_name+"' and c.cnum = a.cnum and s.pnum = a.snum"
    print(new.select_query(query))

def get_sem_num(student_name):
    query = "select sem_num from student s where s.sname = '"+student_name+"'"
    print(new.select_query(query))

def get_course_grade(student_name,course_name):
    query = "select grade from student s,courses c,enrolledin e where s.sname = '"+student_name+"' and c.cname = '"+course_name+"' and c.cnum = e.cnum and s.pnum = e.snum"
    print(new.select_query(query))

def get_sem_gpa(student_name,sem_num):
    query = "select gpa from student,studentsemester where sname = '"+student_name+"' and student.pnum=studentsemester.snum and studentsemester.sem_num = "+str(sem_num)
    print(new.select_query(query))

def display_assessments_table():
    query = "select * from assessment"
    print(new.select_query(query))

def get_semester_status(student_name,sem_num):
    query = "select status from student,studentsemester where sname = '"+student_name+"' and student.pnum=studentsemester.snum and studentsemester.sem_num = "+str(sem_num)
    print(new.select_query(query))

def get_courses_enrolled_in(student_name):
    query = "select cname from student s,courses c,enrolledin e where c.cnum = e.cnum and s.pnum = e.snum and s.sname = '"+student_name+"'"
    print(new.select_query(query))

attendance = Button(window,text="Attendance",padx=10, pady=10, command=lambda: get_attendance("SHABANA AZIZ","DATABASE SYSTEMS")).pack()
cgpa = Button(window,text="CGPA",padx=10, pady=10, command=lambda: get_cgpa("SHABANA AZIZ")).pack()
assessment = Button(window,text="Assignment Marks",padx=10, pady=10, command=lambda: get_assessment_marks("SHAFIQUE KAMRAN", "LINEAR ALGEBRA")).pack()
sem_num = Button(window,text="Semester Number",padx=10, pady=10, command=lambda: get_sem_num("SHABANA AZIZ")).pack()
course_grade = Button(window,text="Course Grade",padx=10, pady=10, command=lambda: get_course_grade("SHABANA AZIZ","DATABASE SYSTEMS")).pack()
semester_gpa = Button(window,text="Semester GPA",padx=10, pady=10, command=lambda: get_sem_gpa("SHABANA AZIZ",2)).pack()
assessment_weightages = Button(window,text="Assessment weightages",padx=10, pady=10, command=display_assessments_table).pack()
semester_status = Button(window,text="Semester Status",padx=10, pady=10, command=lambda: get_semester_status("SHABANA AZIZ",2)).pack()
courses_enrolled = Button(window,text="Courses Enrolled",padx=10, pady=10, command=lambda: get_courses_enrolled_in("SHABANA AZIZ")).pack()

window.mainloop()
